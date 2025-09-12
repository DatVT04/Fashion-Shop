package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.Date;
import java.util.LinkedHashMap;
import Context.DBContext;

public class MarketingReportDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public MarketingReportDAO() {
        try {
            this.conn = new DBContext().connection;
        } catch (Exception e) {
            System.out.println("Connection error: " + e.getMessage());
        }
    }

    private void closeResources() {
        try {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        } catch (SQLException e) {
            System.out.println("Error closing resources: " + e.getMessage());
        }
    }

    // 1. COUPON REPORT METHODS
    // Get coupons by status
    public Map<String, Integer> getCouponsByStatus() {
        Map<String, Integer> result = new HashMap<>();
        String sql = "SELECT status, COUNT(*) as count FROM coupons GROUP BY status";

        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                result.put(rs.getString("status"), rs.getInt("count"));
            }
        } catch (SQLException e) {
            System.out.println("Error getting coupons by status: " + e.getMessage());
        }
        return result;
    }

    // Get coupons by type
    public Map<String, Integer> getCouponsByType() {
        Map<String, Integer> result = new HashMap<>();
        String sql = "SELECT coupon_type, COUNT(*) as count FROM coupons GROUP BY coupon_type";

        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                result.put(rs.getString("coupon_type"), rs.getInt("count"));
            }
        } catch (SQLException e) {
            System.out.println("Error getting coupons by type: " + e.getMessage());
        }
        return result;
    }

    // Get coupons by discount type
    public Map<String, Integer> getCouponsByDiscountType() {
        Map<String, Integer> result = new HashMap<>();
        String sql = "SELECT discount_type, COUNT(*) as count FROM coupons GROUP BY discount_type";

        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                result.put(rs.getString("discount_type"), rs.getInt("count"));
            }
        } catch (SQLException e) {
            System.out.println("Error getting coupons by discount type: " + e.getMessage());
        }
        return result;
    }

    // Get coupon usage rate
    public List<Map<String, Object>> getCouponUsageRate() {
        List<Map<String, Object>> result = new ArrayList<>();
        String sql = "SELECT code, used_count, usage_limit "
                + "FROM coupons";

        try (PreparedStatement ps = conn.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Map<String, Object> coupon = new HashMap<>();
                String code = rs.getString("code");
                int usedCount = rs.getInt("used_count");
                int usageLimit = rs.getInt("usage_limit");

                double usageRate = 0.0;
                if (usageLimit > 0) {
                    usageRate = ((double) usedCount / usageLimit) * 100;

                    usageRate = BigDecimal.valueOf(usageRate)
                            .setScale(2, RoundingMode.HALF_UP)
                            .doubleValue();
                } else {

                    usageRate = -1;
                }

                coupon.put("code", code);
                coupon.put("used_count", usedCount);
                coupon.put("usage_limit", usageLimit);
                coupon.put("usage_rate", usageRate);
                result.add(coupon);
            }
        } catch (SQLException e) {
            System.out.println("Error getting coupon usage rate: " + e.getMessage());
        }
        return result;
    }

    public List<Map<String, Object>> getMostUsedCoupons(int limit) {
        List<Map<String, Object>> result = new ArrayList<>();
        String sql = "SELECT id, code, discount_type, discount_value, used_count, usage_limit "
                + "FROM coupons "
                + "WHERE used_count > 0 "
                + "ORDER BY used_count DESC";

        if (limit > 0) {
            sql += " OFFSET 0 ROWS FETCH NEXT ? ROWS ONLY";
        }

        try {
            ps = conn.prepareStatement(sql);
            if (limit > 0) {
                ps.setInt(1, limit);
            }
            rs = ps.executeQuery();
            while (rs.next()) {
                Map<String, Object> coupon = new HashMap<>();
                int usedCount = rs.getInt("used_count");
                int usageLimit = rs.getInt("usage_limit");

                double usageRate = 0.0;
                if (usageLimit > 0) {
                    usageRate = ((double) usedCount / usageLimit) * 100;
                    usageRate = BigDecimal.valueOf(usageRate)
                            .setScale(2, RoundingMode.HALF_UP)
                            .doubleValue();
                }

                coupon.put("id", rs.getInt("id"));
                coupon.put("code", rs.getString("code"));
                coupon.put("discount_type", rs.getString("discount_type"));
                coupon.put("discount_value", rs.getBigDecimal("discount_value"));
                coupon.put("usage_count", usedCount);
                coupon.put("usage_limit", usageLimit);
                coupon.put("usage_rate", usageRate);
                result.add(coupon);
            }
        } catch (SQLException e) {
            System.out.println("Error getting most used coupons: " + e.getMessage());
        }
        return result;
    }

    // Get average discount amount
    public BigDecimal getAverageDiscountAmount() {
        BigDecimal result = BigDecimal.ZERO;
        String sql = "SELECT AVG(CASE "
                + "  WHEN discount_type = 'percentage' THEN (discount_value / 100) * COALESCE(min_order_amount, 0) "
                + "  ELSE discount_value "
                + "END) AS avg_discount "
                + "FROM coupons "
                + "WHERE used_count > 0";

        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                result = rs.getBigDecimal("avg_discount");
                if (result == null) {
                    result = BigDecimal.ZERO;
                }
            }
        } catch (SQLException e) {
            System.out.println("Error getting average discount amount: " + e.getMessage());
        }
        return result;
    }

    // Get coupon expiry analysis
    public List<Map<String, Object>> getCouponExpiryAnalysis() {
        List<Map<String, Object>> result = new ArrayList<>();
        String sql = "SELECT id, code, expiry_date, DATEDIFF(day, GETDATE(), expiry_date) as days_remaining "
                + "FROM coupons WHERE status = 'active' AND expiry_date IS NOT NULL ORDER BY days_remaining";

        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Map<String, Object> coupon = new HashMap<>();
                coupon.put("id", rs.getInt("id"));
                coupon.put("code", rs.getString("code"));
                coupon.put("expiry_date", rs.getDate("expiry_date"));
                coupon.put("days_remaining", rs.getInt("days_remaining"));
                result.add(coupon);
            }
        } catch (SQLException e) {
            System.out.println("Error getting coupon expiry analysis: " + e.getMessage());
        }
        return result;
    }

    // Get unused expired coupons count
    public int getUnusedExpiredCouponsCount() {
        int result = 0;
        String sql = "SELECT COUNT(*) as count FROM coupons WHERE status = 'expired' AND used_count = 0";

        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                result = rs.getInt("count");
            }
        } catch (SQLException e) {
            System.out.println("Error getting unused expired coupons count: " + e.getMessage());
        }
        return result;
    }

    // 2. FEEDBACK REPORT METHODS
    // Get average rating
    public BigDecimal getAverageRating() {
        BigDecimal result = BigDecimal.ZERO;
        String sql = "SELECT AVG(CAST(rating AS FLOAT)) as avg_rating FROM feedback WHERE status = 'approved'";

        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                result = rs.getBigDecimal("avg_rating");
                if (result != null) {
                    result = result.setScale(2, RoundingMode.HALF_UP);
                } else {
                    result = BigDecimal.ZERO;
                }
            }
        } catch (SQLException e) {
            System.out.println("Error getting average rating: " + e.getMessage());
        }
        return result;
    }

    // Get rating distribution
    public Map<Integer, Integer> getRatingDistribution() {
        Map<Integer, Integer> result = new HashMap<>();
        String sql = "SELECT rating, COUNT(*) as count FROM feedback GROUP BY rating ORDER BY rating";

        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                result.put(rs.getInt("rating"), rs.getInt("count"));
            }
            // Ensure all ratings 1-5 are included
            for (int i = 1; i <= 5; i++) {
                if (!result.containsKey(i)) {
                    result.put(i, 0);
                }
            }
        } catch (SQLException e) {
            System.out.println("Error getting rating distribution: " + e.getMessage());
        }
        return result;
    }

    // Get feedback by status
    public Map<String, Integer> getFeedbackByStatus() {
        Map<String, Integer> result = new HashMap<>();
        String sql = "SELECT status, COUNT(*) as count FROM feedback GROUP BY status";

        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                result.put(rs.getString("status"), rs.getInt("count"));
            }
        } catch (SQLException e) {
            System.out.println("Error getting feedback by status: " + e.getMessage());
        }
        return result;
    }

    // Get highest/lowest rated products
    public List<Map<String, Object>> getProductsByRating(boolean highest, int limit) {
        List<Map<String, Object>> result = new ArrayList<>();
        String sql = "SELECT p.id, p.title, AVG(CAST(f.rating AS FLOAT)) as avg_rating, COUNT(f.id) as review_count "
                + "FROM products p "
                + "JOIN order_items oi ON p.id = oi.product_id "
                + "JOIN feedback f ON oi.id = f.order_item_id "
                + "WHERE f.status = 'approved' "
                + // Thêm điều kiện lấy feedback đã được duyệt
                "GROUP BY p.id, p.title "
                + "HAVING COUNT(f.id) > 0 "
                + "ORDER BY avg_rating " + (highest ? "DESC" : "ASC");

        if (limit > 0) {
            sql += " OFFSET 0 ROWS FETCH NEXT ? ROWS ONLY";
        }

        try {
            ps = conn.prepareStatement(sql);
            if (limit > 0) {
                ps.setInt(1, limit);
            }
            rs = ps.executeQuery();
            while (rs.next()) {
                Map<String, Object> product = new HashMap<>();
                product.put("id", rs.getInt("id"));
                product.put("title", rs.getString("title"));
                product.put("avg_rating", rs.getBigDecimal("avg_rating").setScale(2, RoundingMode.HALF_UP));
                product.put("review_count", rs.getInt("review_count"));
                result.add(product);
            }
        } catch (SQLException e) {
            System.out.println("Error getting products by rating: " + e.getMessage());
        }
        return result;
    }

    // Get product rating coverage
    public Map<String, Object> getProductRatingCoverage() {
        Map<String, Object> result = new HashMap<>();
        String sql = "SELECT "
                + "(SELECT COUNT(DISTINCT p.id) "
                + " FROM products p "
                + " JOIN order_items oi ON p.id = oi.product_id "
                + " JOIN feedback f ON oi.id = f.order_item_id "
                + " WHERE f.status = 'approved') AS rated_products_count, "
                + "(SELECT COUNT(*) FROM products) AS total_products_count";

        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                int ratedProductsCount = rs.getInt("rated_products_count");
                int totalProductsCount = rs.getInt("total_products_count");
                result.put("rated_products_count", ratedProductsCount);
                result.put("total_products_count", totalProductsCount);

                BigDecimal coverageRate = BigDecimal.ZERO;
                if (totalProductsCount > 0) {
                    coverageRate = new BigDecimal(ratedProductsCount)
                            .divide(new BigDecimal(totalProductsCount), 4, RoundingMode.HALF_UP)
                            .multiply(new BigDecimal(100))
                            .setScale(2, RoundingMode.HALF_UP);
                }
                result.put("coverage_rate", coverageRate);
            }
        } catch (SQLException e) {
            System.out.println("Error getting product rating coverage: " + e.getMessage());
        }
        return result;
    }

    // Get most active reviewers
    public List<Map<String, Object>> getMostActiveReviewers(int limit) {
        List<Map<String, Object>> result = new ArrayList<>();
        String sql = "SELECT u.id, u.username, u.full_name, COUNT(f.id) as feedback_count "
                + "FROM users u JOIN feedback f ON u.id = f.user_id "
                + "GROUP BY u.id, u.username, u.full_name "
                + "ORDER BY feedback_count DESC";

        if (limit > 0) {
            sql += " OFFSET 0 ROWS FETCH NEXT ? ROWS ONLY";
        }

        try {
            ps = conn.prepareStatement(sql);
            if (limit > 0) {
                ps.setInt(1, limit);
            }
            rs = ps.executeQuery();
            while (rs.next()) {
                Map<String, Object> user = new HashMap<>();
                user.put("id", rs.getInt("id"));
                user.put("username", rs.getString("username"));
                user.put("full_name", rs.getString("full_name"));
                user.put("feedback_count", rs.getInt("feedback_count"));
                result.add(user);
            }
        } catch (SQLException e) {
            System.out.println("Error getting most active reviewers: " + e.getMessage());
        }
        return result;
    }

    // Get customer feedback rate
    public Map<String, Object> getCustomerFeedbackRate() {
        Map<String, Object> result = new HashMap<>();
        String sql = "SELECT "
                + "(SELECT COUNT(DISTINCT user_id) FROM feedback WHERE status = 'approved') AS customers_with_feedback, "
                + "(SELECT COUNT(DISTINCT user_id) FROM orders WHERE user_id IS NOT NULL AND status = 'completed') AS customers_with_orders";

        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                int customersWithFeedback = rs.getInt("customers_with_feedback");
                int customersWithOrders = rs.getInt("customers_with_orders");
                result.put("customers_with_feedback", customersWithFeedback);
                result.put("customers_with_orders", customersWithOrders);

                BigDecimal feedbackRate = BigDecimal.ZERO;
                if (customersWithOrders > 0) {
                    feedbackRate = new BigDecimal(customersWithFeedback)
                            .divide(new BigDecimal(customersWithOrders), 4, RoundingMode.HALF_UP)
                            .multiply(new BigDecimal(100))
                            .setScale(2, RoundingMode.HALF_UP);
                }
                result.put("feedback_rate", feedbackRate);
            }
        } catch (SQLException e) {
            System.out.println("Error getting customer feedback rate: " + e.getMessage());
        }
        return result;
    }

    // Get feedback with images count
    public int getFeedbackWithImagesCount() {
        int result = 0;
        String sql = "SELECT COUNT(DISTINCT f.id) as count "
                + "FROM feedback f JOIN feedback_images fi ON f.id = fi.feedback_id";

        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                result = rs.getInt("count");
            }
        } catch (SQLException e) {
            System.out.println("Error getting feedback with images count: " + e.getMessage());
        }
        return result;
    }

    // Get feedback with replies count
    public int getFeedbackWithRepliesCount() {
        int result = 0;
        String sql = "SELECT COUNT(DISTINCT f.id) as count "
                + "FROM feedback f "
                + "JOIN feedback_reply fr ON f.id = fr.feedback_id "
                + "WHERE f.status = 'approved'";

        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                result = rs.getInt("count");
            }
        } catch (SQLException e) {
            System.out.println("Error getting feedback with replies count: " + e.getMessage());
        }
        return result;
    }

    // 3. PRODUCT REPORT METHODS
    // Get products by status
    public Map<String, Integer> getProductsByStatus() {
        Map<String, Integer> result = new HashMap<>();
        String sql = "SELECT status, COUNT(*) as count FROM products GROUP BY status";

        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                result.put(rs.getString("status"), rs.getInt("count"));
            }
        } catch (SQLException e) {
            System.out.println("Error getting products by status: " + e.getMessage());
        }
        return result;
    }

    // Get products by category
    public List<Map<String, Object>> getProductsByCategory() {
        List<Map<String, Object>> result = new ArrayList<>();
        String sql = "SELECT c.id, c.name, COUNT(p.id) as product_count "
                + "FROM categories c LEFT JOIN products p ON c.id = p.category_id "
                + "GROUP BY c.id, c.name ORDER BY product_count DESC";

        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Map<String, Object> category = new HashMap<>();
                category.put("id", rs.getInt("id"));
                category.put("name", rs.getString("name"));
                category.put("product_count", rs.getInt("product_count"));
                result.add(category);
            }
        } catch (SQLException e) {
            System.out.println("Error getting products by category: " + e.getMessage());
        }
        return result;
    }

    // Get combo products count
    public int getComboProductsCount() {
        int result = 0;
        String sql = "SELECT COUNT(*) as count FROM products WHERE is_combo = 1";

        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                result = rs.getInt("count");
            }
        } catch (SQLException e) {
            System.out.println("Error getting combo products count: " + e.getMessage());
        }
        return result;
    }

    // Get average price by category
    public List<Map<String, Object>> getAveragePriceByCategory() {
        List<Map<String, Object>> result = new ArrayList<>();
        String sql = "SELECT c.id, c.name, AVG(p.sale_price) as avg_price "
                + "FROM categories c JOIN products p ON c.id = p.category_id "
                + "GROUP BY c.id, c.name ORDER BY avg_price DESC";

        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Map<String, Object> category = new HashMap<>();
                category.put("id", rs.getInt("id"));
                category.put("name", rs.getString("name"));
                category.put("avg_price", rs.getBigDecimal("avg_price").setScale(2, RoundingMode.HALF_UP));
                result.add(category);
            }
        } catch (SQLException e) {
            System.out.println("Error getting average price by category: " + e.getMessage());
        }
        return result;
    }

    // Get products with highest discount
    public List<Map<String, Object>> getProductsWithHighestPriceIncrease(int limit) {
        List<Map<String, Object>> result = new ArrayList<>();
        String sql = "SELECT id, title, original_price, sale_price, "
                + "((sale_price - original_price) / original_price) * 100 as increase_percentage "
                + "FROM products WHERE sale_price > original_price "
                + "ORDER BY increase_percentage DESC";

        if (limit > 0) {
            sql += " OFFSET 0 ROWS FETCH NEXT ? ROWS ONLY";
        }

        try {
            ps = conn.prepareStatement(sql);
            if (limit > 0) {
                ps.setInt(1, limit);
            }
            rs = ps.executeQuery();
            while (rs.next()) {
                Map<String, Object> product = new HashMap<>();
                product.put("id", rs.getInt("id"));
                product.put("title", rs.getString("title"));
                product.put("original_price", rs.getBigDecimal("original_price"));
                product.put("sale_price", rs.getBigDecimal("sale_price"));
                product.put("increase_percentage", rs.getBigDecimal("increase_percentage").setScale(2, RoundingMode.HALF_UP));
                result.add(product);
            }
        } catch (SQLException e) {
            System.out.println("Error getting products with highest price increase: " + e.getMessage());
        }
        return result;
    }

    // Get best selling products
    public List<Map<String, Object>> getBestSellingProducts(int limit) {
        List<Map<String, Object>> result = new ArrayList<>();
        String sql = "SELECT p.id, p.title, SUM(oi.quantity) as total_sold "
                + "FROM products p JOIN order_items oi ON p.id = oi.product_id "
                + "JOIN orders o ON oi.order_id = o.id "
                + "WHERE o.status = 'completed' "
                + "GROUP BY p.id, p.title "
                + "ORDER BY total_sold DESC";

        if (limit > 0) {
            sql += " OFFSET 0 ROWS FETCH NEXT ? ROWS ONLY";
        }

        try {
            ps = conn.prepareStatement(sql);
            if (limit > 0) {
                ps.setInt(1, limit);
            }
            rs = ps.executeQuery();
            while (rs.next()) {
                Map<String, Object> product = new HashMap<>();
                product.put("id", rs.getInt("id"));
                product.put("title", rs.getString("title"));
                product.put("total_sold", rs.getInt("total_sold"));
                result.add(product);
            }
        } catch (SQLException e) {
            System.out.println("Error getting best selling products: " + e.getMessage());
        }
        return result;
    }

    // Get revenue by category
    public List<Map<String, Object>> getRevenueByCategory() {
        List<Map<String, Object>> result = new ArrayList<>();
        String sql = "WITH CategoryHierarchy AS ("
                + " SELECT c1.id, c1.name, c1.parent_id, "
                + " CASE "
                + "     WHEN c1.parent_id IS NULL THEN c1.id "
                + "     WHEN c2.parent_id IS NULL THEN c2.id "
                + "     WHEN c3.parent_id IS NULL THEN c3.id "
                + "     ELSE NULL "
                + " END AS top_level_id "
                + " FROM categories c1 "
                + " LEFT JOIN categories c2 ON c1.parent_id = c2.id "
                + " LEFT JOIN categories c3 ON c2.parent_id = c3.id "
                + ") "
                + "SELECT c.id, c.name, SUM(oi.quantity * oi.unit_price_at_order) AS revenue "
                + "FROM order_items oi "
                + "JOIN products p ON oi.product_id = p.id "
                + "JOIN CategoryHierarchy ch ON p.category_id = ch.id "
                + "JOIN categories c ON ch.top_level_id = c.id "
                + "JOIN orders o ON oi.order_id = o.id "
                + "WHERE o.status = 'completed' "
                + "GROUP BY c.id, c.name "
                + "ORDER BY revenue DESC;";

        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Map<String, Object> category = new HashMap<>();
                category.put("id", rs.getInt("id"));
                category.put("name", rs.getString("name"));
                category.put("revenue", rs.getBigDecimal("revenue"));
                result.add(category);
            }
        } catch (SQLException e) {
            System.out.println("Error getting revenue by category: " + e.getMessage());
        }
        return result;
    }

    // Get product variations by size
    public Map<String, Integer> getProductVariationsBySize() {
        Map<String, Integer> result = new HashMap<>();
        String sql = "SELECT size, COUNT(*) as count FROM product_sizes GROUP BY size ORDER BY count DESC";

        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                result.put(rs.getString("size"), rs.getInt("count"));
            }
        } catch (SQLException e) {
            System.out.println("Error getting product variations by size: " + e.getMessage());
        }
        return result;
    }

    // Get product variations by color
    public Map<String, Integer> getProductVariationsByColor() {
        Map<String, Integer> result = new HashMap<>();
        String sql = "SELECT color, COUNT(*) as count FROM product_colors GROUP BY color ORDER BY count DESC";

        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                result.put(rs.getString("color"), rs.getInt("count"));
            }
        } catch (SQLException e) {
            System.out.println("Error getting product variations by color: " + e.getMessage());
        }
        return result;
    }

    // 4. INVENTORY REPORT METHODS
    // Get total inventory by product
    public List<Map<String, Object>> getTotalInventoryByProduct(int limit) {
        List<Map<String, Object>> result = new ArrayList<>();
        String sql = "SELECT p.id, p.title, SUM(pv.stock_quantity) as total_stock "
                + "FROM products p "
                + "JOIN product_variants pv ON p.id = pv.product_id "
                + "GROUP BY p.id, p.title "
                + "ORDER BY total_stock DESC";

        if (limit > 0) {
            sql += " OFFSET 0 ROWS FETCH NEXT ? ROWS ONLY";
        }

        try {
            ps = conn.prepareStatement(sql);
            if (limit > 0) {
                ps.setInt(1, limit);
            }
            rs = ps.executeQuery();
            while (rs.next()) {
                Map<String, Object> product = new HashMap<>();
                product.put("id", rs.getInt("id"));
                product.put("title", rs.getString("title"));
                product.put("total_stock", rs.getInt("total_stock"));
                result.add(product);
            }
        } catch (SQLException e) {
            System.out.println("Error getting total inventory by product: " + e.getMessage());
        }
        return result;
    }

    // Get inventory by category
    public List<Map<String, Object>> getInventoryByCategory() {
        List<Map<String, Object>> result = new ArrayList<>();
        String sql = "WITH CategoryHierarchy AS ( "
                + "    SELECT c1.id, c1.name, c1.parent_id, "
                + "        CASE "
                + "            WHEN c1.level = 1 THEN c1.id "
                + "            WHEN c2.level = 1 THEN c2.id "
                + "            WHEN c3.level = 1 THEN c3.id "
                + "            ELSE NULL "
                + "        END AS top_level_id "
                + "    FROM categories c1 "
                + "    LEFT JOIN categories c2 ON c1.parent_id = c2.id "
                + "    LEFT JOIN categories c3 ON c2.parent_id = c3.id "
                + ") "
                + "SELECT c.name AS category_name, SUM(pv.stock_quantity) AS total_stock "
                + "FROM product_variants pv "
                + "JOIN products p ON pv.product_id = p.id "
                + "JOIN CategoryHierarchy ch ON p.category_id = ch.id "
                + "JOIN categories c ON ch.top_level_id = c.id "
                + "WHERE p.status = 'active' "
                + "GROUP BY c.name "
                + "ORDER BY total_stock DESC";

        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Map<String, Object> category = new HashMap<>();
                category.put("name", rs.getString("category_name"));
                category.put("total_stock", rs.getInt("total_stock"));
                result.add(category);
            }
            if (result.isEmpty()) {
                System.out.println("No inventory data found for categories using hierarchical query.");
            } else {
                System.out.println("Inventory by Category: " + result);
            }
        } catch (SQLException e) {
            System.out.println("Error getting inventory by category: " + e.getMessage());
            e.printStackTrace();
        }
        return result;
    }

    // Get low stock products
    public List<Map<String, Object>> getLowStockProducts(int threshold) {
        List<Map<String, Object>> result = new ArrayList<>();
        String sql = "SELECT p.id, p.title, ps.size, pc.color, pv.stock_quantity "
                + "FROM product_variants pv "
                + "JOIN products p ON pv.product_id = p.id "
                + "JOIN product_sizes ps ON pv.size_id = ps.id "
                + "JOIN product_colors pc ON pv.color_id = pc.id "
                + "WHERE pv.stock_quantity < ? "
                + "ORDER BY pv.stock_quantity ASC";

        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            if (conn == null) {
                System.out.println("Database connection is null. Check DBContext configuration.");
                return result;
            }
            ps.setInt(1, threshold);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Map<String, Object> product = new HashMap<>();
                    product.put("id", rs.getInt("id"));
                    product.put("title", rs.getString("title"));
                    product.put("size", rs.getString("size"));
                    product.put("color", rs.getString("color"));
                    product.put("stock_quantity", rs.getInt("stock_quantity"));
                    result.add(product);
                }
                if (result.isEmpty()) {
                    System.out.println("No products found with stock below threshold: " + threshold);
                }
            }
        } catch (SQLException e) {
            System.out.println("Error getting low stock products: " + e.getMessage());
            e.printStackTrace();
        }
        return result;
    }

    // Get products with no restocking recently
    public List<Map<String, Object>> getProductsWithoutRecentRestocking(int days) {
        List<Map<String, Object>> result = new ArrayList<>();
        String sql = "SELECT p.id, p.title, MAX(pv.last_restock_date) as last_restock_date, "
                + "DATEDIFF(day, MAX(pv.last_restock_date), GETDATE()) as days_since_restock "
                + "FROM products p "
                + "JOIN product_variants pv ON p.id = pv.product_id "
                + "WHERE pv.last_restock_date IS NOT NULL "
                + "GROUP BY p.id, p.title "
                + "HAVING DATEDIFF(day, MAX(pv.last_restock_date), GETDATE()) >= ? "
                + "ORDER BY days_since_restock DESC";

        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, days);
            rs = ps.executeQuery();
            while (rs.next()) {
                Map<String, Object> product = new HashMap<>();
                product.put("id", rs.getInt("id"));
                product.put("title", rs.getString("title"));
                product.put("last_restock_date", rs.getDate("last_restock_date"));
                product.put("days_since_restock", rs.getInt("days_since_restock"));
                result.add(product);
            }
        } catch (SQLException e) {
            System.out.println("Error getting products without recent restocking: " + e.getMessage());
        }
        return result;
    }

    // Get out of stock rate
    public Map<String, Object> getOutOfStockRate() {
        Map<String, Object> result = new HashMap<>();
        String sql = "SELECT "
                + "(SELECT COUNT(*) FROM products WHERE status = 'EOStock') as out_of_stock_count, "
                + "(SELECT COUNT(*) FROM products) as total_products_count";

        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                int outOfStockCount = rs.getInt("out_of_stock_count");
                int totalProductsCount = rs.getInt("total_products_count");
                result.put("out_of_stock_count", outOfStockCount);
                result.put("total_products_count", totalProductsCount);

                BigDecimal outOfStockRate = BigDecimal.ZERO;
                if (totalProductsCount > 0) {
                    outOfStockRate = new BigDecimal(outOfStockCount)
                            .divide(new BigDecimal(totalProductsCount), 4, RoundingMode.HALF_UP)
                            .multiply(new BigDecimal(100))
                            .setScale(2, RoundingMode.HALF_UP);
                }
                result.put("out_of_stock_rate", outOfStockRate);
            }
        } catch (SQLException e) {
            System.out.println("Error getting out of stock rate: " + e.getMessage());
        }
        return result;
    }

    // 5. SLIDER REPORT METHODS
    // Get sliders by status
    public Map<String, Integer> getSlidersByStatus() {
        Map<String, Integer> result = new HashMap<>();
        String sql = "SELECT status, COUNT(*) as count FROM sliders GROUP BY status";

        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                result.put(rs.getString("status"), rs.getInt("count"));
            }
        } catch (SQLException e) {
            System.out.println("Error getting sliders by status: " + e.getMessage());
        }
        return result;
    }

    // Get sliders by display order
    public List<Map<String, Object>> getSlidersByDisplayOrder() {
        List<Map<String, Object>> result = new ArrayList<>();
        String sql = "SELECT display_order, COUNT(*) as count FROM sliders GROUP BY display_order ORDER BY display_order";

        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Map<String, Object> displayOrder = new HashMap<>();
                displayOrder.put("display_order", rs.getInt("display_order"));
                displayOrder.put("count", rs.getInt("count"));
                result.add(displayOrder);
            }
        } catch (SQLException e) {
            System.out.println("Error getting sliders by display order: " + e.getMessage());
        }
        return result;
    }

    // Get all sliders
    public List<Map<String, Object>> getAllSliders() {
        List<Map<String, Object>> result = new ArrayList<>();
        String sql = "SELECT id, title, image_url, link, status, display_order, notes FROM sliders ORDER BY display_order";

        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Map<String, Object> slider = new HashMap<>();
                slider.put("id", rs.getInt("id"));
                slider.put("title", rs.getString("title"));
                slider.put("image_url", rs.getString("image_url"));
                slider.put("link", rs.getString("link"));
                slider.put("status", rs.getString("status"));
                slider.put("display_order", rs.getInt("display_order"));
                slider.put("notes", rs.getString("notes"));
                result.add(slider);
            }
        } catch (SQLException e) {
            System.out.println("Error getting all sliders: " + e.getMessage());
        }
        return result;
    }

    // 6. POST REPORT METHODS
    // Get posts by status
    public Map<String, Integer> getPostsByStatus() {
        Map<String, Integer> result = new HashMap<>();
        String sql = "SELECT status, COUNT(*) as count FROM posts GROUP BY status";

        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                result.put(rs.getString("status"), rs.getInt("count"));
            }
        } catch (SQLException e) {
            System.out.println("Error getting posts by status: " + e.getMessage());
        }
        return result;
    }

    // Get featured posts count
    public int getFeaturedPostsCount() {
        int result = 0;
        String sql = "SELECT COUNT(*) as count FROM posts WHERE is_featured = 1";

        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                result = rs.getInt("count");
            }
        } catch (SQLException e) {
            System.out.println("Error getting featured posts count: " + e.getMessage());
        }
        return result;
    }

    // Get posts by author
    public List<Map<String, Object>> getPostsByAuthor() {
        List<Map<String, Object>> result = new ArrayList<>();
        String sql = "SELECT u.id, u.username, u.full_name, COUNT(p.id) as post_count "
                + "FROM users u JOIN posts p ON u.id = p.author_id "
                + "GROUP BY u.id, u.username, u.full_name "
                + "ORDER BY post_count DESC";

        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Map<String, Object> author = new HashMap<>();
                author.put("id", rs.getInt("id"));
                author.put("username", rs.getString("username"));
                author.put("full_name", rs.getString("full_name"));
                author.put("post_count", rs.getInt("post_count"));
                result.add(author);
            }
        } catch (SQLException e) {
            System.out.println("Error getting posts by author: " + e.getMessage());
        }
        return result;
    }

    // Get post distribution by month
    public Map<String, Integer> getPostDistributionByMonth() {
        Map<String, Integer> result = new LinkedHashMap<>();
        String sql = "SELECT FORMAT(created_at, 'yyyy-MM') as month, COUNT(*) as count "
                + "FROM posts GROUP BY FORMAT(created_at, 'yyyy-MM') ORDER BY month";

        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                result.put(rs.getString("month"), rs.getInt("count"));
            }
        } catch (SQLException e) {
            System.out.println("Error getting post distribution by month: " + e.getMessage());
        }
        return result;
    }

    // Get average time from draft to published
    public BigDecimal getAverageTimeDraftToPublished() {
        BigDecimal result = BigDecimal.ZERO;
        String sql = "SELECT AVG(CAST(DATEDIFF(minute, created_at, updated_at) AS FLOAT) / 1440) as avg_days "
                + "FROM posts WHERE status = 'published'";

        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                result = rs.getBigDecimal("avg_days");
                if (result != null) {
                    result = result.setScale(2, RoundingMode.HALF_UP);
                } else {
                    result = BigDecimal.ZERO;
                }
            }
        } catch (SQLException e) {
            System.out.println("Error getting average time from draft to published: " + e.getMessage());
        }
        return result;
    }

    // Get latest updated post date
    public Date getLatestUpdatedPostDate() {
        Date result = null;
        String sql = "SELECT MAX(updated_at) as latest_date FROM posts";

        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                result = rs.getDate("latest_date");
            }
        } catch (SQLException e) {
            System.out.println("Error getting latest updated post date: " + e.getMessage());
        }
        return result;
    }

    // Get long-time draft posts
    public List<Map<String, Object>> getLongTimeDraftPosts(int days) {
        List<Map<String, Object>> result = new ArrayList<>();
        String sql = "SELECT id, title, created_at, DATEDIFF(day, created_at, GETDATE()) as days_in_draft "
                + "FROM posts WHERE status = 'draft' AND DATEDIFF(day, created_at, GETDATE()) >= ? "
                + "ORDER BY days_in_draft DESC";

        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, days);
            rs = ps.executeQuery();
            while (rs.next()) {
                Map<String, Object> post = new HashMap<>();
                post.put("id", rs.getInt("id"));
                post.put("title", rs.getString("title"));
                post.put("created_at", rs.getDate("created_at"));
                post.put("days_in_draft", rs.getInt("days_in_draft"));
                result.add(post);
            }
        } catch (SQLException e) {
            System.out.println("Error getting long-time draft posts: " + e.getMessage());
        }
        return result;
    }

    // 7. Additional reporting methods for comprehensive analytics
    // Get order coupon usage
    public Map<String, Object> getCouponUsageMetrics() {
        Map<String, Object> result = new HashMap<>();

        // Tổng số mã giảm giá đã sử dụng
        String sqlTotalUsed = "SELECT SUM(used_count) as total_used FROM coupons";

        // Tổng số mã giảm giá đã tạo
        String sqlTotalCreated = "SELECT COUNT(*) as total_created FROM coupons";

        // Tỷ lệ sử dụng dựa trên số lần sử dụng/giới hạn sử dụng
        String sqlUsageRate = "SELECT AVG(CASE WHEN usage_limit > 0 THEN CAST(used_count AS FLOAT) / usage_limit * 100 ELSE 0 END) as avg_usage_rate "
                + "FROM coupons WHERE usage_limit > 0";

        try {
            // Get total used
            ps = conn.prepareStatement(sqlTotalUsed);
            rs = ps.executeQuery();
            if (rs.next()) {
                result.put("totalUsed", rs.getInt("total_used"));
            }

            // Get total created
            ps = conn.prepareStatement(sqlTotalCreated);
            rs = ps.executeQuery();
            if (rs.next()) {
                result.put("totalCreated", rs.getInt("total_created"));
            }

            // Get usage rate
            ps = conn.prepareStatement(sqlUsageRate);
            rs = ps.executeQuery();
            if (rs.next()) {
                result.put("averageUsageRate", rs.getFloat("avg_usage_rate"));
            }
        } catch (SQLException e) {
            System.out.println("Error getting coupon usage metrics: " + e.getMessage());
        }

        return result;
    }

    // Get combined product metrics
    public List<Map<String, Object>> getCombinedProductMetrics(int limit) {
        List<Map<String, Object>> result = new ArrayList<>();
        String sql = "SELECT p.id, p.title, "
                + "AVG(CAST(f.rating AS FLOAT)) as avg_rating, "
                + "COUNT(DISTINCT f.id) as review_count, "
                + "SUM(oi.quantity) as total_sold, "
                + "SUM(pv.stock_quantity) as stock_quantity "
                + "FROM products p "
                + "LEFT JOIN order_items oi ON p.id = oi.product_id "
                + "LEFT JOIN orders o ON oi.order_id = o.id "
                + "LEFT JOIN feedback f ON oi.id = f.order_item_id "
                + "LEFT JOIN product_variants pv ON p.id = pv.product_id "
                + "WHERE o.status = 'completed' "
                + "GROUP BY p.id, p.title "
                + "ORDER BY total_sold DESC";

        if (limit > 0) {
            sql += " OFFSET 0 ROWS FETCH NEXT ? ROWS ONLY";
        }

        try {
            ps = conn.prepareStatement(sql);
            if (limit > 0) {
                ps.setInt(1, limit);
            }
            rs = ps.executeQuery();
            while (rs.next()) {
                Map<String, Object> product = new HashMap<>();
                product.put("id", rs.getInt("id"));
                product.put("title", rs.getString("title"));

                // Handle null values for average rating
                BigDecimal avgRating = rs.getBigDecimal("avg_rating");
                if (avgRating != null) {
                    product.put("avg_rating", avgRating.setScale(2, RoundingMode.HALF_UP));
                } else {
                    product.put("avg_rating", BigDecimal.ZERO);
                }

                product.put("review_count", rs.getInt("review_count"));
                product.put("total_sold", rs.getInt("total_sold"));
                product.put("stock_quantity", rs.getInt("stock_quantity"));
                result.add(product);
            }
        } catch (SQLException e) {
            System.out.println("Error getting combined product metrics: " + e.getMessage());
        }
        return result;
    }

    // Get inventory value
    public BigDecimal getTotalInventoryValue() {
        BigDecimal result = BigDecimal.ZERO;
        String sql = "SELECT SUM(p.sale_price * pv.stock_quantity) as total_value "
                + "FROM products p JOIN product_variants pv ON p.id = pv.product_id";

        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                result = rs.getBigDecimal("total_value");
                if (result == null) {
                    result = BigDecimal.ZERO;
                }
            }
        } catch (SQLException e) {
            System.out.println("Error getting total inventory value: " + e.getMessage());
        }
        return result;
    }

    public void close() {
        closeResources();
    }
}
