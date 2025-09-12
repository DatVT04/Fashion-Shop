package Cart;

import DAO.CartDAO;
import DAO.CouponDAO;
import DAO.InventoryDAO;
import DAO.ProductDAO;
import entity.Cart;
import entity.CartItem;
import entity.Coupon;
import entity.Product;
import entity.User;
import entity.Variant;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "CartDetail", urlPatterns = {"/cartdetail"})
public class CartDetail extends HttpServlet {

    private ProductDAO productDAO = new ProductDAO();
    private CartDAO cartDAO = new CartDAO();
    private CouponDAO couponDAO = new CouponDAO();
    private InventoryDAO inventoryDAO = new InventoryDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CartDetail</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CartDetail at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("acc");
        String fromPage = request.getParameter("from");
        if ("contact".equals(fromPage) || request.getParameter("clearCoupon") != null) {
            session.removeAttribute("appliedCoupon");
            session.removeAttribute("cartDiscount");
        }

        Cart cart = user != null
                ? cartDAO.getCart(request, user.getId())
                : cartDAO.getCart(request, null);

        // Lấy thông tin tồn kho cho mỗi sản phẩm trong giỏ hàng
        Map<Integer, Integer> stock = new HashMap<>();
        if (cart != null && cart.getItems() != null) {
            for (CartItem item : cart.getItems()) {
                Variant variant = inventoryDAO.getVariant(item.getVariantId());
                if (variant != null) {
                    stock.put(item.getId(), variant.getQuantity());
                }
            }
        }
        request.setAttribute("stockMap", stock);

        Map<Integer, String> productStatusMap = new HashMap<>();
        for (CartItem item : cart.getItems()) {
            Product product = productDAO.getProductById(item.getProductId());
            if (product != null) {
                productStatusMap.put(item.getId(), product.getStatus());
            }
        }

        // Truyền thông tin trạng thái sản phẩm tới JSP
        request.setAttribute("productStatusMap", productStatusMap);
        boolean isVip = user != null && checkUserVipStatus(user);
        List<Coupon> availableCoupons = couponDAO.getAvailableCoupons(isVip);
        request.setAttribute("availableCoupons", availableCoupons);

