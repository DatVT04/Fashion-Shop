/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package admin;

import DAO.CategoryDAO;
import entity.Category;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author thanh
 */
@WebServlet(name = "CategoryList", urlPatterns = {"/admin/categorylists"})
public class CategoryList extends HttpServlet {
private static final int PAGE_SIZE = 10;
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
            out.println("<title>Servlet CategoryList</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CategoryList at " + request.getContextPath() + "</h1>");
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
        try {
            CategoryDAO categoryDAO = new CategoryDAO();

            // Lấy các tham số
            String searchQuery = request.getParameter("search");
            String sortField = request.getParameter("sortField");
            String sortDir = request.getParameter("sortDir");
            String statusFilter = request.getParameter("status");

            // Xử lý phân trang
            int page = 1;
            String pageStr = request.getParameter("page");
            if (pageStr != null && !pageStr.trim().isEmpty()) {
                try {
                    page = Integer.parseInt(pageStr);
                } catch (NumberFormatException e) {
                    page = 1;
                }
            }

            // Lấy tất cả danh mục và áp dụng filter
            List<Category> allCategories = categoryDAO.getAll();
            List<Category> filteredCategories = new ArrayList<>(allCategories);

            // Áp dụng bộ lọc tìm kiếm
            if (searchQuery != null && !searchQuery.trim().isEmpty()) {
                filteredCategories.removeIf(c -> 
                    !c.getName().toLowerCase().contains(searchQuery.toLowerCase()));
            }

            // Áp dụng bộ lọc trạng thái
            if (statusFilter != null && !statusFilter.isEmpty()) {
                filteredCategories.removeIf(c -> 
                    !c.getStatus().equals(statusFilter));
            }

            // Áp dụng sắp xếp theo cột
            if (sortField != null && !sortField.isEmpty()) {
                Comparator<Category> comparator = null;
                
                switch (sortField) {
                    case "name":
                        comparator = Comparator.comparing(Category::getName, String.CASE_INSENSITIVE_ORDER);
                        break;
                    case "parent_id":
                        comparator = Comparator.comparing(
                            c -> c.getParentName() != null ? c.getParentName() : "", 
                            String.CASE_INSENSITIVE_ORDER
                        );
                        break;
                    case "level":
                        comparator = Comparator.comparingInt(Category::getLevel);
                        break;
                    case "status":
                        comparator = Comparator.comparing(Category::getStatus, String.CASE_INSENSITIVE_ORDER);
                        break;
                    default:
                        comparator = Comparator.comparingInt(Category::getId);
                        break;
                }
                
                // Đảo ngược thứ tự nếu là desc
                if ("desc".equals(sortDir)) {
                    comparator = comparator.reversed();
                }
                
                filteredCategories.sort(comparator);
            }

            // Tính toán phân trang
            int totalCategories = filteredCategories.size();
            int totalPages = (int) Math.ceil((double) totalCategories / PAGE_SIZE);

            // Điều chỉnh page nếu cần
            if (page < 1) page = 1;
            if (page > totalPages && totalPages > 0) page = totalPages;

            // Lấy danh sách cho trang hiện tại
            int startIndex = (page - 1) * PAGE_SIZE;
            int endIndex = Math.min(startIndex + PAGE_SIZE, totalCategories);
            List<Category> pagedCategories = startIndex < totalCategories ?
                filteredCategories.subList(startIndex, endIndex) : 
                new ArrayList<>();

            // Set attributes
            request.setAttribute("categories", pagedCategories);
            request.setAttribute("currentPage", page);
            request.setAttribute("totalPages", totalPages);
            request.setAttribute("pageSize", PAGE_SIZE);
            request.setAttribute("totalCategories", totalCategories);
            request.setAttribute("searchQuery", searchQuery);
            request.setAttribute("statusFilter", statusFilter);
            request.setAttribute("sortField", sortField);
            request.setAttribute("sortDir", sortDir);

            // Forward to JSP
            request.getRequestDispatcher("categorylists.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
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
        response.sendRedirect(request.getContextPath() + "/categorylists");
    }
private void updateChildCategoriesStatus(CategoryDAO categoryDAO, int parentId, String status) {
        List<Category> children = categoryDAO.getChildCategories(parentId);
        for (Category child : children) {
            child.setStatus(status);
            categoryDAO.updateCategory(child);
            
            // Recursively update all descendants
            updateChildCategoriesStatus(categoryDAO, child.getId(), status);
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
