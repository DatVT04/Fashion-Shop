package DAO;

import Context.DBContext;
import entity.Cart;
import entity.CartItem;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import java.lang.reflect.Type;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

public class CartDAO extends DBContext {

    private static final String CART_COOKIE_NAME = "user_cart";
    private static final int COOKIE_MAX_AGE = 30 * 24 * 60 * 60; // 30 days in seconds
    public static final Gson gson = new Gson();

    // Method to get cart from cookies
    public void saveCartToCookies(HttpServletResponse response, Cart cart) {
        try {
            String jsonCart = gson.toJson(cart);
            String encodedValue = Base64.getEncoder().encodeToString(jsonCart.getBytes(StandardCharsets.UTF_8));
            String urlEncodedValue = URLEncoder.encode(encodedValue, StandardCharsets.UTF_8.toString());

            Cookie cookie = new Cookie(CART_COOKIE_NAME, urlEncodedValue);
            cookie.setMaxAge(COOKIE_MAX_AGE);
            cookie.setPath("/");
            response.addCookie(cookie);
        } catch (Exception e) {
            System.out.println("Error saving cart to cookie: " + e.getMessage());
        }
    }

// Khi đọc từ cookie
    public Cart getCartFromCookies(HttpServletRequest request) {
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (CART_COOKIE_NAME.equals(cookie.getName())) {
                    try {
                        String decodedValue = URLDecoder.decode(cookie.getValue(), StandardCharsets.UTF_8.toString());
                        String jsonCart = new String(Base64.getDecoder().decode(decodedValue), StandardCharsets.UTF_8);
                        Type cartType = new TypeToken<Cart>() {
                        }.getType();
                        Cart cart = gson.fromJson(jsonCart, cartType);
                        if (cart != null && cart.getItems() == null) {
                            cart.setItems(new ArrayList<>());
                        }
                        return cart;
                    } catch (Exception e) {
                        System.out.println("Error parsing cart cookie: " + e.getMessage());
                    }
                }
            }
        }
        // Quay lại cart nếu k có cookie
        Cart cart = new Cart();
        cart.setItems(new ArrayList<>());
        return cart;
    }

    // add vào cookie
    public void addItemToCookieCart(HttpServletRequest request, HttpServletResponse response, CartItem item) {
        Cart cart = getCartFromCookies(request);

        // Kiểm tra sản phẩm đã tồn tại chưa
        boolean itemExists = false;
        for (CartItem existingItem : cart.getItems()) {
            if (existingItem.getProductId() == item.getProductId()
                    && existingItem.getVariantId() == item.getVariantId()) {
                // Tăng số lượng thay vì thêm mới
                existingItem.setQuantity(existingItem.getQuantity() + item.getQuantity());
                itemExists = true;
                break;
            }
        }

        // Nếu sản phẩm chưa tồn tại, thêm mới với ID duy nhất
        if (!itemExists) {
            // Tạo ID duy nhất cho cart item dựa trên thời gian
            if (item.getId() == 0) {
                item.setId((int) (System.currentTimeMillis() % Integer.MAX_VALUE));
            }
            cart.getItems().add(item);
        }

        saveCartToCookies(response, cart);
    }

    // cập nhật cart cookie
    public void updateCartItemQuantityInCookie(HttpServletRequest request, HttpServletResponse response,
            int cartItemId, int quantity) {
        Cart cart = getCartFromCookies(request);
        for (CartItem item : cart.getItems()) {
            if (item.getId() == cartItemId) {
                item.setQuantity(quantity);
                break;
            }
        }
        saveCartToCookies(response, cart);
    }

    // Phương thức xóa item từ cookie
    public void deleteCartItemFromCookie(HttpServletRequest request, HttpServletResponse response, int cartItemId) {
        Cart cart = getCartFromCookies(request);
        boolean itemRemoved = false;

        if (cart != null && cart.getItems() != null) {
            // Tạo một danh sách mới không chứa item cần xóa
            List<CartItem> updatedItems = new ArrayList<>();
            for (CartItem item : cart.getItems()) {
                if (item.getId() != cartItemId) {
                    updatedItems.add(item);
                } else {
                    itemRemoved = true;
                }
            }

            // Nếu có item bị xóa, cập nhật lại cookie
            if (itemRemoved) {
                cart.setItems(updatedItems);
                saveCartToCookies(response, cart);
            }
        }

        // Thêm log để debug
        System.out.println("Attempted to delete item ID: " + cartItemId + " - Success: " + itemRemoved);
    }

    public Cart getCart(HttpServletRequest request, Integer userId) {
        if (userId != null) {

            Cart cart = getCartByUserId(userId);
            if (cart == null) {
                cart = createCart(userId);
            }
            return cart;
        } else {

            return getCartFromCookies(request);
        }
    }

    public boolean deleteProductFromCart(int productId) {
        String query = "DELETE FROM cart_items WHERE product_id = ?";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, productId);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public Cart createCart(int userId) {
        Cart cart = new Cart();
        String sql = "INSERT INTO cart (user_id, created_at) VALUES (?, GETDATE());";
        try {
            PreparedStatement st = connection.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
            st.setInt(1, userId);
            st.executeUpdate();

            ResultSet rs = st.getGeneratedKeys();
            if (rs.next()) {
                cart.setId(rs.getInt(1));
                cart.setUserId(userId);
                cart.setCreatedAt(rs.getTimestamp("created_at"));
                cart.setItems(new ArrayList<>());
            }
            rs.close();
            st.close();
        } catch (SQLException e) {
            System.out.println("Error creating cart: " + e.getMessage());
        }
        return cart;
    }

    public double calculateTotalAmount(Cart cart) {
        double total = 0;
        if (cart != null && cart.getItems() != null) {
            for (CartItem item : cart.getItems()) {
                total += item.getProductPrice() * item.getQuantity();
            }
        }
        return total;
    }

    public Cart getCartByUserId(int userId) {
        Cart cart = null;
        String sql = "SELECT * FROM cart WHERE user_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                cart = new Cart();
                cart.setId(rs.getInt("id"));
                cart.setUserId(rs.getInt("user_id"));
                cart.setCreatedAt(rs.getTimestamp("created_at"));

                cart.setItems(getCartItems(cart.getId()));
            } else {

                cart = createCart(userId);
            }
        } catch (SQLException e) {
            System.out.println("Error getting cart: " + e.getMessage());
        }
        return cart;
    }

    private List<CartItem> getCartItems(int cartId) {
        List<CartItem> items = new ArrayList<>();
        String sql = "SELECT ci.*, pv.size_id, pv.color_id, "
                + "ps.size, pc.color, p.title, p.thumbnail, p.sale_price "
                + "FROM cart_items ci "
                + "INNER JOIN product_variants pv ON ci.variant_id = pv.id "
                + "INNER JOIN product_sizes ps ON pv.size_id = ps.id "
                + "INNER JOIN product_colors pc ON pv.color_id = pc.id "
                + "INNER JOIN products p ON ci.product_id = p.id "
                + "WHERE ci.cart_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cartId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                CartItem item = new CartItem();
                item.setId(rs.getInt("id"));
                item.setCartId(cartId);
                item.setProductId(rs.getInt("product_id"));
                item.setVariantId(rs.getInt("variant_id"));
                item.setQuantity(rs.getInt("quantity"));

                item.setProductTitle(rs.getString("title"));
                item.setProductThumbnail(rs.getString("thumbnail"));
                item.setProductPrice(rs.getDouble("sale_price"));
                item.setSize(rs.getString("size"));
                item.setColor(rs.getString("color"));

                items.add(item);
            }
        } catch (SQLException e) {
            System.out.println("Error getting cart items: " + e.getMessage());
        }
        return items;
    }

    public boolean updateCartItemQuantity(int cartItemId, int quantity) {
        String sql = "UPDATE cart_items SET quantity = ? WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, quantity);
            st.setInt(2, cartItemId);
            return st.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("Error updating quantity: " + e.getMessage());
            return false;
        }
    }

    public void deleteCartItem(HttpServletRequest request, HttpServletResponse response, int cartItemId, Integer userId) {
        if (userId != null) {

            String sql = "DELETE FROM cart_items WHERE id = ?";
            try {
                PreparedStatement st = connection.prepareStatement(sql);
                st.setInt(1, cartItemId);
                st.executeUpdate();
            } catch (SQLException e) {
                System.out.println("Error deleting cart item: " + e.getMessage());
            }
        } else {

            deleteCartItemFromCookie(request, response, cartItemId);
        }
    }

    public boolean addCartItem(CartItem item) {
        String sql = "INSERT INTO cart_items (cart_id, product_id, variant_id, quantity) VALUES (?, ?, ?, ?)";
        try {

            Cart cart = getCartByUserId(item.getCartId());
            if (cart == null) {

                cart = createCart(item.getCartId());
            }

            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, item.getCartId());
            st.setInt(2, item.getProductId());
            st.setInt(3, item.getVariantId());
            st.setInt(4, item.getQuantity());
            return st.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("Error adding cart item: " + e.getMessage());
            return false;
        }
    }

    public String encodeCookieValue(String value) throws Exception {
        return Base64.getEncoder().encodeToString(value.getBytes(StandardCharsets.UTF_8));
    }

    public String decodeCookieValue(String value) throws Exception {
        return new String(Base64.getDecoder().decode(value), StandardCharsets.UTF_8);
    }

    //VTĐ thêm để đếm số hàng trong giỏ hàng trên header
    public int getCartItemCount(int cartId) {
        int count = 0;
        String sql = "SELECT COUNT(DISTINCT id) as total FROM cart_items WHERE cart_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cartId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                count = rs.getInt("total");
            }
        } catch (SQLException e) {
            System.out.println("Error getting cart item count: " + e.getMessage());
        }
        return count;
    }

    public int getCartItemCountFromCookie(HttpServletRequest request) {
        Cart cart = getCartFromCookies(request);
        if (cart != null && cart.getItems() != null) {
            return cart.getItems().size();
        }
        return 0;
    }

    /**
     * *******************Huy*************************
     */
    /**
     * ***********************************************
     */
    // Xóa cart_items chứa variantId trong database
    public void deleteCartItemByVariantId(int variantId) {
        String sql = "DELETE FROM cart_items WHERE variant_id = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, variantId);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error deleting cart item by variantId: " + e.getMessage());
        }
    }

    // Xóa cart_items chứa variantId trong cookie
    public void deleteCartItemByVariantIdFromCookie(HttpServletRequest request, HttpServletResponse response, int variantId) {
        Cart cart = getCartFromCookies(request);
        if (cart != null && cart.getItems() != null) {
            List<CartItem> updatedItems = new ArrayList<>();
            for (CartItem item : cart.getItems()) {
                if (item.getVariantId() != variantId) {
                    updatedItems.add(item);
                }
            }
            cart.setItems(updatedItems);
            saveCartToCookies(response, cart);
        }
    }

    // Xóa nhiều sản phẩm trong cart cookie
    public void deleteCartItemsByVariantIdsFromCookie(HttpServletRequest request, HttpServletResponse response, List<Integer> variantIds) {
        Cart cart = getCartFromCookies(request);
        if (cart != null && cart.getItems() != null) {
            List<CartItem> updatedItems = new ArrayList<>();
            for (CartItem item : cart.getItems()) {
                if (!variantIds.contains(item.getVariantId())) {
                    updatedItems.add(item);
                }
            }
            cart.setItems(updatedItems);
            saveCartToCookies(response, cart);
        }
    }

}
