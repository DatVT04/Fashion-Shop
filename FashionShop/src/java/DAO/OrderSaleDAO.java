package DAO;

import entity.Order;
import entity.OrderItem;
import entity.DashboardStats;
import entity.OrderStatusCount;
import entity.CategorySales;
import entity.DailySalesData;
import Context.DBContext;
import entity.PaymentMethodSales;
import entity.SalesOverview;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class OrderSaleDAO extends DBContext {

    /**
     * Get all orders from the database
     *
     * @return List of all orders
     */
    public List<Order> getAllOrders() {
        List<Order> orders = new ArrayList<>();
        String sql = "SELECT * FROM orders";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                orders.add(mapOrder(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return orders;
    }

    /**
     * Get order by id
     *
     * @param id Order ID
     * @return Order object
     */
    public Order getOrderById(int id) {
        String sql = "SELECT * FROM orders WHERE id = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                return mapOrder(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    /**
     * Get order items for a specific order
     *
     * @param orderId Order ID
     * @return List of order items
     */
    public List<OrderItem> getOrderItems(int orderId) {
        List<OrderItem> items = new ArrayList<>();
        String sql = "SELECT oi.*, p.name as product_name, pv.name as variant_name, pc.name as category_name "
                + "FROM order_items oi "
                + "JOIN products p ON oi.product_id = p.id "
                + "JOIN product_variants pv ON oi.variant_id = pv.id "
                + "JOIN product_categories pc ON p.category_id = pc.id "
                + "WHERE oi.order_id = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, orderId);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                OrderItem item = new OrderItem();
                item.setId(rs.getInt("id"));
                item.setOrderId(rs.getInt("order_id"));
                item.setProductId(rs.getInt("product_id"));
                item.setVariantId(rs.getInt("variant_id"));
                item.setQuantity(rs.getInt("quantity"));
                item.setUnitPrice(rs.getBigDecimal("unit_price"));
                item.setProductName(rs.getString("product_name"));
                item.setVariantName(rs.getString("variant_name"));
                item.setCategoryName(rs.getString("category_name"));
                items.add(item);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return items;
    }

    /**
     * Get dashboard statistics
     *
     * @return DashboardStats object containing various statistics
     */
    public SalesOverview getSalesOverview() {
        SalesOverview stats = new SalesOverview();

        // Get order status counts
        String statusSql = "SELECT status, COUNT(*) as count FROM orders GROUP BY status";
        try {
            PreparedStatement st = connection.prepareStatement(statusSql);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                String status = rs.getString("status");
                int count = rs.getInt("count");

                switch (status) {
                    case "pending_pay":
                        stats.setPendingPayOrders(count);
                        break;
                    case "pending":
                        stats.setPendingOrders(count);
                        break;
                    case "processing":
                        stats.setProcessingOrders(count);
                        break;
                    case "shipping":
                        stats.setShippingOrders(count);
                        break;
                    case "completed":
                        stats.setCompletedOrders(count);
                        break;
                    case "returned":
                        stats.setReturnedOrders(count);
                        break;
                    case "cancelled":
                        stats.setCancelledOrders(count);
                        break;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // Get total revenue
        String revenueSql = "SELECT SUM(total_amount) as total_revenue FROM orders WHERE status = 'completed'";
        try {
            PreparedStatement st = connection.prepareStatement(revenueSql);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                stats.setTotalRevenue(rs.getBigDecimal("total_revenue"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // Get total sales (number of completed orders)
        String salesSql = "SELECT COUNT(*) as total_sales FROM orders WHERE status = 'completed'";
        try {
            PreparedStatement st = connection.prepareStatement(salesSql);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                stats.setTotalSales(rs.getInt("total_sales"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // Get customer counts
        String customerSql = "SELECT customer_type, COUNT(*) as count FROM customer_contact_history GROUP BY customer_type";
        try {
            PreparedStatement st = connection.prepareStatement(customerSql);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                String type = rs.getString("customer_type");
                int count = rs.getInt("count");

                if ("vip".equals(type)) {
                    stats.setVipCustomers(count);
                } else if ("normal".equals(type)) {
                    stats.setNormalCustomers(count);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        stats.setCompletedSalesQuantity(getCompletedSalesQuantity());
        return stats;
    }

    /**
     * Get total quantity of items sold in completed orders
     *
     * @return int representing total number of items sold
     */
    public int getCompletedSalesQuantity() {
        String sql = "SELECT SUM(oi.quantity) as total_quantity_sold "
                + "FROM order_items oi "
                + "JOIN orders o ON oi.order_id = o.id "
                + "WHERE o.status = 'completed'";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                int result = rs.getInt("total_quantity_sold");
                return (result != 0) ? result : 0;
            }
            return 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        }
    }

    /**
     * Get order status counts for a date range
     *
     * @param startDate Start date
     * @param endDate End date
     * @return List of OrderStatusCount objects
     */
    public List<OrderStatusCount> getOrderStatusCounts(LocalDate startDate, LocalDate endDate) {
        List<OrderStatusCount> statusCounts = new ArrayList<>();

        String sql = "SELECT CAST(created_at AS DATE) as order_date, status, COUNT(*) as count "
                + "FROM orders "
                + "WHERE CAST(created_at AS DATE) BETWEEN ? AND ? "
                + "GROUP BY CAST(created_at AS DATE), status "
                + "ORDER BY CAST(created_at AS DATE)";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setDate(1, Date.valueOf(startDate));
            st.setDate(2, Date.valueOf(endDate));
            ResultSet rs = st.executeQuery();

            Map<LocalDate, OrderStatusCount> dateStatusMap = new HashMap<>();

            while (rs.next()) {
                LocalDate orderDate = rs.getDate("order_date").toLocalDate();
                String status = rs.getString("status");
                int count = rs.getInt("count");

                OrderStatusCount statusCount = dateStatusMap.get(orderDate);
                if (statusCount == null) {
                    statusCount = new OrderStatusCount();
                    statusCount.setOrderDate(orderDate);
                    dateStatusMap.put(orderDate, statusCount);
                }

                switch (status) {
                    case "pending_pay":
                        statusCount.setPendingPayCount(count);
                        break;
                    case "pending":
                        statusCount.setPendingCount(count);
                        break;
                    case "processing":
                        statusCount.setProcessingCount(count);
                        break;
                    case "shipping":
                        statusCount.setShippingCount(count);
                        break;
                    case "completed":
                        statusCount.setCompletedCount(count);
                        break;
                    case "returned":
                        statusCount.setReturnedCount(count);
                        break;
                    case "cancelled":
                        statusCount.setCancelledCount(count);
                        break;
                }
            }

            LocalDate currentDate = startDate;
            while (!currentDate.isAfter(endDate)) {
                if (!dateStatusMap.containsKey(currentDate)) {
                    OrderStatusCount emptyCount = new OrderStatusCount();
                    emptyCount.setOrderDate(currentDate);
                    dateStatusMap.put(currentDate, emptyCount);
                }
                currentDate = currentDate.plusDays(1);
            }

            statusCounts.addAll(dateStatusMap.values());

            statusCounts.sort((a, b) -> a.getOrderDate().compareTo(b.getOrderDate()));

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return statusCounts;
    }

    /**
     * Get sales by category
     *
     * @return List of CategorySales objects
     */
    public List<CategorySales> getSalesByCategory() {
        List<CategorySales> categorySales = new ArrayList<>();

        String sql = "WITH CategoryHierarchy AS ("
                + " SELECT c1.id, c1.name, c1.parent_id,"
                + " CASE"
                + "     WHEN c1.parent_id IS NULL THEN c1.id"
                + "     WHEN c2.parent_id IS NULL THEN c2.id"
                + "     WHEN c3.parent_id IS NULL THEN c3.id"
                + "     ELSE NULL"
                + " END AS top_level_id"
                + " FROM categories c1"
                + " LEFT JOIN categories c2 ON c1.parent_id = c2.id"
                + " LEFT JOIN categories c3 ON c2.parent_id = c3.id"
                + ") "
                + "SELECT c.name AS category_name, "
                + " COUNT(oi.id) AS total_items, "
                + " SUM(oi.quantity * oi.unit_price_at_order) AS total_amount "
                + " FROM order_items oi "
                + " JOIN products p ON oi.product_id = p.id "
                + " JOIN CategoryHierarchy ch ON p.category_id = ch.id "
                + " JOIN categories c ON ch.top_level_id = c.id "
                + " JOIN orders o ON oi.order_id = o.id "
                + " WHERE o.status = 'completed' "
                + " AND c.id IN (1, 2, 3, 4, 5) "
                + " GROUP BY c.name "
                + " ORDER BY total_amount DESC;";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                CategorySales category = new CategorySales();
                category.setCategoryName(rs.getString("category_name"));
                category.setTotalItems(rs.getInt("total_items"));
                category.setTotalAmount(rs.getBigDecimal("total_amount"));
                categorySales.add(category);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return categorySales;
    }

    /**
     * Get daily sales data for a date range
     *
     * @param startDate Start date
     * @param endDate End date
     * @return List of DailySalesData objects
     */
    public List<DailySalesData> getDailySalesData(LocalDate startDate, LocalDate endDate) {
        List<DailySalesData> salesData = new ArrayList<>();

        String sql = "SELECT CAST(o.created_at AS DATE) as order_date, COUNT(*) as order_count, SUM(total_amount) as total_amount "
                + "FROM orders o "
                + "WHERE CAST(o.created_at AS DATE) BETWEEN ? AND ? "
                + "AND o.status = 'completed' "
                + "GROUP BY CAST(o.created_at AS DATE) "
                + "ORDER BY CAST(o.created_at AS DATE)";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setDate(1, Date.valueOf(startDate));
            st.setDate(2, Date.valueOf(endDate));
            ResultSet rs = st.executeQuery();

            Map<LocalDate, DailySalesData> dateSalesMap = new HashMap<>();

            while (rs.next()) {
                LocalDate orderDate = rs.getDate("order_date").toLocalDate();
                int orderCount = rs.getInt("order_count");
                java.math.BigDecimal totalAmount = rs.getBigDecimal("total_amount");

                DailySalesData data = new DailySalesData();
                data.setSaleDate(orderDate);
                data.setOrderCount(orderCount);
                data.setTotalAmount(totalAmount);

                dateSalesMap.put(orderDate, data);
            }

            // Fill in missing dates
            LocalDate currentDate = startDate;
            while (!currentDate.isAfter(endDate)) {
                if (!dateSalesMap.containsKey(currentDate)) {
                    DailySalesData emptyData = new DailySalesData();
                    emptyData.setSaleDate(currentDate);
                    emptyData.setOrderCount(0);
                    emptyData.setTotalAmount(java.math.BigDecimal.ZERO);
                    dateSalesMap.put(currentDate, emptyData);
                }
                currentDate = currentDate.plusDays(1);
            }

            // Convert map to list
            salesData.addAll(dateSalesMap.values());

            // Sort by date
            salesData.sort((a, b) -> a.getSaleDate().compareTo(b.getSaleDate()));

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return salesData;
    }

    /**
     * Get sales data grouped by payment method
     *
     * @return List of PaymentMethodSales objects
     */
    public List<PaymentMethodSales> getSalesByPaymentMethod() {
        List<PaymentMethodSales> paymentMethodSales = new ArrayList<>();

        String sql = "SELECT p.payment_method, "
                + "COUNT(*) AS order_count, "
                + "SUM(o.total_amount) AS total_amount "
                + "FROM orders o "
                + "JOIN payments p ON o.id = p.order_id "
                + "WHERE o.status = 'completed' "
                + "GROUP BY p.payment_method "
                + "ORDER BY total_amount DESC";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                PaymentMethodSales payment = new PaymentMethodSales();
                payment.setPaymentMethod(rs.getString("payment_method"));
                payment.setOrderCount(rs.getInt("order_count"));
                payment.setTotalAmount(rs.getBigDecimal("total_amount"));
                paymentMethodSales.add(payment);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return paymentMethodSales;
    }

    /**
     * Helper method to map ResultSet to Order object
     *
     * @param rs ResultSet containing order data
     * @return Mapped Order object
     * @throws SQLException if database access error occurs
     */
    private Order mapOrder(ResultSet rs) throws SQLException {
        Order order = new Order();
        order.setId(rs.getInt("id"));

        int userId = rs.getInt("user_id");
        if (!rs.wasNull()) {
            order.setUserId(userId);
        }

        order.setStatus(rs.getString("status"));
        order.setTotal(rs.getDouble("total_amount"));
        order.setRecipientName(rs.getString("recipient_name"));
        order.setRecipientEmail(rs.getString("recipient_email"));
        order.setPhone(rs.getString("recipient_phone"));
        order.setAddress(rs.getString("recipient_address"));
        order.setNotes(rs.getString("notes"));

        Timestamp createdAt = rs.getTimestamp("created_at");
        if (createdAt != null) {
            order.setOrderDate(new java.util.Date(createdAt.getTime()));
        }

        return order;
    }
}
