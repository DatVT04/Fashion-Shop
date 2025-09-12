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
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.regex.Pattern;

/**
 *
 * @author nguye
 */
@WebServlet(name = "EditModelServlet", urlPatterns = {"/marketing/editModel"})
public class EditModelServlet extends HttpServlet {

    private static final Pattern COLOR_PATTERN = Pattern.compile("^([A-ZĐẮẰẲẴẶÀẢÃÁẠÂẦẨẪẬẤĂẲẮẰẴẲẸẺẼÈÉẸÊỀỂỄỆẾÌÍỈĨỊÒÓỎÕỌÔỒỐỔỖỘƠỜỚỞỠỢÙÚỦŨỤƯỪỨỬỮỰỲÝỶỸỴỴ]|[a-zđắằẳẵặàảãáạâầẩẫậấăằẳẵẳẹẻẽèéẹêềểễệếìíỉĩịòóỏõọôồốổỗộơờớởỡợùúủũụưừứửữựỳýỷỹỵ])+([ ]([A-ZĐẮẰẲẴẶÀẢÃÁẠÂẦẨẪẬẤĂẲẮẰẴẲẸẺẼÈÉẸÊỀỂỄỆẾÌÍỈĨỊÒÓỎÕỌÔỒỐỔỖỘƠỜỚỞỠỢÙÚỦŨỤƯỪỨỬỮỰỲÝỶỸỴỴ]|[a-zđắằẳẵặàảãáạâầẩẫậấăằẳẵẳẹẻẽèéẹêềểễệếìíỉĩịòóỏõọôồốổỗộơờớởỡợùúủũụưừứửữựỳýỷỹỵ])+)*$");
    private static final int MAX_QUANTITY = 1000000;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int variantId = Integer.parseInt(request.getParameter("variantId"));
            String source = request.getParameter("source");
            InventoryDAO dao = new InventoryDAO();
            Variant variant = dao.getVariant(variantId);

            if (variant == null) {
                response.sendRedirect("inventorylist");
                return;
            }

            List<Color> colorList = dao.getColorsByProductId(variant.getProductId());
            List<Size> sizeList = dao.getSizesByProductId(variant.getProductId());
            List<Variant> variants = dao.getProductVariants(variant.getProductId()); // Lấy danh sách variants

