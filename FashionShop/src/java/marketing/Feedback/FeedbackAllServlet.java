/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package marketing.Feedback;

import DAO.FeedbackDAO;
import entity.Feedback;
import java.io.IOException;
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
@WebServlet(name = "FeedbackAllServlet", urlPatterns = {"/marketing/feedbackall"})
public class FeedbackAllServlet extends HttpServlet {

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
        String searchKeyword = request.getParameter("searchKeyword");
        String filterRating = request.getParameter("filterRating");
        String filterStatus = request.getParameter("filterStatus");
        String sortField = request.getParameter("sortField");
        String sortOrder = request.getParameter("sortOrder");
        String pageStr = request.getParameter("page");

        // Mặc định sắp xếp theo created_at giảm dần nếu không có sortField
        if (sortField == null || sortField.isEmpty()) {
            sortField = "created_at";
            sortOrder = "desc";
        }

        int page = (pageStr == null || pageStr.isEmpty()) ? 1 : Integer.parseInt(pageStr);
        int recordsPerPage = 10;

        FeedbackDAO feedbackDAO = new FeedbackDAO();
        List<Feedback> feedbackList = feedbackDAO.getFeedbacks(searchKeyword, filterRating, filterStatus,
                sortField, sortOrder, 0, page, recordsPerPage);
        int totalRecords = feedbackDAO.getTotalFeedbacks(searchKeyword, filterRating, filterStatus, 0);
        int totalPages = (int) Math.ceil((double) totalRecords / recordsPerPage);
        
        int[] ratingCounts = feedbackDAO.getRatingCounts(searchKeyword);

        request.setAttribute("feedbackList", feedbackList);
        request.setAttribute("searchKeyword", searchKeyword);
        request.setAttribute("filterRating", filterRating);
        request.setAttribute("filterStatus", filterStatus);
        request.setAttribute("sortField", sortField);
        request.setAttribute("sortOrder", sortOrder);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("totalItems", totalRecords);
        request.setAttribute("ratingCounts", ratingCounts); // Truyền mảng ratingCounts vào request

        request.getRequestDispatcher("/marketing/feedback/feedbackAll.jsp").forward(request, response);
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

        if ("updateStatus".equals(action)) {
            try {
                int id = Integer.parseInt(request.getParameter("id"));
                String status = request.getParameter("status");
                boolean updated = feedbackDAO.updateFeedbackStatus(id, status);
                if (updated) {
                    response.sendRedirect(request.getContextPath() + "/marketing/feedbackall?success=update");
                } else {
                    response.sendRedirect(request.getContextPath() + "/marketing/feedbackall?error=update");
                }
            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect(request.getContextPath() + "/marketing/feedbackall?error=update");
            }
        } else if ("deleteFeedback".equals(action)) {
            try {
                int id = Integer.parseInt(request.getParameter("id"));
                boolean deleted = feedbackDAO.deleteFeedback(id);
                if (deleted) {
                    response.sendRedirect(request.getContextPath() + "/marketing/feedbackall?success=delete_feedback");
                } else {
                    response.sendRedirect(request.getContextPath() + "/marketing/feedbackall?error=delete_feedback");
                }
            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect(request.getContextPath() + "/marketing/feedbackall?error=delete_feedback");
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
        return "Servlet to handle all feedback operations";
    }
}