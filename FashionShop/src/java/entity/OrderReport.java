/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.math.BigDecimal;

/**
 *
 * @author VuxD4t
 */
public class OrderReport {

    private String status;
    private int orderCount;
    private BigDecimal totalAmount;
    private BigDecimal actualRevenue;
    private BigDecimal totalDiscount;
    private int discountedOrderCount;

    // Getters and Setters
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getOrderCount() {
        return orderCount;
    }

    public void setOrderCount(int orderCount) {
        this.orderCount = orderCount;
    }

    public BigDecimal getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(BigDecimal totalAmount) {
        this.totalAmount = totalAmount;
    }

    public BigDecimal getActualRevenue() {
        return actualRevenue;
    }

    public void setActualRevenue(BigDecimal actualRevenue) {
        this.actualRevenue = actualRevenue;
    }

    public BigDecimal getTotalDiscount() {
        return totalDiscount;
    }

    public void setTotalDiscount(BigDecimal totalDiscount) {
        this.totalDiscount = totalDiscount;
    }

    public int getDiscountedOrderCount() {
        return discountedOrderCount;
    }

    public void setDiscountedOrderCount(int discountedOrderCount) {
        this.discountedOrderCount = discountedOrderCount;
    }
}
