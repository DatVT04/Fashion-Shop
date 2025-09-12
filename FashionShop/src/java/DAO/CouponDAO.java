/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

/**
 *
 * @author nguye
 */
import Context.DBContext;
import entity.Coupon;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CouponDAO extends DBContext {

    public List<Coupon> getCoupons(String searchCode, String filterType, String filterCouponType, String filterStatus, String sortField, String sortOrder, int page, int recordsPerPage) {
        updateCouponStatus();

        List<Coupon> list = new ArrayList<>();
        String sql = "SELECT * FROM coupons WHERE 1=1";

        if (searchCode != null && !searchCode.isEmpty()) {
            sql += " AND code LIKE ?";
        }
        if (filterType != null && !filterType.isEmpty()) {
            sql += " AND discount_type = ?";
        }
        if (filterCouponType != null && !filterCouponType.isEmpty()) {
            sql += " AND coupon_type = ?";
        }
        if (filterStatus != null && !filterStatus.isEmpty()) {
            sql += " AND status = ?";
        }

        if (sortField != null && !sortField.isEmpty()) {
            sql += " ORDER BY " + sortField + (sortOrder.equals("desc") ? " DESC" : " ASC");
        } else {
            sql += " ORDER BY created_at DESC";
        }

        sql += " OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            int parameterIndex = 1;
            if (searchCode != null && !searchCode.isEmpty()) {
                ps.setString(parameterIndex++, "%" + searchCode + "%");
            }
            if (filterType != null && !filterType.isEmpty()) {
                ps.setString(parameterIndex++, filterType);
            }
            if (filterCouponType != null && !filterCouponType.isEmpty()) {
                ps.setString(parameterIndex++, filterCouponType);
            }
            if (filterStatus != null && !filterStatus.isEmpty()) {
                ps.setString(parameterIndex++, filterStatus);
            }
            ps.setInt(parameterIndex++, (page - 1) * recordsPerPage);
            ps.setInt(parameterIndex++, recordsPerPage);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Coupon coupon = extractCouponFromResultSet(rs);
                list.add(coupon);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    
    private Coupon extractCouponFromResultSet(ResultSet rs) throws SQLException {
        Coupon coupon = new Coupon();
        coupon.setId(rs.getInt("id"));
        coupon.setCode(rs.getString("code"));
        coupon.setDiscount_type(rs.getString("discount_type"));
        coupon.setDiscount_value(rs.getDouble("discount_value"));
        coupon.setMin_order_amount(rs.getDouble("min_order_amount"));
        coupon.setMax_discount(rs.getDouble("max_discount"));
        coupon.setUsage_limit(rs.getInt("usage_limit"));
        coupon.setUsed_count(rs.getInt("used_count"));
        coupon.setExpiry_date(rs.getTimestamp("expiry_date"));  // Sử dụng getTimestamp
        coupon.setActivation_date(rs.getTimestamp("activation_date"));  // Sử dụng getTimestamp
        coupon.setCreated_at(rs.getTimestamp("created_at"));  // Sử dụng getTimestamp
        coupon.setCouponType(rs.getString("coupon_type"));
        coupon.setStatus(rs.getString("status"));
        return coupon;
    }

    public int getTotalCoupons(String searchCode, String filterType, String filterStatus) {
        String sql = "SELECT COUNT(*) FROM coupons WHERE 1=1";

        // tìm kiếm vs lọc
        if (searchCode != null && !searchCode.isEmpty()) {
            sql += " AND code LIKE ?";
        }
        if (filterType != null && !filterType.isEmpty()) {
            sql += " AND discount_type = ?";
        }
        if (filterStatus != null && !filterStatus.isEmpty()) {
            sql += " AND status = ?";
        }

        try {
            PreparedStatement ps = connection.prepareStatement(sql);

            int parameterIndex = 1;
            if (searchCode != null && !searchCode.isEmpty()) {
                ps.setString(parameterIndex++, "%" + searchCode + "%");
            }
            if (filterType != null && !filterType.isEmpty()) {
                ps.setString(parameterIndex++, filterType);
            }
            if (filterStatus != null && !filterStatus.isEmpty()) {
                ps.setString(parameterIndex++, filterStatus);
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

    public void updateCouponStatus() {
        String sql = "UPDATE coupons SET status = CASE " +
                     "WHEN expiry_date <= GETDATE() THEN 'expired' " +
                     "WHEN activation_date IS NOT NULL AND activation_date <= GETDATE() AND status = 'inactive' THEN 'active' " +
                     "ELSE status END " +
                     "WHERE status != 'expired'";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public boolean addCoupon(Coupon coupon) {
        String sql = "INSERT INTO coupons (code, discount_type, discount_value, min_order_amount, max_discount, usage_limit, used_count, expiry_date, activation_date, created_at, coupon_type, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, coupon.getCode());
            ps.setString(2, coupon.getDiscount_type());
            ps.setDouble(3, coupon.getDiscount_value());
            ps.setDouble(4, coupon.getMin_order_amount());
            ps.setDouble(5, coupon.getMax_discount());
            ps.setObject(6, coupon.getUsage_limit() == 0 ? null : coupon.getUsage_limit(), java.sql.Types.INTEGER);
            ps.setInt(7, coupon.getUsed_count());
            ps.setTimestamp(8, coupon.getExpiry_date());  // Sử dụng setTimestamp
            ps.setTimestamp(9, coupon.getActivation_date());  // Sử dụng setTimestamp
            ps.setTimestamp(10, coupon.getCreated_at());  // Sử dụng setTimestamp
            ps.setString(11, coupon.getCouponType());
            ps.setString(12, coupon.getStatus());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean isCouponCodeExists(String code) {
        String sql = "SELECT COUNT(*) FROM coupons WHERE code = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, code);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean deleteCoupon(int id) {
        try {
            String sql = "DELETE FROM Coupons WHERE id = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setInt(1, id);
                int rowsAffected = statement.executeUpdate();
                return rowsAffected > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean updateCoupon(Coupon coupon) {
        String sql = "UPDATE coupons SET code = ?, discount_type = ?, discount_value = ?, min_order_amount = ?, max_discount = ?, usage_limit = ?, expiry_date = ?, activation_date = ?, coupon_type = ?, status = ? WHERE id = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, coupon.getCode());
            ps.setString(2, coupon.getDiscount_type());
            ps.setDouble(3, coupon.getDiscount_value());
            ps.setDouble(4, coupon.getMin_order_amount());
            ps.setDouble(5, coupon.getMax_discount());
            ps.setObject(6, coupon.getUsage_limit() == 0 ? null : coupon.getUsage_limit(), java.sql.Types.INTEGER);
            ps.setTimestamp(7, coupon.getExpiry_date());  // Sử dụng setTimestamp
            ps.setTimestamp(8, coupon.getActivation_date());  // Sử dụng setTimestamp
            ps.setString(9, coupon.getCouponType());
            ps.setString(10, coupon.getStatus());
            ps.setInt(11, coupon.getId());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public Coupon getCouponById(int id) {
        String sql = "SELECT * FROM coupons WHERE id = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return extractCouponFromResultSet(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public Coupon getCouponByCode(String code) {
        String sql = "SELECT * FROM coupons WHERE code = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, code);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return extractCouponFromResultSet(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Coupon> getAvailableCoupons(boolean isVip) {
    updateCouponStatus();

    List<Coupon> coupons = new ArrayList<>();
    String sql = "SELECT * FROM coupons " +
                 "WHERE status = 'active' " +
                 "AND (expiry_date IS NULL OR expiry_date > GETDATE()) " +
                 "AND (usage_limit IS NULL OR used_count < usage_limit) " +
                 (isVip ? "" : "AND coupon_type = 'normal' ") + // Nếu không phải VIP, chỉ lấy mã normal
                 "ORDER BY min_order_amount ASC";

    try (PreparedStatement ps = connection.prepareStatement(sql)) {
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            Coupon coupon = new Coupon();
            coupon.setId(rs.getInt("id"));
            coupon.setCode(rs.getString("code"));
            coupon.setDiscount_type(rs.getString("discount_type"));
            coupon.setDiscount_value(rs.getDouble("discount_value"));
            coupon.setMin_order_amount(rs.getDouble("min_order_amount"));
            coupon.setMax_discount(rs.getDouble("max_discount"));
            coupon.setUsage_limit(rs.getInt("usage_limit"));
            coupon.setUsed_count(rs.getInt("used_count"));
            coupon.setExpiry_date(rs.getTimestamp("expiry_date"));
            coupon.setCouponType(rs.getString("coupon_type"));
            coupon.setStatus(rs.getString("status"));
            coupons.add(coupon);
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return coupons;
}

    public static void main(String[] args) {
        CouponDAO dao = new CouponDAO();
        List<Coupon> list = dao.getCoupons(" ", "", "", "", "", "", 1, 10);
        for (Coupon o : list) {
            System.out.println(o);
        }
    }
}
