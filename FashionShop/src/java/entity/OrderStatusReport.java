package entity;
import java.math.BigDecimal;
/**
 *
 * @author VuxD4t
 */
public class OrderStatusReport {
    private int pendingPayCount;
    private int pendingCount;
    private int processingCount;
    private int shippingCount;
    private int completedCount;
    private int returnedCount;
    private int cancelledCount;
    private int totalOrders;
    
    private BigDecimal pendingPayAmount = BigDecimal.ZERO;
    private BigDecimal pendingAmount = BigDecimal.ZERO;
    private BigDecimal processingAmount = BigDecimal.ZERO;
    private BigDecimal shippingAmount = BigDecimal.ZERO;
    private BigDecimal completedAmount = BigDecimal.ZERO;
    private BigDecimal returnedAmount = BigDecimal.ZERO;
    private BigDecimal cancelledAmount = BigDecimal.ZERO;
    private BigDecimal totalAmount = BigDecimal.ZERO;
    
    public OrderStatusReport() {
    }

    public int getPendingPayCount() {
        return pendingPayCount;
    }

    public void setPendingPayCount(int pendingPayCount) {
        this.pendingPayCount = pendingPayCount;
    }
    
    public int getPendingCount() {
        return pendingCount;
    }
    
    public void setPendingCount(int pendingCount) {
        this.pendingCount = pendingCount;
    }
    
    public int getProcessingCount() {
        return processingCount;
    }
    
    public void setProcessingCount(int processingCount) {
        this.processingCount = processingCount;
    }
    
    public int getShippingCount() {
        return shippingCount;
    }
    
    public void setShippingCount(int shippingCount) {
        this.shippingCount = shippingCount;
    }
    
    public int getCompletedCount() {
        return completedCount;
    }
    
    public void setCompletedCount(int completedCount) {
        this.completedCount = completedCount;
    }
    
    public int getReturnedCount() {
        return returnedCount;
    }
    
    public void setReturnedCount(int returnedCount) {
        this.returnedCount = returnedCount;
    }
    
    public int getCancelledCount() {
        return cancelledCount;
    }
    
    public void setCancelledCount(int cancelledCount) {
        this.cancelledCount = cancelledCount;
    }
    
    public int getTotalOrders() {
        return totalOrders;
    }
    
    public void setTotalOrders(int totalOrders) {
        this.totalOrders = totalOrders;
    }

    public BigDecimal getPendingPayAmount() {
        return pendingPayAmount;
    }

    public void setPendingPayAmount(BigDecimal pendingPayAmount) {
        this.pendingPayAmount = pendingPayAmount;
    }
    
    public BigDecimal getPendingAmount() {
        return pendingAmount;
    }
    
    public void setPendingAmount(BigDecimal pendingAmount) {
        this.pendingAmount = pendingAmount;
    }
    
    public BigDecimal getProcessingAmount() {
        return processingAmount;
    }
    
    public void setProcessingAmount(BigDecimal processingAmount) {
        this.processingAmount = processingAmount;
    }
    
    public BigDecimal getShippingAmount() {
        return shippingAmount;
    }
    
    public void setShippingAmount(BigDecimal shippingAmount) {
        this.shippingAmount = shippingAmount;
    }
    
    public BigDecimal getCompletedAmount() {
        return completedAmount;
    }
    
    public void setCompletedAmount(BigDecimal completedAmount) {
        this.completedAmount = completedAmount;
    }
    
    public BigDecimal getReturnedAmount() {
        return returnedAmount;
    }
    
    public void setReturnedAmount(BigDecimal returnedAmount) {
        this.returnedAmount = returnedAmount;
    }
    
    public BigDecimal getCancelledAmount() {
        return cancelledAmount;
    }
    
    public void setCancelledAmount(BigDecimal cancelledAmount) {
        this.cancelledAmount = cancelledAmount;
    }
    
    public BigDecimal getTotalAmount() {
        return totalAmount;
    }
    
    public void setTotalAmount(BigDecimal totalAmount) {
        this.totalAmount = totalAmount;
    }
}