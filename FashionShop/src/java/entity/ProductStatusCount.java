package entity;

public class ProductStatusCount {
    private int totalProducts;
    private int activeCount;
    private int inactiveCount;
    private int eoStockCount;
    
    public int getTotalProducts() {
        return totalProducts;
    }
    
    public void setTotalProducts(int totalProducts) {
        this.totalProducts = totalProducts;
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
    
    public int getEoStockCount() {
        return eoStockCount;
    }
    
    public void setEoStockCount(int eoStockCount) {
        this.eoStockCount = eoStockCount;
    }
}