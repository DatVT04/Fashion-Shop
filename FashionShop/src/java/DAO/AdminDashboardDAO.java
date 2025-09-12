package DAO;

import Context.DBContext;
import entity.CategoryCount;
import entity.ProductStatusCount;
import entity.UserStatusCount;
import entity.CustomerSpendData;
import entity.TimeSeriesData;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.math.BigDecimal;

public class AdminDashboardDAO extends DBContext {

    /**
     * Get user counts grouped by status
     *
     * @return UserStatusCount object containing counts of active, inactive, and
     * pending users
     */
    public UserStatusCount getUserStatusCounts() {
        UserStatusCount userCount = new UserStatusCount();

        String sql = "SELECT status, COUNT(*) as count FROM users GROUP BY status";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                String status = rs.getString("status");
                int count = rs.getInt("count");

                switch (status) {
                    case "active":
                        userCount.setActiveCount(count);
                        break;
                    case "inactive":
                        userCount.setInactiveCount(count);
                        break;
                    case "pending":
                        userCount.setPendingCount(count);
                        break;
                }
            }

            // Calculate total users
            userCount.setTotalUsers(userCount.getActiveCount() + userCount.getInactiveCount() + userCount.getPendingCount());

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return userCount;
    }

    /**
     * Get category counts at level 1
     *
     * @return List of CategoryCount objects containing name and count of level
     * 1 categories
     */
    public List<CategoryCount> getLevel1Categories() {
        List<CategoryCount> categories = new ArrayList<>();

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
                + "SELECT TOP 5 c.name AS category_name, COUNT(p.id) AS product_count "
                + "FROM products p "
                + "JOIN CategoryHierarchy ch ON p.category_id = ch.id "
                + "JOIN categories c ON ch.top_level_id = c.id "
                + "WHERE p.status = 'active' "
                + "GROUP BY c.name "
                + "ORDER BY product_count DESC;";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                CategoryCount category = new CategoryCount();
                category.setName(rs.getString("category_name"));
                category.setProductCount(rs.getInt("product_count"));
                categories.add(category);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return categories;
    }

    /**
     * Get total number of categories
     *
     * @return Total number of categories
     */
    public int getTotalCategories() {
        int totalCategories = 0;
        String sql = "SELECT COUNT(*) AS total FROM categories WHERE level = 1";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                totalCategories = rs.getInt("total");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return totalCategories;
    }

    /**
     * Get product counts by status
     *
     * @return ProductStatusCount object containing counts of active, inactive,
     * and EOStock products
     */
    public ProductStatusCount getProductStatusCounts() {
        ProductStatusCount productCount = new ProductStatusCount();

        String sql = "SELECT status, COUNT(*) as count FROM products GROUP BY status";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                String status = rs.getString("status");
                int count = rs.getInt("count");

                switch (status) {
                    case "active":
                        productCount.setActiveCount(count);
                        break;
                    case "inactive":
                        productCount.setInactiveCount(count);
                        break;
                    case "EOStock":
                        productCount.setEoStockCount(count);
                        break;
                }
            }

            // Calculate total products
            productCount.setTotalProducts(productCount.getActiveCount() + productCount.getInactiveCount() + productCount.getEoStockCount());

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return productCount;
    }

    /**
     * Get customer spending data
     *
     * @return List of CustomerSpendData objects with customer spending
     * information
     */
    public List<CustomerSpendData> getTopCustomersBySpend() {
        List<CustomerSpendData> customers = new ArrayList<>();

        String sql = "SELECT TOP 5 full_name, total_purchases, total_spend FROM customer_contact_history "
                + "ORDER BY total_spend DESC ";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                CustomerSpendData customer = new CustomerSpendData();
                customer.setFullName(rs.getString("full_name"));
                customer.setTotalPurchases(rs.getInt("total_purchases"));
                customer.setTotalSpend(rs.getBigDecimal("total_spend"));
                customers.add(customer);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return customers;
    }

    /**
     * Get total customer purchases and spending
     *
     * @return CustomerSpendData object with aggregated customer spending
     * information
     */
    public CustomerSpendData getTotalCustomerStats() {
        CustomerSpendData totals = new CustomerSpendData();

        // Câu truy vấn để tính doanh số (số lượng sản phẩm đã bán)
        String salesQuantitySql = "SELECT SUM(oi.quantity) as total_purchases "
                + "FROM order_items oi "
                + "JOIN orders o ON oi.order_id = o.id "
                + "WHERE o.status = 'completed'";

        // Câu truy vấn để tính doanh thu
        String revenueSql = "SELECT SUM(total_spend) AS total_spend "
                + "FROM customer_contact_history";

        try {
            // Tính doanh số
            PreparedStatement salesSt = connection.prepareStatement(salesQuantitySql);
            ResultSet salesRs = salesSt.executeQuery();

            if (salesRs.next()) {
                totals.setTotalPurchases(salesRs.getInt("total_purchases"));
            }

            // Tính doanh thu
            PreparedStatement revenueSt = connection.prepareStatement(revenueSql);
            ResultSet revenueRs = revenueSt.executeQuery();

            if (revenueRs.next()) {
                totals.setTotalSpend(revenueRs.getBigDecimal("total_spend"));
            }

            // Đóng các ResultSet và PreparedStatement
            salesRs.close();
            salesSt.close();
            revenueRs.close();
            revenueSt.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return totals;
    }

    /**
     * Get monthly product additions over time
     *
     * @return List of TimeSeriesData objects with month and product count
     * information
     */
    public List<TimeSeriesData> getMonthlyProductAdditions() {
        List<TimeSeriesData> timeSeriesData = new ArrayList<>();

        // SQL query to get product count by month
        String sql = "SELECT FORMAT(created_at, 'yyyy-MM') AS month, COUNT(*) AS count "
                + "FROM products "
                + "GROUP BY FORMAT(created_at, 'yyyy-MM') "
                + "ORDER BY month";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                TimeSeriesData data = new TimeSeriesData();
                data.setPeriod(rs.getString("month"));
                data.setCount(rs.getInt("count"));
                timeSeriesData.add(data);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return timeSeriesData;
    }

    /**
     * Get monthly order counts over time
     *
     * @return List of TimeSeriesData objects with month and order count
     * information
     */
    public List<TimeSeriesData> getMonthlyOrderCounts() {
        List<TimeSeriesData> timeSeriesData = new ArrayList<>();

        // SQL query to get order count by month
        String sql = "SELECT FORMAT(created_at, 'yyyy-MM') AS month, COUNT(*) AS count "
                + "FROM orders "
                + "GROUP BY FORMAT(created_at, 'yyyy-MM') "
                + "ORDER BY month";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                TimeSeriesData data = new TimeSeriesData();
                data.setPeriod(rs.getString("month"));
                data.setCount(rs.getInt("count"));
                timeSeriesData.add(data);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return timeSeriesData;
    }
}
