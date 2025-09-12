/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import DAO.CategoryDAO;
import DAO.FooterDAO;
import DAO.MessageDAO;
import DAO.PostDAO;
import DAO.ProductDAO;
import DAO.SliderDAO;
import entity.Category;
import entity.Footer;
import entity.Message;
import entity.Post;
import entity.Product;
import entity.Slider;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author VuxD4t
 */
@WebServlet(urlPatterns = {"/home"})
public class HomeServlet extends HttpServlet {

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
            out.println("<title>Servlet HomeServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet HomeServlet at " + request.getContextPath() + "</h1>");
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
        SliderDAO sliderDAO = new SliderDAO();
        PostDAO postDAO = new PostDAO();
        ProductDAO productDAO = new ProductDAO();
        CategoryDAO categoryDAO = new CategoryDAO();
        MessageDAO messageDAO = new MessageDAO();

        
        // Lấy danh sách các slider và bài đăng
        List<Slider> activeSliders = sliderDAO.getAllSliders("active");
        List<Post> latestPosts = postDAO.getPostToHome(1, 4, "", null, "published", null, "created_at", "DESC");

        // Lấy danh mục cấp 1 có trạng thái active
        List<Category> level1Categories = categoryDAO.getActiveLevel1Categories();

        // Lấy sản phẩm cho mỗi danh mục
        Map<Integer, List<Product>> productsByCategory = new HashMap<>();

        for (Category category : level1Categories) {
            // Lấy 4 sản phẩm cho mỗi danh mục
            List<Product> products = productDAO.getProductsByCategory(category.getId(), 4);
            productsByCategory.put(category.getId(), products);
        }

        // Lấy sản phẩm nổi bật
        List<Product> featuredProducts = productDAO.getFeaturedProducts(8);
        

        // Set attributes cho request
        request.setAttribute("sliders", activeSliders);
        request.setAttribute("latestPosts", latestPosts);
        request.setAttribute("featuredProducts", featuredProducts);
        request.setAttribute("level1Categories", level1Categories);
        request.setAttribute("productsByCategory", productsByCategory);

        request.getRequestDispatcher("homepage.jsp").forward(request, response);
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
        processRequest(request, response);
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
