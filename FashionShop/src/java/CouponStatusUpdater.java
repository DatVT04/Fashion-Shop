/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import DAO.CouponDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

/**
 *
 * @author nguye
 */
@WebServlet(name = "CouponStatusUpdater", urlPatterns = {"/couponStatusUpdater"}, loadOnStartup = 1)
public class CouponStatusUpdater extends HttpServlet {

    private ScheduledExecutorService scheduler;

    @Override
    public void init() throws ServletException {
        super.init();
        scheduler = Executors.newSingleThreadScheduledExecutor();
        scheduler.scheduleAtFixedRate(new CouponStatusTask(), 0, 1, TimeUnit.DAYS); // Chạy mỗi phút
    }

    @Override
    public void destroy() {
        super.destroy();
        if (scheduler != null && !scheduler.isShutdown()) {
            scheduler.shutdown();
        }
    }
}

class CouponStatusTask implements Runnable {

    private final CouponDAO couponDAO = new CouponDAO();

    @Override
    public void run() {
        try {
            couponDAO.updateCouponStatus(); // cập nhật trạng thái
            System.out.println("Checked and updated expired coupons at " + new java.util.Date());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