        setupCartAttributes(request, cart);
        request.getRequestDispatcher("cartdetail.jsp").forward(request, response);
    }

    private void setupCartAttributes(HttpServletRequest request, Cart cart) {
        double totalAmount = cartDAO.calculateTotalAmount(cart);
        double discount = calculateDiscount(request, totalAmount);

        request.setAttribute("cart", cart);
        request.setAttribute("totalAmount", totalAmount);
        request.setAttribute("discount", discount);
        request.setAttribute("finalAmount", totalAmount - discount);

        String appliedCoupon = (String) request.getSession().getAttribute("appliedCoupon");
        if (appliedCoupon != null) {
            request.setAttribute("appliedCoupon", appliedCoupon);
            Coupon couponDetails = couponDAO.getCouponByCode(appliedCoupon);
            if (couponDetails != null) {
                request.setAttribute("appliedCouponDetails", couponDetails);
            }
        }
    }

    private double calculateDiscount(HttpServletRequest request, double totalAmount) {
        HttpSession session = request.getSession();
        String appliedCoupon = (String) session.getAttribute("appliedCoupon");

        if (appliedCoupon != null) {
            try {
                return validateAndCalculateCouponDiscount(appliedCoupon, totalAmount);
            } catch (Exception e) {
                session.removeAttribute("appliedCoupon");
                session.removeAttribute("cartDiscount");
                request.setAttribute("couponError", e.getMessage());
            }
        }
        return 0.0;
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("acc");

        if ("update".equals(action)) {
            handleUpdateQuantity(request, response, user);
        } else if ("delete".equals(action)) {
            handleDeleteItem(request, response);
        } else if ("applyCoupon".equals(action)) {
            handleApplyCoupon(request, response);
            return;
        } else if ("checkout".equals(action)) {
            handleCheckout(request, response);
            return;
        } else if ("checkStock".equals(action)) {
            handleCheckStock(request, response);
            return;
        } else if ("clearCoupon".equals(action)) {
            session.removeAttribute("appliedCoupon");
            session.removeAttribute("cartDiscount");
            response.sendRedirect("cartdetail");
            return;
        }

        response.sendRedirect("cartdetail");
    }

    private void handleCheckStock(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();

        try {
            int variantId = Integer.parseInt(request.getParameter("variantId"));

            Variant variant = inventoryDAO.getVariant(variantId);
            if (variant != null) {
                out.print("{\"success\": true, \"stockQuantity\": " + variant.getQuantity() + "}");
            } else {
                out.print("{\"success\": false, \"message\": \"Không tìm thấy sản phẩm\"}");
            }
        } catch (Exception e) {
            out.print("{\"success\": false, \"message\": \"" + e.getMessage() + "\"}");
        }
    }

    private void handleCheckout(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String[] selectedIds = request.getParameterValues("selectedItems");

        if (selectedIds == null || selectedIds.length == 0) {
            request.setAttribute("error", "Vui lòng chọn sản phẩm");
            doGet(request, response);
            return;
        }

        List<String> selectedItemIds = new ArrayList<>();
        List<String> selectedQuantities = new ArrayList<>();
        User user = (User) session.getAttribute("acc");
        Cart cart = user != null ? cartDAO.getCartByUserId(user.getId()) : cartDAO.getCartFromCookies(request);
        double totalSelected = 0;

        for (String itemId : selectedIds) {
            String quantity = request.getParameter("quantity_" + itemId);
            selectedItemIds.add(itemId);
            selectedQuantities.add(quantity);
            for (CartItem item : cart.getItems()) {
                if (String.valueOf(item.getId()).equals(itemId)) {
                    totalSelected += item.getProductPrice() * Integer.parseInt(quantity);
                    break;
                }
            }
        }

        session.setAttribute("selectedItemIds", selectedItemIds);
        session.setAttribute("selectedQuantities", selectedQuantities);

        String currentCoupon = request.getParameter("couponCode");
        if (currentCoupon != null && !currentCoupon.isEmpty()) {
            synchronized (this) {
                Coupon coupon = couponDAO.getCouponByCode(currentCoupon);
                if (coupon != null) {
                    try {
                        if (!"active".equals(coupon.getStatus())) {
                            throw new Exception("Mã giảm giá không còn hiệu lực!");
                        }
                        Date expiryDate = coupon.getExpiry_date();
                        if (expiryDate != null && new Date().after(expiryDate)) {
                            coupon.setStatus("expired");
                            couponDAO.updateCoupon(coupon);
                            throw new Exception("Mã giảm giá đã hết hạn!");
                        }
                        int currentUsedCount = coupon.getUsed_count();
                        Integer usageLimit = coupon.getUsage_limit();
                        if (usageLimit != null && currentUsedCount >= usageLimit) {
                            throw new Exception("Mã giảm giá đã hết lượt sử dụng!");
                        }

                        // Kiểm tra phân quyền sử dụng mã giảm giá
                        String couponType = coupon.getCouponType();
                        boolean isUserVip = user != null && checkUserVipStatus(user);
                        if ("vip".equals(couponType) && !isUserVip) {
                            throw new Exception("Mã giảm giá này chỉ dành cho khách hàng VIP!");
                        }

                        double discount = validateAndCalculateCouponDiscount(currentCoupon, totalSelected);
                        coupon.setUsed_count(currentUsedCount + 1);
                        couponDAO.updateCoupon(coupon);

                        session.setAttribute("cartDiscount", discount);
                        session.setAttribute("appliedCoupon", currentCoupon);
                    } catch (Exception e) {
                        session.removeAttribute("cartDiscount");
                        session.removeAttribute("appliedCoupon");
                        request.setAttribute("couponError", e.getMessage());
                        doGet(request, response);
                        return;
                    }
                } else {
                    session.removeAttribute("appliedCoupon");
                    session.removeAttribute("cartDiscount");
                    request.setAttribute("couponError", "Mã giảm giá không tồn tại!");
                    doGet(request, response);
                    return;
                }
            }
        } else {
            session.removeAttribute("appliedCoupon");
            session.removeAttribute("cartDiscount");
        }

        response.sendRedirect("cartcontact");
    }

    private void handleUpdateQuantity(HttpServletRequest request, HttpServletResponse response, User user) {
        try {
            int cartItemId = Integer.parseInt(request.getParameter("cartItemId"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));

            // Kiểm tra số lượng tồn kho
            int variantId = -1;
            Cart cart = user != null
                    ? cartDAO.getCartByUserId(user.getId())
                    : cartDAO.getCartFromCookies(request);

            for (CartItem item : cart.getItems()) {
                if (item.getId() == cartItemId) {
                    variantId = item.getVariantId();
                    break;
                }
            }

            if (variantId != -1) {
                Variant variant = inventoryDAO.getVariant(variantId);
                if (variant != null && variant.getQuantity() < quantity) {
                    quantity = variant.getQuantity(); // Giới hạn số lượng ở mức tồn kho
                }
            }

            System.out.println("Updating cart item: " + cartItemId + " with quantity: " + quantity);

            if (user != null) {
                boolean success = cartDAO.updateCartItemQuantity(cartItemId, quantity);
                if (!success) {
                    System.out.println("Failed to update cart item quantity in database");
                }
            } else {
                cartDAO.updateCartItemQuantityInCookie(request, response, cartItemId, quantity);
            }

            response.setContentType("application/json");
            PrintWriter out = response.getWriter();
            out.print("{\"success\": true, \"updatedQuantity\": " + quantity + "}");
            out.flush();

        } catch (NumberFormatException | IOException e) {
            System.out.println("Error parsing quantity: " + e.getMessage());
            System.out.println("cartItemId: " + request.getParameter("cartItemId"));
            System.out.println("quantity: " + request.getParameter("quantity"));

            try {
                response.setContentType("application/json");
                PrintWriter out = response.getWriter();
                out.print("{\"success\": false, \"message\": \"" + e.getMessage() + "\"}");
                out.flush();
            } catch (IOException ex) {
                ex.printStackTrace();
            }
        }
    }

    private void handleDeleteItem(HttpServletRequest request, HttpServletResponse response) {
        try {
            int cartItemId = Integer.parseInt(request.getParameter("cartItemId"));
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("acc");

            if (user != null) {
                // Người dùng đã đăng nhập, xóa từ database
                cartDAO.deleteCartItem(request, response, cartItemId, cartItemId);
            } else {
                // Người dùng chưa đăng nhập, xóa từ cookie
                cartDAO.deleteCartItemFromCookie(request, response, cartItemId);
            }
        } catch (NumberFormatException e) {
            System.out.println("Lỗi khi parse ID sản phẩm: " + e.getMessage());
        }
    }

    private void handleApplyCoupon(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String couponCode = request.getParameter("couponCode");
        User user = (User) session.getAttribute("acc");
        Cart cart = cartDAO.getCart(request, user != null ? user.getId() : null);

        if (couponCode == null || couponCode.trim().isEmpty()) {
            session.removeAttribute("appliedCoupon");
            session.removeAttribute("cartDiscount");
            response.sendRedirect("cartdetail");
            return;
        }

        try {
            double totalAmount = cartDAO.calculateTotalAmount(cart);
            Coupon coupon = couponDAO.getCouponByCode(couponCode);
            if (coupon == null) {
                throw new Exception("Mã giảm giá không tồn tại!");
            }
            if (!"active".equals(coupon.getStatus())) {
                throw new Exception("Mã giảm giá không còn hiệu lực!");
            }
            Date expiryDate = coupon.getExpiry_date();
            if (expiryDate != null && new Date().after(expiryDate)) {
                coupon.setStatus("expired");
                couponDAO.updateCoupon(coupon);
                throw new Exception("Mã giảm giá đã hết hạn!");
            }

            // Kiểm tra phân quyền sử dụng mã giảm giá
            String couponType = coupon.getCouponType();
            boolean isUserVip = user != null && checkUserVipStatus(user);
            if ("vip".equals(couponType) && !isUserVip) {
                throw new Exception("Mã giảm giá này chỉ dành cho khách hàng VIP!");
            }
            if ("normal".equals(couponType) && isUserVip) {
                // Có thể thêm logic nếu muốn hạn chế VIP không dùng mã "normal"
            }

            double discount = validateAndCalculateCouponDiscount(couponCode, totalAmount);
            session.setAttribute("appliedCoupon", couponCode);
            session.setAttribute("cartDiscount", discount);
        } catch (Exception e) {
            session.removeAttribute("appliedCoupon");
            session.removeAttribute("cartDiscount");
            request.setAttribute("couponError", e.getMessage());
        }

        response.sendRedirect("cartdetail");
    }

    private double validateAndCalculateCouponDiscount(String couponCode, double totalAmount) throws Exception {
        Coupon coupon = couponDAO.getCouponByCode(couponCode);

        if (coupon == null) {
            throw new Exception("Mã giảm giá không tồn tại!");
        }

        if (!"active".equals(coupon.getStatus())) {
            throw new Exception("Mã giảm giá không còn hiệu lực!");
        }

        Date expiryDate = coupon.getExpiry_date();
        if (expiryDate != null) {
            Date currentDate = new Date(System.currentTimeMillis());
            if (currentDate.after(expiryDate)) {
                coupon.setStatus("expired");
                couponDAO.updateCoupon(coupon);
                throw new Exception("Mã giảm giá đã hết hạn!");
            }
        }

        if (totalAmount < coupon.getMin_order_amount()) {
            throw new Exception(String.format("Đơn hàng cần tối thiểu %,.0f₫ để áp dụng mã này!",
                    coupon.getMin_order_amount()));
        }

        double discount;
        if ("percentage".equals(coupon.getDiscount_type())) {
            discount = totalAmount * (coupon.getDiscount_value() / 100);
            if (coupon.getMax_discount() > 0 && discount > coupon.getMax_discount()) {
                discount = coupon.getMax_discount();
            }
        } else {
            discount = coupon.getDiscount_value();
        }

        return discount;
    }

    private boolean checkUserVipStatus(User user) {
        if (user == null) {
            return false; 
        }    
        return "vip".equalsIgnoreCase(user.getRole());
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
