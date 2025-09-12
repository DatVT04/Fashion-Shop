package admin;

import DAO.AdminReportDAO;
import entity.UserReport;
import entity.OrderReport;
import entity.ProductInventoryReport;
import entity.ProductReport;
import entity.UserRoleReport;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;

@WebServlet(name = "AdminReportServlet", urlPatterns = {"/admin/report"})
public class AdminReportServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        AdminReportDAO reportDAO = new AdminReportDAO();

        // Get user role report data
        List<UserRoleReport> userRoleReports = reportDAO.getUserRoleReports();
        request.setAttribute("userRoleReports", userRoleReports);
        request.setAttribute("userCount", userRoleReports.stream().mapToInt(UserRoleReport::getTotalUsers).sum());

        // Get order report data
        String orderStatusFilter = request.getParameter("orderStatus") != null ? request.getParameter("orderStatus") : "all";
        List<OrderReport> orderReports = reportDAO.getOrderReports(orderStatusFilter);
        request.setAttribute("orderReports", orderReports);
        request.setAttribute("orderStatusFilter", orderStatusFilter);

        // Calculate totals for order report footer
        int orderReportTotalOrders = orderReports.stream().mapToInt(OrderReport::getOrderCount).sum();
        BigDecimal orderReportTotalAmount = orderReports.stream()
                .map(OrderReport::getTotalAmount)
                .reduce(BigDecimal.ZERO, BigDecimal::add);
        BigDecimal orderReportTotalActualRevenue = orderReports.stream()
                .map(OrderReport::getActualRevenue)
                .reduce(BigDecimal.ZERO, BigDecimal::add);
        BigDecimal orderReportTotalDiscount = orderReports.stream()
                .map(OrderReport::getTotalDiscount)
                .reduce(BigDecimal.ZERO, BigDecimal::add);
        int orderReportTotalDiscountedOrders = orderReports.stream().mapToInt(OrderReport::getDiscountedOrderCount).sum();

        request.setAttribute("orderReportTotalOrders", orderReportTotalOrders);
        request.setAttribute("orderReportTotalAmount", orderReportTotalAmount);
        request.setAttribute("orderReportTotalActualRevenue", orderReportTotalActualRevenue);
        request.setAttribute("orderReportTotalDiscount", orderReportTotalDiscount);
        request.setAttribute("orderReportTotalDiscountedOrders", orderReportTotalDiscountedOrders);

        // Get product inventory report data
        String productStatusFilter = request.getParameter("productStatus") != null ? request.getParameter("productStatus") : "all";
        List<ProductInventoryReport> productInventoryReports = reportDAO.getProductInventoryReports(productStatusFilter);
        request.setAttribute("productInventoryReports", productInventoryReports);
        request.setAttribute("productCount", productInventoryReports.stream().mapToInt(ProductInventoryReport::getTotalProducts).sum());

        // Tính tổng cho footer
        int totalStock = productInventoryReports.stream().mapToInt(ProductInventoryReport::getTotalStock).sum();
        int totalLowStockCount = productInventoryReports.stream().mapToInt(ProductInventoryReport::getLowStockCount).sum();
        int totalSoldQuantity = productInventoryReports.stream().mapToInt(ProductInventoryReport::getTotalSoldQuantity).sum();
        BigDecimal totalRevenue = productInventoryReports.stream()
                .map(ProductInventoryReport::getTotalRevenue)
                .reduce(BigDecimal.ZERO, BigDecimal::add);
        int totalBestSellerCount = productInventoryReports.stream().mapToInt(ProductInventoryReport::getBestSellerCount).sum();

        request.setAttribute("totalStock", totalStock);
        request.setAttribute("totalLowStockCount", totalLowStockCount);
        request.setAttribute("totalSoldQuantity", totalSoldQuantity);
        request.setAttribute("productTotalRevenue", totalRevenue); // Instead of "totalRevenue"
        request.setAttribute("totalBestSellerCount", totalBestSellerCount);

        // Get summary statistics
        request.setAttribute("userSummary", reportDAO.getUserSummary());
        request.setAttribute("orderSummary", reportDAO.getOrderSummary());
        request.setAttribute("productSummary", reportDAO.getProductSummary());

        // Calculate totals from userRoleReports
        BigDecimal userRoleTotalRevenue = userRoleReports.stream()
                .map(UserRoleReport::getTotalRevenue)
                .reduce(BigDecimal.ZERO, BigDecimal::add);
        int userRoleTotalOrders = userRoleReports.stream()
                .mapToInt(UserRoleReport::getTotalOrders)
                .sum();
        int userRoleTotalActive = userRoleReports.stream()
                .mapToInt(UserRoleReport::getActiveCount)
                .sum();
        int userRoleTotalInactive = userRoleReports.stream()
                .mapToInt(UserRoleReport::getInactiveCount)
                .sum();
        BigDecimal userRoleAvgOrderValue = userRoleTotalOrders > 0
                ? userRoleTotalRevenue.divide(BigDecimal.valueOf(userRoleTotalOrders), 2, BigDecimal.ROUND_HALF_UP)
                : BigDecimal.ZERO;

        // Set attributes for user role report
        request.setAttribute("userRoleTotalRevenue", userRoleTotalRevenue);
        request.setAttribute("userRoleTotalOrders", userRoleTotalOrders);
        request.setAttribute("userRoleTotalActive", userRoleTotalActive);
        request.setAttribute("userRoleTotalInactive", userRoleTotalInactive);
        request.setAttribute("userRoleAvgOrderValue", userRoleAvgOrderValue);

        // Forward to the report JSP
        request.getRequestDispatcher("/admin/report.jsp").forward(request, response);
    }
}
