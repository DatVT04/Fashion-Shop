package entity;

import java.math.BigDecimal;

public class CustomerSpendData {
    private String fullName;
    private int totalPurchases;
    private BigDecimal totalSpend;
    
    public String getFullName() {
        return fullName;
    }
    
    public void setFullName(String fullName) {
        this.fullName = fullName;
    }
    
    public int getTotalPurchases() {
        return totalPurchases;
    }
    
    public void setTotalPurchases(int totalPurchases) {
        this.totalPurchases = totalPurchases;
    }
    
    public BigDecimal getTotalSpend() {
        return totalSpend;
    }
    
    public void setTotalSpend(BigDecimal totalSpend) {
        this.totalSpend = totalSpend;
    }
}