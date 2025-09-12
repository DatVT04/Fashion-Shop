/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Context.DBContext;
import entity.FeedbackReply;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author nguye
 */
public class FeedbackReplyDAO extends DBContext {

    public List<FeedbackReply> getRepliesByFeedbackId(int feedbackId) {
        List<FeedbackReply> list = new ArrayList<>();
        String sql = "SELECT fr.*, u.full_name FROM feedback_reply fr "
                + "JOIN users u ON fr.user_id = u.id "
                + "WHERE fr.feedback_id = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, feedbackId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                FeedbackReply reply = new FeedbackReply();
                reply.setId(rs.getInt("id"));
                reply.setFeedbackId(rs.getInt("feedback_id"));
                reply.setUserId(rs.getInt("user_id"));
                reply.setComment(rs.getString("comment"));
                reply.setCreatedAt(rs.getTimestamp("created_at"));
                reply.setUpdatedAt(rs.getTimestamp("updated_at"));
                reply.setUserFullName(rs.getString("full_name"));
                list.add(reply);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean addReply(FeedbackReply reply) {
        String sql = "INSERT INTO feedback_reply (feedback_id, user_id, comment) VALUES (?, ?, ?)";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, reply.getFeedbackId());
            ps.setInt(2, reply.getUserId());
            ps.setString(3, reply.getComment());
            int result = ps.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean updateReply(int replyId, String comment) {
        String sql = "UPDATE feedback_reply SET comment = ?, updated_at = CURRENT_TIMESTAMP WHERE id = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, comment);
            ps.setInt(2, replyId);
            int result = ps.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteReply(int replyId) {
        String sql = "DELETE FROM feedback_reply WHERE id = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, replyId);
            int result = ps.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
