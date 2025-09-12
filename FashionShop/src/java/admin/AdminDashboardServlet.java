package admin;

import DAO.AdminDashboardDAO;
import entity.CategoryCount;
import entity.ProductStatusCount;
import entity.UserStatusCount;
import entity.CustomerSpendData;
import entity.TimeSeriesData;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import com.google.gson.Gson;

@WebServlet(name = "AdminDashboardServlet", urlPatterns = {"/admin/dashboard"})
public class AdminDashboardServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        AdminDashboardDAO dashboardDAO = new AdminDashboardDAO();
        
        // Get user statistics
        UserStatusCount userStatusCount = dashboardDAO.getUserStatusCounts();
        request.setAttribute("userStatusCount", userStatusCount);
        
        // Get category statistics
        List<CategoryCount> categoryData = dashboardDAO.getLevel1Categories();
        request.setAttribute("categoryData", categoryData);
        int totalCategories = dashboardDAO.getTotalCategories();
        request.setAttribute("totalCategories", totalCategories);
        
        // Convert category data to JSON for chart
        Gson gson = new Gson();
        String categoryDataJson = gson.toJson(categoryData);
        request.setAttribute("categoryDataJson", categoryDataJson);
        
        // Get product statistics
        ProductStatusCount productStatusCount = dashboardDAO.getProductStatusCounts();
        request.setAttribute("productStatusCount", productStatusCount);
        
        // Get customer spending statistics
        List<CustomerSpendData> topCustomers = dashboardDAO.getTopCustomersBySpend();
        request.setAttribute("topCustomers", topCustomers);
        
        CustomerSpendData totalCustomerStats = dashboardDAO.getTotalCustomerStats();
        request.setAttribute("totalCustomerStats", totalCustomerStats);
        
        // Get time-based data
        List<TimeSeriesData> monthlyProductAdditions = dashboardDAO.getMonthlyProductAdditions();
        request.setAttribute("monthlyProductAdditions", monthlyProductAdditions);
        String monthlyProductAdditionsJson = gson.toJson(monthlyProductAdditions);
        request.setAttribute("monthlyProductAdditionsJson", monthlyProductAdditionsJson);
        
        List<TimeSeriesData> monthlyOrderCounts = dashboardDAO.getMonthlyOrderCounts();
        request.setAttribute("monthlyOrderCounts", monthlyOrderCounts);
        String monthlyOrderCountsJson = gson.toJson(monthlyOrderCounts);
        request.setAttribute("monthlyOrderCountsJson", monthlyOrderCountsJson);
        
        // Forward to the dashboard JSP
        request.getRequestDispatcher("/admin/dashboard.jsp").forward(request, response);
    }
}