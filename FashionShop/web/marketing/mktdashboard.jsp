<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Bảng Điều Khiển Tiếp Thị</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
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
            height: 15px;
            border-radius: 10px;
            background: #e9ecef;
        }
        .progress-bar {
            background: linear-gradient(90deg, #007bff, #00c4cc);
        }
        .badge {
            padding: 6px 12px;
            font-size: 0.9em;
        }
        
        .fixed-height {
            min-height: 150px; 
            display: flex;
            align-items: center;
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
                    <h2 class="text-dark fw-bold"><i class="fas fa-chart-line me-2"></i> Bảng Điều Khiển Tiếp Thị</h2>
                </div>
            </div>

            <div class="row mb-4">
                <div class="col-xl-4 col-md-4 mb-4">
                    <div class="card">
                        <div class="card-body fixed-height">
                            <div class="d-flex align-items-center">
                                <div class="icon-box bg-gradient-primary text-white">
                                    <i class="bi bi-box-seam fa-2x"></i>
                                </div>
                                <div>
                                    <div class="text-muted text-uppercase fw-bold small">Tổng Sản Phẩm</div>
                                    <div class="h4 mb-0 fw-bold text-dark">${stats.totalProducts}</div>
                                    <div class="mt-2 small">
                                        <span class="badge bg-success">${stats.activeProducts} Đang bán</span>
                                        <span class="badge bg-danger">${stats.outOfStockProducts} Hết hàng</span>
                                        <span class="badge bg-secondary">${stats.totalProducts - stats.activeProducts - stats.outOfStockProducts} Ngừng bán</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-xl-4 col-md-4 mb-4">
                    <div class="card">
                        <div class="card-body fixed-height">
                            <div class="d-flex align-items-center">
                                <div class="icon-box bg-gradient-success text-white">
                                    <i class="bi bi-people fa-2x"></i>
                                </div>
                                <div>
                                    <div class="text-muted text-uppercase fw-bold small">Tổng Người Dùng</div>
                                    <div class="h4 mb-0 fw-bold text-dark">${stats.totalCustomers}</div>
                                    <div class="mt-2 small">
                                        <span class="badge bg-success">${stats.activeCustomers} Đang hoạt động</span>
                                        <span class="badge bg-secondary">${stats.inactiveCustomers} Ngừng hoạt động</span>
                                        <span class="badge bg-warning">${stats.pendingCustomers} Đang phê duyệt</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-xl-4 col-md-4 mb-4">
                    <div class="card">
                        <div class="card-body fixed-height">
                            <div class="d-flex align-items-center">
                                <div class="icon-box bg-gradient-warning text-white">
                                    <i class="bi bi-star-fill fa-2x"></i>
                                </div>
                                <div>
                                    <div class="text-muted text-uppercase fw-bold small">Đánh Giá Trung Bình</div>
                                    <div class="h4 mb-0 fw-bold text-dark">
                                        <fmt:formatNumber value="${stats.averageRating}" pattern="0.0" /> / 5.0
                                    </div>
                                    <div class="mt-2 small">
                                        <div class="progress">
                                            <div class="progress-bar bg-warning" style="width: ${(stats.averageRating / 5) * 100}%;"></div>
                                        </div>
                                        <div class="mt-2"></div>
                                        <div class="mt-2"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row mb-4">
                <div class="col-12">
                    <div class="filter-section">
                        <form class="d-flex align-items-center justify-content-end" method="get" action="${pageContext.request.contextPath}/marketing/dashboard">
                            <div class="input-group me-3">
                                <span class="input-group-text bg-primary text-white"><i class="fas fa-calendar-alt"></i> Từ</span>
                                <input type="date" class="form-control" id="startDate" name="startDate" value="${startDateStr}">
                            </div>
                            <div class="input-group me-3">
                                <span class="input-group-text bg-primary text-white"><i class="fas fa-calendar-alt"></i> Đến</span>
                                <input type="date" class="form-control" id="endDate" name="endDate" value="${endDateStr}">
                            </div>
                            <button type="submit" class="btn btn-primary"><i class="fas fa-filter me-1"></i> Lọc</button>
                        </form>
                    </div>
                </div>
            </div>

            <div class="row mb-4">
                <div class="col-xl-6 col-lg-6">
                    <div class="card">
                        <div class="card-header">
                            <h6 class="m-0">Xu Hướng Khách Hàng Mới</h6>
                        </div>
                        <div class="card-body">
                            <div class="chart-container">
                                <canvas id="newCustomersChart"></canvas>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-6 col-lg-6">
                    <div class="card">
                        <div class="card-header">
                            <h6 class="m-0">Phân Phối Đánh Giá</h6>
                        </div>
                        <div class="card-body">
                            <div class="chart-container" style="height: 300px;">
                                <canvas id="feedbackChart"></canvas>
                            </div>
                            <div class="mt-3 text-center small">
                                <span class="me-2"><i class="fas fa-circle text-danger"></i> 1 Sao</span>
                                <span class="me-2"><i class="fas fa-circle text-warning"></i> 2 Sao</span>
                                <span class="me-2"><i class="fas fa-circle text-info"></i> 3 Sao</span>
                                <span class="me-2"><i class="fas fa-circle text-primary"></i> 4 Sao</span>
                                <span class="me-2"><i class="fas fa-circle text-success"></i> 5 Sao</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row mb-4">
                <div class="col-xl-6 col-lg-6">
                    <div class="card">
                        <div class="card-header">
                            <h6 class="m-0">Sản Phẩm Theo Danh Mục</h6>
                        </div>
                        <div class="card-body">
                            <div class="chart-container">
                                <canvas id="productsByCategoryChart"></canvas>
                            </div>
                            <div class="mt-3 small text-center">
                                <c:choose>
                                    <c:when test="${empty stats.productsByCategory}">
                                        <span class="text-muted">Không có dữ liệu có sẵn</span>
                                    </c:when>
                                    <c:otherwise>
                                        <c:forEach items="${stats.productsByCategory}" var="category" varStatus="status">
                                            <span class="me-2 mb-1 d-inline-block">
                                                <c:set var="colorIndex" value="${status.index % 7}" />
                                                <i class="fas fa-circle" style="color: ${colorIndex == 0 ? '#36b9cc' : colorIndex == 1 ? '#4e73df' : colorIndex == 2 ? '#f6c23e' : colorIndex == 3 ? '#1cc88a' : colorIndex == 4 ? '#d65b4f' : colorIndex == 5 ? '#6f42c1' : '#20c997'}"></i>
                                                ${category.key}: ${category.value}
                                            </span>
                                        </c:forEach>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-6 col-lg-6">
                    <div class="card">
                        <div class="card-header">
                            <h6 class="m-0">Trạng Thái Kho</h6>
                        </div>
                        <div class="card-body">
                            <h4 class="small fw-bold">Sản phẩm đang bán <span class="float-end">
                                <fmt:formatNumber value="${stats.activeProducts / (stats.totalProducts == 0 ? 1 : stats.totalProducts) * 100}" pattern="0.0" />%
                            </span></h4>
                            <div class="progress mb-4">
                                <div class="progress-bar bg-success" style="width: ${stats.activeProducts / (stats.totalProducts == 0 ? 1 : stats.totalProducts) * 100}%"></div>
                            </div>
                            <h4 class="small fw-bold">Hết hàng <span class="float-end">
                                <fmt:formatNumber value="${stats.outOfStockProducts / (stats.totalProducts == 0 ? 1 : stats.totalProducts) * 100}" pattern="0.0" />%
                            </span></h4>
                            <div class="progress mb-4">
                                <div class="progress-bar bg-danger" style="width: ${stats.outOfStockProducts / (stats.totalProducts == 0 ? 1 : stats.totalProducts) * 100}%"></div>
                            </div>
                            <h4 class="small fw-bold">Sản phẩm ngừng bán <span class="float-end">
                                <fmt:formatNumber value="${stats.inactiveProducts / (stats.totalProducts == 0 ? 1 : stats.totalProducts) * 100}" pattern="0.0" />%
                            </span></h4>
                            <div class="progress mb-4">
                                <div class="progress-bar bg-secondary" style="width: ${stats.inactiveProducts / (stats.totalProducts == 0 ? 1 : stats.totalProducts) * 100}%"></div>
                            </div>
                            <h4 class="small fw-bold">Tổng kho: ${stats.totalStock} mặt hàng</h4>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row mb-4">
                <div class="col-xl-8 col-lg-8">
                    <div class="card">
                        <div class="card-header">
                            <h6 class="m-0">Cảnh Báo Hàng Tồn Kho Thấp</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <th>ID Sản phẩm</th>
                                            <th>Tên sản phẩm</th>
                                            <th>Kích thước</th>
                                            <th>Màu sắc</th>
                                            <th>Kho</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${stats.lowStockProducts}" var="product">
                                            <tr>
                                                <td>${product.productId}</td>
                                                <td>${product.productName}</td>
                                                <td>${product.size}</td>
                                                <td>${product.color}</td>
                                                <td><span class="badge bg-danger">${product.stockQuantity}</span></td>
                                            </tr>
                                        </c:forEach>
                                        <c:if test="${empty stats.lowStockProducts}">
                                            <tr>
                                                <td colspan="5" class="text-center">Không có sản phẩm tồn kho thấp</td>
                                            </tr>
                                        </c:if>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-4 col-lg-4">
                    <div class="card">
                        <div class="card-header">
                            <h6 class="m-0">Phân Phối Loại Khách Hàng</h6>
                        </div>
                        <div class="card-body">
                            <div class="chart-container" style="height: 300px;">
                                <canvas id="customerTypeChart"></canvas>
                            </div>
                            <div class="mt-3 text-center small">
                                <span class="me-2"><i class="fas fa-circle text-success"></i> Cao cấp: ${stats.customerContactStats['vip']}</span>
                                <span class="me-2"><i class="fas fa-circle text-primary"></i> Thông thường: ${stats.customerContactStats['normal']}</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row mb-4">
                <div class="col-xl-4 col-lg-4">
                    <div class="card">
                        <div class="card-header">
                            <h6 class="m-0">Danh Sách Khách Hàng Cao Cấp Hàng Đầu</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <th>Tên</th>
                                            <th>SĐT</th>
                                            <th>Email</th>
                                            <th>Tổng đơn hàng</th>
                                            <th>Tổng đã chi</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${stats.topVIPCustomers}" var="customer">
                                            <tr>
                                                <td>${customer.fullName}</td>
                                                <td>${customer.mobile}</td>
                                                <td>${customer.email}</td>
                                                <td>${customer.totalPurchases}</td>
                                                <td><fmt:formatNumber value="${customer.totalSpend}" type="currency" currencySymbol="VNĐ"/></td>
                                            </tr>
                                        </c:forEach>
                                        <c:if test="${empty stats.topVIPCustomers}">
                                            <tr>
                                                <td colspan="5" class="text-center">Không có khách hàng VIP nào</td>
                                            </tr>
                                        </c:if>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-8 col-lg-8">
                    <div class="card">
                        <div class="card-header">
                            <h6 class="m-0">Sử Dụng Phiếu Giảm Giá</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <th>Mã giảm giá</th>
                                            <th>Sử dụng (Đã sử dụng/Giới hạn)</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${stats.couponUsage}" var="coupon">
                                            <tr>
                                                <td>${coupon.key}</td>
                                                <td>${coupon.value}</td>
                                            </tr>
                                        </c:forEach>
                                        <c:if test="${empty stats.couponUsage}">
                                            <tr>
                                                <td colspan="2" class="text-center">Không có dữ liệu sử dụng phiếu giảm giá</td>
                                            </tr>
                                        </c:if>
                                    </tbody>
                                </table>
                            </div>
                            <div class="row mt-4">
                                <div class="col-md-3">
                                    <div class="card bg-gradient-primary text-white">
                                        <div class="card-body">
                                            <div class="text-xs fw-bold text-uppercase mb-1">Tổng số phiếu</div>
                                            <div class="h5 mb-0 fw-bold">${stats.totalCoupons}</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="card bg-gradient-success text-white">
                                        <div class="card-body">
                                            <div class="text-xs fw-bold text-uppercase mb-1">Đang hoạt động</div>
                                            <div class="h5 mb-0 fw-bold">${stats.activeCoupons}</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="card bg-gradient-warning text-white">
                                        <div class="card-body">
                                            <div class="text-xs fw-bold text-uppercase mb-1">Đã hết hạn</div>
                                            <div class="h5 mb-0 fw-bold">${stats.expiredCoupons}</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="card bg-danger text-white">
                                        <div class="card-body">
                                            <div class="text-xs fw-bold text-uppercase mb-1">Không hoạt động</div>
                                            <div class="h5 mb-0 fw-bold">${stats.inactiveCoupons}</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="mt-4">
                                <h6 class="fw-bold text-primary mb-3">Dòng Thời Gian Hết Hạn Phiếu Giảm Giá</h6>
                                <div class="chart-container">
                                    <canvas id="couponExpirationChart"></canvas>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-xl-6 col-lg-6">
                    <div class="card">
                        <div class="card-header">
                            <h6 class="m-0">Quản Lý Nội Dung</h6>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="text-center mb-3">
                                        <h5 class="fw-bold">Bài đăng</h5>
                                    </div>
                                    <div class="chart-container" style="height: 200px;">
                                        <canvas id="postsChart"></canvas>
                                    </div>
                                    <div class="mt-3 text-center small">
                                        <span class="me-2"><i class="fas fa-circle text-success"></i> Đã xuất bản: ${stats.publishedPosts}</span>
                                        <span class="me-2"><i class="fas fa-circle text-warning"></i> Bản thảo: ${stats.draftPosts}</span>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="text-center mb-3">
                                        <h5 class="fw-bold">Thanh trượt</h5>
                                    </div>
                                    <div class="chart-container" style="height: 200px;">
                                        <canvas id="slidersChart"></canvas>
                                    </div>
                                    <div class="mt-3 text-center small">
                                        <span class="me-2"><i class="fas fa-circle text-info"></i> Đang hoạt động: ${stats.activeSliders}</span>
                                        <span class="me-2"><i class="fas fa-circle text-secondary"></i> Không hoạt động: ${stats.totalSliders - stats.activeSliders}</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // New Customers Chart
        var newCustomersChartContext = document.getElementById('newCustomersChart').getContext('2d');
        var newCustomersChart = new Chart(newCustomersChartContext, {
            type: 'line',
            data: {
                labels: [<c:forEach items="${stats.newCustomersByDay}" var="entry" varStatus="status">'<fmt:formatDate value="${entry.key}" pattern="dd MMM" />',</c:forEach>],
                datasets: [{
                    label: 'Khách hàng mới',
                    data: [<c:forEach items="${stats.newCustomersByDay}" var="entry" varStatus="status">${entry.value},</c:forEach>],
                    lineTension: 0.3,
                    backgroundColor: 'rgba(0, 123, 255, 0.05)',
                    borderColor: '#007bff',
                    pointRadius: 3,
                    pointBackgroundColor: '#007bff',
                    pointBorderColor: '#007bff',
                    pointHoverRadius: 5,
                    pointHoverBackgroundColor: '#007bff',
                    pointHoverBorderColor: '#007bff',
                    pointHitRadius: 10,
                    pointBorderWidth: 2
                }]
            },
            options: {
                maintainAspectRatio: false,
                scales: { y: { beginAtZero: true, ticks: { stepSize: 1 } } },
                plugins: {
                    title: { display: true, text: 'Đăng ký khách hàng mới' },
                    tooltip: {
                        callbacks: {
                            title: function(tooltipItems) { return tooltipItems[0].label; },
                            label: function(context) { return 'Khách hàng mới: ' + context.raw; }
                        }
                    }
                }
            }
        });

        // Feedback Chart
        document.addEventListener('DOMContentLoaded', function() {
            var feedbackChartContext = document.getElementById('feedbackChart').getContext('2d');
            var feedbackData = [];
            <c:forEach begin="1" end="5" var="rating">
                feedbackData.push(${feedbackByRating[rating] != null ? feedbackByRating[rating] : 0});
            </c:forEach>
            var hasData = feedbackData.some(value => value > 0);
            if (!hasData) {
                document.getElementById('feedbackChart').parentElement.innerHTML = '<p class="text-center text-muted">Không có dữ liệu phản hồi</p>';
            } else {
                var feedbackChart = new Chart(feedbackChartContext, {
                    type: 'bar',
                    data: {
                        labels: ['', '', '', '', ''],
                        datasets: [{
                            label: 'Số sao',
                            data: feedbackData,
                            backgroundColor: ['#e74a3b', '#f6c23e', '#36b9cc', '#4e73df', '#1cc88a'],
                            hoverBackgroundColor: ['#be3d30', '#dda20a', '#2c9faf', '#2e59d9', '#17a673'],
                            borderWidth: 1,
                            borderColor: '#ffffff'
                        }]
                    },
                    options: {
                        maintainAspectRatio: false,
                        scales: {
                            y: { beginAtZero: true, ticks: { stepSize: 1, precision: 0 }, title: { display: true, text: 'Số lượng đánh giá' } },
                            x: { title: { display: true, text: 'Số sao' } }
                        },
                        plugins: { legend: { display: false } }
                    }
                });
            }
        });

        // Products by Category Chart
        document.addEventListener("DOMContentLoaded", function() {
            var ctx = document.getElementById("productsByCategoryChart").getContext('2d');
            var labels = [], data = [];
            <c:forEach items="${productsByCategory}" var="category">
                labels.push("${category.key}");
                data.push(${category.value});
            </c:forEach>
            var productChart = new Chart(ctx, {
                type: 'pie',
                data: {
                    labels: labels,
                    datasets: [{
                        data: data,
                        backgroundColor: ["#36b9cc", "#4e73df", "#f6c23e", "#1cc88a", "#d65b4f", "#6f42c1", "#20c997"],
                        borderColor: "#ffffff",
                        borderWidth: 1
                    }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    plugins: { legend: { display: false } }
                }
            });
        });

        // Coupon Expiration Chart
        document.addEventListener("DOMContentLoaded", function() {
            var ctx = document.getElementById("couponExpirationChart").getContext('2d');
            var expirationLabels = [], expirationData = [];
            <c:forEach items="${stats.couponExpirations}" var="expiration">
                expirationLabels.push("${expiration.key}");
                expirationData.push(${expiration.value});
            </c:forEach>
            var myBarChart = new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: expirationLabels,
                    datasets: [{
                        label: "Phiếu giảm giá",
                        backgroundColor: "#4e73df",
                        hoverBackgroundColor: "#2e59d9",
                        borderColor: "#4e73df",
                        data: expirationData
                    }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    scales: { y: { beginAtZero: true, ticks: { precision: 0 } } }
                }
            });
        });

        // Posts and Sliders Charts
        document.addEventListener('DOMContentLoaded', function() {
            var postsChartContext = document.getElementById('postsChart').getContext('2d');
            var postsChart = new Chart(postsChartContext, {
                type: 'doughnut',
                data: {
                    labels: ['Đã xuất bản', 'Bản thảo'],
                    datasets: [{
                        data: [${stats.publishedPosts}, ${stats.draftPosts}],
                        backgroundColor: ['#1cc88a', '#f6c23e'],
                        hoverBackgroundColor: ['#17a673', '#dda20a'],
                        borderWidth: 2,
                        borderColor: '#ffffff'
                    }]
                },
                options: { maintainAspectRatio: false, cutout: '60%', plugins: { legend: { display: false } } }
            });

            var slidersChartContext = document.getElementById('slidersChart').getContext('2d');
            var slidersChart = new Chart(slidersChartContext, {
                type: 'doughnut',
                data: {
                    labels: ['Đang hoạt động', 'Không hoạt động'],
                    datasets: [{
                        data: [${stats.activeSliders}, ${stats.totalSliders - stats.activeSliders}],
                        backgroundColor: ['#36b9cc', '#858796'],
                        hoverBackgroundColor: ['#2c9faf', '#6e707e'],
                        borderWidth: 2,
                        borderColor: '#ffffff'
                    }]
                },
                options: { maintainAspectRatio: false, cutout: '60%', plugins: { legend: { display: false } } }
            });

            var customerTypeChartContext = document.getElementById('customerTypeChart').getContext('2d');
            var customerTypeChart = new Chart(customerTypeChartContext, {
                type: 'doughnut',
                data: {
                    labels: ['Cao cấp', 'Thông thường'],
                    datasets: [{
                        data: [${stats.customerContactStats['vip']}, ${stats.customerContactStats['normal']}],
                        backgroundColor: ['#1cc88a', '#4e73df'],
                        hoverBackgroundColor: ['#17a673', '#2e59d9'],
                        borderWidth: 2,
                        borderColor: '#ffffff'
                    }]
                },
                options: { maintainAspectRatio: false, cutout: '60%', plugins: { legend: { display: false } } }
            });
        });
    </script>
</body>
</html>