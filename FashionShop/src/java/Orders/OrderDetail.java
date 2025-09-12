package Orders;

import DAO.OrderDAO;
import entity.Order;
import entity.OrderHistory;
import entity.User;
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
import java.util.List;

@WebServlet(name = "OrderDetailServlet", urlPatterns = {"/orderdetail"})
public class OrderDetail extends HttpServlet {

    private OrderDAO orderDAO = new OrderDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("acc");

        // Check if user is logged in
        if (user == null) {
            response.sendRedirect("login?redirect=myorder");
            return;
        }

        // Get order ID from request
        String orderIdStr = request.getParameter("id");
        if (orderIdStr == null || orderIdStr.isEmpty()) {
            response.sendRedirect("myorder");
            return;
        }

        int orderId;
        try {
            orderId = Integer.parseInt(orderIdStr);
        } catch (NumberFormatException e) {
            response.sendRedirect("myorder");
            return;
        }

        // Get order details - ensure we get the latest data from database
        Order order = orderDAO.getOrderById(orderId);

        // Check if order exists and belongs to the current user
        if (order == null || order.getUserId() != user.getId()) {
            response.sendRedirect("myorder");
            return;
        }

        // Get order history
        List<OrderHistory> orderHistory = orderDAO.getOrderHistory(orderId);

        // Calculate shipping fee based on shipping method
        double shippingFee = 30000.0; // Default standard shipping
        if (order.getShippingMethod() != null) {
            if (order.getShippingMethod().equals("express")) {
                shippingFee = 45000.0;
            }
        }

        // Calculate subtotal from order items
        double subtotal = 0;
        if (order.getItems() != null && !order.getItems().isEmpty()) {
            for (CartItem item : order.getItems()) {
                subtotal += item.getProductPrice() * item.getQuantity();
            }
        }
        if (subtotal > 500000) {
            shippingFee = 0.0; // Override shippingFee từ session nếu subtotal > 500k
        }
        
        //Kiểm tra order đã feedback chưa
        boolean checkFeedBack = orderDAO.hasFeedback(orderId);
        
        // Set attributes for JSP
        request.setAttribute("isFeedBack", checkFeedBack);
        request.setAttribute("order", order);
        request.setAttribute("orderHistory", orderHistory);
        request.setAttribute("subtotal", subtotal);
        request.setAttribute("shippingFee", shippingFee);
        
        
        // Forward to JSP
        request.getRequestDispatcher("orderdetail.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    String action = request.getParameter("action");

    HttpSession session = request.getSession();
    User user = (User) session.getAttribute("acc");

    if (user == null) {
        response.sendRedirect("login?redirect=myorder");
        return;
    }

    if (action != null) {
        int orderId = Integer.parseInt(request.getParameter("id"));
        Order order = orderDAO.getOrderById(orderId);

        if (order == null || order.getUserId() != user.getId()) {
            response.sendRedirect("myorder");
            return;
        }

        if (action.equals("cancel")) {
            boolean cancelled = orderDAO.cancelOrder(orderId, user.getId());
            if (cancelled) {
                request.setAttribute("successMessage", "Đơn hàng đã được hủy thành công và số lượng kho đã được cập nhật!");
            } else {
                request.setAttribute("errorMessage", "Không thể hủy đơn hàng hoặc cập nhật kho. Vui lòng thử lại!");
            }
        } else if (action.equals("reorder")) {
            StringBuilder queryParams = new StringBuilder();
            List<CartItem> items = order.getItems();
            if (items != null && !items.isEmpty()) {
                for (int i = 0; i < items.size(); i++) {
                    CartItem item = items.get(i);
                    if (i > 0) {
                        queryParams.append("&");
                    }
                    queryParams.append("productId=").append(item.getProductId())
                            .append("&size=").append(URLEncoder.encode(item.getSize(), StandardCharsets.UTF_8.toString()))
                            .append("&color=").append(URLEncoder.encode(item.getColor(), StandardCharsets.UTF_8.toString()))
                            .append("&quantity=").append(item.getQuantity());
                }
            }
            response.sendRedirect("cartcontact?" + queryParams.toString());
            return;
        }
    }

    processRequest(request, response);
}

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Order Detail Servlet";
    }
}
