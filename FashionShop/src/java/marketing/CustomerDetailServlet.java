package marketing;

import DAO.CustomerDAO;
import entity.Customer;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "CustomerDetailServlet", urlPatterns = {"/marketing/customerdetail/*"})
public class CustomerDetailServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String pathInfo = request.getPathInfo();

        if (pathInfo == null || pathInfo.equals("/")) {
            response.sendRedirect(request.getContextPath() + "/marketing/customerlist");
            return;
        }

        String[] pathParts = pathInfo.split("/");
        String action = pathParts[1]; // view, edit, delete, etc.

        switch (action) {
            case "view":
                viewCustomerDetail(request, response);
                break;
            case "edit":
                viewCustomerDetail(request, response);  // Chỉnh sửa trực tiếp trong trang detail
                break;
            case "delete":
                deleteCustomer(request, response);
                break;
            default:
                response.sendRedirect(request.getContextPath() + "/marketing/customerlist");
                break;
        }
    }

    private void viewCustomerDetail(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String customerId = request.getParameter("id");
            if (customerId == null || customerId.trim().isEmpty()) {
                response.sendRedirect(request.getContextPath() + "/marketing/customerlist");
                return;
            }

            int id = Integer.parseInt(customerId);
            CustomerDAO customerDAO = new CustomerDAO();
            Customer customer = customerDAO.getCustomerById(id);

            if (customer == null) {
                response.sendRedirect(request.getContextPath() + "/marketing/customerlist");
                return;
            }

            request.setAttribute("customer", customer);
            request.getRequestDispatcher("/marketing/customerdetail.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/marketing/customerlist");
        }
    }

    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int customerId = Integer.parseInt(request.getParameter("id"));
            CustomerDAO customerDAO = new CustomerDAO();
            
            if (customerDAO.deleteCustomer(customerId)) {
                // Thêm thông báo thành công
                request.getSession().setAttribute("successMessage", "Xóa khách hàng thành công!");
            } else {
                request.getSession().setAttribute("errorMessage", "Không thể xóa khách hàng!");
            }
            
            response.sendRedirect(request.getContextPath() + "/marketing/customerlist");
        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/marketing/customerlist");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String pathInfo = request.getPathInfo();
        if (pathInfo == null || pathInfo.equals("/")) {
            response.sendRedirect(request.getContextPath() + "/marketing/customerlist");
            return;
        }

        String[] pathParts = pathInfo.split("/");
        String action = pathParts[1];

        if ("edit".equals(action)) {
            updateCustomer(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/marketing/customerlist");
        }
    }

    private void updateCustomer(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Lấy thông tin từ form
            int customerId = Integer.parseInt(request.getParameter("id"));
            String fullName = request.getParameter("fullName");
            String email = request.getParameter("email");
            String mobile = request.getParameter("mobile");
            String gender = request.getParameter("gender");
//            String address = request.getParameter("address");
            String customerType = request.getParameter("customerType");

            // Lấy thông tin hiện tại từ database để giữ nguyên các trường không thay đổi
            CustomerDAO customerDAO = new CustomerDAO();
            Customer existingCustomer = customerDAO.getCustomerById(customerId);
            
            if (existingCustomer == null) {
                request.getSession().setAttribute("errorMessage", "Không tìm thấy khách hàng!");
                response.sendRedirect(request.getContextPath() + "/marketing/customerlist");
                return;
            }

            // Tạo đối tượng Customer với thông tin mới
            Customer customer = new Customer();
            customer.setId(customerId);
            customer.setFullName(fullName);
            customer.setEmail(email);
            customer.setMobile(mobile);
            customer.setGender(gender);
//            customer.setAddress(address);
            customer.setCustomerType(customerType);
            
            // Giữ nguyên các thông tin không thay đổi
            customer.setUserId(existingCustomer.getUserId());
            customer.setTotalPurchases(existingCustomer.getTotalPurchases());
            customer.setTotalSpend(existingCustomer.getTotalSpend());

            // Cập nhật customer trong database
            if (customerDAO.updateCustomer(customer)) {
                request.getSession().setAttribute("successMessage", "Cập nhật thông tin khách hàng thành công!");
                // Chuyển hướng về trang chi tiết khách hàng sau khi cập nhật
                response.sendRedirect(request.getContextPath() + "/marketing/customerdetail/view?id=" + customerId);
            } else {
                request.getSession().setAttribute("errorMessage", "Cập nhật thông tin khách hàng thất bại!");
                response.sendRedirect(request.getContextPath() + "/marketing/customerdetail/view?id=" + customerId);
            }

        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/marketing/customerlist");
        }
    }
}