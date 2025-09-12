/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package marketing.Inventory;

import DAO.CartDAO;
import DAO.InventoryDAO;
import DAO.ProductDAO;
import entity.Inventory;
import entity.User;
import entity.Variant;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author nguye
 */
@WebServlet(name = "InventoryDetailServlet", urlPatterns = {"/marketing/inventoryDetail"})
public class InventoryDetailServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        InventoryDAO inventoryDAO = new InventoryDAO();
        try {
            int productId = Integer.parseInt(request.getParameter("id"));
            String source = request.getParameter("source");

            // Lấy thông tin inventory
            Inventory inventory = inventoryDAO.getInventoryDetail(productId);
            List<Variant> variants = inventoryDAO.getProductVariants(productId);

            request.setAttribute("inventory", inventory);
            request.setAttribute("variants", variants);
            request.setAttribute("source", source);
            request.getRequestDispatcher("/marketing/inventory/InventoryDetail.jsp").forward(request, response);
        } catch (Exception e) {
            response.sendRedirect("error/404.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        int productId = Integer.parseInt(request.getParameter("productId"));
        String source = request.getParameter("source");
        InventoryDAO inventoryDAO = new InventoryDAO();
        ProductDAO productDAO = new ProductDAO();

        System.out.println("Source in doPost: " + source);

        try {
            if ("delete".equals(action)) {
                int variantId = Integer.parseInt(request.getParameter("variantId"));
                CartDAO cartDAO = new CartDAO();

                // Xóa variant khỏi cart_items và cookie
                HttpSession session = request.getSession();
                User user = (User) session.getAttribute("acc");
                if (user != null) {
                    // Xóa khỏi bảng cart_items trong database
                    cartDAO.deleteCartItemByVariantId(variantId);
                } else {
                    // Xóa khỏi cookie
                    cartDAO.deleteCartItemByVariantIdFromCookie(request, response, variantId);
                }

                // Xóa variant khỏi tất cả các bảng liên quan
                boolean deleted = inventoryDAO.deleteVariant(variantId);
                if (deleted) {
                    List<Variant> remainingVariants = inventoryDAO.getProductVariants(productId);
                    if (remainingVariants == null || remainingVariants.isEmpty()) {
                        // Nếu không còn variant nào, cập nhật trạng thái sản phẩm thành EOStock
                        productDAO.updateProductStatus(productId, "EOStock");
                    }
                }

                String redirectUrl = "inventoryDetail?id=" + productId;
                redirectUrl += deleted ? "&success=delete" : "&error=delete";
                if (source != null && !source.trim().isEmpty()) {
                    redirectUrl += "&source=" + source;
                }
                response.sendRedirect(redirectUrl);
            }

        } catch (Exception e) {
            // Tạo URL chuyển hướng khi có lỗi
            String redirectUrl = "inventoryDetail?id=" + productId + "&error=delete";
            if (source != null && !source.trim().isEmpty()) {
                redirectUrl += "&source=" + source;
            }
            response.sendRedirect(redirectUrl);
        }
    }
}