            request.setAttribute("variant", variant);
            request.setAttribute("colorList", colorList);
            request.setAttribute("sizeList", sizeList);
            request.setAttribute("variants", variants); // Thêm variants vào request
            request.setAttribute("source", source);
            request.getRequestDispatcher("/marketing/inventory/EditModel.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            response.sendRedirect("error.jsp");
        }
    }

    @Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    request.setCharacterEncoding("UTF-8");
    InventoryDAO inventoryDao = new InventoryDAO();
    ProductDAO productDao = new ProductDAO();

    try {
        int variantId = Integer.parseInt(request.getParameter("variantId"));
        int productId = Integer.parseInt(request.getParameter("productId"));
        String source = request.getParameter("source");
        String colorName = request.getParameter("color").trim();
        String sizeName = request.getParameter("size").trim();
        String quantityStr = request.getParameter("quantity");
        String stockAction = request.getParameter("stockAction");
        String stockChangeStr = request.getParameter("stockChange");

        List<Color> colorList = inventoryDao.getColorsByProductId(productId);
        List<Size> sizeList = inventoryDao.getSizesByProductId(productId);
        List<Variant> variants = inventoryDao.getProductVariants(productId);

        if (colorName.isEmpty() || sizeName.isEmpty()) {
            request.setAttribute("errorMessage", "Màu sắc và kích thước không được để trống");
            Variant variant = inventoryDao.getVariant(variantId);
            request.setAttribute("variant", variant);
            request.setAttribute("colorList", colorList);
            request.setAttribute("sizeList", sizeList);
            request.setAttribute("variants", variants);
            request.setAttribute("source", source);
            request.getRequestDispatcher("/marketing/inventory/EditModel.jsp").forward(request, response);
            return;
        }

        if (!COLOR_PATTERN.matcher(colorName).matches()) {
            request.setAttribute("errorMessage", "Màu sắc chỉ được chứa chữ cái và khoảng trắng");
            Variant variant = inventoryDao.getVariant(variantId);
            request.setAttribute("variant", variant);
            request.setAttribute("colorList", colorList);
            request.setAttribute("sizeList", sizeList);
            request.setAttribute("variants", variants);
            request.setAttribute("source", source);
            request.getRequestDispatcher("/marketing/inventory/EditModel.jsp").forward(request, response);
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
            request.getRequestDispatcher("/marketing/inventory/EditModel.jsp").forward(request, response);
            return;
        }

        // Xử lý thay đổi số lượng từ "Nhập" hoặc "Xuất"
        int finalQuantity = quantity;
        if (stockAction != null && !stockAction.equals("none")) {
            int stockChange;
            try {
                stockChange = stockChangeStr != null ? Integer.parseInt(stockChangeStr) : 0;
                if (stockChange < 0) {
                    throw new NumberFormatException();
                }
            } catch (NumberFormatException e) {
                request.setAttribute("errorMessage", "Số lượng thay đổi phải là số nguyên không âm");
                request.setAttribute("variant", inventoryDao.getVariant(variantId));
                request.setAttribute("colorList", colorList);
                request.setAttribute("sizeList", sizeList);
                request.setAttribute("variants", variants);
                request.setAttribute("source", source);
                request.getRequestDispatcher("/marketing/inventory/EditModel.jsp").forward(request, response);
                return;
            }

            if (stockAction.equals("import")) {
                finalQuantity = quantity + stockChange;
                if (finalQuantity > MAX_QUANTITY) {
                    request.setAttribute("errorMessage", "Số lượng sau khi nhập không được vượt quá " + MAX_QUANTITY);
                    request.setAttribute("variant", inventoryDao.getVariant(variantId));
                    request.setAttribute("colorList", colorList);
                    request.setAttribute("sizeList", sizeList);
                    request.setAttribute("variants", variants);
                    request.setAttribute("source", source);
                    request.getRequestDispatcher("/marketing/inventory/EditModel.jsp").forward(request, response);
                    return;
                }
            } else if (stockAction.equals("export")) {
                if (stockChange > quantity) {
                    request.setAttribute("errorMessage", "Chỉ có thể xuất tối đa " + quantity + " sản phẩm");
                    request.setAttribute("variant", inventoryDao.getVariant(variantId));
                    request.setAttribute("colorList", colorList);
                    request.setAttribute("sizeList", sizeList);
                    request.setAttribute("variants", variants);
                    request.setAttribute("source", source);
                    request.getRequestDispatcher("/marketing/inventory/EditModel.jsp").forward(request, response);
                    return;
                }
                finalQuantity = quantity - stockChange;
            }
        }

        Variant currentVariant = inventoryDao.getVariant(variantId);
        if (currentVariant == null) {
            response.sendRedirect("inventorylist");
            return;
        }

        int oldColorId = currentVariant.getColor().getId();
        int oldSizeId = currentVariant.getSize().getId();

        Color newColor;
        if (currentVariant.getColor().getName().equalsIgnoreCase(colorName)) {
            newColor = currentVariant.getColor();
        } else {
            newColor = inventoryDao.getColorByName(productId, colorName);
            if (newColor == null) {
                int usageCount = inventoryDao.countVariantsUsingColor(oldColorId);
                if (usageCount == 1) {
                    inventoryDao.updateColor(oldColorId, colorName);
                    newColor = new Color(oldColorId, colorName);
                } else {
                    int newColorId = inventoryDao.addColor(productId, colorName);
                    newColor = new Color(newColorId, colorName);
                }
            }
        }

        Size newSize;
        if (currentVariant.getSize().getName().equalsIgnoreCase(sizeName)) {
            newSize = currentVariant.getSize();
        } else {
            newSize = inventoryDao.getSizeByName(productId, sizeName);
            if (newSize == null) {
                int usageCount = inventoryDao.countVariantsUsingSize(oldSizeId);
                if (usageCount == 1) {
                    inventoryDao.updateSize(oldSizeId, sizeName);
                    newSize = new Size(oldSizeId, sizeName);
                } else {
                    int newSizeId = inventoryDao.addSize(productId, sizeName);
                    newSize = new Size(newSizeId, sizeName);
                }
            }
        }

        if (inventoryDao.isVariantExists(productId, newColor.getId(), newSize.getId(), variantId)) {
            request.setAttribute("errorMessage", "Mẫu với màu sắc và kích thước này đã tồn tại");
            request.setAttribute("variant", currentVariant);
            request.setAttribute("colorList", colorList);
            request.setAttribute("sizeList", sizeList);
            request.setAttribute("variants", variants);
            request.setAttribute("source", source);
            request.getRequestDispatcher("/marketing/inventory/EditModel.jsp").forward(request, response);
            return;
        }

        inventoryDao.updateVariant(variantId, newColor.getId(), newSize.getId(), finalQuantity);
        productDao.updateProductStatusIfNeeded(productId);

        if (oldColorId != newColor.getId()) {
            inventoryDao.cleanupOrphanColor(oldColorId);
        }
        if (oldSizeId != newSize.getId()) {
            inventoryDao.cleanupOrphanSize(oldSizeId);
        }

        String redirectUrl = "inventoryDetail?id=" + productId + "&success=edit";
        if (source != null && !source.trim().isEmpty()) {
            redirectUrl += "&source=" + source;
        }
        response.sendRedirect(redirectUrl);

    } catch (NumberFormatException e) {
        int productId = Integer.parseInt(request.getParameter("productId"));
        List<Color> colorList = inventoryDao.getColorsByProductId(productId);
        List<Size> sizeList = inventoryDao.getSizesByProductId(productId);
        List<Variant> variants = inventoryDao.getProductVariants(productId);

        request.setAttribute("errorMessage", "Dữ liệu không hợp lệ");
        request.setAttribute("variant", inventoryDao.getVariant(Integer.parseInt(request.getParameter("variantId"))));
        request.setAttribute("colorList", colorList);
        request.setAttribute("sizeList", sizeList);
        request.setAttribute("variants", variants);
        request.setAttribute("source", request.getParameter("source"));
        request.getRequestDispatcher("/marketing/inventory/EditModel.jsp").forward(request, response);
    }
}
}