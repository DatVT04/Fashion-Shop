package DAO;

import Context.DBContext;
import entity.Color;
import entity.Inventory;
import entity.Size;
import entity.Variant;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

public class InventoryDAO extends DBContext {

    public List<Inventory> searchInventory(String keyword, Integer categoryId, String sortField, String sortOrder, int limit, int offset) {
        Map<Integer, Inventory> inventoryMap = new LinkedHashMap<>();

        StringBuilder query = new StringBuilder("""
        WITH ProductPagination AS (
            SELECT 
                p.id AS product_id, 
                p.title AS product_name, 
                c.name AS category, 
                COALESCE(SUM(pv.stock_quantity), 0) AS total_stock_quantity
            FROM products p
            JOIN categories c ON p.category_id = c.id
            LEFT JOIN product_variants pv ON p.id = pv.product_id
            WHERE 1=1
        """);

        List<Object> params = new ArrayList<>();

        // Tìm kiếm, lọc
        if (keyword != null && !keyword.trim().isEmpty()) {
            query.append(" AND p.title LIKE ?");
            params.add("%" + keyword + "%");
        }
        if (categoryId != null) {
            query.append(" AND p.category_id = ?");
            params.add(categoryId);
        }

        query.append(" GROUP BY p.id, p.title, c.name, p.created_at")
                .append(" ORDER BY ")
                .append(sortField.equals("category") ? "c.name"
                        : sortField.equals("totalQuantity") ? "total_stock_quantity"
                        : sortField.equals("created_at") ? "p.created_at" : "p.title")
                .append(" ").append(sortOrder.equalsIgnoreCase("asc") ? "ASC" : "DESC")
                .append(" OFFSET ? ROWS FETCH NEXT ? ROWS ONLY)");

        query.append("""
        SELECT 
            pp.product_id, 
            pp.product_name, 
            pp.category, 
            pp.total_stock_quantity, 
            pc.id AS color_id, 
            pc.color AS color_name, 
            ps.id AS size_id, 
            ps.size AS size_name
        FROM ProductPagination pp
        LEFT JOIN product_colors pc ON pp.product_id = pc.product_id
        LEFT JOIN product_sizes ps ON pp.product_id = ps.product_id
        """);

        // Add pagination para
        params.add(offset);
        params.add(limit);

        try (PreparedStatement ps = connection.prepareStatement(query.toString())) {
            // Set para
            for (int i = 0; i < params.size(); i++) {
                ps.setObject(i + 1, params.get(i));
            }
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int productId = rs.getInt("product_id");
                String productName = rs.getString("product_name");
                String category = rs.getString("category");
                int totalQuantity = rs.getInt("total_stock_quantity");
                int colorId = rs.getInt("color_id");
                String colorName = rs.getString("color_name");
                int sizeId = rs.getInt("size_id");
                String sizeName = rs.getString("size_name");

                Inventory inventory = inventoryMap.computeIfAbsent(productId,
                        id -> new Inventory(id, productName, category, new HashSet<>(), new HashSet<>(), totalQuantity));

                if (colorName != null) {
                    inventory.getColors().add(new Color(colorId, colorName));
                }
                if (sizeName != null) {
                    inventory.getSizes().add(new Size(sizeId, sizeName));
                }
            }
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
            e.printStackTrace();
        }

