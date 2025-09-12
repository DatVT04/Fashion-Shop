/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 */
package marketing.Slider;

import DAO.PostDAO;
import DAO.ProductDAO;
import DAO.SliderDAO;
import entity.Post;
import entity.Product;
import entity.Slider;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.util.List;

/**
 *
 * @author DELL
 */
@WebServlet(name = "SliderDetailServlet", urlPatterns = {"/marketing/detailSlider"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024, // 1 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 15, // 15 MB
        location = ""
)
public class SliderDetailServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SliderDetailServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SliderDetailServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String sId = request.getParameter("id");
        int sliderId;
        try {
            sliderId = Integer.parseInt(sId);
            SliderDAO sliderDAO = new SliderDAO();
            PostDAO postDAO = new PostDAO();
            ProductDAO productDAO = new ProductDAO();

            Slider slider = sliderDAO.getSliderById(sliderId);
            List<Integer> existingOrders = sliderDAO.getAllDisplayOrdersExcept(sliderId);

            List<Post> publishedPosts = postDAO.getPublishedPostTitles();
            List<Product> activeProducts = productDAO.getActiveProductTitles();

            request.setAttribute("existingOrders", existingOrders);
            request.setAttribute("slider", slider);
            request.setAttribute("publishedPosts", publishedPosts);
            request.setAttribute("activeProducts", activeProducts);

            request.getRequestDispatcher("/marketing/slider/sliderdetail.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            System.out.println(e);
            response.sendRedirect("sliderList");
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        int id = Integer.parseInt(request.getParameter("id"));
        String title = request.getParameter("title");
        String oldImage = request.getParameter("old_image");
        String link = request.getParameter("link");
        int display_order = Integer.parseInt(request.getParameter("display_order"));
        String status = request.getParameter("status");
        String notes = request.getParameter("notes");

        String postIdStr = request.getParameter("selectedPost");
        String productIdStr = request.getParameter("selectedProduct");

        int postId = (postIdStr != null && !postIdStr.trim().isEmpty()) ? Integer.parseInt(postIdStr) : 0;
        int productId = (productIdStr != null && !productIdStr.trim().isEmpty()) ? Integer.parseInt(productIdStr) : 0;

        SliderDAO sliderDAO = new SliderDAO();

        if (postId > 0) {

            link = "http://localhost:9999/fashionshop/post?id=" + postId;
        } else if (productId > 0) {

            link = "http://localhost:9999/fashionshop/productdetail?id=" + productId;
        }

        if (postId > 0 && productId > 0) {
            request.setAttribute("error", "Không thể chọn cả bài đăng và sản phẩm cùng lúc.");
            Slider currentSlider = sliderDAO.getSliderById(id);
            request.setAttribute("slider", currentSlider);
            request.getRequestDispatcher("/marketing/slider/sliderdetail.jsp").forward(request, response);
            return;
        }

        Slider originalSlider = sliderDAO.getSliderById(id);
        if (link == null) {
            link = "";
        }
        if (postId == 0 && productId == 0) {

            postId = originalSlider.getPostId();
            productId = originalSlider.getProductId();
            link = originalSlider.getLink();
        }

        if (title == null || title.isEmpty() || link == null || link.isEmpty() || notes == null || notes.isEmpty()) {
            request.setAttribute("error", "Tất cả các trường không được để trống.");
            Slider currentSlider = sliderDAO.getSliderById(id);
            request.setAttribute("slider", currentSlider);
            request.getRequestDispatcher("/marketing/slider/sliderdetail.jsp").forward(request, response);
            return;
        }

        if (originalSlider.getDisplay_order() != display_order && sliderDAO.isDisplayOrderExists(display_order, id)) {
            request.setAttribute("error", "Thứ tự hiển thị đã tồn tại. Vui lòng chọn một thứ tự khác.");
            Slider currentSlider = sliderDAO.getSliderById(id);
            request.setAttribute("slider", currentSlider);
            request.getRequestDispatcher("/marketing/slider/sliderdetail.jsp").forward(request, response);
            return;
        }

        String image_url = oldImage;
        boolean imageChanged = false;

        boolean hasChanges = !originalSlider.getTitle().equals(title)
                || (originalSlider.getLink() == null ? link != null : !originalSlider.getLink().equals(link))
                || originalSlider.getDisplay_order() != display_order
                || !originalSlider.getStatus().equals(status)
                || !originalSlider.getNotes().equals(notes)
                || originalSlider.getPostId() != postId
                || originalSlider.getProductId() != productId
                || imageChanged;

        try {
            Part imagePart = request.getPart("image");
            if (imagePart != null && imagePart.getSize() > 0) {
                imageChanged = true;
                String uploadPath = request.getServletContext().getRealPath("") + File.separator + "uploads/sliders/";
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) {
                    uploadDir.mkdir();
                }

                if (oldImage != null && !oldImage.startsWith("http") && !oldImage.isEmpty()) {
                    String oldImagePath = request.getServletContext().getRealPath("") + File.separator + oldImage;
                    File oldFile = new File(oldImagePath);
                    if (oldFile.exists()) {
                        oldFile.delete();
                    }
                }
                String fileName = System.currentTimeMillis() + "_" + imagePart.getSubmittedFileName();
                String filePath = uploadPath + File.separator + fileName;

                imagePart.write(filePath);
                image_url = "uploads/sliders/" + fileName;
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Lỗi khi tải hình ảnh lên: " + e.getMessage());
            Slider currentSlider = sliderDAO.getSliderById(id);
            request.setAttribute("slider", currentSlider);
            request.getRequestDispatcher("/marketing/slider/sliderdetail.jsp").forward(request, response);
            return;
        }

        if (!hasChanges) {
            response.sendRedirect("sliderList");
            return;
        }

        Slider slider = new Slider(id, title, image_url, link, status, display_order, notes, postId, productId);

        boolean isUpdated = sliderDAO.updateSlider(slider);

        if (isUpdated) {

            request.getSession().setAttribute("success", "Cập nhật thanh trượt thành công.");
            response.sendRedirect("sliderList");
        } else {

            Slider s = sliderDAO.getSliderById(id);
            request.setAttribute("slider", s);
            request.setAttribute("error", "Cập nhật thanh trượt thất bại.");
            request.getRequestDispatcher("/marketing/slider/sliderdetail.jsp").forward(request, response);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
