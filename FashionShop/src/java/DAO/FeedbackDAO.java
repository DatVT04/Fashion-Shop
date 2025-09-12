/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Context.DBContext;
import entity.Feedback;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.sql.Statement;

/**
 *
 * @author nguye
 */
public class FeedbackDAO extends DBContext {

    public List<Feedback> getFeedbacks(String searchKeyword, String filterRating, String filterStatus,
            String sortField, String sortOrder, int productId, int page, int recordsPerPage) {
        List<Feedback> list = new ArrayList<>();
        StringBuilder sql = new StringBuilder("SELECT f.*, u.full_name, u.username, p.title, p.thumbnail, oi.product_id ");
        sql.append("FROM feedback f ");
        sql.append("JOIN users u ON f.user_id = u.id ");
        sql.append("JOIN order_items oi ON f.order_item_id = oi.id ");
        sql.append("JOIN products p ON oi.product_id = p.id ");
        sql.append("WHERE 1=1");

        // Điều kiện tìm kiếm và lọc
        if (productId > 0) {
            sql.append(" AND p.id = ?");
        }
        if (searchKeyword != null && !searchKeyword.isEmpty()) {
            sql.append(" AND (f.comment LIKE ? OR u.username LIKE ?)");
        }
        if (filterRating != null && !filterRating.isEmpty()) {
            sql.append(" AND f.rating = ?");
        }
        if (filterStatus != null && !filterStatus.isEmpty()) {
            sql.append(" AND f.status = ?");
        }

        // Sắp xếp
        if (sortField != null && !sortField.isEmpty()) {
            sql.append(" ORDER BY ").append(sortField).append(" ").append(sortOrder.equals("desc") ? "DESC" : "ASC");
        } else {
            sql.append(" ORDER BY f.created_at DESC");
        }

        // Phân trang
        sql.append(" OFFSET ? ROWS FETCH NEXT ? ROWS ONLY");

        try (PreparedStatement ps = connection.prepareStatement(sql.toString())) {
            int paramIndex = 1;

            if (productId > 0) {
                ps.setInt(paramIndex++, productId);
            }
            if (searchKeyword != null && !searchKeyword.isEmpty()) {
                ps.setString(paramIndex++, "%" + searchKeyword + "%");
                ps.setString(paramIndex++, "%" + searchKeyword + "%");
            }
            if (filterRating != null && !filterRating.isEmpty()) {
                ps.setInt(paramIndex++, Integer.parseInt(filterRating));
            }
            if (filterStatus != null && !filterStatus.isEmpty()) {
                ps.setString(paramIndex++, filterStatus);
            }

            ps.setInt(paramIndex++, (page - 1) * recordsPerPage);
            ps.setInt(paramIndex++, recordsPerPage);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Feedback feedback = new Feedback();
                feedback.setId(rs.getInt("id"));
                feedback.setOrderItemId(rs.getInt("order_item_id"));
                feedback.setUserId(rs.getInt("user_id"));
                feedback.setRating(rs.getInt("rating"));
                feedback.setComment(rs.getString("comment"));
                feedback.setStatus(rs.getString("status"));
                feedback.setCreatedAt(rs.getTimestamp("created_at"));
                feedback.setUpdatedAt(rs.getTimestamp("updated_at"));
                feedback.setUserFullName(rs.getString("full_name"));
                feedback.setUserName(rs.getString("username"));
                feedback.setProductTitle(rs.getString("title"));
                feedback.setProductThumbnail(rs.getString("thumbnail"));
                feedback.setProductId(rs.getInt("product_id"));
                list.add(feedback);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public int getTotalFeedbacks(String searchKeyword, String filterRating, String filterStatus, int productId) {
        StringBuilder sql = new StringBuilder("SELECT COUNT(*) FROM feedback f ");
        sql.append("JOIN users u ON f.user_id = u.id ");
        sql.append("JOIN order_items oi ON f.order_item_id = oi.id ");
        sql.append("JOIN products p ON oi.product_id = p.id ");
        sql.append("WHERE 1=1");

        if (productId > 0) {
            sql.append(" AND p.id = ?");
        }
        if (searchKeyword != null && !searchKeyword.isEmpty()) {
            sql.append(" AND (f.comment LIKE ? OR u.full_name LIKE ?)");
        }
        if (filterRating != null && !filterRating.isEmpty()) {
            sql.append(" AND f.rating = ?");
        }
        if (filterStatus != null && !filterStatus.isEmpty()) {
            sql.append(" AND f.status = ?");
        }

        try (PreparedStatement ps = connection.prepareStatement(sql.toString())) {
            int paramIndex = 1;

            if (productId > 0) {
                ps.setInt(paramIndex++, productId);
            }
            if (searchKeyword != null && !searchKeyword.isEmpty()) {
                ps.setString(paramIndex++, "%" + searchKeyword + "%");
                ps.setString(paramIndex++, "%" + searchKeyword + "%");
            }
            if (filterRating != null && !filterRating.isEmpty()) {
                ps.setInt(paramIndex++, Integer.parseInt(filterRating));
            }
            if (filterStatus != null && !filterStatus.isEmpty()) {
                ps.setString(paramIndex++, filterStatus);
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

    public Feedback getFeedbackById(int id) {
        String sql = "SELECT f.*, u.full_name, u.username, p.title, p.thumbnail, oi.product_id FROM feedback f "
                + "JOIN users u ON f.user_id = u.id "
                + "JOIN order_items oi ON f.order_item_id = oi.id "
                + "JOIN products p ON oi.product_id = p.id "
                + "WHERE f.id = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Feedback feedback = new Feedback();
                feedback.setId(rs.getInt("id"));
                feedback.setOrderItemId(rs.getInt("order_item_id"));
                feedback.setUserId(rs.getInt("user_id"));
                feedback.setRating(rs.getInt("rating"));
                feedback.setComment(rs.getString("comment"));
                feedback.setStatus(rs.getString("status"));
                feedback.setCreatedAt(rs.getTimestamp("created_at"));
                feedback.setUpdatedAt(rs.getTimestamp("updated_at"));
                feedback.setUserFullName(rs.getString("full_name"));
                feedback.setUserName(rs.getString("username"));
                feedback.setProductTitle(rs.getString("title"));
                feedback.setProductThumbnail(rs.getString("thumbnail"));
                feedback.setProductId(rs.getInt("product_id"));
                return feedback;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean updateFeedbackStatus(int id, String status) {
        String sql = "UPDATE feedback SET status = ?, updated_at = GETDATE() WHERE id = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, status);
            ps.setInt(2, id);
            int result = ps.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    /*--------- cho feedbackdetail có gửi productId  ----------*/
 /*--------- --------------------------- ----------*/
 /*--------- --------------------------- ----------*/
    public List<Feedback> getFeedbacksByProduct(String searchKeyword, String filterRating, String filterStatus,
            String sortField, String sortOrder, int productId, int page, int recordsPerPage) {
        List<Feedback> list = new ArrayList<>();
        StringBuilder sql = new StringBuilder("SELECT f.*, u.full_name, u.username, p.title, p.thumbnail, oi.product_id ");
        sql.append("FROM feedback f ");
        sql.append("JOIN users u ON f.user_id = u.id ");
        sql.append("JOIN order_items oi ON f.order_item_id = oi.id ");
        sql.append("JOIN products p ON oi.product_id = p.id ");
        sql.append("WHERE 1=1");

        // Điều kiện tìm kiếm và lọc
        if (productId > 0) {
            sql.append(" AND p.id = ?");
        }
        if (searchKeyword != null && !searchKeyword.isEmpty()) {
            sql.append(" AND (f.comment LIKE ? OR u.username LIKE ?)");
        }
        if (filterRating != null && !filterRating.isEmpty()) {
            sql.append(" AND f.rating = ?");
        }
        if (filterStatus != null && !filterStatus.isEmpty()) {
            sql.append(" AND f.status = ?");
        }

        // Sắp xếp với bí danh rõ ràng
        if (sortField != null && !sortField.isEmpty()) {
            String orderColumn;
            switch (sortField) {
                case "username":
                    orderColumn = "u.username";
                    break;
                case "rating":
                    orderColumn = "f.rating";
                    break;
                case "created_at":
                    orderColumn = "f.created_at";
                    break;
                case "status":
                    orderColumn = "f.status";
                    break;
                default:
                    orderColumn = "f.created_at"; // Mặc định
            }
            sql.append(" ORDER BY ").append(orderColumn)
                    .append(" ").append(sortOrder.equals("desc") ? "DESC" : "ASC");
        } else {
            sql.append(" ORDER BY f.created_at DESC");
        }

        sql.append(" OFFSET ? ROWS FETCH NEXT ? ROWS ONLY");

        try (PreparedStatement ps = connection.prepareStatement(sql.toString())) {
            int paramIndex = 1;

            if (productId > 0) {
                ps.setInt(paramIndex++, productId);
            }
            if (searchKeyword != null && !searchKeyword.isEmpty()) {
                ps.setString(paramIndex++, "%" + searchKeyword + "%");
                ps.setString(paramIndex++, "%" + searchKeyword + "%");
            }
            if (filterRating != null && !filterRating.isEmpty()) {
                ps.setInt(paramIndex++, Integer.parseInt(filterRating));
            }
            if (filterStatus != null && !filterStatus.isEmpty()) {
                ps.setString(paramIndex++, filterStatus);
            }

            ps.setInt(paramIndex++, (page - 1) * recordsPerPage);
            ps.setInt(paramIndex++, recordsPerPage);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Feedback feedback = new Feedback();
                feedback.setId(rs.getInt("id"));
                feedback.setOrderItemId(rs.getInt("order_item_id"));
                feedback.setUserId(rs.getInt("user_id"));
                feedback.setRating(rs.getInt("rating"));
                feedback.setComment(rs.getString("comment"));
                feedback.setStatus(rs.getString("status"));
                feedback.setCreatedAt(rs.getTimestamp("created_at"));
                feedback.setUpdatedAt(rs.getTimestamp("updated_at"));
                feedback.setUserFullName(rs.getString("full_name"));
                feedback.setUserName(rs.getString("username"));
                feedback.setProductTitle(rs.getString("title"));
                feedback.setProductThumbnail(rs.getString("thumbnail"));
                feedback.setProductId(rs.getInt("product_id"));
                list.add(feedback);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public int getTotalFeedbacksByProduct(String searchKeyword, String filterRating, String filterStatus, int productId) {
        StringBuilder sql = new StringBuilder("SELECT COUNT(*) FROM feedback f ");
        sql.append("JOIN users u ON f.user_id = u.id ");
        sql.append("JOIN order_items oi ON f.order_item_id = oi.id ");
        sql.append("JOIN products p ON oi.product_id = p.id ");
        sql.append("WHERE 1=1");

        if (productId > 0) {
            sql.append(" AND p.id = ?");
        }
        if (searchKeyword != null && !searchKeyword.isEmpty()) {
            sql.append(" AND (f.comment LIKE ? OR u.username LIKE ?)");
        }
        if (filterRating != null && !filterRating.isEmpty()) {
            sql.append(" AND f.rating = ?");
        }
        if (filterStatus != null && !filterStatus.isEmpty()) {
            sql.append(" AND f.status = ?");
        }

        try (PreparedStatement ps = connection.prepareStatement(sql.toString())) {
            int paramIndex = 1;

            if (productId > 0) {
                ps.setInt(paramIndex++, productId);
            }
            if (searchKeyword != null && !searchKeyword.isEmpty()) {
                ps.setString(paramIndex++, "%" + searchKeyword + "%");
                ps.setString(paramIndex++, "%" + searchKeyword + "%");
            }
            if (filterRating != null && !filterRating.isEmpty()) {
                ps.setInt(paramIndex++, Integer.parseInt(filterRating));
            }
            if (filterStatus != null && !filterStatus.isEmpty()) {
                ps.setString(paramIndex++, filterStatus);
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

    /*--------- Không in sản phẩm trùng lặp ----------*/
 /*--------- Không in sản phẩm trùng lặp ----------*/
 /*--------- Không in sản phẩm trùng lặp ----------*/
 /*--------- Không in sản phẩm trùng lặp ----------*/
    public List<Feedback> getFeedbacksGroupedByProduct(String searchKeyword, String filterRating,
            String sortField, String sortOrder, int page, int recordsPerPage) {
        List<Feedback> list = new ArrayList<>();
        StringBuilder sql = new StringBuilder("SELECT p.id AS product_id, p.title, p.thumbnail, ");
        sql.append("AVG(f.rating) AS avg_rating, COUNT(f.id) AS feedback_count ");
        sql.append("FROM products p ");
        sql.append("INNER JOIN order_items oi ON p.id = oi.product_id "); // Thay LEFT JOIN bằng INNER JOIN
        sql.append("INNER JOIN feedback f ON oi.id = f.order_item_id "); // Thay LEFT JOIN bằng INNER JOIN
        sql.append("WHERE 1=1");

        if (searchKeyword != null && !searchKeyword.isEmpty()) {
            sql.append(" AND p.title LIKE ?");
        }
        if (filterRating != null && !filterRating.isEmpty()) {
            sql.append(" AND f.rating = ?");
        }

        sql.append(" GROUP BY p.id, p.title, p.thumbnail ");
        sql.append(" HAVING COUNT(f.id) > 0 "); // Thêm điều kiện để đảm bảo có ít nhất 1 phản hồi

        if (sortField != null && !sortField.isEmpty()) {
            sql.append(" ORDER BY ").append(sortField).append(" ").append(sortOrder != null && sortOrder.equals("desc") ? "DESC" : "ASC");
        } else {
            sql.append(" ORDER BY p.id ASC");
        }

        sql.append(" OFFSET ? ROWS FETCH NEXT ? ROWS ONLY");

        try (PreparedStatement ps = connection.prepareStatement(sql.toString())) {
            int paramIndex = 1;

            if (searchKeyword != null && !searchKeyword.isEmpty()) {
                ps.setString(paramIndex++, "%" + searchKeyword + "%");
            }
            if (filterRating != null && !filterRating.isEmpty()) {
                ps.setInt(paramIndex++, Integer.parseInt(filterRating));
            }

            ps.setInt(paramIndex++, (page - 1) * recordsPerPage);
            ps.setInt(paramIndex++, recordsPerPage);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Feedback feedback = new Feedback();
                feedback.setProductId(rs.getInt("product_id"));
                feedback.setProductTitle(rs.getString("title"));
                feedback.setProductThumbnail(rs.getString("thumbnail"));
                feedback.setRating(rs.getInt("avg_rating")); // Lấy giá trị trung bình rating
                feedback.setComment(rs.getString("feedback_count")); // Số lượng feedback lưu trong comment
                list.add(feedback);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public int getTotalProductsWithFeedback(String searchKeyword, String filterRating) {
        StringBuilder sql = new StringBuilder("SELECT COUNT(DISTINCT p.id) ");
        sql.append("FROM products p ");
        sql.append("INNER JOIN order_items oi ON p.id = oi.product_id ");
        sql.append("INNER JOIN feedback f ON oi.id = f.order_item_id ");
        sql.append("WHERE 1=1");

        if (searchKeyword != null && !searchKeyword.isEmpty()) {
            sql.append(" AND p.title LIKE ?");
        }
        if (filterRating != null && !filterRating.isEmpty()) {
            sql.append(" AND f.rating = ?");
        }

        try (PreparedStatement ps = connection.prepareStatement(sql.toString())) {
            int paramIndex = 1;

            if (searchKeyword != null && !searchKeyword.isEmpty()) {
                ps.setString(paramIndex++, "%" + searchKeyword + "%");
            }
            if (filterRating != null && !filterRating.isEmpty()) {
                ps.setInt(paramIndex++, Integer.parseInt(filterRating));
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

    public List<String> getImagesByFeedbackId(int feedbackId) {
        List<String> images = new ArrayList<>();
        String sql = "SELECT image_url FROM feedback_images WHERE feedback_id = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, feedbackId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                images.add(rs.getString("image_url"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return images;
    }

    public boolean deleteFeedback(int feedbackId) {
        try {
            connection.setAutoCommit(false);

            // Xóa feedback_reply liên quan
            String deleteRepliesSql = "DELETE FROM feedback_reply WHERE feedback_id = ?";
            try (PreparedStatement ps = connection.prepareStatement(deleteRepliesSql)) {
                ps.setInt(1, feedbackId);
                ps.executeUpdate();
            }

            // Xóa feedback_images liên quan
            String deleteImagesSql = "DELETE FROM feedback_images WHERE feedback_id = ?";
            try (PreparedStatement ps = connection.prepareStatement(deleteImagesSql)) {
                ps.setInt(1, feedbackId);
                ps.executeUpdate();
            }

            // Xóa feedback
            String deleteFeedbackSql = "DELETE FROM feedback WHERE id = ?";
            try (PreparedStatement ps = connection.prepareStatement(deleteFeedbackSql)) {
                ps.setInt(1, feedbackId);
                int result = ps.executeUpdate();
                connection.commit(); // Commit transaction nếu thành công
                return result > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            try {
                connection.rollback(); // Rollback nếu có lỗi
            } catch (SQLException rollbackEx) {
                rollbackEx.printStackTrace();
            }
            return false;
        } finally {
            try {
                connection.setAutoCommit(true); // Khôi phục auto-commit
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public int[] getRatingCounts(String searchKeyword) {
        int[] ratingCounts = new int[5]; // Mảng lưu số lượng đánh giá từ 1 đến 5 sao
        StringBuilder sql = new StringBuilder("SELECT rating, COUNT(*) as count ");
        sql.append("FROM feedback f ");
        sql.append("JOIN order_items oi ON f.order_item_id = oi.id ");
        sql.append("JOIN products p ON oi.product_id = p.id ");
        sql.append("WHERE 1=1");

        if (searchKeyword != null && !searchKeyword.isEmpty()) {
            sql.append(" AND p.title LIKE ?");
        }

        sql.append(" GROUP BY rating");

        try (PreparedStatement ps = connection.prepareStatement(sql.toString())) {
            int paramIndex = 1;
            if (searchKeyword != null && !searchKeyword.isEmpty()) {
                ps.setString(paramIndex++, "%" + searchKeyword + "%");
            }

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int rating = rs.getInt("rating");
                if (rating >= 1 && rating <= 5) {
                    ratingCounts[rating - 1] = rs.getInt("count"); // rating 1 -> index 0, rating 5 -> index 4
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ratingCounts;
    }

    public int[] getRatingCountsByProduct(String searchKeyword, int productId) {
        int[] ratingCounts = new int[5]; // Mảng lưu số lượng đánh giá từ 1 đến 5 sao
        StringBuilder sql = new StringBuilder("SELECT rating, COUNT(*) as count ");
        sql.append("FROM feedback f ");
        sql.append("JOIN order_items oi ON f.order_item_id = oi.id ");
        sql.append("JOIN products p ON oi.product_id = p.id ");
        sql.append("WHERE f.status ='approved' AND p.id = ?");

        if (searchKeyword != null && !searchKeyword.isEmpty()) {
            sql.append(" AND (f.comment LIKE ? OR p.title LIKE ?)");
        }

        sql.append(" GROUP BY rating");

        try (PreparedStatement ps = connection.prepareStatement(sql.toString())) {
            int paramIndex = 1;
            ps.setInt(paramIndex++, productId);
            if (searchKeyword != null && !searchKeyword.isEmpty()) {
                ps.setString(paramIndex++, "%" + searchKeyword + "%");
                ps.setString(paramIndex++, "%" + searchKeyword + "%");
            }

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int rating = rs.getInt("rating");
                if (rating >= 1 && rating <= 5) {
                    ratingCounts[rating - 1] = rs.getInt("count"); // rating 1 -> index 0, rating 5 -> index 4
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ratingCounts;
    }

    // DAO dùng cho feedback phía người dùng - Tran Phong
    public int insertFeedback(Feedback feedback) {
//        System.out.println("Run insert feedback");
        String sql = "INSERT INTO feedback (order_item_id, user_id, rating, comment, status, created_at, updated_at) "
                + "VALUES (?, ?, ?, ?, ?, GETDATE(), GETDATE()); SELECT SCOPE_IDENTITY();";
        try (PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            ps.setInt(1, feedback.getOrderItemId());
            ps.setInt(2, feedback.getUserId());
            ps.setInt(3, feedback.getRating());
            ps.setString(4, feedback.getComment());
            ps.setString(5, feedback.getStatus());

            int affectedRows = ps.executeUpdate();
            System.out.println(affectedRows);
            if (affectedRows == 0) {
                throw new SQLException("Creating feedback failed, no rows affected.");
            }

            try (ResultSet generatedKeys = ps.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    return generatedKeys.getInt(1);
                } else {
                    throw new SQLException("Creating feedback failed, no ID obtained.");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return -1;
        }
    }

    public boolean insertFeedbackImage(int feedbackId, String imageUrl) {
        String sql = "INSERT INTO feedback_images (feedback_id, image_url, created_at) VALUES (?, ?, GETDATE())";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, feedbackId);
            ps.setString(2, imageUrl);

            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<Feedback> getFeedbacksByProduct(String filterRating, String notFilterStatus, int productId, int page, int recordsPerPage) {
        List<Feedback> list = new ArrayList<>();
        StringBuilder sql = new StringBuilder("SELECT f.*, u.full_name, u.username, p.title, p.thumbnail, oi.product_id ");
        sql.append("FROM feedback f ");
        sql.append("JOIN users u ON f.user_id = u.id ");
        sql.append("JOIN order_items oi ON f.order_item_id = oi.id ");
        sql.append("JOIN products p ON oi.product_id = p.id ");
        sql.append("WHERE 1=1");

        // Điều kiện tìm kiếm và lọc
        if (productId > 0) {
            sql.append(" AND p.id = ?");
        }
        if (filterRating != null && !filterRating.isEmpty()) {
            sql.append(" AND f.rating = ?");
        }
        if (notFilterStatus != null && !notFilterStatus.isEmpty()) {
            sql.append(" AND f.status != ?");
        }

        sql.append(" ORDER BY f.created_at DESC");

        sql.append(" OFFSET ? ROWS FETCH NEXT ? ROWS ONLY");

        try (PreparedStatement ps = connection.prepareStatement(sql.toString())) {
            int paramIndex = 1;

            if (productId > 0) {
                ps.setInt(paramIndex++, productId);
            }
            if (filterRating != null && !filterRating.isEmpty()) {
                ps.setInt(paramIndex++, Integer.parseInt(filterRating));
            }
            if (notFilterStatus != null && !notFilterStatus.isEmpty()) {
                ps.setString(paramIndex++, notFilterStatus);
            }

            ps.setInt(paramIndex++, (page - 1) * recordsPerPage);
            ps.setInt(paramIndex++, recordsPerPage);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Feedback feedback = new Feedback();
                feedback.setId(rs.getInt("id"));
                feedback.setOrderItemId(rs.getInt("order_item_id"));
                feedback.setUserId(rs.getInt("user_id"));
                feedback.setRating(rs.getInt("rating"));
                feedback.setComment(rs.getString("comment"));
                feedback.setStatus(rs.getString("status"));
                feedback.setCreatedAt(rs.getTimestamp("created_at"));
                feedback.setUpdatedAt(rs.getTimestamp("updated_at"));
                feedback.setUserFullName(rs.getString("full_name"));
                feedback.setUserName(rs.getString("username"));
                feedback.setProductTitle(rs.getString("title"));
                feedback.setProductThumbnail(rs.getString("thumbnail"));
                feedback.setProductId(rs.getInt("product_id"));
                list.add(feedback);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public int getTotalFeedbacksByProduct(String filterRating, String notFilterStatus, int productId) {
        StringBuilder sql = new StringBuilder("SELECT COUNT(*) FROM feedback f ");
        sql.append("JOIN users u ON f.user_id = u.id ");
        sql.append("JOIN order_items oi ON f.order_item_id = oi.id ");
        sql.append("JOIN products p ON oi.product_id = p.id ");
        sql.append("WHERE 1=1");

        if (productId > 0) {
            sql.append(" AND p.id = ?");
        }
        if (filterRating != null && !filterRating.isEmpty()) {
            sql.append(" AND f.rating = ?");
        }
        if (notFilterStatus != null && !notFilterStatus.isEmpty()) {
            sql.append(" AND f.status != ?");
        }

        try (PreparedStatement ps = connection.prepareStatement(sql.toString())) {
            int paramIndex = 1;

            if (productId > 0) {
                ps.setInt(paramIndex++, productId);
            }
            if (filterRating != null && !filterRating.isEmpty()) {
                ps.setInt(paramIndex++, Integer.parseInt(filterRating));
            }
            if (notFilterStatus != null && !notFilterStatus.isEmpty()) {
                ps.setString(paramIndex++, notFilterStatus);
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
}
