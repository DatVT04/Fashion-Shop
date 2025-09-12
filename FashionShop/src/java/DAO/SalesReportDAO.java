package DAO;

import Context.DBContext;
import entity.*;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.Date;
import java.util.concurrent.TimeUnit;

public class SalesReportDAO extends DBContext {

    /**
     * Generates a comprehensive sales report for the specified date range
     *
     * @param startDate Start date for the report
     * @param endDate End date for the report
     * @return SalesReport object containing all report data
     */
    public SalesReport generateSalesReport(Date startDate, Date endDate) {
        SalesReport report = new SalesReport();
        report.setStartDate(startDate);
        report.setEndDate(endDate);

        try {

            java.sql.Date sqlStartDate = new java.sql.Date(startDate.getTime());
            java.sql.Date sqlEndDate = new java.sql.Date(endDate.getTime());

            getSalesOverview(report, sqlStartDate, sqlEndDate);

            getTimeBasedMetrics(report, sqlStartDate, sqlEndDate);

            getProductPerformance(report, sqlStartDate, sqlEndDate);

            getOrderProcessingMetrics(report, sqlStartDate, sqlEndDate);

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return report;
    }

    /**
     * Gets sales overview metrics like total revenue, orders, etc.
     */
    private void getSalesOverview(SalesReport report, java.sql.Date startDate, java.sql.Date endDate) throws SQLException {
        // Thống kê đơn hàng, doanh thu, giá trị trung bình đơn hàng, tổng số khách hàng
        String sql = "SELECT COUNT(id) AS total_orders, "
                + "SUM(total_amount) AS total_revenue, "
                + "AVG(total_amount) AS avg_order_value, "
                + "COUNT(DISTINCT user_id) AS total_customers "
                + "FROM orders "
                + "WHERE created_at BETWEEN ? AND ? "
                + "AND status = 'completed'"; // Chỉ tính đơn hàng đã hoàn thành

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setDate(1, startDate);
            stmt.setDate(2, endDate);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    report.setTotalOrders(rs.getInt("total_orders"));
                    report.setTotalRevenue(rs.getBigDecimal("total_revenue") != null
                            ? rs.getBigDecimal("total_revenue") : BigDecimal.ZERO);
                    report.setAverageOrderValue(rs.getBigDecimal("avg_order_value") != null
                            ? rs.getBigDecimal("avg_order_value").setScale(2, RoundingMode.HALF_UP) : BigDecimal.ZERO);
                    report.setTotalCustomers(rs.getInt("total_customers"));
                }
            }
        }

        // Thống kê tổng số sản phẩm đã bán
        sql = "SELECT SUM(oi.quantity) AS total_quantity "
                + "FROM order_items oi "
                + "JOIN orders o ON oi.order_id = o.id "
                + "WHERE o.created_at BETWEEN ? AND ? "
                + "AND o.status = 'completed'"; // Chỉ tính đơn hàng đã hoàn thành

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setDate(1, startDate);
            stmt.setDate(2, endDate);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    report.setTotalProducts(rs.getInt("total_quantity")); // Sửa lại thành đúng tên cột
                }
            }
        }
    }

    /**
     * Gets time-based metrics like daily/monthly revenue
     */
    private void getTimeBasedMetrics(SalesReport report, java.sql.Date startDate, java.sql.Date endDate) throws SQLException {
        // Thống kê doanh thu theo ngày
        String sqlDaily = "SELECT CONVERT(VARCHAR(10), created_at, 120) AS order_date, "
                + "SUM(total_amount) AS daily_revenue, "
                + "COUNT(id) AS daily_orders "
                + "FROM orders "
                + "WHERE created_at BETWEEN ? AND ? "
                + "AND status = 'completed' "
                + // Chỉ lấy đơn hàng hoàn thành
                "GROUP BY CONVERT(VARCHAR(10), created_at, 120) "
                + "ORDER BY order_date";

        Map<String, BigDecimal> dailyRevenue = new LinkedHashMap<>();
        Map<String, Integer> ordersPerDay = new LinkedHashMap<>();

        try (PreparedStatement stmt = connection.prepareStatement(sqlDaily)) {
            stmt.setDate(1, startDate);
            stmt.setDate(2, endDate);

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    String date = rs.getString("order_date");
                    BigDecimal revenue = rs.getBigDecimal("daily_revenue");
                    int orders = rs.getInt("daily_orders");

                    dailyRevenue.put(date, revenue);
                    ordersPerDay.put(date, orders);
                }
            }
        }

        report.setDailyRevenue(dailyRevenue);
        report.setOrdersPerDay(ordersPerDay);

        // Thống kê doanh thu theo tháng
        String sqlMonthly = "SELECT SUBSTRING(CONVERT(VARCHAR(10), created_at, 120), 1, 7) AS month, "
                + "SUM(total_amount) AS monthly_revenue, "
                + "COUNT(id) AS monthly_orders "
                + "FROM orders "
                + "WHERE created_at BETWEEN ? AND ? "
                + "AND status = 'completed' "
                + // Chỉ lấy đơn hàng hoàn thành
                "GROUP BY SUBSTRING(CONVERT(VARCHAR(10), created_at, 120), 1, 7) "
                + "ORDER BY month";

        Map<String, BigDecimal> monthlyRevenue = new LinkedHashMap<>();
        Map<String, Integer> ordersPerMonth = new LinkedHashMap<>();

        try (PreparedStatement stmt = connection.prepareStatement(sqlMonthly)) {
            stmt.setDate(1, startDate);
            stmt.setDate(2, endDate);

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    String month = rs.getString("month");
                    BigDecimal revenue = rs.getBigDecimal("monthly_revenue");
                    int orders = rs.getInt("monthly_orders");

                    monthlyRevenue.put(month, revenue);
                    ordersPerMonth.put(month, orders);
                }
            }
        }

        report.setMonthlyRevenue(monthlyRevenue);
        report.setOrdersPerMonth(ordersPerMonth);
    }

    /**
     * Gets product performance metrics
     */
    private void getProductPerformance(SalesReport report, java.sql.Date startDate, java.sql.Date endDate) throws SQLException {
        // Top products by revenue with variant distribution
        String sql = "WITH CategoryHierarchy AS ( "
                + "   SELECT c1.id AS category_id, "
                + "          c1.name AS category_name, "
                + "          c1.parent_id, "
                + "          CASE "
                + "              WHEN c1.parent_id IS NULL THEN c1.id "
                + "              WHEN c2.parent_id IS NULL THEN c2.id "
                + "              WHEN c3.parent_id IS NULL THEN c3.id "
                + "              ELSE NULL "
                + "          END AS top_level_id "
                + "   FROM categories c1 "
                + "   LEFT JOIN categories c2 ON c1.parent_id = c2.id "
                + "   LEFT JOIN categories c3 ON c2.parent_id = c3.id "
                + ") "
                + "SELECT TOP 10 "
                + "    p.id AS product_id, "
                + "    p.title AS product_name, "
                + "    c1.name AS category_name, "
                + "    SUM(oi.quantity) AS total_quantity, "
                + "    SUM(oi.quantity * oi.unit_price_at_order) AS total_revenue, "
                + "    oi.variant_name AS variant, "
                + "    SUM(oi.quantity) AS variant_quantity "
                + "FROM order_items oi "
                + "JOIN orders o ON oi.order_id = o.id "
                + "JOIN products p ON oi.product_id = p.id "
                + "JOIN CategoryHierarchy ch ON p.category_id = ch.category_id "
                + "JOIN categories c1 ON ch.top_level_id = c1.id "
                + "WHERE o.created_at BETWEEN ? AND ? "
                + "AND o.status = 'completed' "
                + "GROUP BY p.id, p.title, c1.name, oi.variant_name "
                + "ORDER BY total_revenue DESC, total_quantity DESC";

        List<SalesReport.ProductPerformance> topProducts = new ArrayList<>();
        Map<Integer, SalesReport.ProductPerformance> productMap = new HashMap<>();

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setDate(1, startDate);
            stmt.setDate(2, endDate);

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    int productId = rs.getInt("product_id");
                    SalesReport.ProductPerformance product;

                    if (!productMap.containsKey(productId)) {
                        product = new SalesReport.ProductPerformance();
                        product.setProductId(productId);
                        product.setProductName(rs.getString("product_name"));
                        product.setCategory(rs.getString("category_name"));
                        product.setTotalQuantitySold(rs.getInt("total_quantity"));
                        product.setTotalRevenue(rs.getBigDecimal("total_revenue"));
                        product.setVariantDistribution(new HashMap<>()); // Khởi tạo map

                        productMap.put(productId, product);
                        topProducts.add(product);
                    } else {
                        product = productMap.get(productId);
                    }

                    // Thêm phân phối variant
                    String variant = rs.getString("variant");
                    int variantQuantity = rs.getInt("variant_quantity");

                    // Kiểm tra null trước khi thêm
                    if (variant != null) {
                        product.getVariantDistribution().put(variant, variantQuantity);
                    }
                }
            }
        }

        report.setTopProducts(topProducts);

        // Revenue by category - keeping consistent with top products query
        sql = "WITH CategoryHierarchy AS ("
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
                + "SELECT c1.name AS category_name, "
                + " SUM(oi.quantity * oi.unit_price_at_order) AS category_revenue, "
                + " COUNT(DISTINCT o.id) AS category_orders "
                + "FROM order_items oi "
                + "JOIN orders o ON oi.order_id = o.id "
                + "JOIN products p ON oi.product_id = p.id "
                + "JOIN CategoryHierarchy ch ON p.category_id = ch.id "
                + "JOIN categories c1 ON ch.top_level_id = c1.id "
                + "WHERE o.created_at BETWEEN ? AND ? "
                + "AND o.status = 'completed' "
                + // Changed to match top products condition
                "GROUP BY c1.name "
                + "ORDER BY category_revenue DESC";

        Map<String, BigDecimal> revenueByCategoryMap = new LinkedHashMap<>();
        Map<String, Integer> ordersByCategoryMap = new LinkedHashMap<>();

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setDate(1, startDate);
            stmt.setDate(2, endDate);

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    String categoryName = rs.getString("category_name");
                    BigDecimal revenue = rs.getBigDecimal("category_revenue");
                    int orders = rs.getInt("category_orders");

                    revenueByCategoryMap.put(categoryName, revenue);
                    ordersByCategoryMap.put(categoryName, orders);
                }
            }
        }

        report.setRevenueByCategoryMap(revenueByCategoryMap);
        report.setOrdersByCategoryMap(ordersByCategoryMap);
    }

    /**
     * Gets distribution of sizes and colors for a product with time constraint
     */
    private void getProductVariantDistribution(SalesReport.ProductPerformance product, java.sql.Date startDate, java.sql.Date endDate) throws SQLException {
        // Size distribution with time constraint
        String sqlSizes = "SELECT ps.size, SUM(oi.quantity) AS count "
                + "FROM order_items oi "
                + "JOIN orders o ON oi.order_id = o.id "
                + "JOIN product_sizes ps ON oi.product_id = ps.product_id "
                + "WHERE oi.product_id = ? "
                + "AND o.created_at BETWEEN ? AND ? "
                + "AND o.status = 'completed' "
                + "GROUP BY ps.size "
                + "ORDER BY count DESC";

        Map<String, Integer> sizeDistribution = new HashMap<>();

        try (PreparedStatement stmt = connection.prepareStatement(sqlSizes)) {
            stmt.setInt(1, product.getProductId());
            stmt.setDate(2, startDate);
            stmt.setDate(3, endDate);

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    String size = rs.getString("size");
                    int count = rs.getInt("count");
                    sizeDistribution.put(size, count);
                }
            }
        }

        product.setSizeDistribution(sizeDistribution);

        // Color distribution with time constraint
        String sqlColors = "SELECT pc.color, SUM(oi.quantity) AS count "
                + // Changed COUNT to SUM for consistency
                "FROM order_items oi "
                + "JOIN orders o ON oi.order_id = o.id "
                + "JOIN products p ON oi.product_id = p.id "
                + "JOIN product_variants pv ON p.id = pv.product_id "
                + "JOIN product_colors pc ON pv.color_id = pc.id "
                + "WHERE p.id = ? "
                + "AND o.created_at BETWEEN ? AND ? "
                + "AND o.status = 'completed' "
                + "GROUP BY pc.color "
                + "ORDER BY count DESC";

        Map<String, Integer> colorDistribution = new HashMap<>();

        try (PreparedStatement stmt = connection.prepareStatement(sqlColors)) {
            stmt.setInt(1, product.getProductId());
            stmt.setDate(2, startDate);
            stmt.setDate(3, endDate);

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    String color = rs.getString("color");
                    int count = rs.getInt("count");
                    colorDistribution.put(color, count);
                }
            }
        }

        product.setColorDistribution(colorDistribution);

        // Category is already set from the main query, no need to query again
    }

    /**
     * Gets order processing metrics
     */
    private void getOrderProcessingMetrics(SalesReport report, java.sql.Date startDate, java.sql.Date endDate) {
        try {
            // In ra thông tin để debug
            System.out.println("Start Date: " + startDate);
            System.out.println("End Date: " + endDate);

            // 1. Xử lý trạng thái đơn hàng
            String sqlOrderStatus = "SELECT status, COUNT(*) AS status_count "
                    + "FROM orders "
                    + "WHERE created_at BETWEEN ? AND ? "
                    + "GROUP BY status";

            Map<String, Integer> ordersByStatus = new HashMap<>();

            try (PreparedStatement stmt = connection.prepareStatement(sqlOrderStatus)) {
                stmt.setDate(1, startDate);
                stmt.setDate(2, endDate);
                System.out.println("SQL Query (Order Status): " + stmt.toString());

                try (ResultSet rs = stmt.executeQuery()) {
                    while (rs.next()) {
                        String status = rs.getString("status");
                        int count = rs.getInt("status_count");
                        System.out.println("Status: " + status + ", Count: " + count);
                        ordersByStatus.put(status, count);
                    }
                }
            }

            report.setOrdersByStatus(ordersByStatus);

            // 2. Tính thời gian xử lý trung bình (average fulfillment time)
            String sqlFulfillmentTime = "SELECT AVG(DATEDIFF(HOUR, created_at, updated_at)) AS avg_fulfillment_time "
                    + "FROM orders "
                    + "WHERE created_at BETWEEN ? AND ? "
                    + "AND status = 'completed'";

            try (PreparedStatement stmt = connection.prepareStatement(sqlFulfillmentTime)) {
                stmt.setDate(1, startDate);
                stmt.setDate(2, endDate);
                System.out.println("SQL Query (Fulfillment Time): " + stmt.toString());

                try (ResultSet rs = stmt.executeQuery()) {
                    if (rs.next()) {
                        double avgFulfillmentTime = rs.getDouble("avg_fulfillment_time");
                        // Nếu giá trị hợp lệ, gán vào report; nếu không, gán 0
                        report.setAverageFulfillmentTime(avgFulfillmentTime > 0 ? avgFulfillmentTime : 0);
                        System.out.println("Average Fulfillment Time: " + avgFulfillmentTime + " hours");
                    } else {
                        report.setAverageFulfillmentTime(0);
                        System.out.println("No completed orders found for fulfillment time calculation.");
                    }
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("SQL Error Details: " + e.getMessage());
            System.err.println("SQL State: " + e.getSQLState());
            System.err.println("Error Code: " + e.getErrorCode());
            report.setAverageFulfillmentTime(0); 
        }
    }

}