        return new ArrayList<>(inventoryMap.values());
    }

    public int getTotalInventoryCount(String keyword, Integer categoryId) {
        int totalRecords = 0;
        String query = "SELECT COUNT(DISTINCT p.id) FROM products p WHERE 1=1 ";

        List<Object> params = new ArrayList<>();

        if (keyword != null && !keyword.trim().isEmpty()) {
            query += "AND p.title LIKE ? ";
            params.add("%" + keyword + "%");
        }
        if (categoryId != null) {
            query += "AND p.category_id = ? ";
            params.add(categoryId);
        }

        try (PreparedStatement ps = connection.prepareStatement(query)) {
            for (int i = 0; i < params.size(); i++) {
                ps.setObject(i + 1, params.get(i));
            }

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                totalRecords = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }

        return totalRecords;
    }

    public Inventory getInventoryDetail(int productId) {
        String sql = """
                SELECT 
                    p.id, 
                    p.title, 
                    c.name as category_name,
                    pc.id as color_id, 
                    pc.color as color_name,
                    ps.id as size_id, 
                    ps.size as size_name,
                    SUM(pv.stock_quantity) as total_quantity
                FROM products p
                JOIN categories c ON p.category_id = c.id
                LEFT JOIN product_variants pv ON p.id = pv.product_id
                LEFT JOIN product_colors pc ON pv.color_id = pc.id
                LEFT JOIN product_sizes ps ON pv.size_id = ps.id
                WHERE p.id = ?
                GROUP BY p.id, p.title, c.name, pc.id, pc.color, ps.id, ps.size
                """;

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, productId);
            ResultSet rs = st.executeQuery();

            Set<Color> colors = new TreeSet<>((c1, c2) -> c1.getName().compareToIgnoreCase(c2.getName()));
            Set<Size> sizes = new TreeSet<>((s1, s2) -> s1.getName().compareToIgnoreCase(s2.getName()));
            String productName = null;
            String category = null;
            int totalQuantity = 0;

            while (rs.next()) {
                if (productName == null) {
                    productName = rs.getString("title");
                    category = rs.getString("category_name");
                }

                if (rs.getInt("color_id") != 0) {
                    colors.add(new Color(rs.getInt("color_id"), rs.getString("color_name")));
                }
                if (rs.getInt("size_id") != 0) {
                    sizes.add(new Size(rs.getInt("size_id"), rs.getString("size_name")));
                }

                totalQuantity += rs.getInt("total_quantity");
            }

            return new Inventory(productId, productName, category, colors, sizes, totalQuantity);
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return null;
    }

    public List<Variant> getProductVariants(int productId) {
        String sql = """
                    SELECT 
                        pv.id, 
                        pv.product_id, 
                        pc.id as color_id, 
                        pc.color as color_name,
                        ps.id as size_id, 
                        ps.size as size_name,
                        pv.stock_quantity, 
                        pv.last_restock_date
                    FROM product_variants pv
                    JOIN product_colors pc ON pv.color_id = pc.id
                    JOIN product_sizes ps ON pv.size_id = ps.id
                    WHERE pv.product_id = ?
                    ORDER BY pc.color, ps.size
                    """;

        List<Variant> variants = new ArrayList<>();

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, productId);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Color color = new Color(rs.getInt("color_id"), rs.getString("color_name"));
                Size size = new Size(rs.getInt("size_id"), rs.getString("size_name"));

                variants.add(new Variant(
                        rs.getInt("id"),
                        productId,
                        color,
                        size,
                        rs.getInt("stock_quantity"),
                        rs.getTimestamp("last_restock_date")
                ));
            }
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }

        return variants;
    }

    public Color getColorByName(int productId, String colorName) {
        colorName = colorName.trim();
        String sql = "SELECT id, color FROM product_colors WHERE product_id = ? AND UPPER(TRIM(color)) = UPPER(?)";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, productId);
            st.setString(2, colorName);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new Color(rs.getInt("id"), rs.getString("color"));
            }
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return null;
    }

    public Size getSizeByName(int productId, String sizeName) {
        sizeName = sizeName.trim();
        String sql = "SELECT id, size FROM product_sizes WHERE product_id = ? AND UPPER(TRIM(size)) = UPPER(?)";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, productId);
            st.setString(2, sizeName);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new Size(rs.getInt("id"), rs.getString("size"));
            }
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return null;
    }

    public Variant getVariant(int variantId) {
        String sql = """
                    SELECT 
                        pv.id, 
                        pv.product_id,
                        pc.id as color_id, pc.color as color_name,
                        ps.id as size_id, ps.size as size_name,
                        pv.stock_quantity, pv.last_restock_date
                    FROM product_variants pv
                    JOIN product_colors pc ON pv.color_id = pc.id
                    JOIN product_sizes ps ON pv.size_id = ps.id
                    WHERE pv.id = ?
                    """;

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, variantId);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                Color color = new Color(rs.getInt("color_id"), rs.getString("color_name"));
                Size size = new Size(rs.getInt("size_id"), rs.getString("size_name"));

                return new Variant(
                        rs.getInt("id"),
                        rs.getInt("product_id"),
                        color,
                        size,
                        rs.getInt("stock_quantity"),
                        rs.getTimestamp("last_restock_date")
                );
            }
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return null;
    }

    public boolean isVariantExists(int productId, int colorId, int sizeId) {
        String sql = "SELECT COUNT(*) FROM product_variants WHERE product_id = ? AND color_id = ? AND size_id = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, productId);
            st.setInt(2, colorId);
            st.setInt(3, sizeId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return false;
    }

    public boolean isVariantExists(int productId, int colorId, int sizeId, int excludeVariantId) {
        String sql = "SELECT COUNT(*) FROM product_variants WHERE product_id = ? AND color_id = ? AND size_id = ? AND id <> ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, productId);
            st.setInt(2, colorId);
            st.setInt(3, sizeId);
            st.setInt(4, excludeVariantId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return false;
    }

    public List<Color> getColorsByProductId(int productId) {
        List<Color> colors = new ArrayList<>();
        String sql = "SELECT id, color FROM product_colors WHERE product_id = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, productId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                colors.add(new Color(rs.getInt("id"), rs.getString("color")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return colors;
    }

    public List<Size> getSizesByProductId(int productId) {
        List<Size> sizes = new ArrayList<>();
        String sql = "SELECT id, size FROM product_sizes WHERE product_id = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, productId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                sizes.add(new Size(rs.getInt("id"), rs.getString("size")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return sizes;
    }

    public int addColor(int productId, String colorName) {
        String sql = "INSERT INTO product_colors (product_id, color) OUTPUT INSERTED.id VALUES (?, ?)";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, productId);
            st.setString(2, colorName);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return -1;
    }

    public int addSize(int productId, String sizeName) {
        String sql = "INSERT INTO product_sizes (product_id, size) OUTPUT INSERTED.id VALUES (?, ?)";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, productId);
            st.setString(2, sizeName);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return -1;
    }

    public void addNewVariant(int productId, int colorId, int sizeId, int quantity) {
        String sql = "INSERT INTO product_variants (product_id, color_id, size_id, stock_quantity, last_restock_date) VALUES (?, ?, ?, ?, GETDATE())";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, productId);
            st.setInt(2, colorId);
            st.setInt(3, sizeId);
            st.setInt(4, quantity);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
    }

    public void updateSize(int sizeId, String newSize) {
        String sql = "UPDATE product_sizes SET size = ? WHERE id = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, newSize);
            st.setInt(2, sizeId);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
    }

    public void updateColor(int colorId, String newColor) {
        String sql = "UPDATE product_colors SET color = ? WHERE id = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, newColor);
            st.setInt(2, colorId);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
    }

    public void updateVariant(int variantId, int colorId, int sizeId, int quantity) {
        String sql = "UPDATE product_variants SET color_id = ?, size_id = ?, stock_quantity = ?, last_restock_date = GETDATE() WHERE id = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, colorId);
            st.setInt(2, sizeId);
            st.setInt(3, quantity);
            st.setInt(4, variantId);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
    }

    public void updateVariantQuantity(int variantId, int quantity) {
        String sql = "UPDATE product_variants SET stock_quantity = ?, last_restock_date = GETDATE() WHERE id = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, quantity);
            st.setInt(2, variantId);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
    }

    public boolean deleteVariant(int variantId) {
        // lấy color_id and size_id
        String getIdsSQL = "SELECT color_id, size_id FROM product_variants WHERE id = ?";
        int colorId = 0;
        int sizeId = 0;
        try (PreparedStatement st = connection.prepareStatement(getIdsSQL)) {
            st.setInt(1, variantId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                colorId = rs.getInt("color_id");
                sizeId = rs.getInt("size_id");
            }
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
            return false;
        }
        // Bắt đầu transaction
        try {
            connection.setAutoCommit(false);
            // Xóa từ bảng product_variants
            try (PreparedStatement st = connection.prepareStatement("DELETE FROM product_variants WHERE id = ?")) {
                st.setInt(1, variantId);
                st.executeUpdate();
            }
            // Kiểm tra và xóa color nếu không còn sử dụng
            boolean colorInUse = false;
            try (PreparedStatement st = connection.prepareStatement("SELECT COUNT(*) FROM product_variants WHERE color_id = ?")) {
                st.setInt(1, colorId);
                ResultSet rs = st.executeQuery();
                if (rs.next()) {
                    colorInUse = rs.getInt(1) > 0;
                }
            }
            if (!colorInUse) {
                try (PreparedStatement st = connection.prepareStatement("DELETE FROM product_colors WHERE id = ?")) {
                    st.setInt(1, colorId);
                    st.executeUpdate();
                }
            }
            // Kiểm tra và xóa size nếu không còn sử dụng
            boolean sizeInUse = false;
            try (PreparedStatement st = connection.prepareStatement("SELECT COUNT(*) FROM product_variants WHERE size_id = ?")) {
                st.setInt(1, sizeId);
                ResultSet rs = st.executeQuery();
                if (rs.next()) {
                    sizeInUse = rs.getInt(1) > 0;
                }
            }
            if (!sizeInUse) {
                try (PreparedStatement st = connection.prepareStatement("DELETE FROM product_sizes WHERE id = ?")) {
                    st.setInt(1, sizeId);
                    st.executeUpdate();
                }
            }
            // Commit transaction
            connection.commit();
            return true;
        } catch (SQLException e) {
            try {
                connection.rollback(); // Rollback nếu có lỗi
            } catch (SQLException rollbackEx) {
                System.out.println("Error: " + e.getMessage());
            }
            System.out.println("Error: " + e.getMessage());
            return false;
        } finally {
            try {
                connection.setAutoCommit(true);
            } catch (SQLException ex) {
                System.out.println("Error: " + ex.getMessage());
            }
        }
    }

    public void cleanupOrphanColor(int colorId) {
        String sql = "SELECT COUNT(*) FROM product_variants WHERE color_id = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, colorId);
            ResultSet rs = st.executeQuery();
            if (rs.next() && rs.getInt(1) == 0) {
                try (PreparedStatement del = connection.prepareStatement("DELETE FROM product_colors WHERE id = ?")) {
                    del.setInt(1, colorId);
                    del.executeUpdate();
                }
            }
        } catch (SQLException e) {
            System.out.println("Error cleaning up color: " + e.getMessage());
        }
    }

    public void cleanupOrphanSize(int sizeId) {
        String sql = "SELECT COUNT(*) FROM product_variants WHERE size_id = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, sizeId);
            ResultSet rs = st.executeQuery();
            if (rs.next() && rs.getInt(1) == 0) {
                try (PreparedStatement del = connection.prepareStatement("DELETE FROM product_sizes WHERE id = ?")) {
                    del.setInt(1, sizeId);
                    del.executeUpdate();
                }
            }
        } catch (SQLException e) {
            System.out.println("Error cleaning up size: " + e.getMessage());
        }
    }

    public int countVariantsUsingColor(int colorId) {
        String sql = "SELECT COUNT(*) FROM product_variants WHERE color_id = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, colorId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return 0;
    }

    public int countVariantsUsingSize(int sizeId) {
        String sql = "SELECT COUNT(*) FROM product_variants WHERE size_id = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, sizeId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return 0;
    }

    public int getVariantId(int productId, int colorId, int sizeId) {
        String sql = "SELECT id FROM product_variants WHERE product_id = ? AND color_id = ? AND size_id = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, productId);
            st.setInt(2, colorId);
            st.setInt(3, sizeId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt("id");
            }
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return -1; // Trả về -1 nếu không tìm thấy variant
    }
