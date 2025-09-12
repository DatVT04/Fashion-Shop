/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Cart;

import DAO.CartDAO;
import DAO.ProductDAO;
import DAO.UserDAO;
import com.google.gson.reflect.TypeToken;
import entity.Cart;
import entity.CartItem;
import entity.Product;
import entity.User;
import entity.UserAddress;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.lang.reflect.Type;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

/**
 *
 * @author thanh
 */
@WebServlet(name = "CartContact", urlPatterns = {"/cartcontact"})
public class CartContact extends HttpServlet {

    private CartDAO cartDAO = new CartDAO();
    private UserDAO userDAO = new UserDAO();
    private static final String GUEST_ADDRESS_COOKIE = "guest_address";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CartContact</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CartContact at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       HttpSession session = request.getSession();
    User user = (User) session.getAttribute("acc");

    // Thiết lập biến isGuest để kiểm tra trạng thái đăng nhập trong JSP
    request.setAttribute("isGuest", user == null);

    // Lấy danh sách sản phẩm từ query parameters (nếu có, từ reorder)
    String[] productIds = request.getParameterValues("productId");
    String[] sizes = request.getParameterValues("size");
    String[] colors = request.getParameterValues("color");
    String[] quantities = request.getParameterValues("quantity");

    List<CartItem> cartItems = new ArrayList<>();
    if (productIds != null && sizes != null && colors != null && quantities != null
            && productIds.length == sizes.length && sizes.length == colors.length && colors.length == quantities.length) {
        for (int i = 0; i < productIds.length; i++) {
            CartItem item = new CartItem();
            item.setProductId(Integer.parseInt(productIds[i]));
            item.setSize(URLDecoder.decode(sizes[i], StandardCharsets.UTF_8.toString()));
            item.setColor(URLDecoder.decode(colors[i], StandardCharsets.UTF_8.toString()));
            item.setQuantity(Integer.parseInt(quantities[i]));
            // Tạo ID tạm thời cho CartItem
            item.setId((int) (System.currentTimeMillis() % Integer.MAX_VALUE) + i); // Đảm bảo ID duy nhất

            // Lấy thông tin sản phẩm từ ProductDAO
            ProductDAO productDAO = new ProductDAO();
            Product product = productDAO.getProductById(item.getProductId());
            if (product != null) {
                item.setProductTitle(product.getTitle());
                item.setProductThumbnail(product.getThumbnail());
                item.setProductPrice(product.getSalePrice().doubleValue());
            }
            cartItems.add(item);
        }
        // Lưu cartItems trực tiếp vào session cho trường hợp "Mua lại"
        session.setAttribute("selectedItemsFromReorder", cartItems);
    } else {
        // Nếu không có dữ liệu từ query string, lấy từ giỏ hàng
        CartDAO cartDAO = new CartDAO();
        Cart cart;
        if (user != null) {
            cart = cartDAO.getCartByUserId(user.getId());
        } else {
            cart = cartDAO.getCartFromCookies(request);
        }

        List<String> selectedItemIds = (List<String>) session.getAttribute("selectedItemIds");
        List<String> selectedQuantities = (List<String>) session.getAttribute("selectedQuantities");

        if (selectedItemIds != null && selectedQuantities != null && cart != null) {
            for (CartItem item : cart.getItems()) {
                for (int i = 0; i < selectedItemIds.size(); i++) {
                    if (String.valueOf(item.getId()).equals(selectedItemIds.get(i))) {
                        item.setQuantity(Integer.parseInt(selectedQuantities.get(i)));
                        cartItems.add(item);
                        break;
                    }
                }
            }
        }
    }

    if (cartItems.isEmpty()) {
        response.sendRedirect("cartdetail");
        return;
    }

    // Tính toán subtotal
    double subtotal = 0;
    for (CartItem item : cartItems) {
        subtotal += item.getProductPrice() * item.getQuantity();
    }

