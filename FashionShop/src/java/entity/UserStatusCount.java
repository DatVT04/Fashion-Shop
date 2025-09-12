package entity;

import java.math.BigDecimal;

public class UserStatusCount {
    private int totalUsers;
    private int activeCount;
    private int inactiveCount;
    private int pendingCount;
    
    public int getTotalUsers() {
        return totalUsers;
    }
    
    public void setTotalUsers(int totalUsers) {
        this.totalUsers = totalUsers;
    }
    
    public int getActiveCount() {
        return activeCount;
    }
    
    public void setActiveCount(int activeCount) {
        this.activeCount = activeCount;
    }
    
    public int getInactiveCount() {
        return inactiveCount;
    }
    
    public void setInactiveCount(int inactiveCount) {
        this.inactiveCount = inactiveCount;
    }
    
    public int getPendingCount() {
        return pendingCount;
    }
    
    public void setPendingCount(int pendingCount) {
        this.pendingCount = pendingCount;
    }
}