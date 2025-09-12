/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Context.DBContext;
import entity.Message;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author nguye
 */
public class MessageDAO extends DBContext {

    // Lấy ID của marketing (chỉ chọn role = 'marketing')
    public int getMarketingId() {
        String sql = "SELECT TOP 1 id FROM users WHERE role = 'marketing' AND status = 'active'";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("id");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }

    // Gửi tin nhắn
    public boolean sendMessage(int senderId, int receiverId, String content, String imageUrl) {
        String sql = "INSERT INTO messages (sender_id, receiver_id, content, image_url, created_at) " +
                     "VALUES (?, ?, ?, ?, GETDATE())";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, senderId);
            ps.setInt(2, receiverId);
            ps.setString(3, content);
            ps.setString(4, imageUrl);
            int result = ps.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Lấy danh sách user mà marketing đang chat 
    public List<Message> getChatList(int marketingId, String searchUsername, int page, int recordsPerPage) {
    List<Message> list = new ArrayList<>();
    StringBuilder sql = new StringBuilder(
        "WITH LatestMessages AS ( " +
        "    SELECT sender_id, receiver_id, content, created_at, image_url, " + // Thêm image_url
        "           ROW_NUMBER() OVER (PARTITION BY CASE WHEN sender_id = ? THEN receiver_id ELSE sender_id END ORDER BY created_at DESC) as rn " +
        "    FROM messages " +
        "    WHERE sender_id = ? OR receiver_id = ? " +
        "), " +
        "UnreadCount AS ( " +
        "    SELECT sender_id, COUNT(*) as unread_count " +
        "    FROM messages " +
        "    WHERE receiver_id = ? AND sender_id != ? AND is_read = 0 " +
        "    GROUP BY sender_id " +
        ") " +
        "SELECT u.id, u.username, m.content, m.created_at, m.sender_id, m.image_url, " + // Thêm m.image_url
        "       CASE WHEN uc.unread_count IS NULL OR uc.unread_count = 0 THEN 1 ELSE 0 END as is_read " +
        "FROM LatestMessages m " +
        "JOIN users u ON (u.id = CASE WHEN m.sender_id = ? THEN m.receiver_id ELSE m.sender_id END) " +
        "LEFT JOIN UnreadCount uc ON u.id = uc.sender_id " +
        "WHERE m.rn = 1 AND u.id != ?"
    );

    if (searchUsername != null && !searchUsername.isEmpty()) {
        sql.append(" AND u.username LIKE ?");
    }

    sql.append(" ORDER BY m.created_at DESC");
    sql.append(" OFFSET ? ROWS FETCH NEXT ? ROWS ONLY");

    try (PreparedStatement ps = connection.prepareStatement(sql.toString())) {
        int paramIndex = 1;
        ps.setInt(paramIndex++, marketingId); // LatestMessages: sender_id
        ps.setInt(paramIndex++, marketingId); // LatestMessages: sender_id
        ps.setInt(paramIndex++, marketingId); // LatestMessages: receiver_id
        ps.setInt(paramIndex++, marketingId); // UnreadCount: receiver_id
        ps.setInt(paramIndex++, marketingId); // UnreadCount: sender_id != marketingId
        ps.setInt(paramIndex++, marketingId); // JOIN: sender_id
        ps.setInt(paramIndex++, marketingId); // WHERE: u.id != marketingId

        if (searchUsername != null && !searchUsername.isEmpty()) {
            ps.setString(paramIndex++, "%" + searchUsername + "%");
        }

        ps.setInt(paramIndex++, (page - 1) * recordsPerPage);
        ps.setInt(paramIndex++, recordsPerPage);

        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            Message msg = new Message();
            msg.setSenderId(rs.getInt("id")); // ID của user trong danh sách chat
            msg.setSenderUsername(rs.getString("username"));
            msg.setContent(rs.getString("content"));
            msg.setCreatedAt(rs.getTimestamp("created_at"));
            msg.setRead(rs.getBoolean("is_read"));
            msg.setLastSenderId(rs.getInt("sender_id")); // ID của người gửi tin nhắn cuối cùng
            msg.setImageUrl(rs.getString("image_url")); // URL của hình ảnh (nếu có)
            list.add(msg);
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return list;
}

    // Đếm tổng số user đang chat với marketing
    public int getTotalChatUsers(int marketingId, String searchUsername) {
        StringBuilder sql = new StringBuilder(
            "SELECT COUNT(DISTINCT u.id) " +
            "FROM users u " +
            "JOIN messages m ON (u.id = m.sender_id OR u.id = m.receiver_id) " +
            "WHERE (m.sender_id = ? OR m.receiver_id = ?) AND u.id != ?"
        );

        if (searchUsername != null && !searchUsername.isEmpty()) {
            sql.append(" AND u.username LIKE ?");
        }

        try (PreparedStatement ps = connection.prepareStatement(sql.toString())) {
            int paramIndex = 1;
            ps.setInt(paramIndex++, marketingId);
            ps.setInt(paramIndex++, marketingId);
            ps.setInt(paramIndex++, marketingId);

            if (searchUsername != null && !searchUsername.isEmpty()) {
                ps.setString(paramIndex++, "%" + searchUsername + "%");
            }

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    // Lấy tin nhắn giữa hai user
    public List<Message> getMessagesBetweenUsers(int marketingId, int userId) {
        List<Message> list = new ArrayList<>();
        String sql = "SELECT m.*, s.username AS sender_username, r.username AS receiver_username " +
                     "FROM messages m " +
                     "JOIN users s ON m.sender_id = s.id " +
                     "JOIN users r ON m.receiver_id = r.id " +
                     "WHERE (m.sender_id = ? AND m.receiver_id = ?) OR (m.sender_id = ? AND m.receiver_id = ?) " +
                     "ORDER BY m.created_at ASC";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, marketingId);
            ps.setInt(2, userId);
            ps.setInt(3, userId);
            ps.setInt(4, marketingId);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Message msg = new Message();
                msg.setId(rs.getInt("id"));
                msg.setSenderId(rs.getInt("sender_id"));
                msg.setReceiverId(rs.getInt("receiver_id"));
                msg.setContent(rs.getString("content"));
                msg.setImageUrl(rs.getString("image_url"));
                msg.setRead(rs.getBoolean("is_read"));
                msg.setCreatedAt(rs.getTimestamp("created_at"));
                msg.setSenderUsername(rs.getString("sender_username"));
                msg.setReceiverUsername(rs.getString("receiver_username"));
                list.add(msg);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // Đánh dấu tin nhắn là đã đọc
    public boolean markAsRead(int marketingId, int userId) {
        String sql = "UPDATE messages SET is_read = 1 " +
                     "WHERE sender_id = ? AND receiver_id = ? AND is_read = 0";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ps.setInt(2, marketingId);
            int result = ps.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}