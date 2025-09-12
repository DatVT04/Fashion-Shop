package marketing.Product;

import DAO.CategoryDAO;
import entity.Category;
import DAO.ProductDAO;
import entity.Product;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "AddProductServlet", urlPatterns = {"/marketing/addproduct"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50 // 50MB
)
public class AddProductServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddProductServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddProductServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CategoryDAO cateDao = new CategoryDAO();
        List<Category> listCate = cateDao.getThirdLevelCategories();
        request.setAttribute("categories", listCate);

        ProductDAO productDao = new ProductDAO();
        List<Product> comboProducts = productDao.getComboProducts();
        request.setAttribute("comboProducts", comboProducts);
        request.setAttribute("alert", request.getParameter("alert"));

        request.getRequestDispatcher("/marketing/product/addProduct.jsp").forward(request, response);
    }

    ProductDAO productDAO = new ProductDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        // Xử lý upload ảnh từ Summernote
        if ("uploadImage".equals(action)) {
            Part filePart = request.getPart("file"); // Summernote gửi file dưới tên "file"
            if (filePart != null && filePart.getSize() > 0) {
                if (!isValidImage(filePart)) {
                    response.setContentType("application/json");
                    response.getWriter().write("{ \"error\": \"Invalid image format\" }");
                    return;
                }

                String imageUrl = saveImage(filePart, request);
                if (imageUrl != null) {
                    response.setContentType("application/json");
                    String fullUrl = request.getContextPath() + "/" + imageUrl;
                    response.getWriter().write("{ \"url\": \"" + fullUrl + "\" }"); // Summernote chỉ cần "url"
                } else {
                    response.setContentType("application/json");
                    response.getWriter().write("{ \"error\": \"Upload failed\" }");
                }
            } else {
                response.setContentType("application/json");
                response.getWriter().write("{ \"error\": \"No file uploaded\" }");
            }
            return;
        }

        // Xử lý thêm sản phẩm
        try {
            String title = request.getParameter("title");
            int categoryId = Integer.parseInt(request.getParameter("categoryId"));
            String description = request.getParameter("description");

            if (productDAO.isProductExists(title, categoryId)) {
                response.sendRedirect("addproduct?alert=ER_dp");
                return;
            }

            BigDecimal originalPrice = new BigDecimal(request.getParameter("originalPrice").replace(".", ""));
            if (originalPrice.compareTo(BigDecimal.ZERO) < 1 || originalPrice.compareTo(BigDecimal.valueOf(100000000)) == 1) {
                response.sendRedirect("addproduct?alert=oP_IV");
                return;
            }
            BigDecimal salePrice = new BigDecimal(request.getParameter("salePrice").replace(".", ""));
            boolean isCombo = request.getParameter("isCombo") != null;
            String comboGroupId = null;

            if (isCombo) {
                int newComboGroupId = productDAO.getMaxComboGroupId() + 1;
                comboGroupId = String.valueOf(newComboGroupId);
            } else {
                comboGroupId = request.getParameter("comboGroupId");
            }

            for (Part part : request.getParts()) {
                if ((part.getName().equals("subImages") || part.getName().equals("thumbnail")) && part.getSize() > 0) {
                    if (!isValidImage(part)) {
                        response.sendRedirect("addproduct?alert=ER1_IVImg");
                        return;
                    }
                }
            }

            Part thumbnailPart = request.getPart("thumbnail");
            String thumbnail = saveImage(thumbnailPart, request);

            List<String> subImages = new ArrayList<>();
            for (Part part : request.getParts()) {
                if (part.getName().equals("subImages") && part.getSize() > 0) {
                    String imageUrl = saveImage(part, request);
                    if (imageUrl != null) {
                        subImages.add(imageUrl);
                    }
                }
            }

            Product product = new Product();
            product.setTitle(title);
            product.setCategoryId(categoryId);
            product.setDescription(description);
            product.setOriginalPrice(originalPrice);
            product.setSalePrice(salePrice);
            product.setThumbnail(thumbnail);
            product.setIsCombo(isCombo);
            product.setComboGroupId(comboGroupId != null && !comboGroupId.isEmpty() ? Integer.parseInt(comboGroupId) : 0);

            if (productDAO.addProduct(product, subImages)) {
                response.sendRedirect("productlist?alert=SSA");
            } else {
                response.sendRedirect("addproduct?alert=ERR");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("addproduct?alert=ERR");
        }
    }

    private String saveImage(Part part, HttpServletRequest request) {
        try {
            String oldFName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
            String fileExtension = oldFName.substring(oldFName.lastIndexOf("."));
            String fileName = "img_" + System.currentTimeMillis() + fileExtension;
            String uploadDir = request.getServletContext().getRealPath("/uploads/productImages");

            File uploadFolder = new File(uploadDir);
            if (!uploadFolder.exists()) {
                uploadFolder.mkdirs();
            }

            String filePath = uploadDir + File.separator + fileName;
            part.write(filePath);
            return "uploads/productImages/" + fileName;
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    private boolean isValidImage(Part part) {
        String contentType = part.getContentType();
        return contentType.equals("image/jpeg")
                || contentType.equals("image/png")
                || contentType.equals("image/gif")
                || contentType.equals("image/svg+xml")
                || contentType.equals("image/webp");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}