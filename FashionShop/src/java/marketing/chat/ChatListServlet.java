/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package marketing.chat;

import DAO.MessageDAO;
import entity.Message;
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
@WebServlet(name = "ChatListServlet", urlPatterns = {"/marketing/chatlist"})
public class ChatListServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Integer userId = (Integer) request.getSession().getAttribute("userID");
        if (userId == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        MessageDAO messageDAO = new MessageDAO();
        int marketingId = messageDAO.getMarketingId();
        if (marketingId == -1) {
            request.setAttribute("error", "Không tìm thấy nhân viên marketing.");
            request.getRequestDispatcher("/marketing/chat/chatList.jsp").forward(request, response);
            return;
        }

        String searchUsername = request.getParameter("searchUsername");
        String pageStr = request.getParameter("page");
        int page = (pageStr == null || pageStr.isEmpty()) ? 1 : Integer.parseInt(pageStr);
        int recordsPerPage = 10;

        List<Message> chatList = messageDAO.getChatList(marketingId, searchUsername, page, recordsPerPage);
        int totalUsers = messageDAO.getTotalChatUsers(marketingId, searchUsername);
        int totalPages = (int) Math.ceil((double) totalUsers / recordsPerPage);

        request.setAttribute("chatList", chatList);
        request.setAttribute("searchUsername", searchUsername);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("totalUsers", totalUsers);
        request.setAttribute("marketingId", marketingId); 

        request.getRequestDispatcher("/marketing/chat/chatList.jsp").forward(request, response);
    }
}