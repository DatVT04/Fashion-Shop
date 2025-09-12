/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Filter.java to edit this template
 */
import DAO.MessageDAO;
import entity.Message;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.List;

/**
 *
 * @author nguye
 */
@WebFilter(urlPatterns = {"/*"})
public class Chat implements Filter {

    private MessageDAO messageDAO;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        messageDAO = new MessageDAO();
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;

        // Lấy dữ liệu chat
        Integer userId = (Integer) httpRequest.getSession().getAttribute("userID");
        List<Message> messages = null;
        int chatUserId = userId != null ? userId : -1;
        int marketingId = -1;

        if (userId != null) {
            marketingId = messageDAO.getMarketingId();
            if (marketingId != -1) {
                messages = messageDAO.getMessagesBetweenUsers(marketingId, userId);
                messageDAO.markAsRead(marketingId, userId);
                chatUserId = userId;
            } else {
                request.setAttribute("chatError", "Không tìm thấy nhân viên marketing.");
            }
        } else {
            request.setAttribute("chatError", "Vui lòng đăng nhập để sử dụng chat!");
        }

        request.setAttribute("chatMessages", messages);
        request.setAttribute("chatUserId", chatUserId);
        request.setAttribute("userID", userId);
        request.setAttribute("marketingId", marketingId);

        // Tiếp tục chain để xử lý request tiếp theo 
        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
        // Cleanup
    }
}