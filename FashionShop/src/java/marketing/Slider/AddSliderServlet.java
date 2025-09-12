package marketing.Slider;

import DAO.PostDAO;
import DAO.ProductDAO;
import DAO.SliderDAO;
import entity.Post;
import entity.Product;
import entity.Slider;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.util.List;

@WebServlet(name = "AddSliderServlet", urlPatterns = {"/marketing/addSlider"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024, // 1 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 15 // 15 MB
)
public class AddSliderServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        SliderDAO sliderDAO = new SliderDAO();
        PostDAO postDAO = new PostDAO();
        ProductDAO productDAO = new ProductDAO();

        List<Integer> existingOrders = sliderDAO.getAllDisplayOrdersExcept(-1);
        List<Post> publishedPosts = postDAO.getPublishedPostTitles();
        List<Product> activeProducts = productDAO.getActiveProductTitles();

        request.setAttribute("existingOrders", existingOrders);
        request.setAttribute("publishedPosts", publishedPosts);
        request.setAttribute("activeProducts", activeProducts);

        request.getRequestDispatcher("/marketing/slider/sliderform.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        try {

            String title = request.getParameter("title");
            String link = request.getParameter("link");
            String status = request.getParameter("status");
            String notes = request.getParameter("notes");
            int display_order = Integer.parseInt(request.getParameter("display_order"));
            String postIdStr = request.getParameter("selectedPost");
            String productIdStr = request.getParameter("selectedProduct");

            SliderDAO sliderDAO = new SliderDAO();
            PostDAO postDAO = new PostDAO();
            ProductDAO productDAO = new ProductDAO();

            int selectedPost = (postIdStr != null && !postIdStr.trim().isEmpty()) ? Integer.parseInt(postIdStr) : 0;
            int selectedProduct = (productIdStr != null && !productIdStr.trim().isEmpty()) ? Integer.parseInt(productIdStr) : 0;

            if ((selectedPost == 0 && selectedProduct == 0)) {
                List<Integer> existingOrders = sliderDAO.getAllDisplayOrdersExcept(-1);
                List<Post> publishedPosts = postDAO.getPublishedPostTitles();
                List<Product> activeProducts = productDAO.getActiveProductTitles();

                request.setAttribute("existingOrders", existingOrders);
                request.setAttribute("publishedPosts", publishedPosts);
                request.setAttribute("activeProducts", activeProducts);
                request.setAttribute("error", "Vui lòng chọn một trong hai: Bài đăng hoặc Sản phẩm.");
                request.getRequestDispatcher("/marketing/slider/sliderform.jsp").forward(request, response);
                return;
            }

            if (title == null || title.trim().isEmpty()
                    || status == null || status.trim().isEmpty()
                    || notes == null || notes.trim().isEmpty()) {

                List<Integer> existingOrders = sliderDAO.getAllDisplayOrdersExcept(-1);
                List<Post> publishedPosts = postDAO.getPublishedPostTitles();
                List<Product> activeProducts = productDAO.getActiveProductTitles();

                request.setAttribute("existingOrders", existingOrders);
                request.setAttribute("publishedPosts", publishedPosts);
                request.setAttribute("activeProducts", activeProducts);
                request.setAttribute("error", "Tất cả các trường không được để trống.");
                request.getRequestDispatcher("/marketing/slider/sliderform.jsp").forward(request, response);
                return;
            }

            try {
                display_order = Integer.parseInt(request.getParameter("display_order"));
            } catch (NumberFormatException e) {
                List<Integer> existingOrders = sliderDAO.getAllDisplayOrdersExcept(-1);
                List<Post> publishedPosts = postDAO.getPublishedPostTitles();
                List<Product> activeProducts = productDAO.getActiveProductTitles();

                request.setAttribute("existingOrders", existingOrders);
                request.setAttribute("publishedPosts", publishedPosts);
                request.setAttribute("activeProducts", activeProducts);
                request.setAttribute("error", "Thứ tự hiển thị không hợp lệ!");
                request.getRequestDispatcher("/marketing/slider/sliderform.jsp").forward(request, response);
                return;
            }

            if (sliderDAO.isDisplayOrderExists(display_order, -1)) { // Pass -1 as id since this is a new slider
                List<Integer> existingOrders = sliderDAO.getAllDisplayOrdersExcept(-1);
                List<Post> publishedPosts = postDAO.getPublishedPostTitles();
                List<Product> activeProducts = productDAO.getActiveProductTitles();

                request.setAttribute("existingOrders", existingOrders);
                request.setAttribute("publishedPosts", publishedPosts);
                request.setAttribute("activeProducts", activeProducts);
                request.setAttribute("error", "Thứ tự hiển thị đã tồn tại. Vui lòng chọn một thứ tự khác.");
                request.getRequestDispatcher("/marketing/slider/sliderform.jsp").forward(request, response);
                return;
            }

            String image_url = "";
            try {
                Part filePart = request.getPart("image_url");
                if (filePart != null && filePart.getSize() > 0) {
                    String uploadPath = request.getServletContext().getRealPath("") + "uploads";
                    File uploadDir = new File(uploadPath);
                    if (!uploadDir.exists()) {
                        uploadDir.mkdir();
                    }

                    String fileName = System.currentTimeMillis() + "_" + filePart.getSubmittedFileName();
                    String filePath = uploadPath + File.separator + fileName;

                    filePart.write(filePath);
                    image_url = "uploads/" + fileName;
                } else {
                    List<Integer> existingOrders = sliderDAO.getAllDisplayOrdersExcept(-1);
                    List<Post> publishedPosts = postDAO.getPublishedPostTitles();
                    List<Product> activeProducts = productDAO.getActiveProductTitles();

                    request.setAttribute("existingOrders", existingOrders);
                    request.setAttribute("publishedPosts", publishedPosts);
                    request.setAttribute("activeProducts", activeProducts);
                    request.setAttribute("error", "Vui lòng chọn hình ảnh cho slider!");
                    request.getRequestDispatcher("/marketing/slider/sliderform.jsp").forward(request, response);
                    return;
                }
            } catch (Exception e) {
                e.printStackTrace();
                List<Integer> existingOrders = sliderDAO.getAllDisplayOrdersExcept(-1);
                List<Post> publishedPosts = postDAO.getPublishedPostTitles();
                List<Product> activeProducts = productDAO.getActiveProductTitles();

                request.setAttribute("existingOrders", existingOrders);
                request.setAttribute("publishedPosts", publishedPosts);
                request.setAttribute("activeProducts", activeProducts);
                request.setAttribute("error", "Lỗi upload ảnh: " + e.getMessage());
                request.getRequestDispatcher("/marketing/slider/sliderform.jsp").forward(request, response);
                return;
            }

            if (link == null || link.trim().isEmpty()) {
                if (selectedPost > 0) {

                    link = "http://localhost:9999/fashionshop/post?id=" + selectedPost;
                } else if (selectedProduct > 0) {

                    link = "http://localhost:9999/fashionshop/productdetail?id=" + selectedProduct;
                }
            }

            Slider slider = new Slider();
            slider.setTitle(title);
            slider.setImage_url(image_url);
            slider.setLink(link);
            slider.setDisplay_order(display_order);
            slider.setStatus(status);
            slider.setNotes(notes);
            slider.setPostId(selectedPost);
            slider.setProductId(selectedProduct);

            boolean isAdded = sliderDAO.addSlider(slider);

            if (isAdded) {

                session.setAttribute("success", "Đã thêm thanh trượt thành công!");

                response.sendRedirect(request.getContextPath() + "/marketing/sliderList");
            } else {
                List<Integer> existingOrders = sliderDAO.getAllDisplayOrdersExcept(-1);
                List<Post> publishedPosts = postDAO.getPublishedPostTitles();
                List<Product> activeProducts = productDAO.getActiveProductTitles();

                request.setAttribute("existingOrders", existingOrders);
                request.setAttribute("publishedPosts", publishedPosts);
                request.setAttribute("activeProducts", activeProducts);
                request.setAttribute("error", "Thêm thanh trượt thất bại!");
                request.getRequestDispatcher("/marketing/slider/sliderform.jsp").forward(request, response);
            }
        } catch (NumberFormatException e) {
            SliderDAO sliderDAO = new SliderDAO();
            PostDAO postDAO = new PostDAO();
            ProductDAO productDAO = new ProductDAO();
            List<Integer> existingOrders = sliderDAO.getAllDisplayOrdersExcept(-1);
            List<Post> publishedPosts = postDAO.getPublishedPostTitles();
            List<Product> activeProducts = productDAO.getActiveProductTitles();

            request.setAttribute("existingOrders", existingOrders);
            request.setAttribute("publishedPosts", publishedPosts);
            request.setAttribute("activeProducts", activeProducts);
            request.setAttribute("error", "Lỗi: Giá trị nhập vào không hợp lệ!");
            request.getRequestDispatcher("/marketing/slider/sliderform.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            SliderDAO sliderDAO = new SliderDAO();
            PostDAO postDAO = new PostDAO();
            ProductDAO productDAO = new ProductDAO();
            List<Integer> existingOrders = sliderDAO.getAllDisplayOrdersExcept(-1);
            List<Post> publishedPosts = postDAO.getPublishedPostTitles();
            List<Product> activeProducts = productDAO.getActiveProductTitles();

            request.setAttribute("existingOrders", existingOrders);
            request.setAttribute("publishedPosts", publishedPosts);
            request.setAttribute("activeProducts", activeProducts);
            request.setAttribute("error", "Lỗi: " + e.getMessage());
            request.getRequestDispatcher("/marketing/slider/sliderform.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Servlet to handle adding new sliders";
    }
}
