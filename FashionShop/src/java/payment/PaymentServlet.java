package payment;

import DAO.OrderDAO;
import DAO.InventoryDAO;
import entity.Cart;
import entity.Order;
import entity.CartItem;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;
import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

@WebServlet(name = "PaymentServlet", urlPatterns = {"/payment"})
public class PaymentServlet extends HttpServlet {

    private OrderDAO orderDAO = new OrderDAO();
    private InventoryDAO inventoryDAO = new InventoryDAO();

    private static final String VNP_VERSION = "2.1.0";
    private static final String VNP_COMMAND = "pay";
    private static final String VNP_TMN_CODE = "UE7X71VT";
    private static final String VNP_HASH_SECRET = "V0LLLO92GG64TULVKNLABKZ2GO9PFLZU";
    private static final String VNP_API_URL = "https://sandbox.vnpayment.vn/paymentv2/vpcpay.html";
    private static final String VNP_CURR_CODE = "VND";
    private static final String ORDER_TYPE = "other";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String vnp_ResponseCode = request.getParameter("vnp_ResponseCode");

        if (vnp_ResponseCode != null) {
            processVNPayReturn(request, response);
            return;
        }

        HttpSession session = request.getSession();
        Order order = (Order) session.getAttribute("pending_order");

        if (order == null) {
            response.sendRedirect("cartdetail");
            return;
        }

        request.setAttribute("order", order);
        request.getRequestDispatcher("payment.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Order order = (Order) session.getAttribute("pending_order");

        if (order == null) {
            response.sendRedirect("cartdetail");
            return;
        }

        String paymentMethod = request.getParameter("payment_method");

        if ("vnpay".equals(paymentMethod)) {
            processVNPayPayment(request, response, order);
        } else {
            request.setAttribute("errorMessage", "Phương thức thanh toán không được hỗ trợ");
            request.getRequestDispatcher("payment.jsp").forward(request, response);
        }
    }

    private void processVNPayPayment(HttpServletRequest request, HttpServletResponse response, Order order)
            throws IOException, ServletException {
        try {
            if (order.getOrderCode() == null || order.getOrderCode().isEmpty()) {
                order.setOrderCode("ORD" + System.currentTimeMillis());
            }

            String cleanOrderCode = order.getOrderCode().replaceAll("[^a-zA-Z0-9]", "");
            String vnp_OrderInfo = "Thanh toan don hang " + order.getOrderCode();
            String vnp_TxnRef = cleanOrderCode;
            String vnp_IpAddr = getClientIpAddress(request);

            long amount = (long) (order.getTotal() * 100);
            String vnp_Amount = String.valueOf(amount);

            Map<String, String> vnp_Params = new HashMap<>();
            vnp_Params.put("vnp_Version", VNP_VERSION);
            vnp_Params.put("vnp_Command", VNP_COMMAND);
            vnp_Params.put("vnp_TmnCode", VNP_TMN_CODE);
            vnp_Params.put("vnp_Amount", vnp_Amount);
            vnp_Params.put("vnp_CurrCode", VNP_CURR_CODE);
            vnp_Params.put("vnp_Locale", "vn");
            vnp_Params.put("vnp_OrderInfo", vnp_OrderInfo);
            vnp_Params.put("vnp_OrderType", ORDER_TYPE);

            String returnUrl = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
                    + request.getContextPath() + "/payment";
            vnp_Params.put("vnp_ReturnUrl", returnUrl);
            vnp_Params.put("vnp_IpAddr", vnp_IpAddr);
            vnp_Params.put("vnp_TxnRef", vnp_TxnRef);

            Calendar cld = Calendar.getInstance(TimeZone.getTimeZone("Etc/GMT+7"));
            SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
            String vnp_CreateDate = formatter.format(cld.getTime());
            vnp_Params.put("vnp_CreateDate", vnp_CreateDate);

            cld.add(Calendar.MINUTE, 15);
            String vnp_ExpireDate = formatter.format(cld.getTime());
            vnp_Params.put("vnp_ExpireDate", vnp_ExpireDate);

            String paymentUrl = buildVNPayUrl(vnp_Params);
            System.out.println("Redirecting to VNPay URL: " + paymentUrl);
            response.sendRedirect(paymentUrl);
        } catch (Exception e) {
            System.out.println("Error processing VNPay payment: " + e.getMessage());
            e.printStackTrace();
            request.setAttribute("errorMessage", "Có lỗi xảy ra khi kết nối với cổng thanh toán: " + e.getMessage());
            request.getRequestDispatcher("payment.jsp").forward(request, response);
        }
    }

