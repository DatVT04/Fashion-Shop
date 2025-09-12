package entity;

import java.util.Date;

/**
 * Entity class representing order history records from order_history table
 */
public class OrderHistory {
    private int id;
    private int orderId;
    private int updatedBy;
    private String status;
    private String notes;
    private Date updatedAt;
    
    // Thêm để hiển thị thông tin người cập nhật (không có trong database)
    private String updaterName;
    
    /**
     * Default constructor
     */
    public OrderHistory() {
    }
    
    /**
     * Parameterized constructor
     * 
     * @param id the history record ID
     * @param orderId the order ID
     * @param updatedBy the user ID who updated the order
     * @param status the new status
     * @param notes additional notes about the update
     * @param updatedAt the timestamp of the update
     */
    public OrderHistory(int id, int orderId, int updatedBy, String status, String notes, Date updatedAt) {
        this.id = id;
        this.orderId = orderId;
        this.updatedBy = updatedBy;
        this.status = status;
        this.notes = notes;
        this.updatedAt = updatedAt;
    }
    
    /**
     * @return the ID of the history record
     */
    public int getId() {
        return id;
    }
    
    /**
     * @param id the ID to set
     */
    public void setId(int id) {
        this.id = id;
    }
    
    /**
     * @return the order ID
     */
    public int getOrderId() {
        return orderId;
    }
    
    /**
     * @param orderId the order ID to set
     */
    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }
    
    /**
     * @return the ID of the user who updated the order
     */
    public int getUpdatedBy() {
        return updatedBy;
    }
    
    /**
     * @param updatedBy the user ID to set
     */
    public void setUpdatedBy(int updatedBy) {
        this.updatedBy = updatedBy;
    }
    
    /**
     * @return the name of the user who updated the order
     */
    public String getUpdaterName() {
        return updaterName;
    }
    
    /**
     * @param updaterName the user name to set
     */
    public void setUpdaterName(String updaterName) {
        this.updaterName = updaterName;
    }
    
    /**
     * @return the status of the order after update
     */
    public String getStatus() {
        return status;
    }
    
    /**
     * @param status the status to set
     */
    public void setStatus(String status) {
        this.status = status;
    }
    
    /**
     * @return additional notes about the update
     */
    public String getNotes() {
        return notes;
    }
    
    /**
     * @param notes the notes to set
     */
    public void setNotes(String notes) {
        this.notes = notes;
    }
    
    /**
     * @return the timestamp of the update
     */
    public Date getUpdatedAt() {
        return updatedAt;
    }
    
    /**
     * @param updatedAt the timestamp to set
     */
    public void setUpdatedAt(Date updatedAt) {
        this.updatedAt = updatedAt;
    }
    
    @Override
    public String toString() {
        return "OrderHistory{" +
                "id=" + id +
                ", orderId=" + orderId +
                ", updatedBy=" + updatedBy +
                ", status='" + status + '\'' +
                ", notes='" + notes + '\'' +
                ", updatedAt=" + updatedAt +
                '}';
    }
}