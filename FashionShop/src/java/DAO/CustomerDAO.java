/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import entity.Customer;
import Context.DBContext;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.math.BigDecimal;

/**
 *
 * @author VuxD4t
 */
public class CustomerDAO extends DBContext {

    /**
     * Get all customers from the database
     *
     * @return List of all customers
     */
    public List<Customer> getAllCustomers() {
        List<Customer> customers = new ArrayList<>();
        String sql = "SELECT * FROM customer_contact_history";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                customers.add(mapCustomer(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return customers;
    }

    /**
     * Get customers by applying filters
     *
     * @param sql SQL query string with placeholders
     * @param params List of parameter values to substitute in the SQL
     * @return List of filtered customers
     */
    public List<Customer> getCustomersByFilter(String sql, List<Object> params) {
        List<Customer> customers = new ArrayList<>();

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            // Set parameters
            for (int i = 0; i < params.size(); i++) {
                st.setObject(i + 1, params.get(i));
            }

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                customers.add(mapCustomer(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return customers;
    }

    /**
     * Get total number of records matching filter criteria
     *
     * @param sql SQL query string with placeholders
     * @param params List of parameter values to substitute in the SQL
     * @return Total count of records
     */
    public int getTotalFilteredRecords(String sql, List<Object> params) {
        // Convert SQL to count total records
        String countSql = sql.replaceFirst("SELECT \\*", "SELECT COUNT(*)");
        // Remove ORDER BY clause if present
        int orderByIndex = countSql.toLowerCase().indexOf("order by");
        if (orderByIndex != -1) {
            countSql = countSql.substring(0, orderByIndex);
        }
        // Remove OFFSET clause if present
        int offsetIndex = countSql.toLowerCase().indexOf("offset");
        if (offsetIndex != -1) {
            countSql = countSql.substring(0, offsetIndex);
        }

        try {
            PreparedStatement st = connection.prepareStatement(countSql);
            // Set parameters (skip the last two if they're for pagination)
            for (int i = 0; i < params.size() - 2; i++) {
                st.setObject(i + 1, params.get(i));
            }

            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    /**
     * Retrieve a customer by their ID
     *
     * @param id The customer ID
     * @return Customer object or null if not found
     */
    public Customer getCustomerById(int id) {
        String sql = "SELECT * FROM customer_contact_history WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return mapCustomer(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * Add a new customer to the database
     *
     * @param customer Customer object to add
     * @return true if successful, false otherwise
     */
    public boolean addCustomer(Customer customer) {
        String sql = "INSERT INTO customer_contact_history (user_id, customer_type, email, full_name, gender, "
                + "mobile, total_purchases, total_spend, updated_at) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, GETDATE())";

        try {
            PreparedStatement st = connection.prepareStatement(sql);

            // Handle nullable user_id
            if (customer.getUserId() != null) {
                st.setInt(1, customer.getUserId());
            } else {
                st.setNull(1, java.sql.Types.INTEGER);
            }

            st.setString(2, customer.getCustomerType());
            st.setString(3, customer.getEmail());
            st.setString(4, customer.getFullName());
            st.setString(5, customer.getGender());
            st.setString(6, customer.getMobile());
            st.setInt(7, customer.getTotalPurchases());
            st.setBigDecimal(8, customer.getTotalSpend());

            return st.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Update an existing customer's information
     *
     * @param customer Customer object with updated data
     * @return true if successful, false otherwise
     */
    public boolean updateCustomer(Customer customer) {
        String sql = "UPDATE customer_contact_history SET user_id = ?, customer_type = ?, email = ?, "
                + "full_name = ?, gender = ?, mobile = ?, total_purchases = ?, "
                + "total_spend = ?, updated_at = GETDATE() WHERE id = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);

            // Handle nullable user_id
            if (customer.getUserId() != null) {
                st.setInt(1, customer.getUserId());
            } else {
                st.setNull(1, java.sql.Types.INTEGER);
            }

            st.setString(2, customer.getCustomerType());
            st.setString(3, customer.getEmail());
            st.setString(4, customer.getFullName());
            st.setString(5, customer.getGender());
            st.setString(6, customer.getMobile());
//            st.setString(7, customer.getAddress());
            st.setInt(7, customer.getTotalPurchases());
            st.setBigDecimal(8, customer.getTotalSpend());

            st.setInt(9, customer.getId());

            return st.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Delete a customer from the database
     *
     * @param id ID of the customer to delete
     * @return true if successful, false otherwise
     */
    public boolean deleteCustomer(int id) {
        String sql = "DELETE FROM customer_contact_history WHERE id = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);

            return st.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Check if a customer with the given email exists
     *
     * @param email Email to check
     * @return Customer object if exists, null otherwise
     */
    public Customer checkExistEmail(String email) {
        String sql = "SELECT * FROM customer_contact_history WHERE email = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return mapCustomer(rs);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    /**
     * Check if a customer with the given phone number exists
     *
     * @param mobile Phone number to check
     * @return Customer object if exists, null otherwise
     */
    public Customer checkExistPhone(String mobile) {
        String sql = "SELECT * FROM customer_contact_history WHERE mobile = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, mobile);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return mapCustomer(rs);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    /**
     * Get customers by their type (VIP, Regular, etc.)
     *
     * @param customerType Type of customers to fetch
     * @return List of customers of specified type
     */
    public List<Customer> getCustomersByType(String customerType) {
        List<Customer> customers = new ArrayList<>();
        String sql = "SELECT * FROM customer_contact_history WHERE customer_type = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, customerType);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                customers.add(mapCustomer(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return customers;
    }

    /**
     * Update customer purchase statistics after a new order
     *
     * @param customerId ID of the customer
     * @param orderAmount Amount of the new order
     * @param updatedBy ID of the user who processed the update
     * @return true if successful, false otherwise
     */
    public boolean updateCustomerPurchaseStats(int customerId, BigDecimal orderAmount, int updatedBy) {
        String sql = "UPDATE customer_contact_history SET total_purchases = total_purchases + 1, "
                + "total_spend = total_spend + ?, updated_at = GETDATE() WHERE id = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setBigDecimal(1, orderAmount);

            st.setInt(2, customerId);

            return st.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean updateCustomerType(int customerId, String customerType) {
        String sql = "UPDATE customer_contact_history SET customer_type = ?, updated_at = GETDATE() WHERE id = ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, customerType);
            ps.setInt(2, customerId);

            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    /**
     * Helper method to map ResultSet to Customer object
     *
     * @param rs ResultSet containing customer data
     * @return Mapped Customer object
     * @throws SQLException if database access error occurs
     */
    private Customer mapCustomer(ResultSet rs) throws SQLException {
        Customer customer = new Customer();
        customer.setId(rs.getInt("id"));

        int userId = rs.getInt("user_id");
        if (!rs.wasNull()) {
            customer.setUserId(userId);
        }

        customer.setCustomerType(rs.getString("customer_type"));
        customer.setEmail(rs.getString("email"));
        customer.setFullName(rs.getString("full_name"));
        customer.setGender(rs.getString("gender"));
        customer.setMobile(rs.getString("mobile"));
//        customer.setAddress(rs.getString("address"));
        customer.setTotalPurchases(rs.getInt("total_purchases"));
        customer.setTotalSpend(rs.getBigDecimal("total_spend"));

        Timestamp updatedAt = rs.getTimestamp("updated_at");
        if (updatedAt != null) {
            customer.setUpdatedAt(updatedAt.toLocalDateTime());
        }

        return customer;
    }

    public Customer getCusdByEmailPhone(String email, String mobile) {
        String sql = "SELECT * FROM customer_contact_history WHERE email = ? AND mobile = ?";
        try {
            Customer customer = new Customer();
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            st.setString(2, mobile);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                customer.setId(rs.getInt("id"));
                int userId = rs.getInt("user_id");
                if (!rs.wasNull()) {
                    customer.setUserId(userId);
                }
                customer.setCustomerType(rs.getString("customer_type"));
                customer.setEmail(rs.getString("email"));
                customer.setFullName(rs.getString("full_name"));
                customer.setGender(rs.getString("gender"));
                customer.setMobile(rs.getString("mobile"));
                customer.setTotalPurchases(rs.getInt("total_purchases"));
                customer.setTotalSpend(rs.getBigDecimal("total_spend"));

                Timestamp updatedAt = rs.getTimestamp("updated_at");
                if (updatedAt != null) {
                    customer.setUpdatedAt(updatedAt.toLocalDateTime());
                }
                return customer;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    /**
     * Main method for testing
     */
    public static void main(String[] args) {
        CustomerDAO customerDAO = new CustomerDAO();
        System.out.println(customerDAO.getAllCustomers().size() + " customers found");
    }
}
