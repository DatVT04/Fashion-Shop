/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package marketing.Feedback;

import DAO.FeedbackDAO;
import entity.Feedback;
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
@WebServlet(name = "FeedbackListServlet", urlPatterns = {"/marketing/feedbacklist"})
public class FeedbackListServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String searchKeyword = request.getParameter("searchKeyword");
        String filterRating = request.getParameter("filterRating");
        String sortField = request.getParameter("sortField");
        String sortOrder = request.getParameter("sortOrder");
        String pageStr = request.getParameter("page");

        int page = (pageStr == null) ? 1 : Integer.parseInt(pageStr);
        int recordsPerPage = 10;

        FeedbackDAO feedbackDAO = new FeedbackDAO();
        List<Feedback> feedbackList = feedbackDAO.getFeedbacksGroupedByProduct(
                searchKeyword, filterRating, sortField, sortOrder, page, recordsPerPage
        );
        int totalRecords = feedbackDAO.getTotalProductsWithFeedback(searchKeyword, filterRating);
        int totalPages = (int) Math.ceil((double) totalRecords / recordsPerPage);

        request.setAttribute("feedbackList", feedbackList);
        request.setAttribute("searchKeyword", searchKeyword);
        request.setAttribute("filterRating", filterRating);
        request.setAttribute("sortField", sortField);
        request.setAttribute("sortOrder", sortOrder);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("totalItems", totalRecords);

        request.getRequestDispatcher("/marketing/feedback/feedbackList.jsp").forward(request, response);
    }

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
                    response.sendRedirect(request.getContextPath() + "/marketing/feedbacklist?success=update");
                } else {
                    response.sendRedirect(request.getContextPath() + "/marketing/feedbacklist?error=update");
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
                    response.sendRedirect(request.getContextPath() + "/marketing/feedbacklist?success=delete_feedback");
                } else {
                    response.sendRedirect(request.getContextPath() + "/marketing/feedbacklist?error=delete_feedback");
                }
            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect(request.getContextPath() + "/marketing/feedbacklist?error=delete_feedback");
            }
        }
    }
}
