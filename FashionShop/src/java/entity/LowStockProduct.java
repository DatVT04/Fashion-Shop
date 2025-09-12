package entity;

public class LowStockProduct {
    private int productId;
    private String productName;
    private String size;
    private String color;
    private int stockQuantity;

    // Thêm constructor không tham số
    public LowStockProduct() {
        // Constructor không tham số
    }

    public LowStockProduct(int productId, String productName, String size, String color, int stockQuantity) {
        this.productId = productId;
        this.productName = productName;
        this.size = size;
        this.color = color;
        this.stockQuantity = stockQuantity;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public int getStockQuantity() {
        return stockQuantity;
    }

    public void setStockQuantity(int stockQuantity) {
        this.stockQuantity = stockQuantity;
    }
}