package DAO;

import Context.DBContext;
import entity.Slider;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class SliderDAO extends DBContext {

    public List<Slider> getAllSliders(int page, int pageSize, String search, String status) {
        List<Slider> sliders = new ArrayList<>();

        StringBuilder sql = new StringBuilder("SELECT * FROM sliders");
        List<Object> params = new ArrayList<>();

        // WHERE conditions
        boolean hasCondition = false;
        if (search != null && !search.isEmpty()) {
            sql.append(hasCondition ? " AND" : " WHERE").append(" title LIKE ?");
            params.add("%" + search + "%");
            hasCondition = true;
        }

        if (status != null && !status.isEmpty()) {
            sql.append(hasCondition ? " AND" : " WHERE").append(" status = ?");
            params.add(status);
            hasCondition = true;
        }

        // Order by display_order for proper sequencing
        sql.append(" ORDER BY display_order ASC");

        // Pagination
        sql.append(" OFFSET ? ROWS FETCH NEXT ? ROWS ONLY");
        params.add((page - 1) * pageSize); // OFFSET
        params.add(Math.max(pageSize, 1)); // FETCH NEXT (must be > 0)

        try (PreparedStatement st = connection.prepareStatement(sql.toString())) {
            for (int i = 0; i < params.size(); i++) {
                if (params.get(i) instanceof Integer) {
                    st.setInt(i + 1, (Integer) params.get(i));
                } else {
                    st.setString(i + 1, (String) params.get(i));
                }
            }

            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    Slider slider = new Slider();
                    slider.setId(rs.getInt("id"));
                    slider.setTitle(rs.getString("title"));
                    slider.setImage_url(rs.getString("image_url"));
                    slider.setLink(rs.getString("link"));
                    slider.setDisplay_order(rs.getInt("display_order"));
                    slider.setStatus(rs.getString("status"));
                    slider.setNotes(rs.getString("notes"));
                    sliders.add(slider);
                }
            }
        } catch (SQLException e) {
            System.err.println("Error getting sliders: " + e.getMessage());
            e.printStackTrace();
        }
        return sliders;
    }

    // đa hình để lọc bài đăng hoặc sản phẩm ẩn 
    /* trích xuất link xem là post hay product rồi lấy id để kiểm tra status của nó
                    nếu status của product hay post khác active (riêng product thì nếu status không phải là inactive thì cho in tẹt bô) thì không cho in ra slider
                     (không cho in bằng cách nào - bằng cách dell chạy câu lệnh bên dưới, hay chính là dell cho vào list)*/
    public List<Slider> getAllSliders(String status) {
        List<Slider> sliders = new ArrayList<>();
        StringBuilder sql = new StringBuilder("SELECT * FROM sliders");
        List<Object> params = new ArrayList<>();
        // WHERE conditions
        boolean hasCondition = false;
        if (status != null && !status.isEmpty()) {
            sql.append(hasCondition ? " AND" : " WHERE").append(" status = ?");
            params.add(status);
            hasCondition = true;
        }
        // Order by display_order for proper sequencing
        sql.append(" ORDER BY display_order ASC");
        try (PreparedStatement st = connection.prepareStatement(sql.toString())) {
            for (int i = 0; i < params.size(); i++) {
                if (params.get(i) instanceof Integer) {
                    st.setInt(i + 1, (Integer) params.get(i));
                } else {
                    st.setString(i + 1, (String) params.get(i));
                }
            }
            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    Slider slider = new Slider();
                    slider.setId(rs.getInt("id"));
                    slider.setTitle(rs.getString("title"));
                    slider.setImage_url(rs.getString("image_url"));
                    slider.setLink(rs.getString("link"));
                    slider.setDisplay_order(rs.getInt("display_order"));
                    slider.setStatus(rs.getString("status"));
                    slider.setNotes(rs.getString("notes"));

                    // Extract link to check if it's a post or product, then verify its status
                    String link = slider.getLink();
                    boolean shouldAddSlider = true;

                    if (link != null && !link.isEmpty()) {
                        // Check if it's a post
                        if (link.contains("/post/") || link.contains("post_id=")) {
                            // Extract post ID from the link
                            int postId = extractIdFromLink(link, "post");
                            if (postId > 0) {
                                // Check post status
                                String postStatus = getPostStatus(postId);
                                if (postStatus == null || !postStatus.equals("active")) {
                                    shouldAddSlider = false;
                                }
                            }
                        } // Check if it's a product
                        else if (link.contains("/product/") || link.contains("product_id=")) {
                            // Extract product ID from the link
                            int productId = extractIdFromLink(link, "product");
                            if (productId > 0) {
                                // Check product status
                                String productStatus = getProductStatus(productId);
                                // For products, only exclude if status is "inactive"
                                if (productStatus != null && productStatus.equals("inactive")) {
                                    shouldAddSlider = false;
                                }
                            }
                        }
                    }

                    // Add slider to list only if it passes all checks
                    if (shouldAddSlider) {
                        sliders.add(slider);
                    }
                }
            }
        } catch (SQLException e) {
            System.err.println("Error getting sliders: " + e.getMessage());
            e.printStackTrace();
        }
        return sliders;
    }

