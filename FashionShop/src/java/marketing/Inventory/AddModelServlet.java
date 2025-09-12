/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package marketing.Inventory;

import DAO.InventoryDAO;
import DAO.ProductDAO;
import entity.Color;
import entity.Size;
import entity.Variant;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.List;
import java.util.regex.Pattern;

/**
 *
 * @author nguye
 */
@WebServlet(name = "AddModelServlet", urlPatterns = {"/marketing/addModel"})
public class AddModelServlet extends HttpServlet {

    private static final Pattern COLOR_PATTERN = Pattern.compile("^([A-ZĐẮẰẲẴẶÀẢÃÁẠÂẦẨẪẬẤĂẲẮẰẴẲẸẺẼÈÉẸÊỀỂỄỆẾÌÍỈĨỊÒÓỎÕỌÔỒỐỔỖỘƠỜỚỞỠỢÙÚỦŨỤƯỪỨỬỮỰỲÝỶỸỴỴ]|[a-zđắằẳẵặàảãáạâầẩẫậấăằẳẵẳẹẻẽèéẹêềểễệếìíỉĩịòóỏõọôồốổỗộơờớởỡợùúủũụưừứửữựỳýỷỹỵ])+([ ]([A-ZĐẮẰẲẴẶÀẢÃÁẠÂẦẨẪẬẤĂẲẮẰẴẲẸẺẼÈÉẸÊỀỂỄỆẾÌÍỈĨỊÒÓỎÕỌÔỒỐỔỖỘƠỜỚỞỠỢÙÚỦŨỤƯỪỨỬỮỰỲÝỶỸỴỴ]|[a-zđắằẳẵặàảãáạâầẩẫậấăằẳẵẳẹẻẽèéẹêềểễệếìíỉĩịòóỏõọôồốổỗộơờớởỡợùúủũụưừứửữựỳýỷỹỵ])+)*$");
    private static final int MAX_QUANTITY = 1000000;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String productIdStr = request.getParameter("productId");
        if (productIdStr == null || productIdStr.trim().isEmpty()) {
            response.sendRedirect("inventorylist");
            return;
        }

        int productId = Integer.parseInt(productIdStr);
        InventoryDAO inventoryDao = new InventoryDAO();

        List<Color> colorList = inventoryDao.getColorsByProductId(productId);
        List<Size> sizeList = inventoryDao.getSizesByProductId(productId);
        List<Variant> variants = inventoryDao.getProductVariants(productId); // Lấy danh sách variants

        request.setAttribute("productId", productId);
        request.setAttribute("colorList", colorList);
        request.setAttribute("sizeList", sizeList);
        request.setAttribute("variants", variants); // Thêm variants vào request

        request.getRequestDispatcher("/marketing/inventory/AddModel.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        InventoryDAO inventoryDao = new InventoryDAO();
        ProductDAO productDao = new ProductDAO();

        try {
            int productId = Integer.parseInt(request.getParameter("productId"));
            String source = request.getParameter("source");
            String colorName = request.getParameter("color").trim();
            String sizeName = request.getParameter("size").trim();
            String quantityStr = request.getParameter("quantity");

            List<Color> colorList = inventoryDao.getColorsByProductId(productId);
            List<Size> sizeList = inventoryDao.getSizesByProductId(productId);
            List<Variant> variants = inventoryDao.getProductVariants(productId);

            if (!COLOR_PATTERN.matcher(colorName).matches()) {
                request.setAttribute("errorMessage", "Màu sắc chỉ được phép chứa chữ cái và khoảng trắng");
                request.setAttribute("productId", productId);
                request.setAttribute("source", source);
                request.setAttribute("colorList", colorList);
                request.setAttribute("sizeList", sizeList);
                request.setAttribute("variants", variants);
                request.getRequestDispatcher("/marketing/inventory/AddModel.jsp").forward(request, response);
                return;
            }

            int quantity;
            try {
                quantity = Integer.parseInt(quantityStr);
                if (quantity < 0 || quantity > MAX_QUANTITY) {
                    throw new NumberFormatException();
                }
            } catch (NumberFormatException e) {
                request.setAttribute("errorMessage", "Số lượng phải là số nguyên từ 0 đến " + MAX_QUANTITY);
                request.setAttribute("productId", productId);
                request.setAttribute("source", source);
                request.setAttribute("colorList", colorList);
                request.setAttribute("sizeList", sizeList);
                request.setAttribute("variants", variants);
                request.getRequestDispatcher("/marketing/inventory/AddModel.jsp").forward(request, response);
                return;
            }

            Color color = inventoryDao.getColorByName(productId, colorName);
            Size size = inventoryDao.getSizeByName(productId, sizeName);

            int colorId;
            if (color != null) {
                colorId = color.getId();
            } else {
                colorId = inventoryDao.addColor(productId, colorName);
                if (colorId == -1) {
                    throw new SQLException("Không thể tạo màu mới");
                }
            }

            int sizeId;
            if (size != null) {
                sizeId = size.getId();
            } else {
                sizeId = inventoryDao.addSize(productId, sizeName);
                if (sizeId == -1) {
                    throw new SQLException("Không thể tạo kích thước mới");
                }
            }

            if (inventoryDao.isVariantExists(productId, colorId, sizeId)) {
                request.setAttribute("errorMessage", "Mẫu với màu " + colorName + " và kích thước " + sizeName + " đã tồn tại");
                request.setAttribute("productId", productId);
                request.setAttribute("source", source);
                request.setAttribute("colorList", colorList);
                request.setAttribute("sizeList", sizeList);
                request.setAttribute("variants", variants);
                request.getRequestDispatcher("/marketing/inventory/AddModel.jsp").forward(request, response);
                return;
            }

            inventoryDao.addNewVariant(productId, colorId, sizeId, quantity);
            productDao.updateProductStatusIfNeeded(productId);

            String redirectUrl = "inventoryDetail?id=" + productId + "&success=add";
            if (source != null && !source.trim().isEmpty()) {
                redirectUrl += "&source=" + source;
            }
            response.sendRedirect(redirectUrl);

        } catch (SQLException e) {
            request.setAttribute("errorMessage", "Lỗi hệ thống: " + e.getMessage());
            request.setAttribute("productId", request.getParameter("productId"));
            request.setAttribute("source", request.getParameter("source"));
            request.setAttribute("colorList", inventoryDao.getColorsByProductId(Integer.parseInt(request.getParameter("productId"))));
            request.setAttribute("sizeList", inventoryDao.getSizesByProductId(Integer.parseInt(request.getParameter("productId"))));
            request.setAttribute("variants", inventoryDao.getProductVariants(Integer.parseInt(request.getParameter("productId"))));
            request.getRequestDispatcher("/marketing/inventory/AddModel.jsp").forward(request, response);
        }
    }
}