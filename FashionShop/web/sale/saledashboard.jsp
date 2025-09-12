<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bảng Điều Khiển Bán Hàng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        body {
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            font-family: 'Segoe UI', sans-serif;
        }
        .main-content {
            margin-left: 250px;
            padding: 30px;
        }
        .card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
        }
        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.15);
        }
        .card-header {
            border-radius: 15px 15px 0 0;
            background: linear-gradient(90deg, #007bff, #00c4cc);
            color: white;
            font-weight: 600;
            padding: 15px 20px;
        }
        .card-body {
            padding: 20px;
        }
        .status-badge {
            padding: 8px 15px;
            border-radius: 25px;
            color: white;
            font-weight: 500;
            display: inline-flex;
            align-items: center;
            justify-content: center;
        }
        .bg-pending-pay { background: #ff9800; }
        .bg-pending { background: #ffca2c; }
        .bg-processing { background: #007bff; }
        .bg-shipping { background: #28a745; }
        .bg-completed { background: #17a2b8; }
        .bg-returned { background: #9c27b0; }
        .bg-cancelled { background: #dc3545; }
        .chart-container {
            position: relative;
            height: 350px;
            width: 100%;
        }
        .icon-box {
            width: 60px;
            height: 60px;
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 20px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }
        .bg-gradient-primary { background: linear-gradient(45deg, #007bff, #00c4cc); }
        .bg-gradient-success { background: linear-gradient(45deg, #28a745, #20c997); }
        .bg-gradient-info { background: linear-gradient(45deg, #17a2b8, #00d4ff); }
        .bg-gradient-warning { background: linear-gradient(45deg, #ffca2c, #fd7e14); }
        .filter-section {
            background: white;
            padding: 15px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.05);
            margin-bottom: 20px;
        }
        .table {
            background: white;
            border-radius: 10px;
            overflow: hidden;
        }
        .table thead th {
            background: #007bff;
            color: white;
            border: none;
        }
        .progress {
            height: 20px;
            border-radius: 10px;
            background: #e9ecef;
        }
        .progress-bar {
            background: linear-gradient(90deg, #007bff, #00c4cc);
        }
    </style>
</head>

<body>
    <jsp:include page="sidebar.jsp" />

    <div class="main-content">
        <div class="container-fluid">
            <!-- Page Header -->
            <div class="row mb-4">
                <div class="col-12">
                    <h2 class="text-dark fw-bold"><i class="fas fa-chart-line me-2"></i> Bảng Điều Khiển Bán Hàng</h2>
                </div>
            </div>

            <!-- Overview Cards -->
            <div class="row mb-4">
                <div class="col-xl-4 col-md-6 mb-4">
                    <div class="card">
                        <div class="card-body">
                            <div class="d-flex align-items-center">
                                <div class="icon-box bg-gradient-primary text-white">
                                    <i class="fas fa-coins fa-2x"></i>
                                </div>
                                <div>
                                    <div class="text-muted text-uppercase fw-bold small">Tổng Doanh Thu</div>
                                    <div class="h4 mb-0 fw-bold text-dark">
                                        <fmt:formatNumber value="${salesOverview.totalRevenue}" type="currency" currencySymbol="VNĐ" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-4 col-md-6 mb-4">
                    <div class="card">
                        <div class="card-body">
                            <div class="d-flex align-items-center">
                                <div class="icon-box bg-gradient-success text-white">
                                    <i class="fas fa-shopping-cart fa-2x"></i>
                                </div>
                                <div>
                                    <div class="text-muted text-uppercase fw-bold small">Tổng Đơn Hàng</div>
                                    <div class="h4 mb-0 fw-bold text-dark">${salesOverview.totalSales}</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-4 col-md-6 mb-4">
                    <div class="card">
                        <div class="card-body">
                            <div class="d-flex align-items-center">
                                <div class="icon-box bg-gradient-info text-white">
                                    <i class="fas fa-boxes fa-2x"></i>
                                </div>
                                <div>
                                    <div class="text-muted text-uppercase fw-bold small">Tổng Doanh Số Bán Hàng</div>
                                    <div class="h4 mb-0 fw-bold text-dark">
                                        <fmt:formatNumber value="${salesOverview.completedSalesQuantity}" type="number" groupingUsed="true" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row mb-4">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header">
                            <h5 class="mb-0">Trạng Thái Đơn Hàng</h5>
                        </div>
                        <div class="card-body">
                            <div class="row text-center">
                                <div class="col">
                                    <div class="status-badge bg-pending-pay mb-2"><i class="fas fa-wallet me-1"></i> Chờ Thanh Toán</div>
                                    <h4 class="text-dark">${salesOverview.pendingPayOrders}</h4>
                                </div>
                                <div class="col">
                                    <div class="status-badge bg-pending mb-2"><i class="fas fa-clock me-1"></i> Đang Phê Duyệt</div>
                                    <h4 class="text-dark">${salesOverview.pendingOrders}</h4>
                                </div>
                                <div class="col">
                                    <div class="status-badge bg-processing mb-2"><i class="fas fa-spinner me-1"></i> Đang Xử Lý</div>
                                    <h4 class="text-dark">${salesOverview.processingOrders}</h4>
                                </div>
                                <div class="col">
                                    <div class="status-badge bg-shipping mb-2"><i class="fas fa-shipping-fast me-1"></i> Đang Giao</div>
                                    <h4 class="text-dark">${salesOverview.shippingOrders}</h4>
                                </div>
                            </div>
                            <div class="row text-center mt-4">
                                <div class="col">
                                    <div class="status-badge bg-completed mb-2"><i class="fas fa-check-circle me-1"></i> Đã Hoàn Thành</div>
                                    <h4 class="text-dark">${salesOverview.completedOrders}</h4>
                                </div>
                                <div class="col">
                                    <div class="status-badge bg-returned mb-2"><i class="fas fa-undo-alt me-1"></i> Đã Trả Lại</div>
                                    <h4 class="text-dark">${salesOverview.returnedOrders}</h4>
                                </div>
                                <div class="col">
                                    <div class="status-badge bg-cancelled mb-2"><i class="fas fa-times-circle me-1"></i> Đã Hủy</div>
                                    <h4 class="text-dark">${salesOverview.cancelledOrders}</h4>
                                </div>
                                <div class="col">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row mb-4">
                <div class="col-12">
                    <div class="filter-section">
                        <form action="${pageContext.request.contextPath}/sale/dashboard" method="GET" class="d-flex align-items-center">
                            <div class="input-group me-3">
                                <span class="input-group-text bg-primary text-white"><i class="fas fa-calendar-alt"></i> Từ</span>
                                <input type="date" name="startDate" class="form-control" 
                                       value="${param.startDate != null ? param.startDate : sevenDaysAgo}">
                            </div>
                            <div class="input-group me-3">
                                <span class="input-group-text bg-primary text-white"><i class="fas fa-calendar-alt"></i> Đến</span>
                                <input type="date" name="endDate" class="form-control" 
                                       value="${param.endDate != null ? param.endDate : today}">
                            </div>
                            <button type="submit" class="btn btn-primary"><i class="fas fa-filter me-1"></i> Lọc</button>
                        </form>
                    </div>
                </div>
            </div>

            <!-- Charts Section -->
            <div class="row mb-4">
                <div class="col-lg-8">
                    <div class="card">
                        <div class="card-header">
                            <h5 class="mb-0">Xu Hướng Đơn Hàng Hằng Ngày</h5>
                        </div>
                        <div class="card-body">
                            <div class="chart-container">
                                <canvas id="orderTrendChart"></canvas>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="card">
                        <div class="card-header">
                            <h5 class="mb-0">Đơn Hàng Theo Danh Mục</h5>
                        </div>
                        <div class="card-body">
                            <div class="chart-container">
                                <canvas id="categoryChart"></canvas>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row mb-4">
                <div class="col-lg-8">
                    <div class="card">
                        <div class="card-header">
                            <h5 class="mb-0">Doanh Thu Đơn Hàng Hằng Ngày</h5>
                        </div>
                        <div class="card-body">
                            <div class="chart-container">
                                <canvas id="revenueChart"></canvas>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="card">
                        <div class="card-header">
                            <h5 class="mb-0">Phân Phối Trạng Thái Đơn Hàng</h5>
                        </div>
                        <div class="card-body">
                            <div class="chart-container">
                                <canvas id="statusDistributionChart"></canvas>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Sales by Payment Method Table -->
            <div class="row mb-4">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header">
                            <h5 class="mb-0">Doanh Số Theo Phương Thức Thanh Toán</h5>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th>Phương Thức Thanh Toán</th>
                                            <th>Số Lượng Đơn Hàng</th>
                                            <th>Doanh Thu</th>
                                            <th>% Tổng Doanh Thu</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${paymentMethodSales}" var="payment">
                                            <tr>
                                                <td>${payment.paymentMethod}</td>
                                                <td>${payment.orderCount}</td>
                                                <td><fmt:formatNumber value="${payment.totalAmount}" type="currency" currencySymbol="VNĐ" /></td>
                                                <td>
                                                    <div class="progress">
                                                        <div class="progress-bar" role="progressbar" 
                                                             style="width: ${(payment.totalAmount / totalPaymentAmount) * 100}%" 
                                                             aria-valuenow="${(payment.totalAmount / totalPaymentAmount) * 100}" 
                                                             aria-valuemin="0" aria-valuemax="100">
                                                            <fmt:formatNumber value="${(payment.totalAmount / totalPaymentAmount) * 100}" 
                                                                             type="number" maxFractionDigits="1"/>%
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Sales by Category Table -->
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header">
                            <h5 class="mb-0">Đơn Hàng Theo Danh Mục</h5>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th>Danh Mục</th>
                                            <th>Các Mặt Hàng Đã Bán</th>
                                            <th>Doanh Thu</th>
                                            <th>% Tổng Số</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${categorySales}" var="category">
                                            <tr>
                                                <td>${category.categoryName}</td>
                                                <td>${category.totalItems}</td>
                                                <td><fmt:formatNumber value="${category.totalAmount}" type="currency" currencySymbol="VNĐ" /></td>
                                                <td>
                                                    <div class="progress">
                                                        <div class="progress-bar" role="progressbar" 
                                                             style="width: ${(category.totalAmount / totalCategoryAmount) * 100}%" 
                                                             aria-valuenow="${(category.totalAmount / totalCategoryAmount) * 100}" 
                                                             aria-valuemin="0" aria-valuemax="100">
                                                            <fmt:formatNumber value="${(category.totalAmount / totalCategoryAmount) * 100}" 
                                                                             type="number" maxFractionDigits="1"/>%
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <!-- Chart JS -->
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const orderTrendCtx = document.getElementById('orderTrendChart').getContext('2d');
            const orderTrendChart = new Chart(orderTrendCtx, {
                type: 'line',
                data: {
                    labels: [<c:forEach items="${orderStatusCounts}" var="status" varStatus="loop">'${status.orderDate}'${!loop.last ? ',' : ''}</c:forEach>],
                    datasets: [{
                        label: 'Chờ Thanh Toán',
                        data: [<c:forEach items="${orderStatusCounts}" var="status" varStatus="loop">${status.pendingPayCount}${!loop.last ? ',' : ''}</c:forEach>],
                        borderColor: '#ff9800',
                        backgroundColor: 'rgba(255, 152, 0, 0.2)',
                        tension: 0.3,
                        fill: true
                    }, {
                        label: 'Đang Phê Duyệt',
                        data: [<c:forEach items="${orderStatusCounts}" var="status" varStatus="loop">${status.pendingCount}${!loop.last ? ',' : ''}</c:forEach>],
                        borderColor: '#ffca2c',
                        backgroundColor: 'rgba(255, 202, 44, 0.2)',
                        tension: 0.3,
                        fill: true
                    }, {
                        label: 'Đang Xử Lý',
                        data: [<c:forEach items="${orderStatusCounts}" var="status" varStatus="loop">${status.processingCount}${!loop.last ? ',' : ''}</c:forEach>],
                        borderColor: '#007bff',
                        backgroundColor: 'rgba(0, 123, 255, 0.2)',
                        tension: 0.3,
                        fill: true
                    }, {
                        label: 'Đang Giao',
                        data: [<c:forEach items="${orderStatusCounts}" var="status" varStatus="loop">${status.shippingCount}${!loop.last ? ',' : ''}</c:forEach>],
                        borderColor: '#28a745',
                        backgroundColor: 'rgba(40, 167, 69, 0.2)',
                        tension: 0.3,
                        fill: true
                    }, {
                        label: 'Đã Hoàn Thành',
                        data: [<c:forEach items="${orderStatusCounts}" var="status" varStatus="loop">${status.completedCount}${!loop.last ? ',' : ''}</c:forEach>],
                        borderColor: '#17a2b8',
                        backgroundColor: 'rgba(23, 162, 184, 0.2)',
                        tension: 0.3,
                        fill: true
                    }, {
                        label: 'Đã Trả Lại',
                        data: [<c:forEach items="${orderStatusCounts}" var="status" varStatus="loop">${status.returnedCount}${!loop.last ? ',' : ''}</c:forEach>],
                        borderColor: '#9c27b0',
                        backgroundColor: 'rgba(156, 39, 176, 0.2)',
                        tension: 0.3,
                        fill: true
                    }, {
                        label: 'Đã Hủy',
                        data: [<c:forEach items="${orderStatusCounts}" var="status" varStatus="loop">${status.cancelledCount}${!loop.last ? ',' : ''}</c:forEach>],
                        borderColor: '#dc3545',
                        backgroundColor: 'rgba(220, 53, 69, 0.2)',
                        tension: 0.3,
                        fill: true
                    }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    scales: { y: { beginAtZero: true } },
                    interaction: { intersect: false, mode: 'index' }
                }
            });

            const revenueCtx = document.getElementById('revenueChart').getContext('2d');
            const revenueChart = new Chart(revenueCtx, {
                type: 'bar',
                data: {
                    labels: [<c:forEach items="${dailySalesData}" var="data" varStatus="loop">'${data.saleDate}'${!loop.last ? ',' : ''}</c:forEach>],
                    datasets: [{
                        label: 'Doanh Thu',
                        data: [<c:forEach items="${dailySalesData}" var="data" varStatus="loop">${data.totalAmount}${!loop.last ? ',' : ''}</c:forEach>],
                        backgroundColor: 'rgba(0, 123, 255, 0.8)'
                    }, {
                        label: 'Đơn Hàng',
                        data: [<c:forEach items="${dailySalesData}" var="data" varStatus="loop">${data.orderCount}${!loop.last ? ',' : ''}</c:forEach>],
                        backgroundColor: 'rgba(40, 167, 69, 0.8)',
                        yAxisID: 'y1'
                    }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    scales: {
                        y: { beginAtZero: true, title: { display: true, text: 'Doanh Thu (VNĐ)' } },
                        y1: { beginAtZero: true, position: 'right', grid: { drawOnChartArea: false }, title: { display: true, text: 'Đơn Hàng' } }
                    }
                }
            });

            const categoryCtx = document.getElementById('categoryChart').getContext('2d');
            const categoryChart = new Chart(categoryCtx, {
                type: 'doughnut',
                data: {
                    labels: [<c:forEach items="${categorySales}" var="category" varStatus="loop">'${category.categoryName}'${!loop.last ? ',' : ''}</c:forEach>],
                    datasets: [{
                        data: [<c:forEach items="${categorySales}" var="category" varStatus="loop">${category.totalAmount}${!loop.last ? ',' : ''}</c:forEach>],
                        backgroundColor: ['#007bff', '#28a745', '#17a2b8', '#ffca2c', '#dc3545']
                    }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    plugins: { legend: { position: 'bottom' } }
                }
            });

            const statusDistCtx = document.getElementById('statusDistributionChart').getContext('2d');
            const statusDistChart = new Chart(statusDistCtx, {
                type: 'pie',
                data: {
                    labels: ['Chờ Thanh Toán', 'Đang Phê Duyệt', 'Đang Xử Lý', 'Đang Giao', 'Đã Hoàn Thành', 'Đã Trả Lại', 'Đã Hủy'],
                    datasets: [{
                        data: [${salesOverview.pendingPayOrders}, ${salesOverview.pendingOrders}, ${salesOverview.processingOrders}, ${salesOverview.shippingOrders}, ${salesOverview.completedOrders}, ${salesOverview.returnedOrders}, ${salesOverview.cancelledOrders}],
                        backgroundColor: ['#ff9800', '#ffca2c', '#007bff', '#28a745', '#17a2b8', '#9c27b0', '#dc3545']
                    }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    plugins: { legend: { position: 'bottom' } }
                }
            });
        });
    </script>
</body>
</html>