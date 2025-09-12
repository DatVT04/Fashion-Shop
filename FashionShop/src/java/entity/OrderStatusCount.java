/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;
import java.math.BigDecimal;
import java.time.LocalDate;
/**
 *
 * @author DELL
 */
public class OrderStatusCount {
    private LocalDate orderDate;
    private int pendingPayCount;
    private int pendingCount;
    private int processingCount;
    private int shippingCount;
    private int completedCount;
    private int returnedCount;
    private int cancelledCount;
    
    public OrderStatusCount() {
        this.pendingPayCount = 0;
        this.pendingCount = 0;
        this.processingCount = 0;
        this.shippingCount = 0;
        this.completedCount = 0;
        this.returnedCount = 0;
        this.cancelledCount = 0;
    }
    
    // Getters and Setters
    public LocalDate getOrderDate() {
        return orderDate;
    }
    
    public void setOrderDate(LocalDate orderDate) {
        this.orderDate = orderDate;
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
    
    public int getTotalCount() {
        return pendingPayCount + pendingCount + processingCount + shippingCount + 
               completedCount + returnedCount + cancelledCount;
    }
}