    // Lấy địa chỉ giao hàng
    List<UserAddress> addresses;
    if (user != null) {
        addresses = userDAO.getUserAddresses(user.getId());
    } else {
        addresses = getGuestAddressesFromCookie(request);
    }

    // Lấy thông tin giảm giá từ session
    String appliedCoupon = (String) session.getAttribute("appliedCoupon");
    Double discountAmount = (Double) session.getAttribute("cartDiscount");

    // Thiết lập phí vận chuyển mặc định
    double shippingFee = (subtotal > 500000) ? 0.0 : 30000.0;

    // Lưu dữ liệu vào request
    request.setAttribute("selectedItems", cartItems);
    request.setAttribute("addresses", addresses);
    request.setAttribute("subtotal", subtotal);
    request.setAttribute("discount", discountAmount);
    request.setAttribute("appliedCoupon", appliedCoupon);
    request.setAttribute("shippingFee", shippingFee);

    // Nếu là khách vãng lai, lấy email từ cookie hoặc để trống để người dùng nhập
    if (user == null) {
        String guestEmail = getGuestEmailFromCookie(request);
        request.setAttribute("guestEmail", guestEmail);
    }

    request.getRequestDispatcher("cartcontact.jsp").forward(request, response);
}

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("acc");
        String action = request.getParameter("action");

        if ("add_address".equals(action)) {
            // Xử lý thêm địa chỉ mới
            UserAddress newAddress = new UserAddress();
            newAddress.setRecipientName(request.getParameter("recipient_name"));
            newAddress.setPhone(request.getParameter("phone"));
            newAddress.setAddress(request.getParameter("address"));
            newAddress.setDefault(request.getParameter("is_default") != null);

            if (user != null) {
                // Người dùng đã đăng nhập - lưu vào database
                newAddress.setUserId(user.getId());
                userDAO.addUserAddress(newAddress);
            } else {
                // Người dùng chưa đăng nhập - lưu vào cookie
                newAddress.setId(generateGuestAddressId());
                newAddress.setEmail(request.getParameter("email")); // Lưu email cho khách nếu có trong địa chỉ

                // Lấy danh sách địa chỉ hiện tại từ cookie
                List<UserAddress> guestAddresses = getGuestAddressesFromCookie(request);

                // Nếu đặt địa chỉ mới làm mặc định, cập nhật các địa chỉ khác
                if (newAddress.isDefault()) {
                    for (UserAddress address : guestAddresses) {
                        address.setDefault(false);
                    }
                }

                // Nếu đây là địa chỉ đầu tiên, đặt làm mặc định
                if (guestAddresses.isEmpty()) {
                    newAddress.setDefault(true);
                }

                guestAddresses.add(newAddress);

                // Lưu danh sách địa chỉ vào cookie
                saveGuestAddressesToCookie(response, guestAddresses);
            }

            response.sendRedirect("cartcontact");
            return;
        }

       String addressId = request.getParameter("shipping_address");
    if (addressId == null || addressId.isEmpty()) {
        request.setAttribute("error", "Vui lòng chọn địa chỉ giao hàng");
        doGet(request, response);
        return;
    }

    String shippingMethod = request.getParameter("shipping_method");
    double shippingFee;
    if ("express".equals(shippingMethod)) {
        shippingFee = 45000.0;
    } else {
        shippingMethod = "standard"; // Đảm bảo giá trị mặc định là "standard"
        shippingFee = 30000.0;
    }

    String paymentMethod = request.getParameter("payment_method");
    if (paymentMethod == null || paymentMethod.isEmpty()) {
        request.setAttribute("error", "Vui lòng chọn phương thức thanh toán");
        doGet(request, response);
        return;
    }

    // Lấy email cho khách vãng lai từ form
    String guestEmail = null;
    if (user == null) {
        guestEmail = request.getParameter("guest_email");
        if (guestEmail == null || guestEmail.trim().isEmpty()) {
            request.setAttribute("error", "Vui lòng nhập email để tiếp tục");
            doGet(request, response);
            return;
        }
        saveGuestEmailToCookie(response, guestEmail);
    }

    // Lưu thông tin vào session
    session.setAttribute("shipping_address_id", addressId);
    session.setAttribute("shipping_method", shippingMethod); // Lưu đúng giá trị "standard" hoặc "express"
    session.setAttribute("shipping_fee", shippingFee);
    session.setAttribute("payment_method", paymentMethod);
    if (user == null) {
        session.setAttribute("guest_email", guestEmail);
    } else {
        session.setAttribute("user_email", user.getEmail());
    }

    Double discount = (Double) session.getAttribute("cartDiscount");
    String appliedCoupon = (String) session.getAttribute("appliedCoupon");
    if (discount != null) {
        session.setAttribute("order_discount", discount);
        session.setAttribute("order_coupon", appliedCoupon);
    }

    response.sendRedirect("cartcompletion");
}

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }

    // Phương thức tạo ID duy nhất cho địa chỉ của khách
    private int generateGuestAddressId() {
        return Math.abs(UUID.randomUUID().hashCode());
    }

    // Phương thức lấy danh sách địa chỉ của khách từ cookie
    private List<UserAddress> getGuestAddressesFromCookie(HttpServletRequest request) {
        List<UserAddress> addresses = new ArrayList<>();
        Cookie[] cookies = request.getCookies();

        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (GUEST_ADDRESS_COOKIE.equals(cookie.getName())) {
                    try {
                        // Giải mã cookie
                        String addressesJson = cartDAO.decodeCookieValue(cookie.getValue());

                        // Sử dụng TypeToken để chỉ định loại dữ liệu cần chuyển đổi
                        Type listType = new TypeToken<ArrayList<UserAddress>>() {
                        }.getType();
                        addresses = cartDAO.gson.fromJson(addressesJson, listType);

                        break;
                    } catch (Exception e) {
                        System.out.println("Error parsing guest addresses cookie: " + e.getMessage());
                    }
                }
            }
        }

        return addresses != null ? addresses : new ArrayList<>();
    }

    // Phương thức lưu danh sách địa chỉ của khách vào cookie
    private void saveGuestAddressesToCookie(HttpServletResponse response, List<UserAddress> addresses) {
        try {
            String addressesJson = cartDAO.gson.toJson(addresses);
            String encodedValue = cartDAO.encodeCookieValue(addressesJson);

            Cookie cookie = new Cookie(GUEST_ADDRESS_COOKIE, encodedValue);
            cookie.setMaxAge(30 * 24 * 60 * 60); // 30 ngày
            cookie.setPath("/");
            response.addCookie(cookie);
        } catch (Exception e) {
            System.out.println("Error saving guest addresses to cookie: " + e.getMessage());
        }
    }

    // Phương thức lấy email của khách từ cookie (nếu cần lưu trữ)
    private String getGuestEmailFromCookie(HttpServletRequest request) {
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("guest_email".equals(cookie.getName())) {
                    try {
                        return URLDecoder.decode(cookie.getValue(), StandardCharsets.UTF_8.toString());
                    } catch (Exception e) {
                        System.out.println("Error decoding guest email cookie: " + e.getMessage());
                    }
                }
            }
        }
        return null;
    }

    // Phương thức lưu email của khách vào cookie (nếu cần lưu trữ)
    private void saveGuestEmailToCookie(HttpServletResponse response, String email) {
        try {
            String encodedEmail = URLEncoder.encode(email, StandardCharsets.UTF_8.toString());
            Cookie cookie = new Cookie("guest_email", encodedEmail);
            cookie.setMaxAge(30 * 24 * 60 * 60); // 30 ngày
            cookie.setPath("/");
            response.addCookie(cookie);
        } catch (Exception e) {
            System.out.println("Error saving guest email to cookie: " + e.getMessage());
        }
    }
}