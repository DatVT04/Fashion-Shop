/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import DAO.FeedbackDAO;
import DAO.OrderDAO;
import entity.Feedback;
import entity.FeedbackImage;
import entity.Order;
import entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

/**
 *
 * @author tphon
 */
@WebServlet(urlPatterns = {"/submitfeedback"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50 // 50MB
)
public class SubmitFeedback extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private static final String UPLOAD_DIRECTORY = "uploads/feedbackImages";

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
            out.println("<title>Servlet SubmitFeedback</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SubmitFeedback at " + request.getContextPath() + "</h1>");
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
        // Validate user authentication
        int userId = getUserIdFromSession(request);
        if (userId == -1) {
            // Redirect to login if not authenticated
            response.sendRedirect("login");
            return;
        }

        // Get order ID from request
        String orderIdParam = request.getParameter("orderId");
        if (orderIdParam == null || orderIdParam.isEmpty()) {
            // Handle invalid order ID
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Mã đơn hàng không hợp lệ");
            return;
        }

        try {
            int orderId = Integer.parseInt(orderIdParam);
//            System.out.println("99: orderId:" + orderId);

            // Fetch order details 
            OrderDAO orderDAO = new OrderDAO(); // You'll need to implement this
            Order order = orderDAO.getOrderById(orderId);

            // Verify order belongs to the current user
            if (order == null || order.getUserId() != userId) {
//                response.sendError(HttpServletResponse.SC_FORBIDDEN, "Bạn không có quyền truy cập đơn hàng này");
                response.sendRedirect("error/error.jsp");
                return;
            }

            // Set order in request for JSP to use
            request.setAttribute("order", order);

            // Forward to feedback submission page
            request.getRequestDispatcher("/submitFeedback.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Mã đơn hàng không hợp lệ");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Đã xảy ra lỗi");
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
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        // Get user information from session (you'll need to implement user authentication)
        int userId = getUserIdFromSession(request);

        // Get order ID 
        int orderId = Integer.parseInt(request.getParameter("orderId"));
//        System.out.println("143: test orderId:" + orderId);
        // Get all order item IDs
        String[] orderItemIds = request.getParameterValues("orderItemId");
//        System.out.println("146: test orderIdS:" + orderItemIds.toString());

        // Prepare FeedbackDAO
        FeedbackDAO feedbackDAO = new FeedbackDAO();

        try {
            // Process feedback for each order item
            for (String orderItemIdStr : orderItemIds) {
                int orderItemId = Integer.parseInt(orderItemIdStr);
//                System.out.println("156: orderItemId: "+ orderItemId);
                // Get rating and comment for this specific item
                String ratingParam = "rating-" + orderItemId;
                String commentParam = "comment-" + orderItemId;
                
//                System.out.println("161: rating param:" + ratingParam);
//                System.out.println("162: comment param:" + commentParam);
                // Skip if no rating provided
                System.out.println("164: test:" + request.getParameter(ratingParam));
                if (request.getParameter(ratingParam) == null) {
                    continue;
                }

                int rating = Integer.parseInt(request.getParameter(ratingParam));
                String comment = request.getParameter(commentParam);
//                System.out.println("171: test:"+comment);
                // Create Feedback object
                Feedback feedback = new Feedback();
                feedback.setOrderItemId(orderItemId);
                feedback.setUserId(userId);
                feedback.setRating(rating);
                feedback.setComment(comment);
                feedback.setStatus("pending");

                // Insert feedback and get its ID
                int feedbackId = feedbackDAO.insertFeedback(feedback);

                // Handle image uploads for this specific item
                String imageInputName = "feedbackImages-" + orderItemId;
                List<Part> imageParts = request.getParts().stream()
                        .filter(part -> part.getName().equals(imageInputName))
                        .toList();

                // Upload and save images
                if (!imageParts.isEmpty()) {
                    String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIRECTORY;
                    File uploadDir = new File(uploadPath);
                    if (!uploadDir.exists()) {
                        uploadDir.mkdirs();
                    }

                    // Limit to 5 images
                    int imageCount = 0;
                    for (Part part : imageParts) {
                        if (imageCount >= 5) {
                            break;
                        }

                        String fileName = extractFileName(part);
                        if (fileName != null && !fileName.isEmpty()) {
                            // Generate unique filename
                            String uniqueFileName = UUID.randomUUID().toString() + "_" + fileName;
                            String filePath = uploadPath + File.separator + uniqueFileName;
                            part.write(filePath);

                            // Store relative path for database
                            String relativePath = UPLOAD_DIRECTORY + "/" + uniqueFileName;
                            feedbackDAO.insertFeedbackImage(feedbackId, relativePath);

                            imageCount++;
                        }
                    }
                }
            }

            // Redirect with success message
            request.getSession().setAttribute("successMessage", "Đánh giá của bạn đã được ghi nhận!");
            response.sendRedirect("orderdetail?id=" + orderId + "&alert=success");

        } catch (Exception e) {
            e.printStackTrace();
            // Handle error
            request.getSession().setAttribute("errorMessage", "Có lỗi xảy ra khi lưu đánh giá.");
            response.sendRedirect("orderdetail?id=" + orderId + "&alert=faill");
        }
    }
    // Helper method to extract filename from Part

    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return null;
    }

    // Method to get user ID from session (implement your authentication logic)
    private int getUserIdFromSession(HttpServletRequest request) {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("acc");
        if (user == null) {
            return -1;
        }
        Integer userId = (Integer) user.getId();
        return userId != null ? userId : -1;
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