//______________________THANH______________________
    // Thêm phương thức decreaseVariantStock vào InventoryDAO

    public boolean decreaseVariantStock(int variantId, int quantity) {
        try {
            // First, check current stock to ensure we don't go below 0
            String checkSql = "SELECT stock_quantity FROM product_variants WHERE id = ?";
            PreparedStatement checkStmt = connection.prepareStatement(checkSql);
            checkStmt.setInt(1, variantId);
            ResultSet rs = checkStmt.executeQuery();

            if (rs.next()) {
                int currentStock = rs.getInt("stock_quantity");
                int newStock = Math.max(0, currentStock - quantity); // Ensure we don't go below 0

                // Update the stock
                String updateSql = "UPDATE product_variants SET stock_quantity = ? WHERE id = ?";
                PreparedStatement updateStmt = connection.prepareStatement(updateSql);
                updateStmt.setInt(1, newStock);
                updateStmt.setInt(2, variantId);
                int result = updateStmt.executeUpdate();

                updateStmt.close();
                rs.close();
                checkStmt.close();

                return result > 0;
            }

            rs.close();
            checkStmt.close();
            return false;
        } catch (SQLException e) {
            System.out.println("Error decreasing variant stock: " + e.getMessage());
            return false;
        }
    }

// Thêm phương thức kiểm tra và cập nhật trạng thái sản phẩm
    private void updateProductStatus(int productId) {
        String checkStockSql = "SELECT SUM(stock_quantity) as total FROM product_variants WHERE product_id = ?";
        try (PreparedStatement st = connection.prepareStatement(checkStockSql)) {
            st.setInt(1, productId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                int totalStock = rs.getInt("total");
                String newStatus = totalStock > 0 ? "active" : "EOStock";

                // Cập nhật trạng thái sản phẩm
                String updateStatusSql = "UPDATE products SET status = ? WHERE id = ?";
                try (PreparedStatement updateSt = connection.prepareStatement(updateStatusSql)) {
                    updateSt.setString(1, newStatus);
                    updateSt.setInt(2, productId);
                    updateSt.executeUpdate();
                }
            }
        } catch (SQLException e) {
            System.out.println("Error updating product status: " + e.getMessage());
        }
    }

    public boolean increaseVariantStock(int variantId, int quantity) {
        if (quantity <= 0) {
            return false;
        }

        try {
            // Cập nhật số lượng trong bảng product_variants
            String sql = "UPDATE product_variants SET stock_quantity = stock_quantity + ?, last_restock_date = GETDATE() WHERE id = ?";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, quantity);
            stmt.setInt(2, variantId);
            int rowsAffected = stmt.executeUpdate();

            if (rowsAffected > 0) {
                // Lấy product_id từ variant_id
                String sqlGetProduct = "SELECT product_id FROM product_variants WHERE id = ?";
                PreparedStatement stmtGetProduct = connection.prepareStatement(sqlGetProduct);
                stmtGetProduct.setInt(1, variantId);
                ResultSet rs = stmtGetProduct.executeQuery();

                if (rs.next()) {
                    int productId = rs.getInt("product_id");

                    // Cập nhật trạng thái sản phẩm nếu cần
                    updateProductStatus(productId);
                }

                rs.close();
                stmtGetProduct.close();
                return true;
            }

            stmt.close();
            return false;
        } catch (SQLException e) {
            System.out.println("Error increasing variant stock: " + e.getMessage());
            return false;
        }
    }

    public Integer getVariantId(int productId, String size, String color) {
        String query = "SELECT pv.id FROM product_variants pv "
                + "JOIN product_sizes ps ON pv.size_id = ps.id "
                + "JOIN product_colors pc ON pv.color_id = pc.id "
                + "WHERE pv.product_id = ? AND ps.size = ? AND pc.color = ?";

        try (PreparedStatement stmt = connection.prepareStatement(query)) {

            stmt.setInt(1, productId);
            stmt.setString(2, size);
            stmt.setString(3, color);

            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getInt("id");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
