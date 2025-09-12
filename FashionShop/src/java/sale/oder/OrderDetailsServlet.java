/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package sale.oder;

import DAO.CustomerDAO;
import DAO.InventoryDAO;
import DAO.OrderDAO;
import DAO.UserDAO;
import entity.CartItem;
import entity.Customer;
import entity.Order;
import entity.User;
import entity.OrderHistory;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.List;
import utils.Email;

/**
 *
 * @author tphon
 */
@WebServlet(name = "OrderDetailsServlet", urlPatterns = {"/sale/orderdetails"})
public class OrderDetailsServlet extends HttpServlet {

    private OrderDAO orderDAO = new OrderDAO();
    private UserDAO userDAO = new UserDAO();
    private Email emailUtil = new Email();
    private CustomerDAO customerDAO = new CustomerDAO();
    private InventoryDAO inventoryDAO = new InventoryDAO();

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
            out.println("<title>Servlet OrderDetailsServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OrderDetailsServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
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
        try {
            int orderId = Integer.parseInt(request.getParameter("id"));
            Order order = orderDAO.getOrderById(orderId);
            if (order == null) {
                response.sendRedirect(request.getContextPath() + "error/error.jsp");
                return;
            }

            User user = order.getUserId() > 0 ? userDAO.getUserById(order.getUserId()) : null;
            List<OrderHistory> history = orderDAO.getOrderHistory(orderId);

            request.setAttribute("order", order);
            request.setAttribute("user", user);
            request.setAttribute("history", history);
            request.getRequestDispatcher("/sale/orderDetails.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/error.jsp");
        }
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
        try {
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("acc");

            int orderId = Integer.parseInt(request.getParameter("orderId"));
            String newStatus = request.getParameter("status");
            int updatedBy = user.getId();

            Order order = orderDAO.getOrderById(orderId);
            boolean success = false;

            // Xử lý theo trạng thái mới
            // Trạng thái mới là processing và cancelled
            if ("processing".equals(newStatus) || "cancelled".equals(newStatus)) {
                success = orderDAO.updateOrderStatus(orderId, newStatus, updatedBy, null, null);
                if ("cancelled".equals(newStatus)) {
                    for (CartItem temp : order.getItems()) {
                        int variantId = inventoryDAO.getVariantId(temp.getProductId(), temp.getSize(), temp.getColor());
                        inventoryDAO.increaseVariantStock(variantId, temp.getQuantity());
                    }
                }

                // Trạng thái mới là đang giao   
            } else if ("shipping".equals(newStatus)) {
                String shippingProvider = request.getParameter("shippingProvider");
                String trackingNumber = request.getParameter("trackingNumber");
                success = orderDAO.updateOrderStatus(orderId, newStatus, updatedBy, shippingProvider, trackingNumber);

                // Trạng thái mới là hoàn thành    
            } else if ("completed".equals(newStatus)) {
                success = orderDAO.updateOrderStatus(orderId, newStatus, updatedBy, null, null);
                orderDAO.updatePayStatus(orderId, "completed");
                Customer tempCus = customerDAO.getCusdByEmailPhone(order.getRecipientEmail(), order.getPhone());
                if (tempCus != null) {
                    System.out.println(tempCus.toString());
                    customerDAO.updateCustomerPurchaseStats(tempCus.getId(), BigDecimal.valueOf(order.getTotal()), updatedBy);
                    if (tempCus.getTotalSpend().doubleValue() + order.getTotal() >= 1000000) {
                        customerDAO.updateCustomerType(tempCus.getId(), "vip");
                    }
                } else {
                    Customer newCustomer = new Customer();
                    newCustomer.setUserId(order.getUserId() == 0 ? null : order.getUserId());
                    newCustomer.setEmail(order.getRecipientEmail());
                    newCustomer.setFullName(order.getRecipientName());
                    newCustomer.setGender(userDAO.getUserById(order.getUserId()) == null ? "other" : userDAO.getUserById(order.getUserId()).getGender());
                    newCustomer.setMobile(order.getPhone());
                    newCustomer.setTotalPurchases(1);
                    newCustomer.setTotalSpend(BigDecimal.valueOf(order.getTotal()));
                    if (order.getTotal() >= 1000000) {
                        newCustomer.setCustomerType("vip");
                    } else {
                        newCustomer.setCustomerType("normal");
                    }
                    customerDAO.addCustomer(newCustomer);
                }

                // Trạng thái mới là hoàn hàng    
            } else {
                success = orderDAO.updateOrderStatus(orderId, newStatus, updatedBy, null, null);
                orderDAO.updatePayStatus(orderId, "refunded");
                for (CartItem temp : order.getItems()) {
                    int variantId = inventoryDAO.getVariantId(temp.getProductId(), temp.getSize(), temp.getColor());
                    inventoryDAO.increaseVariantStock(variantId, temp.getQuantity());
                }
            }

            if (success) {
                sendOrderStatusEmail(order, newStatus);
                response.sendRedirect(request.getContextPath() + "/sale/orderdetails?id=" + orderId + "&alert=SSU");
            } else {
                response.sendRedirect(request.getContextPath() + "/sale/orderdetails?id=" + orderId + "&alert=ERR");
            }
        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/error.jsp");
        }
    }

// Hàm gửi email thông báo cập nhật trạng thái đơn hàng
    private void sendOrderStatusEmail(Order order, String newStatus) {
        try {
            User recipient = new User();
            recipient.setEmail(order.getRecipientEmail());
            recipient.setFullName(order.getRecipientName());

            // Ánh xạ trạng thái sang tiếng Việt
            String statusText = switch (newStatus) {
                case "processing" ->
                    "Đang xử lý";
                case "shipping" ->
                    "Đang giao";
                case "completed" ->
                    "Hoàn thành";
                case "returned" ->
                    "Hoàn trả";
                case "cancelled" ->
                    "Đã hủy";
                default ->
                    newStatus;
            };

            // Gửi email
            boolean sent = emailUtil.sendOrderStatusEmail(order, statusText, newStatus);
            if (sent) {
                System.out.println("Email sent successfully to " + recipient.getEmail());
            } else {
                System.out.println("Failed to send email to " + recipient.getEmail());
            }
        } catch (Exception e) {
            System.out.println("Error sending email: " + e.getMessage());
            e.printStackTrace();
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
