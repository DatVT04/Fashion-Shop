package marketing;

import DAO.CustomerDAO;
import entity.Customer;
import java.io.IOException;
import java.util.List;
import java.util.ArrayList;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/marketing/customerlist")
public class CustomerListServlet extends HttpServlet {
    private CustomerDAO customerDAO;
    private static final int RECORDS_PER_PAGE = 10;

    @Override
    public void init() throws ServletException {
        customerDAO = new CustomerDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Get parameters from request
            String customerType = request.getParameter("customerType");
            String gender = request.getParameter("gender");
            String searchTerm = request.getParameter("search");
            String sortField = request.getParameter("sortField");
            String sortDir = request.getParameter("sortDir");
            
            // Handle pagination
            int page = 1;
            if (request.getParameter("page") != null) {
                page = Integer.parseInt(request.getParameter("page"));
            }
            
            // Build SQL query for both filtered and export data
            StringBuilder sql = new StringBuilder("SELECT * FROM customer_contact_history WHERE 1=1");
            List<Object> params = new ArrayList<>();
            
            // Add filter conditions
            if (customerType != null && !customerType.isEmpty()) {
                sql.append(" AND customer_type = ?");
                params.add(customerType);
            }
            if (gender != null && !gender.isEmpty()) {
                sql.append(" AND gender = ?");
                params.add(gender);
            }
            
            // Add search condition
            if (searchTerm != null && !searchTerm.isEmpty()) {
                sql.append(" AND (full_name LIKE ? OR email LIKE ? OR mobile LIKE ?)");
                String searchPattern = "%" + searchTerm + "%";
                params.add(searchPattern);
                params.add(searchPattern);
                params.add(searchPattern);
                
            }
            
            // Add sorting
            if (sortField != null && !sortField.isEmpty()) {
                sql.append(" ORDER BY ").append(sortField);
                if ("desc".equals(sortDir)) {
                    sql.append(" DESC");
                } else {
                    sql.append(" ASC");
                }
            } else {
                sql.append(" ORDER BY id ASC");
            }

            // Save original SQL and params for export (without OFFSET and FETCH)
            StringBuilder exportSql = new StringBuilder(sql);
            List<Object> exportParams = new ArrayList<>(params);

            // Add pagination for display SQL
            int offset = (page - 1) * RECORDS_PER_PAGE;
            sql.append(" OFFSET ? ROWS FETCH NEXT ? ROWS ONLY");
            params.add(offset);
            params.add(RECORDS_PER_PAGE);

            // Execute query for current page
            List<Customer> customers = customerDAO.getCustomersByFilter(sql.toString(), params);
            int totalRecords = customerDAO.getTotalFilteredRecords(sql.toString(), params);
            int totalPages = (int) Math.ceil(totalRecords * 1.0 / RECORDS_PER_PAGE);

            // Get all filtered data (without pagination) for export
            List<Customer> allFilteredCustomers = customerDAO.getCustomersByFilter(exportSql.toString(), exportParams);

            // Save filtered list to session
            HttpSession session = request.getSession();
            session.setAttribute("filteredCustomers", allFilteredCustomers);

            // Set attributes for JSP
            request.setAttribute("customers", customers);
            request.setAttribute("currentPage", page);
            request.setAttribute("totalPages", totalPages);
            request.setAttribute("totalCustomers", totalRecords);
            request.setAttribute("customerType", customerType);
            request.setAttribute("gender", gender);
            request.setAttribute("search", searchTerm);
            request.setAttribute("sortField", sortField);
            request.setAttribute("sortDir", sortDir);

            // Forward to JSP page
            request.getRequestDispatcher("/marketing/customerlist.jsp").forward(request, response);
            
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/error/404.jsp");
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}