// Helper method to extract ID from link
    private int extractIdFromLink(String link, String type) {
        try {
            // Handle URL format like /post/123 or /product/456
            if (link.contains("/" + type + "/")) {
                String[] parts = link.split("/" + type + "/");
                if (parts.length > 1) {
                    // Extract the ID part and remove any additional path or query parameters
                    String idPart = parts[1].split("/")[0].split("\\?")[0];
                    return Integer.parseInt(idPart);
                }
            } // Handle URL format like ?post_id=123 or ?product_id=456
            else if (link.contains(type + "_id=")) {
                // Find the parameter in the query string
                int startIndex = link.indexOf(type + "_id=") + (type + "_id=").length();
                int endIndex = link.indexOf("&", startIndex);
                if (endIndex == -1) {
                    endIndex = link.length();
                }
                return Integer.parseInt(link.substring(startIndex, endIndex));
            }
        } catch (NumberFormatException e) {
            System.err.println("Error extracting ID from link: " + e.getMessage());
        }
        return -1;
    }

// Method to get post status from database
    private String getPostStatus(int postId) {
        String status = null;
        try (PreparedStatement st = connection.prepareStatement("SELECT status FROM posts WHERE id = ?")) {
            st.setInt(1, postId);
            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    status = rs.getString("status");
                }
            }
        } catch (SQLException e) {
            System.err.println("Error checking post status: " + e.getMessage());
        }
        return status;
    }

// Method to get product status from database
    private String getProductStatus(int productId) {
        String status = null;
        try (PreparedStatement st = connection.prepareStatement("SELECT status FROM products WHERE id = ?")) {
            st.setInt(1, productId);
            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    status = rs.getString("status");
                }
            }
        } catch (SQLException e) {
            System.err.println("Error checking product status: " + e.getMessage());
        }
        return status;
    }
//________________________________________________________________________________________________

    public int getTotalSlidersCount(String search, String status) {
        StringBuilder sql = new StringBuilder("SELECT COUNT(*) FROM sliders WHERE 1=1");
        List<Object> params = new ArrayList<>();

        if (search != null && !search.isEmpty()) {
            sql.append(" AND title LIKE ?");
            params.add("%" + search + "%");
        }

        if (status != null && !status.isEmpty()) {
            sql.append(" AND status = ?");
            params.add(status);
        }

        try (PreparedStatement st = connection.prepareStatement(sql.toString())) {
            for (int i = 0; i < params.size(); i++) {
                st.setString(i + 1, (String) params.get(i));
            }

            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1);
                }
            }
        } catch (SQLException e) {
            System.err.println("Error counting sliders: " + e.getMessage());
            e.printStackTrace();
        }
        return 0;
    }

    public Slider getSliderById(int sliderId) {
        String sql = "SELECT * FROM sliders WHERE id = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, sliderId);
            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    Slider slider = new Slider();
                    slider.setId(rs.getInt("id"));
                    slider.setTitle(rs.getString("title"));
                    slider.setImage_url(rs.getString("image_url"));
                    slider.setLink(rs.getString("link"));
                    slider.setDisplay_order(rs.getInt("display_order"));
                    slider.setStatus(rs.getString("status"));
                    slider.setNotes(rs.getString("notes"));
                    return slider;
                }
            }
        } catch (SQLException e) {
            System.err.println("Error getting slider by ID: " + e.getMessage());
            e.printStackTrace();
        }
        return null;
    }

    public boolean addSlider(Slider slider) {
        String sql = "INSERT INTO sliders (title, image_url, link, display_order, status, notes) "
                + "VALUES (?, ?, ?, ?, ?, ?)";

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, slider.getTitle());
            st.setString(2, slider.getImage_url());
            st.setString(3, slider.getLink());
            st.setInt(4, slider.getDisplay_order());
            st.setString(5, slider.getStatus());
            st.setString(6, slider.getNotes());

            return st.executeUpdate() > 0;
        } catch (SQLException e) {
            System.err.println("Error adding slider: " + e.getMessage());
            e.printStackTrace();
        }
        return false;
    }

    public boolean updateSlider(Slider slider) {
        String sql = "UPDATE sliders SET title = ?, image_url = ?, link = ?, display_order = ?, "
                + "status = ?, notes = ? WHERE id = ?";

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, slider.getTitle());
            st.setString(2, slider.getImage_url());
            st.setString(3, slider.getLink());
            st.setInt(4, slider.getDisplay_order());
            st.setString(5, slider.getStatus());
            st.setString(6, slider.getNotes());
            st.setInt(7, slider.getId());

            return st.executeUpdate() > 0;
        } catch (SQLException e) {
            System.err.println("Error updating slider: " + e.getMessage());
            e.printStackTrace();
        }
        return false;
    }

    public boolean deleteSlider(int sliderId) {
        String sql = "DELETE FROM sliders WHERE id = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, sliderId);
            return st.executeUpdate() > 0;
        } catch (SQLException e) {
            System.err.println("Error deleting slider: " + e.getMessage());
            e.printStackTrace();
        }
        return false;
    }

    public boolean isDisplayOrderExists(int displayOrder, int excludeId) {
        String sql = "SELECT COUNT(*) FROM sliders WHERE display_order = ? AND id != ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, displayOrder);
            st.setInt(2, excludeId);
            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0;
                }
            }
        } catch (SQLException e) {
            System.err.println("Error checking display order: " + e.getMessage());
            e.printStackTrace();
        }
        return false;
    }

    public List<Integer> getAllDisplayOrdersExcept(int sliderId) {
        List<Integer> orders = new ArrayList<>();
        String sql = "SELECT display_order FROM sliders WHERE id != ? ORDER BY display_order ASC";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, sliderId);
            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    orders.add(rs.getInt("display_order"));
                }
            }
        } catch (SQLException e) {
            System.err.println("Error getting display orders: " + e.getMessage());
            e.printStackTrace();
        }
        return orders;
    }

    public static void main(String[] args) {
        SliderDAO sliderDAO = new SliderDAO();
    }
}