    private void processVNPayReturn(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Map<String, String> vnp_Params = getParameterMap(request);
            String vnp_SecureHash = request.getParameter("vnp_SecureHash");

            if (vnp_SecureHash == null) {
                throw new Exception("Missing secure hash from VNPay response");
            }

            vnp_Params.remove("vnp_SecureHash");
            vnp_Params.remove("vnp_SecureHashType");

            String vnp_TxnRef = request.getParameter("vnp_TxnRef");
            String vnp_ResponseCode = request.getParameter("vnp_ResponseCode");
            String vnp_TransactionStatus = request.getParameter("vnp_TransactionStatus");
            String vnp_Amount = request.getParameter("vnp_Amount");
            String vnp_OrderInfo = request.getParameter("vnp_OrderInfo");

            HttpSession session = request.getSession();
            Order order = (Order) session.getAttribute("pending_order");

            boolean isValidHash = validateVNPayHash(vnp_Params, vnp_SecureHash);
            boolean isValidTransaction = false;

            if (order != null) {
                String cleanOrderCode = order.getOrderCode().replaceAll("[^a-zA-Z0-9]", "");
                isValidTransaction = cleanOrderCode.equals(vnp_TxnRef)
                        && String.valueOf((long) (order.getTotal() * 100)).equals(vnp_Amount);
            } else {
                String orderCode = vnp_OrderInfo.replace("Thanh toan don hang ", "");
                List<Order> orders = orderDAO.getAllOrders();
                for (Order o : orders) {
                    if (orderCode.equals(o.getOrderCode())) {
                        order = o;
                        break;
                    }
                }
                if (order != null) {
                    isValidTransaction = String.valueOf((long) (order.getTotal() * 100)).equals(vnp_Amount);
                }
            }

            if (order == null) {
                throw new Exception("Không tìm thấy đơn hàng trong session hoặc database");
            }
            
            if (order.getId() == 0) {
                order = orderDAO.createOrder(order);
            }

            Integer userId = order.getUserId() > 0 ? order.getUserId() : null;
            DAO.CartDAO cartDAO = new DAO.CartDAO();
            if (userId != null) {
                for (CartItem item : order.getItems()) {
                    cartDAO.deleteCartItem(request, response, item.getId(), userId);
                }
            } else {
                Cart emptyCart = new Cart();
                emptyCart.setItems(new ArrayList<>());
                cartDAO.saveCartToCookies(response, emptyCart);
            }
            
            if (isValidHash && isValidTransaction && "00".equals(vnp_ResponseCode) && "00".equals(vnp_TransactionStatus)) {
                // Thanh toán thành công
                orderDAO.updatePaymentStatus(order.getId(), "completed");
                orderDAO.updateOrderStatus(order.getId(), "processing", order.getUserId());
                order.setPaymentStatus("completed");
            } else {
                // Thanh toán thất bại
                orderDAO.updatePaymentStatus(order.getId(), "pending"); // Sửa thành "pending"
                orderDAO.updateOrderStatus(order.getId(), "pending_pay", order.getUserId());
                order.setPaymentStatus("pending");
            }

            session.setAttribute("completed_order", order);
            session.removeAttribute("pending_order");
            response.sendRedirect("cartcompletion");

        } catch (Exception e) {
            System.out.println("Exception in processVNPayReturn: " + e.getMessage());
            e.printStackTrace();
            request.setAttribute("errorMessage", "Đã xảy ra lỗi khi xử lý kết quả thanh toán: " + e.getMessage());
            request.getRequestDispatcher("cartcompletion").forward(request, response);
        }
    }

    private String buildVNPayUrl(Map<String, String> vnp_Params) throws Exception {
        List<String> fieldNames = new ArrayList<>(vnp_Params.keySet());
        Collections.sort(fieldNames);

        StringBuilder hashData = new StringBuilder();
        StringBuilder query = new StringBuilder();

        Iterator<String> itr = fieldNames.iterator();
        while (itr.hasNext()) {
            String fieldName = itr.next();
            String fieldValue = vnp_Params.get(fieldName);
            if ((fieldValue != null) && (fieldValue.length() > 0)) {
                hashData.append(fieldName).append('=');
                hashData.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                query.append(URLEncoder.encode(fieldName, StandardCharsets.US_ASCII.toString()));
                query.append('=');
                query.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                if (itr.hasNext()) {
                    hashData.append('&');
                    query.append('&');
                }
            }
        }

        String vnp_SecureHash = calculateHMAC(hashData.toString(), VNP_HASH_SECRET);
        query.append("&vnp_SecureHash=").append(vnp_SecureHash);

        String queryUrl = query.toString();
        return VNP_API_URL + "?" + queryUrl;
    }

    private String calculateHMAC(String data, String key) throws Exception {
        Mac hmac = Mac.getInstance("HmacSHA512");
        SecretKeySpec secretKeySpec = new SecretKeySpec(key.getBytes(), "HmacSHA512");
        hmac.init(secretKeySpec);
        byte[] hmacBytes = hmac.doFinal(data.getBytes());
        return bytesToHex(hmacBytes);
    }

    private String bytesToHex(byte[] bytes) {
        StringBuilder result = new StringBuilder();
        for (byte b : bytes) {
            result.append(String.format("%02x", b));
        }
        return result.toString();
    }

    private boolean validateVNPayHash(Map<String, String> params, String secureHash) {
        try {
            List<String> fieldNames = new ArrayList<>(params.keySet());
            Collections.sort(fieldNames);

            StringBuilder hashData = new StringBuilder();
            Iterator<String> itr = fieldNames.iterator();
            while (itr.hasNext()) {
                String fieldName = itr.next();
                String fieldValue = params.get(fieldName);
                if ((fieldValue != null) && (fieldValue.length() > 0)) {
                    hashData.append(fieldName).append('=');
                    hashData.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                    if (itr.hasNext()) {
                        hashData.append('&');
                    }
                }
            }

            String calculatedHash = calculateHMAC(hashData.toString(), VNP_HASH_SECRET);
            return calculatedHash.equalsIgnoreCase(secureHash);
        } catch (Exception e) {
            System.out.println("Error validating VNPay hash: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

    private String getClientIpAddress(HttpServletRequest request) {
        String ipAddress = request.getHeader("X-FORWARDED-FOR");
        if (ipAddress == null || ipAddress.isEmpty()) {
            ipAddress = request.getRemoteAddr();
        }
        return ipAddress;
    }

    private Map<String, String> getParameterMap(HttpServletRequest request) {
        Map<String, String> params = new HashMap<>();
        Map<String, String[]> requestParams = request.getParameterMap();
        for (Map.Entry<String, String[]> entry : requestParams.entrySet()) {
            String key = entry.getKey();
            String[] values = entry.getValue();
            if (values != null && values.length > 0) {
                params.put(key, values[0]);
            }
        }
        return params;
    }
}