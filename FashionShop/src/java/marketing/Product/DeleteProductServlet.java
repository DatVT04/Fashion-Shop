/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package marketing.Product;

import DAO.CartDAO;
import DAO.InventoryDAO;
import DAO.ProductDAO;
import entity.Product;
import entity.User;
import entity.Variant;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@WebServlet(name = "DeleteProductServlet", urlPatterns = {"/marketing/deleteproduct"})
public class DeleteProductServlet extends HttpServlet {

    private ProductDAO productDAO = new ProductDAO();
    private CartDAO cartDAO = new CartDAO();
    private InventoryDAO inventoryDAO = new InventoryDAO();
    private static final String UPLOAD_DIR = "uploads/productImages";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet DeleteProductServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DeleteProductServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int productId = Integer.parseInt(request.getParameter("productId"));
            String uploadPath = getServletContext().getRealPath("/" + UPLOAD_DIR);
            Product product = productDAO.getProductById(productId);

            // Kiểm tra đơn hàng
            if (productDAO.hasProcessOrders(productId)) {
                response.sendRedirect("productlist?alert=ER1_OP");
                return;
            }

            // Kiểm tra kho
            if (productDAO.hasStock(productId)) {
                response.sendRedirect("productlist?alert=ER2_HS");
                return;
            } else {
                List<Variant> listVariants = inventoryDAO.getProductVariants(productId);
                List<Integer> variantIds = new ArrayList<>();
                for (Variant tempV : listVariants) {
                    variantIds.add(tempV.getId());
                }

                HttpSession session = request.getSession();
                User user = (User) session.getAttribute("acc");
                if (user != null) {
                    for (int tempId : variantIds) {
                        cartDAO.deleteCartItemByVariantId(tempId);
                        inventoryDAO.deleteVariant(tempId);
                    }
                } else {
                    cartDAO.deleteCartItemsByVariantIdsFromCookie(request, response, variantIds);
                    for (int tempId : variantIds) {
                        inventoryDAO.deleteVariant(tempId);
                    }
                }
            }

            // Xử lý combo
            Product tempP = productDAO.getProductById(productId);
            if (tempP.isIsCombo()) {
                List<Product> comboList = productDAO.getComboProduct(tempP.getComboGroupId());
                if (comboList.size() >= 2) {
                    int upProductId = comboList.get(comboList.size() - 2).getId();
                    productDAO.setIsComboByProductId(upProductId, true);
                }
            }

            // Trích xuất và xóa ảnh trong description
            String description = tempP.getDescription();
            if (description != null && !description.isEmpty()) {
                List<String> imageUrls = extractImageUrls(description);
                for (String imageUrl : imageUrls) {
                    deleteImage(imageUrl, uploadPath);
                }
            }

            // Xóa sản phẩm và ảnh liên quan
            if (productDAO.deleteProduct(productId, uploadPath)) {
                response.sendRedirect("productlist?alert=SSD");
            } else {
                response.sendRedirect("productlist?alert=ERR");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error/error.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    // Trích xuất URL ảnh từ nội dung HTML
    private List<String> extractImageUrls(String htmlContent) {
        List<String> imageUrls = new ArrayList<>();
        if (htmlContent == null) {
            return imageUrls;
        }

        // Biểu thức chính quy để tìm các thẻ <img src="...">
        Pattern pattern = Pattern.compile("<img[^>]+src=\"(.*?)\"");
        Matcher matcher = pattern.matcher(htmlContent);
        while (matcher.find()) {
            String src = matcher.group(1);
            // Chỉ lấy các URL thuộc thư mục uploads/productImages
            if (src.contains(UPLOAD_DIR)) {
                // Loại bỏ context path nếu có (ví dụ: /context/uploads/productImages/...)
                String relativePath = src.substring(src.indexOf(UPLOAD_DIR));
                imageUrls.add(relativePath);
            }
        }
        return imageUrls;
    }

    // Xóa ảnh từ thư mục
    private void deleteImage(String imagePath, String uploadPath) {
        imagePath = imagePath.replace(UPLOAD_DIR + "/", ""); // Loại bỏ phần prefix
        File file = new File(uploadPath + File.separator + imagePath);
        if (file.exists()) {
            file.delete();
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
