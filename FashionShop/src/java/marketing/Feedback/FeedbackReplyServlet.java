/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package marketing.Feedback;

import DAO.FeedbackDAO;
import DAO.FeedbackReplyDAO;
import entity.Feedback;
import entity.FeedbackReply;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author nguye
 */
@WebServlet(name = "FeedbackReplyServlet", urlPatterns = {"/marketing/feedbackreply"})
public class FeedbackReplyServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int feedbackId = Integer.parseInt(request.getParameter("feedbackId"));
        String returnUrl = request.getParameter("returnUrl"); // Lấy returnUrl từ request
        String productId = request.getParameter("productId"); // Lấy productId nếu có

        FeedbackDAO feedbackDAO = new FeedbackDAO();
        Feedback feedback = feedbackDAO.getFeedbackById(feedbackId);

        FeedbackReplyDAO replyDAO = new FeedbackReplyDAO();
        List<FeedbackReply> replies = replyDAO.getRepliesByFeedbackId(feedbackId);

        List<String> feedbackImages = feedbackDAO.getImagesByFeedbackId(feedbackId);

        request.setAttribute("feedback", feedback);
        request.setAttribute("replies", replies);
        request.setAttribute("feedbackImages", feedbackImages);
        request.setAttribute("returnUrl", returnUrl); // Truyền returnUrl vào request
        request.setAttribute("productId", productId); // Truyền productId nếu có

        request.getRequestDispatcher("/marketing/feedback/feedbackReply.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userID");
        String returnUrl = request.getParameter("returnUrl"); // Lấy returnUrl từ request
        String productId = request.getParameter("productId"); // Lấy productId nếu có

        String action = request.getParameter("action");
        int feedbackId = Integer.parseInt(request.getParameter("feedbackId"));
        FeedbackReplyDAO replyDAO = new FeedbackReplyDAO();

        String redirectUrl = "";
        if ("deleteReply".equals(action)) {
            int replyId = Integer.parseInt(request.getParameter("replyId"));
            boolean deleted = replyDAO.deleteReply(replyId);
            redirectUrl = request.getContextPath() + "/marketing/feedbackreply?feedbackId=" + feedbackId
                    + "&returnUrl=" + (returnUrl != null ? returnUrl : "feedbackall")
                    + (productId != null ? "&productId=" + productId : "")
                    + (deleted ? "&success=delete_reply" : "&error=delete_reply");
        } else if ("updateReply".equals(action)) {
            int replyId = Integer.parseInt(request.getParameter("replyId"));
            String comment = request.getParameter("comment");
            boolean updated = replyDAO.updateReply(replyId, comment);
            redirectUrl = request.getContextPath() + "/marketing/feedbackreply?feedbackId=" + feedbackId
                    + "&returnUrl=" + (returnUrl != null ? returnUrl : "feedbackall")
                    + (productId != null ? "&productId=" + productId : "")
                    + (updated ? "&success=update_reply" : "&error=update_reply");
        } else {
            // Thêm reply mới
            String comment = request.getParameter("comment");
            FeedbackReply reply = new FeedbackReply();
            reply.setFeedbackId(feedbackId);
            reply.setUserId(userId);
            reply.setComment(comment);

            boolean added = replyDAO.addReply(reply);
            redirectUrl = request.getContextPath() + "/marketing/feedbackreply?feedbackId=" + feedbackId
                    + "&returnUrl=" + (returnUrl != null ? returnUrl : "feedbackall")
                    + (productId != null ? "&productId=" + productId : "")
                    + (added ? "&success=add" : "&error=add");
        }

        response.sendRedirect(redirectUrl);
    }
}
