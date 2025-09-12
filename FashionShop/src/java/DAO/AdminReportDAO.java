package DAO;

import Context.DBContext;
import entity.LowStockProductReport;
import entity.UserReport;
import entity.OrderReport;
import entity.ProductReport;
import entity.UserStatusCount;
import entity.OrderStatusReport;
import entity.ProductInventoryReport;
import entity.ProductStatusCount;
import entity.UserRoleReport;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.math.BigDecimal;

public class AdminReportDAO extends DBContext {

    /**
     * Get user reports filtered by status and role
     *
     * @param statusFilter Filter by user status (active, inactive, pending, or
     * all)
     * @param roleFilter Filter by user role (admin, sale, marketing, customer,
     * or all)
     * @return List of UserReport objects
     */
    public List<UserReport> getUserReports(String statusFilter, String roleFilter) {
        List<UserReport> users = new ArrayList<>();

        StringBuilder sql = new StringBuilder("SELECT id, username, email, full_name, gender, mobile, role, status, created_at FROM users WHERE 1=1");

        // Add filters if not "all"
        if (!"all".equals(statusFilter)) {
            sql.append(" AND status = ?");
        }
        if (!"all".equals(roleFilter)) {
            sql.append(" AND role = ?");
        }

        sql.append(" ORDER BY created_at DESC");

        try {
            PreparedStatement st = connection.prepareStatement(sql.toString());

            // Set parameters for filters
            int paramIndex = 1;
            if (!"all".equals(statusFilter)) {
                st.setString(paramIndex++, statusFilter);
            }
            if (!"all".equals(roleFilter)) {
                st.setString(paramIndex, roleFilter);
            }

            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                UserReport user = new UserReport();
                user.setId(rs.getInt("id"));
                user.setUsername(rs.getString("username"));
                user.setEmail(rs.getString("email"));
                user.setFullName(rs.getString("full_name"));
                user.setGender(rs.getString("gender"));
                user.setMobile(rs.getString("mobile"));
                user.setRole(rs.getString("role"));
                user.setStatus(rs.getString("status"));
                user.setCreatedAt(rs.getString("created_at"));
                users.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return users;
    }

    /**
     * Get order reports filtered by status
     *
     * @param statusFilter Filter by order status (pending, processing, shipped,
     * delivered, cancelled, or all)
     * @return List of OrderReport objects
     */
    public List<OrderReport> getOrderReports(String statusFilter) {
        List<OrderReport> orders = new ArrayList<>();

        StringBuilder sql = new StringBuilder(
                "SELECT "
                + "    o.status AS 'Trạng thái đơn hàng', "
                + "    COUNT(*) AS 'Tổng số đơn hàng', "
                + "    COALESCE(SUM(o.total_amount), 0) AS 'Tổng giá trị đơn', "
                + "    COALESCE(SUM(CASE WHEN o.status = 'completed' THEN o.total_amount ELSE 0 END), 0) AS 'Doanh thu thực tế', "
                + "    COALESCE(SUM(oc.discount_applied), 0) AS 'Tổng giảm giá áp dụng', "
                + "    COUNT(oc.order_id) AS 'Đơn hàng dùng mã giảm giá' "
                + "FROM orders o "
                + "LEFT JOIN order_coupons oc ON o.id = oc.order_id "
                + "WHERE 1=1"
        );

        // Add filter if not "all"
        if (!"all".equals(statusFilter)) {
            sql.append(" AND o.status = ?");
        }

        sql.append(" GROUP BY o.status "
                + "ORDER BY "
                + "    CASE "
                + "        WHEN o.status = 'pending_pay' THEN 1 "
                + "        WHEN o.status = 'pending' THEN 2 "
                + "        WHEN o.status = 'processing' THEN 3 "
                + "        WHEN o.status = 'shipped' THEN 4 "
                + "        WHEN o.status = 'completed' THEN 5 "
                + "        WHEN o.status = 'cancelled' THEN 6 "
                + "    END");

        try {
            PreparedStatement st = connection.prepareStatement(sql.toString());

            // Set parameter for filter
            if (!"all".equals(statusFilter)) {
                st.setString(1, statusFilter);
            }

            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                OrderReport order = new OrderReport();
                order.setStatus(rs.getString("Trạng thái đơn hàng"));
                order.setOrderCount(rs.getInt("Tổng số đơn hàng"));
                order.setTotalAmount(rs.getBigDecimal("Tổng giá trị đơn"));
                order.setActualRevenue(rs.getBigDecimal("Doanh thu thực tế"));
                order.setTotalDiscount(rs.getBigDecimal("Tổng giảm giá áp dụng"));
                order.setDiscountedOrderCount(rs.getInt("Đơn hàng dùng mã giảm giá"));
                orders.add(order);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return orders;
    }

    /**
     * Get product reports filtered by status
     *
     * @param statusFilter Filter by product status (active, inactive, EOStock,
     * or all)
     * @return List of ProductReport objects
     */
    public List<ProductReport> getProductReports(String statusFilter) {
        List<ProductReport> products = new ArrayList<>();
        StringBuilder sql = new StringBuilder(
                "SELECT p.id, p.title, p.category_id, c.name as category_name, "
                + "p.original_price, p.sale_price, p.status, p.created_at "
                + "FROM products p "
                + "JOIN categories c ON p.category_id = c.id "
                + "WHERE 1=1"
        );
        // Add filter if not "all"
        if (!"all".equals(statusFilter)) {
            sql.append(" AND p.status = ?");
        }
        sql.append(" ORDER BY p.created_at DESC");
        try {
            PreparedStatement st = connection.prepareStatement(sql.toString());
            // Set parameter for filter
            if (!"all".equals(statusFilter)) {
                st.setString(1, statusFilter);
            }
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                ProductReport product = new ProductReport();
                product.setId(rs.getInt("id"));
                product.setTitle(rs.getString("title"));
                product.setCategoryId(rs.getInt("category_id"));
                product.setCategoryName(rs.getString("category_name"));
                product.setOriginalPrice(rs.getBigDecimal("original_price"));
                product.setSalePrice(rs.getBigDecimal("sale_price"));
                product.setStatus(rs.getString("status"));
                product.setCreatedAt(rs.getString("created_at"));
                products.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

    /**
     * Get user summary statistics
     *
     * @return UserStatusCount object with counts for each status
     */
    public UserStatusCount getUserSummary() {
        UserStatusCount summary = new UserStatusCount();

        String sql = "SELECT status, COUNT(*) as count FROM users GROUP BY status";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                String status = rs.getString("status");
                int count = rs.getInt("count");

                switch (status) {
                    case "active":
                        summary.setActiveCount(count);
                        break;
                    case "inactive":
                        summary.setInactiveCount(count);
                        break;
                    case "pending":
                        summary.setPendingCount(count);
                        break;
                }
            }

            summary.setTotalUsers(summary.getActiveCount() + summary.getInactiveCount() + summary.getPendingCount());

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return summary;
    }

    /**
     * Get order summary statistics
     *
     * @return OrderStatusReport object with counts for each status
     */
    public OrderStatusReport getOrderSummary() {
        OrderStatusReport summary = new OrderStatusReport();
        String sql = "SELECT status, COUNT(*) as count, SUM(total_amount) as total FROM orders GROUP BY status";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            BigDecimal totalAmount = BigDecimal.ZERO;
            while (rs.next()) {
                String status = rs.getString("status");
                int count = rs.getInt("count");
                BigDecimal statusTotal = rs.getBigDecimal("total");
                totalAmount = totalAmount.add(statusTotal);
                switch (status) {
                    case "pending_pay":
                        summary.setPendingPayCount(count);
                        summary.setPendingPayAmount(statusTotal);
                        break;
                    case "pending":
                        summary.setPendingCount(count);
                        summary.setPendingAmount(statusTotal);
                        break;
                    case "processing":
                        summary.setProcessingCount(count);
                        summary.setProcessingAmount(statusTotal);
                        break;
                    case "shipping":
                        summary.setShippingCount(count);
                        summary.setShippingAmount(statusTotal);
                        break;
                    case "completed":
                        summary.setCompletedCount(count);
                        summary.setCompletedAmount(statusTotal);
                        break;
                    case "returned":
                        summary.setReturnedCount(count);
                        summary.setReturnedAmount(statusTotal);
                        break;
                    case "cancelled":
                        summary.setCancelledCount(count);
                        summary.setCancelledAmount(statusTotal);
                        break;
                }
            }
            summary.setTotalOrders(summary.getPendingPayCount() + summary.getPendingCount()
                    + summary.getProcessingCount() + summary.getShippingCount()
                    + summary.getCompletedCount() + summary.getReturnedCount()
                    + summary.getCancelledCount());
            summary.setTotalAmount(totalAmount);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return summary;
    }

    /**
     * Get product summary statistics
     *
     * @return ProductStatusCount object with counts for each status
     */
    public ProductStatusCount getProductSummary() {
        ProductStatusCount summary = new ProductStatusCount();

        String sql = "SELECT status, COUNT(*) as count FROM products GROUP BY status";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                String status = rs.getString("status");
                int count = rs.getInt("count");

                switch (status) {
                    case "active":
                        summary.setActiveCount(count);
                        break;
                    case "inactive":
                        summary.setInactiveCount(count);
                        break;
                    case "EOStock":
                        summary.setEoStockCount(count);
                        break;
                }
            }

            summary.setTotalProducts(summary.getActiveCount() + summary.getInactiveCount() + summary.getEoStockCount());

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return summary;
    }
///////////////////////////////////////////////////////////////////////////////////

    public List<UserRoleReport> getUserRoleReports() {
        List<UserRoleReport> reports = new ArrayList<>();
        String sql = "SELECT \n"
                + "    u.role AS 'Vai trò',\n"
                + "    COUNT(*) AS 'Tổng số người dùng',\n"
                + "    SUM(CASE WHEN u.status = 'active' THEN 1 ELSE 0 END) AS 'Đang hoạt động',\n"
                + "    SUM(CASE WHEN u.status = 'inactive' OR u.status = 'pending' THEN 1 ELSE 0 END) AS 'Không hoạt động',\n"
                + "    COALESCE(SUM(o.total_amount), 0) AS 'Tổng doanh thu từ khách',\n"
                + "    COALESCE(COUNT(DISTINCT o.id), 0) AS 'Tổng số đơn hàng',\n"
                + "    COALESCE(AVG(o.total_amount), 0) AS 'Giá trị đơn trung bình'\n"
                + "FROM users u\n"
                + "LEFT JOIN orders o ON u.id = o.user_id AND o.status = 'completed'\n"
                + "GROUP BY u.role\n"
                + "HAVING u.role IN ('customer', 'admin', 'sale', 'marketing')\n"
                + "ORDER BY \n"
                + "    CASE \n"
                + "        WHEN u.role = 'customer' THEN 1 \n"
                + "        WHEN u.role = 'admin' THEN 2 \n"
                + "        WHEN u.role = 'sale' THEN 3 \n"
                + "        WHEN u.role = 'marketing' THEN 4 \n"
                + "    END;";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                UserRoleReport report = new UserRoleReport();
                report.setRole(rs.getString("Vai trò"));
                report.setTotalUsers(rs.getInt("Tổng số người dùng"));
                report.setActiveCount(rs.getInt("Đang hoạt động"));
                report.setInactiveCount(rs.getInt("Không hoạt động"));
                report.setTotalRevenue(rs.getBigDecimal("Tổng doanh thu từ khách"));
                report.setTotalOrders(rs.getInt("Tổng số đơn hàng"));
                report.setAvgOrderValue(rs.getBigDecimal("Giá trị đơn trung bình"));
                reports.add(report);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return reports;
    }
//////////////////////////////////////////////////////////////////////////////////

    /**
     * Get product inventory reports grouped by status
     *
     * @param statusFilter Filter by product status (active, inactive, EOStock,
     * or all)
     * @return List of ProductInventoryReport objects
     */
    public List<ProductInventoryReport> getProductInventoryReports(String statusFilter) {
        List<ProductInventoryReport> reports = new ArrayList<>();
        StringBuilder sql = new StringBuilder(
                "SELECT "
                + "    p.status AS 'Trạng thái sản phẩm', "
                + "    COUNT(DISTINCT p.id) AS 'Tổng số sản phẩm', "
                + "    COALESCE(SUM(pv.stock_quantity), 0) AS 'Tổng tồn kho', "
                + "    COUNT(DISTINCT CASE WHEN pv.stock_quantity <= 10 AND p.status = 'active' THEN p.id END) AS 'Sản phẩm tồn thấp', "
                + "    COALESCE((SELECT SUM(oi.quantity) FROM order_items oi "
                + "      JOIN orders o ON oi.order_id = o.id "
                + "      JOIN products prod ON oi.product_id = prod.id "
                + "      WHERE o.status = 'completed' AND prod.status = p.status), 0) AS 'Tổng số lượng bán ra', "
                + "    COALESCE((SELECT SUM(oi.quantity * oi.unit_price_at_order) FROM order_items oi "
                + "      JOIN orders o ON oi.order_id = o.id "
                + "      JOIN products prod ON oi.product_id = prod.id "
                + "      WHERE o.status = 'completed' AND prod.status = p.status), 0) AS 'Tổng doanh thu', "
                + "    (SELECT COUNT(DISTINCT product_id) FROM "
                + "      (SELECT oi2.product_id, SUM(oi2.quantity) as total_qty "
                + "        FROM order_items oi2 "
                + "        JOIN orders o2 ON oi2.order_id = o2.id "
                + "        JOIN products p2 ON oi2.product_id = p2.id "
                + "        WHERE o2.status = 'completed' AND p2.status = p.status "
                + "        GROUP BY oi2.product_id "
                + "        HAVING SUM(oi2.quantity) >= 50) as bestsellers) AS 'Sản phẩm bán chạy' "
                + "FROM products p "
                + "LEFT JOIN product_variants pv ON p.id = pv.product_id "
                + "WHERE 1=1"
        );
        if (!"all".equals(statusFilter)) {
            sql.append(" AND p.status = ?");
        }
        sql.append(" GROUP BY p.status ORDER BY p.status");
        try {
            PreparedStatement st = connection.prepareStatement(sql.toString());
            if (!"all".equals(statusFilter)) {
                st.setString(1, statusFilter);
            }
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                ProductInventoryReport report = new ProductInventoryReport();
                report.setStatus(rs.getString("Trạng thái sản phẩm"));
                report.setTotalProducts(rs.getInt("Tổng số sản phẩm"));
                report.setTotalStock(rs.getInt("Tổng tồn kho"));
                report.setLowStockCount(rs.getInt("Sản phẩm tồn thấp"));
                report.setTotalSoldQuantity(rs.getInt("Tổng số lượng bán ra"));
                report.setTotalRevenue(rs.getBigDecimal("Tổng doanh thu"));
                report.setBestSellerCount(rs.getInt("Sản phẩm bán chạy"));
                reports.add(report);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return reports;
    }

    /**
     * Get products with low stock
     *
     * @return List of LowStockProduct objects
     */
    public List<LowStockProductReport> getLowStockProducts() {
        List<LowStockProductReport> products = new ArrayList<>();
        String sql
                = "SELECT "
                + "    p.id AS 'Mã sản phẩm', "
                + "    p.title AS 'Tên sản phẩm', "
                + "    c.name AS 'Danh mục', "
                + "    ps.size AS 'Kích thước', "
                + "    pc.color AS 'Màu sắc', "
                + "    COALESCE(pv.stock_quantity, 0) AS 'Số lượng tồn kho' "
                + "FROM products p "
                + "LEFT JOIN categories c ON p.category_id = c.id "
                + "LEFT JOIN product_variants pv ON p.id = pv.product_id "
                + "LEFT JOIN product_sizes ps ON pv.size_id = ps.id "
                + "LEFT JOIN product_colors pc ON pv.color_id = pc.id "
                + "WHERE "
                + "    p.status = 'active' "
                + "    AND COALESCE(pv.stock_quantity, 0) <= 10 "
                + // Loại bỏ điều kiện IS NULL
                "GROUP BY p.id, p.title, c.name, ps.size, pc.color, pv.stock_quantity "
                + // Tránh trùng lặp
                "ORDER BY pv.stock_quantity ASC";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                LowStockProductReport product = new LowStockProductReport();
                product.setId(rs.getInt("Mã sản phẩm"));
                product.setTitle(rs.getString("Tên sản phẩm"));
                product.setCategoryName(rs.getString("Danh mục"));
                product.setSize(rs.getString("Kích thước"));
                product.setColor(rs.getString("Màu sắc"));
                product.setStockQuantity(rs.getInt("Số lượng tồn kho"));
                products.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }
}
