/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package marketing.Feedback;

import DAO.FeedbackDAO;
import entity.Feedback;
import entity.FeedbackImage;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author nguye
 */
@WebServlet(name = "FeedbackDetailServlet", urlPatterns = {"/marketing/feedbackdetail"})
public class FeedbackDetailServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int productId = Integer.parseInt(request.getParameter("productId"));
        String searchKeyword = request.getParameter("searchKeyword");
        String filterRating = request.getParameter("filterRating");
        String filterStatus = request.getParameter("filterStatus");
        String sortField = request.getParameter("sortField");
        String sortOrder = request.getParameter("sortOrder");
        String pageStr = request.getParameter("page");

        if (sortField == null || sortField.isEmpty()) {
            sortField = "created_at";
            sortOrder = "desc";
        }

        int page = (pageStr == null) ? 1 : Integer.parseInt(pageStr);
        int recordsPerPage = 10;

        FeedbackDAO feedbackDAO = new FeedbackDAO();
        List<Feedback> feedbackList = feedbackDAO.getFeedbacksByProduct(searchKeyword, filterRating, filterStatus,
                sortField, sortOrder, productId, page, recordsPerPage);
        int totalRecords = feedbackDAO.getTotalFeedbacksByProduct(searchKeyword, filterRating, filterStatus, productId);
        int totalPages = (int) Math.ceil((double) totalRecords / recordsPerPage);

        // Lấy số lượng đánh giá cho từng mức sao theo productId
        int[] ratingCounts = feedbackDAO.getRatingCountsByProduct(searchKeyword, productId);

        request.setAttribute("feedbackList", feedbackList);
        request.setAttribute("productId", productId);
        request.setAttribute("searchKeyword", searchKeyword);
        request.setAttribute("filterRating", filterRating);
        request.setAttribute("filterStatus", filterStatus);
        request.setAttribute("sortField", sortField);
        request.setAttribute("sortOrder", sortOrder);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("totalItems", totalRecords);
        request.setAttribute("ratingCounts", ratingCounts); // Truyền mảng ratingCounts vào request

        request.getRequestDispatcher("/marketing/feedback/feedbackDetail.jsp").forward(request, response);
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
        String action = request.getParameter("action");
        FeedbackDAO feedbackDAO = new FeedbackDAO();
        int productId = Integer.parseInt(request.getParameter("productId"));

        if ("updateStatus".equals(action)) {
            try {
                int id = Integer.parseInt(request.getParameter("id"));
                String status = request.getParameter("status");
                boolean updated = feedbackDAO.updateFeedbackStatus(id, status);
                if (updated) {
                    response.sendRedirect(request.getContextPath() + "/marketing/feedbackdetail?productId=" + productId + "&success=update");
                } else {
                    response.sendRedirect(request.getContextPath() + "/marketing/feedbackdetail?productId=" + productId + "&error=update");
                }
            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect(request.getContextPath() + "/marketing/feedbacklist?error=update");
            }
        } else if ("deleteFeedback".equals(action)) {
            try {
                int id = Integer.parseInt(request.getParameter("id"));
                boolean deleted = feedbackDAO.deleteFeedback(id);
                if (deleted) {
                    response.sendRedirect(request.getContextPath() + "/marketing/feedbackdetail?productId=" + productId + "&success=delete_feedback");
                } else {
                    response.sendRedirect(request.getContextPath() + "/marketing/feedbackdetail?productId=" + productId + "&error=delete_feedback");
                }
            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect(request.getContextPath() + "/marketing/feedbackdetail?error=delete_feedback");
            }
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
