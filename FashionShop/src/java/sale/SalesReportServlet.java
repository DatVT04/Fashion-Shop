package sale;

import DAO.SalesReportDAO;
import entity.SalesReport;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(name = "SalesReportServlet", urlPatterns = {"/sale/report"})
public class SalesReportServlet extends HttpServlet {

    private SalesReportDAO salesReportDAO;

    @Override
    public void init() throws ServletException {
        salesReportDAO = new SalesReportDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date startDate, endDate;

        try {

            String startParam = request.getParameter("startDate");
            String endParam = request.getParameter("endDate");

            if (startParam != null && endParam != null) {
                startDate = sdf.parse(startParam);
                endDate = sdf.parse(endParam);
            } else {

                java.util.Calendar cal = java.util.Calendar.getInstance();
                cal.set(java.util.Calendar.DAY_OF_MONTH, 1);
                startDate = cal.getTime();

                cal.set(java.util.Calendar.DAY_OF_MONTH, cal.getActualMaximum(java.util.Calendar.DAY_OF_MONTH));
                endDate = cal.getTime();
            }

            SalesReport report = salesReportDAO.generateSalesReport(startDate, endDate);

            request.setAttribute("salesReport", report);
            request.setAttribute("startDate", sdf.format(startDate));
            request.setAttribute("endDate", sdf.format(endDate));

            request.getRequestDispatcher("/sale/salereport.jsp").forward(request, response);

        } catch (ParseException e) {
            throw new ServletException("Invalid date format", e);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
