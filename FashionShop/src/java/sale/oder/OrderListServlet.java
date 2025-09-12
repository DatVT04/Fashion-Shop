/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package sale.oder;

import DAO.OrderDAO;
import entity.Order;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author tphon
 */
@WebServlet(name = "OrderListServlet", urlPatterns = {"/sale/orderlist"})
public class OrderListServlet extends HttpServlet {

    private OrderDAO orderDAO = new OrderDAO();
    private static final int RECORDS_PER_PAGE = 10;

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
            out.println("<title>Servlet OrderListServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OrderListServlet at " + request.getContextPath() + "</h1>");
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
            // Lấy tham số từ request
            String dateFrom = request.getParameter("dateFrom");
            String dateTo = request.getParameter("dateTo");
            String customerName = request.getParameter("customerName");
            String status = request.getParameter("status");
            String keyword = request.getParameter("keyword");
            int page = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
            String sortField = request.getParameter("sortField");
            String sortDir = request.getParameter("sortDir");

            // Mặc định sắp xếp theo created_at nếu không có tham số
            if (sortField == null || sortField.isEmpty()) {
                sortField = "created_at";
            }
            if (sortDir == null || sortDir.isEmpty()) {
                sortDir = "desc";
            }

            // Xây dựng truy vấn SQL
            StringBuilder sql = new StringBuilder(
                    "SELECT o.*, p.payment_method, p.payment_status "
                    + "FROM orders o LEFT JOIN payments p ON o.id = p.order_id WHERE 1=1"
            );
            List<Object> params = new ArrayList<>();

            // Các điều kiện lọc giữ nguyên
            if (dateFrom != null && !dateFrom.isEmpty()) {
                sql.append(" AND o.created_at >= ?");
                params.add(dateFrom + " 00:00:00");
            }
            if (dateTo != null && !dateTo.isEmpty()) {
                sql.append(" AND o.created_at <= ?");
                params.add(dateTo + " 23:59:59");
            }
            if (customerName != null && !customerName.isEmpty()) {
                sql.append(" AND o.recipient_name LIKE ?");
                params.add("%" + customerName + "%");
            }
            if (status != null && !status.isEmpty() && !status.equals("all")) {
                sql.append(" AND o.status = ?");
                params.add(status);
            }
            if (keyword != null && !keyword.isEmpty()) {
                sql.append(" AND (o.notes LIKE ? OR o.recipient_name LIKE ? OR o.recipient_email LIKE ?)");
                params.add("%" + keyword + "%");
                params.add("%" + keyword + "%");
                params.add("%" + keyword + "%");
            }

            // Đếm tổng số bản ghi
            int totalRecords = orderDAO.getTotalFilteredRecords(sql.toString(), params);

            // Phân trang và sắp xếp
            int totalPages = (int) Math.ceil(totalRecords * 1.0 / RECORDS_PER_PAGE);
            int offset = (page - 1) * RECORDS_PER_PAGE;

            // Ánh xạ sortField từ JSP sang cột trong cơ sở dữ liệu
            String dbSortField = sortField.equals("orderDate") ? "created_at"
                    : sortField.equals("recipientName") ? "recipient_name"
                    : sortField.equals("recipientEmail") ? "recipient_email"
                    : sortField.equals("total") ? "total"
                    : sortField.equals("status") ? "status" : "created_at";

            sql.append(" ORDER BY ").append(dbSortField).append(" ").append(sortDir);
            sql.append(" OFFSET ? ROWS FETCH NEXT ? ROWS ONLY");
            params.add(offset);
            params.add(RECORDS_PER_PAGE);

            // Lấy danh sách đơn hàng
            List<Order> orders = orderDAO.getOrdersWithFilters(sql.toString(), params);
//            System.out.println(orders.get(0).getItems());
            // Gán thuộc tính cho JSP
            request.setAttribute("orders", orders);
            request.setAttribute("currentPage", page);
            request.setAttribute("totalPages", totalPages);
            request.setAttribute("totalItems", totalRecords);
            request.setAttribute("dateFrom", dateFrom);
            request.setAttribute("dateTo", dateTo);
            request.setAttribute("customerName", customerName);
            request.setAttribute("status", status);
            request.setAttribute("keyword", keyword);
            request.setAttribute("sortField", sortField); // Thêm để JSP biết cột đang sắp xếp
            request.setAttribute("sortDir", sortDir);     // Thêm để JSP biết hướng sắp xếp

            request.getRequestDispatcher("/sale/orderList.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/error/error.jsp");
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
