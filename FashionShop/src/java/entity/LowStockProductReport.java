/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author VuxD4t
 */
public class LowStockProductReport {
    private int id;
    private String title;
    private String categoryName;
    private String size;
    private String color;
    private int stockQuantity;

    // Constructor không tham số
    public LowStockProductReport() {
    }

    // Constructor đầy đủ
    public LowStockProductReport(int id, String title, String categoryName, String size, String color, int stockQuantity) {
        this.id = id;
        this.title = title;
        this.categoryName = categoryName;
        this.size = size;
        this.color = color;
        this.stockQuantity = stockQuantity;
    }

    // Getters và Setters
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

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
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
