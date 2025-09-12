/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.math.BigDecimal;
import java.time.LocalDateTime;
/**
 *
 * @author VuxD4t
 */
public class Customer {
    private int id;
    private Integer userId;
    private String customerType;
    private String email;
    private String fullName;
    private String gender;
    private String mobile;
    private String address;
    private int totalPurchases;
    private BigDecimal totalSpend;
    private Integer updatedBy;
    private LocalDateTime updatedAt;
    
    // Constructors
    public Customer() {
    }
    
    public Customer(int id, Integer userId, String customerType, String email, String fullName, 
                    String gender, String mobile, String address, int totalPurchases, 
                    BigDecimal totalSpend, Integer updatedBy, LocalDateTime updatedAt) {
        this.id = id;
        this.userId = userId;
        this.customerType = customerType;
        this.email = email;
        this.fullName = fullName;
        this.gender = gender;
        this.mobile = mobile;
        this.address = address;
        this.totalPurchases = totalPurchases;
        this.totalSpend = totalSpend;
        this.updatedBy = updatedBy;
        this.updatedAt = updatedAt;
    }
    
    // Getters and Setters
    public int getId() {
        return id;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    
    public Integer getUserId() {
        return userId;
    }
    
    public void setUserId(Integer userId) {
        this.userId = userId;
    }
    
    public String getCustomerType() {
        return customerType;
    }
    
    public void setCustomerType(String customerType) {
        this.customerType = customerType;
    }
    
    public String getEmail() {
        return email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }
    
    public String getFullName() {
        return fullName;
    }
    
    public void setFullName(String fullName) {
        this.fullName = fullName;
    }
    
    public String getGender() {
        return gender;
    }
    
    public void setGender(String gender) {
        this.gender = gender;
    }
    
    public String getMobile() {
        return mobile;
    }
    
    public void setMobile(String mobile) {
        this.mobile = mobile;
    }
    
    public String getAddress() {
        return address;
    }
    
    public void setAddress(String address) {
        this.address = address;
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
    
    public Integer getUpdatedBy() {
        return updatedBy;
    }
    
    public void setUpdatedBy(Integer updatedBy) {
        this.updatedBy = updatedBy;
    }
    
    public LocalDateTime getUpdatedAt() {
        return updatedAt;
    }
    
    public void setUpdatedAt(LocalDateTime updatedAt) {
        this.updatedAt = updatedAt;
    }
}
