package sale;

import DAO.OrderSaleDAO;
import entity.OrderStatusCount;
import entity.CategorySales;
import entity.DailySalesData;
import entity.PaymentMethodSales;
import entity.SalesOverview;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.List;
import java.math.BigDecimal;

@WebServlet(name = "SalesDashboardServlet", urlPatterns = {"/sale/dashboard"})
public class SaleDashboardServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        OrderSaleDAO orderDAO = new OrderSaleDAO();

        SalesOverview salesOverview = orderDAO.getSalesOverview();
        request.setAttribute("salesOverview", salesOverview);

        LocalDate endDate = LocalDate.now();
        LocalDate startDate = endDate.minusDays(6);

        String startDateStr = request.getParameter("startDate");
        String endDateStr = request.getParameter("endDate");

        if (startDateStr != null && !startDateStr.isEmpty()) {
            try {
                startDate = LocalDate.parse(startDateStr, DateTimeFormatter.ISO_DATE);
            } catch (DateTimeParseException e) {

            }
        }

        if (endDateStr != null && !endDateStr.isEmpty()) {
            try {
                endDate = LocalDate.parse(endDateStr, DateTimeFormatter.ISO_DATE);
            } catch (DateTimeParseException e) {

            }
        }

        request.setAttribute("sevenDaysAgo", endDate.minusDays(6).toString());
        request.setAttribute("today", endDate.toString());

        List<OrderStatusCount> orderStatusCounts = orderDAO.getOrderStatusCounts(startDate, endDate);
        request.setAttribute("orderStatusCounts", orderStatusCounts);

        List<CategorySales> categorySales = orderDAO.getSalesByCategory();
        request.setAttribute("categorySales", categorySales);

        BigDecimal totalCategoryAmount = BigDecimal.ZERO;
        for (CategorySales category : categorySales) {
            totalCategoryAmount = totalCategoryAmount.add(category.getTotalAmount());
        }
        request.setAttribute("totalCategoryAmount", totalCategoryAmount);

        List<DailySalesData> dailySalesData = orderDAO.getDailySalesData(startDate, endDate);
        request.setAttribute("dailySalesData", dailySalesData);
        List<PaymentMethodSales> paymentMethodSales = orderDAO.getSalesByPaymentMethod();
        request.setAttribute("paymentMethodSales", paymentMethodSales);

        BigDecimal totalPaymentAmount = BigDecimal.ZERO;
        for (PaymentMethodSales payment : paymentMethodSales) {
            totalPaymentAmount = totalPaymentAmount.add(payment.getTotalAmount());
        }
        request.setAttribute("totalPaymentAmount", totalPaymentAmount);
        request.getRequestDispatcher("/sale/saledashboard.jsp").forward(request, response);
    }
}
