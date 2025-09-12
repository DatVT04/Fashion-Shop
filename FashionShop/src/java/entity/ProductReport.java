package entity;

import java.math.BigDecimal;

/**
 *
 * @author VuxD4t
 */
public class ProductReport {
    private int id;
    private String title;  // Changed from name to match database
    private int categoryId;
    private String categoryName;
    private BigDecimal originalPrice;
    private BigDecimal salePrice;
    private String status;
    private String createdAt;
    
    public ProductReport() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }
    
    // For backward compatibility with JSP
    public String getName() {
        return title;
    }
    
    public void setName(String name) {
        this.title = name;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public BigDecimal getOriginalPrice() {
        return originalPrice;
    }

    public void setOriginalPrice(BigDecimal originalPrice) {
        this.originalPrice = originalPrice;
    }

    public BigDecimal getSalePrice() {
        return salePrice;
    }

    public void setSalePrice(BigDecimal salePrice) {
        this.salePrice = salePrice;
    }
    
    // For backward compatibility with JSP
    public BigDecimal getPrice() {
        return originalPrice;
    }
    
    public void setPrice(BigDecimal price) {
        this.originalPrice = price;
    }
    
    // Added for JSP compatibility 
    public int getStockQuantity() {
        return 0; // This field doesn't exist in database, return default value
    }
    
    public void setStockQuantity(int stockQuantity) {
        // This method will be empty since the field doesn't exist in database
    }
    
    // Added for JSP compatibility
    public String getSku() {
        return ""; // This field doesn't exist in database, return empty string
    }
    
    public void setSku(String sku) {
        // This method will be empty since the field doesn't exist in database
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }
}