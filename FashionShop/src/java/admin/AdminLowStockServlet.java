package admin;

import DAO.AdminReportDAO;
import entity.LowStockProductReport; // Sử dụng class mới
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.google.gson.Gson;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminLowStockServlet", urlPatterns = {"/admin/low-stock-products"})
public class AdminLowStockServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        AdminReportDAO reportDAO = new AdminReportDAO();
        List<LowStockProductReport> lowStockProducts = reportDAO.getLowStockProducts();

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        Gson gson = new Gson();
        String json = gson.toJson(lowStockProducts);
        response.getWriter().write(json);
    }
}