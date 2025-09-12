package utils;

import DAO.OrderDAO;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

@WebListener
public class OrderCancellationScheduler implements ServletContextListener {
    private ScheduledExecutorService scheduler;
    private OrderDAO orderDAO;

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        orderDAO = new OrderDAO();
        scheduler = Executors.newSingleThreadScheduledExecutor();
        
        // Chạy mỗi 24 giờ (có thể điều chỉnh thời gian)
        scheduler.scheduleAtFixedRate(() -> {
            try {
                orderDAO.checkAndCancelExpiredPendingPayOrders();
            } catch (Exception e) {
                System.out.println("Error in scheduled order cancellation: " + e.getMessage());
            }
        }, 0, 24, TimeUnit.HOURS);
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        if (scheduler != null && !scheduler.isShutdown()) {
            scheduler.shutdown();
        }
    }
}