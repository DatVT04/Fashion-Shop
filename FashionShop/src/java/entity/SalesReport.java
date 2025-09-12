package entity;

import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class SalesReport {

    private int totalOrders;
    private BigDecimal totalRevenue;
    private BigDecimal averageOrderValue;
    private int totalCustomers;
    private int totalProducts;

    private Map<String, BigDecimal> dailyRevenue;
    private Map<String, BigDecimal> monthlyRevenue;
    private Map<String, Integer> ordersPerDay;
    private Map<String, Integer> ordersPerMonth;

    private List<ProductPerformance> topProducts;
    private Map<String, BigDecimal> revenueByCategoryMap;
    private Map<String, Integer> ordersByCategoryMap;

    private int newCustomers;
    private int returningCustomers;
    private Map<String, Integer> customersByGender;
    private List<CustomerPerformance> topCustomers;

    private Map<String, Integer> ordersByStatus;
    private double averageFulfillmentTime; // in hours

    private Date startDate;
    private Date endDate;

    public SalesReport() {

        this.totalOrders = 0;
        this.totalRevenue = BigDecimal.ZERO;
        this.averageOrderValue = BigDecimal.ZERO;
        this.totalCustomers = 0;
        this.totalProducts = 0;
        this.newCustomers = 0;
        this.returningCustomers = 0;
        this.averageFulfillmentTime = 0.0;
    }

    public SalesReport(int totalOrders, BigDecimal totalRevenue, BigDecimal averageOrderValue,
            int totalCustomers, int totalProducts, Map<String, BigDecimal> dailyRevenue,
            Map<String, BigDecimal> monthlyRevenue, Map<String, Integer> ordersPerDay,
            Map<String, Integer> ordersPerMonth, List<ProductPerformance> topProducts,
            Map<String, BigDecimal> revenueByCategoryMap, Map<String, Integer> ordersByCategoryMap,
            int newCustomers, int returningCustomers, Map<String, Integer> customersByGender,
            List<CustomerPerformance> topCustomers, Map<String, Integer> ordersByStatus,
            double averageFulfillmentTime, Date startDate, Date endDate) {
        this.totalOrders = totalOrders;
        this.totalRevenue = totalRevenue;
        this.averageOrderValue = averageOrderValue;
        this.totalCustomers = totalCustomers;
        this.totalProducts = totalProducts;
        this.dailyRevenue = dailyRevenue;
        this.monthlyRevenue = monthlyRevenue;
        this.ordersPerDay = ordersPerDay;
        this.ordersPerMonth = ordersPerMonth;
        this.topProducts = topProducts;
        this.revenueByCategoryMap = revenueByCategoryMap;
        this.ordersByCategoryMap = ordersByCategoryMap;
        this.newCustomers = newCustomers;
        this.returningCustomers = returningCustomers;
        this.customersByGender = customersByGender;
        this.topCustomers = topCustomers;
        this.ordersByStatus = ordersByStatus;
        this.averageFulfillmentTime = averageFulfillmentTime;
        this.startDate = startDate;
        this.endDate = endDate;
    }

    public static class ProductPerformance {

        private int productId;
        private String productName;
        private String category;
        private int totalQuantitySold;
        private BigDecimal totalRevenue;
        private Map<String, Integer> sizeDistribution;
        private Map<String, Integer> colorDistribution;
        private Map<String, Integer> variantDistribution = new HashMap<>();

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

        public String getCategory() {
            return category;
        }

        public void setCategory(String category) {
            this.category = category;
        }

        public int getTotalQuantitySold() {
            return totalQuantitySold;
        }

        public void setTotalQuantitySold(int totalQuantitySold) {
            this.totalQuantitySold = totalQuantitySold;
        }

        public BigDecimal getTotalRevenue() {
            return totalRevenue;
        }

        public void setTotalRevenue(BigDecimal totalRevenue) {
            this.totalRevenue = totalRevenue;
        }

        public Map<String, Integer> getSizeDistribution() {
            return sizeDistribution;
        }

        public void setSizeDistribution(Map<String, Integer> sizeDistribution) {
            this.sizeDistribution = sizeDistribution;
        }

        public Map<String, Integer> getColorDistribution() {
            return colorDistribution;
        }

        public void setColorDistribution(Map<String, Integer> colorDistribution) {
            this.colorDistribution = colorDistribution;
        }

        public Map<String, Integer> getVariantDistribution() {
            return variantDistribution;
        }

        public void setVariantDistribution(Map<String, Integer> variantDistribution) {
            this.variantDistribution = variantDistribution;
        }
    }

    public static class CustomerPerformance {

        private int userId;
        private String fullName;
        private String email;
        private String customerType;
        private int totalOrders;
        private BigDecimal totalSpend;
        private Date firstOrderDate;
        private Date lastOrderDate;

        public int getUserId() {
            return userId;
        }

        public void setUserId(int userId) {
            this.userId = userId;
        }

        public String getFullName() {
            return fullName;
        }

        public void setFullName(String fullName) {
            this.fullName = fullName;
        }

        public String getEmail() {
            return email;
        }

        public void setEmail(String email) {
            this.email = email;
        }

        public String getCustomerType() {
            return customerType;
        }

        public void setCustomerType(String customerType) {
            this.customerType = customerType;
        }

        public int getTotalOrders() {
            return totalOrders;
        }

        public void setTotalOrders(int totalOrders) {
            this.totalOrders = totalOrders;
        }

        public BigDecimal getTotalSpend() {
            return totalSpend;
        }

        public void setTotalSpend(BigDecimal totalSpend) {
            this.totalSpend = totalSpend;
        }

        public Date getFirstOrderDate() {
            return firstOrderDate;
        }

        public void setFirstOrderDate(Date firstOrderDate) {
            this.firstOrderDate = firstOrderDate;
        }

        public Date getLastOrderDate() {
            return lastOrderDate;
        }

        public void setLastOrderDate(Date lastOrderDate) {
            this.lastOrderDate = lastOrderDate;
        }
    }

    public int getTotalOrders() {
        return totalOrders;
    }

    public void setTotalOrders(int totalOrders) {
        this.totalOrders = totalOrders;
    }

    public BigDecimal getTotalRevenue() {
        return totalRevenue;
    }

    public void setTotalRevenue(BigDecimal totalRevenue) {
        this.totalRevenue = totalRevenue;
    }

    public BigDecimal getAverageOrderValue() {
        return averageOrderValue;
    }

    public void setAverageOrderValue(BigDecimal averageOrderValue) {
        this.averageOrderValue = averageOrderValue;
    }

    public int getTotalCustomers() {
        return totalCustomers;
    }

    public void setTotalCustomers(int totalCustomers) {
        this.totalCustomers = totalCustomers;
    }

    public int getTotalProducts() {
        return totalProducts;
    }

    public void setTotalProducts(int totalProducts) {
        this.totalProducts = totalProducts;
    }

    public Map<String, BigDecimal> getDailyRevenue() {
        return dailyRevenue;
    }

    public void setDailyRevenue(Map<String, BigDecimal> dailyRevenue) {
        this.dailyRevenue = dailyRevenue;
    }

    public Map<String, BigDecimal> getMonthlyRevenue() {
        return monthlyRevenue;
    }

    public void setMonthlyRevenue(Map<String, BigDecimal> monthlyRevenue) {
        this.monthlyRevenue = monthlyRevenue;
    }

    public Map<String, Integer> getOrdersPerDay() {
        return ordersPerDay;
    }

    public void setOrdersPerDay(Map<String, Integer> ordersPerDay) {
        this.ordersPerDay = ordersPerDay;
    }

    public Map<String, Integer> getOrdersPerMonth() {
        return ordersPerMonth;
    }

    public void setOrdersPerMonth(Map<String, Integer> ordersPerMonth) {
        this.ordersPerMonth = ordersPerMonth;
    }

    public List<ProductPerformance> getTopProducts() {
        return topProducts;
    }

    public void setTopProducts(List<ProductPerformance> topProducts) {
        this.topProducts = topProducts;
    }

    public Map<String, BigDecimal> getRevenueByCategoryMap() {
        return revenueByCategoryMap;
    }

    public void setRevenueByCategoryMap(Map<String, BigDecimal> revenueByCategoryMap) {
        this.revenueByCategoryMap = revenueByCategoryMap;
    }

    public Map<String, Integer> getOrdersByCategoryMap() {
        return ordersByCategoryMap;
    }

    public void setOrdersByCategoryMap(Map<String, Integer> ordersByCategoryMap) {
        this.ordersByCategoryMap = ordersByCategoryMap;
    }

    public int getNewCustomers() {
        return newCustomers;
    }

    public void setNewCustomers(int newCustomers) {
        this.newCustomers = newCustomers;
    }

    public int getReturningCustomers() {
        return returningCustomers;
    }

    public void setReturningCustomers(int returningCustomers) {
        this.returningCustomers = returningCustomers;
    }

    public Map<String, Integer> getCustomersByGender() {
        return customersByGender;
    }

    public void setCustomersByGender(Map<String, Integer> customersByGender) {
        this.customersByGender = customersByGender;
    }

    public List<CustomerPerformance> getTopCustomers() {
        return topCustomers;
    }

    public void setTopCustomers(List<CustomerPerformance> topCustomers) {
        this.topCustomers = topCustomers;
    }

    public Map<String, Integer> getOrdersByStatus() {
        return ordersByStatus;
    }

    public void setOrdersByStatus(Map<String, Integer> ordersByStatus) {
        this.ordersByStatus = ordersByStatus;
    }

    public double getAverageFulfillmentTime() {
        return averageFulfillmentTime;
    }

    public void setAverageFulfillmentTime(double averageFulfillmentTime) {
        this.averageFulfillmentTime = averageFulfillmentTime;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }
}
