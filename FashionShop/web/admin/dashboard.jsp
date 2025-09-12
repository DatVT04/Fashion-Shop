<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin Dashboard</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
        <!-- Chart.js -->
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <style>
            :root {
                --primary-color: #2c3e50;
                --secondary-color: #34495e;
                --accent-color: #3498db;
                --light-color: #ecf0f1;
                --border-color: #dee2e6;
                --hover-color: #f8f9fa;
            }

            body {
                background-color: #f8f9fa;
            }

            .main-content {
                margin-left: 250px;
                transition: all 0.3s;
                padding: 20px;
                min-height: 100vh;
            }

            .dashboard-card {
                border-radius: 8px;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
                transition: transform 0.3s ease;
                border: 1px solid var(--border-color);
                margin-bottom: 20px;
            }
            
            .dashboard-card:hover {
                transform: translateY(-5px);
            }
            
            .icon-bg {
                width: 60px;
                height: 60px;
                border-radius: 50%;
                display: flex;
                align-items: center;
                justify-content: center;
            }
            
            .stat-title {
                font-size: 14px;
                color: #6c757d;
            }
            
            .stat-value {
                font-size: 24px;
                font-weight: bold;
            }
            
            .chart-container {
                position: relative;
                height: 300px;
                margin-bottom: 20px;
            }
            
            .table-container {
                max-height: 400px;
                overflow-y: auto;
            }

            .page-title {
                color: var(--primary-color);
                margin-bottom: 20px;
                padding-bottom: 10px;
                border-bottom: 2px solid var(--accent-color);
                display: inline-block;
            }

            .card-header {
                background-color: #fff;
                border-bottom: 1px solid var(--border-color);
                padding: 15px 20px;
                font-weight: 600;
            }

            .sidebar-toggle {
                position: fixed;
                left: 10px;
                top: 10px;
                z-index: 1001;
                display: none;
                border-radius: 50%;
                width: 40px;
                height: 40px;
                box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            }

            @media (max-width: 768px) {
                .main-content {
                    margin-left: 0;
                }
                .sidebar-toggle {
                    display: block;
                }
            }
        </style>
    </head>
    <body class="bg-light">
        <!-- Include the sidebar -->
        <jsp:include page="/admin/adminsidebar.jsp" />

        <button class="btn btn-primary sidebar-toggle">
            <i class="fas fa-bars"></i>
        </button>

        <div class="main-content">
            <div class="container-fluid p-4">
                <h2 class="page-title">
                    <i class="fas fa-chart-line me-2"></i>Bảng điều khiển quản trị
                </h2>

                <!-- Stats Cards -->
                <div class="row g-3 mb-4">
                    <!-- User Stats -->
                    <div class="col-md-3">
                        <div class="card dashboard-card h-100">
                            <div class="card-body d-flex justify-content-between align-items-start">
                                <div>
                                    <p class="stat-title mb-1">Số lượng người dùng</p>
                                    <h3 class="stat-value">${userStatusCount.totalUsers}</h3>
                                    <div class="mt-2">
                                        <span class="badge bg-success">${userStatusCount.activeCount} Hoạt động</span>
                                        <span class="badge bg-danger">${userStatusCount.inactiveCount} Không hoạt động</span>
                                        <span class="badge bg-warning">${userStatusCount.pendingCount} Chờ xác nhận</span>
                                    </div>
                                </div>
                                <div class="icon-bg bg-primary bg-opacity-10">
                                    <i class="fas fa-users text-primary fa-2x"></i>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Category Stats -->
                    <div class="col-md-3">
                        <div class="card dashboard-card h-100">
                            <div class="card-body d-flex justify-content-between align-items-start">
                                <div>
                                    <p class="stat-title mb-1">Số lượng thể loại chính</p>
                                    <h3 class="stat-value">${totalCategories}</h3>
                                    <div class="mt-2">
                                        <c:forEach var="category" items="${categoryData}" varStatus="loop">
                                            <c:if test="${loop.index < 3}">
                                                <span class="badge bg-info">${category.name}</span>
                                            </c:if>
                                        </c:forEach>
                                        <c:if test="${categoryData.size() > 3}">
                                            <span class="badge bg-secondary">+${categoryData.size() - 3} thêm</span>
                                        </c:if>
                                    </div>
                                </div>
                                <div class="icon-bg bg-success bg-opacity-10">
                                    <i class="fas fa-tags text-success fa-2x"></i>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Product Stats -->
                    <div class="col-md-3">
                        <div class="card dashboard-card h-100">
                            <div class="card-body d-flex justify-content-between align-items-start">
                                <div>
                                    <p class="stat-title mb-1">Số lượng sản phẩm</p>
                                    <h3 class="stat-value">${productStatusCount.totalProducts}</h3>
                                    <div class="mt-2">
                                        <span class="badge bg-success">${productStatusCount.activeCount} Hoạt động</span>
                                        <span class="badge bg-danger">${productStatusCount.inactiveCount} Không hoạt động</span>
                                        <span class="badge bg-warning">${productStatusCount.eoStockCount} Hết hàng</span>
                                    </div>
                                </div>
                                <div class="icon-bg bg-warning bg-opacity-10">
                                    <i class="fas fa-box text-warning fa-2x"></i>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Customer Stats -->
                    <div class="col-md-3">
                        <div class="card dashboard-card h-100">
                            <div class="card-body d-flex justify-content-between align-items-start">
                                <div>
                                    <p class="stat-title mb-1">Doanh thu</p>
                                    <h3 class="stat-value">
                                        <fmt:formatNumber value="${totalCustomerStats.totalSpend}" type="number" groupingUsed="true" /> VNĐ
                                    </h3>

                                    <div class="mt-2">
                                        <span class="badge bg-primary">Số lượng sản phẩm đã bán: ${totalCustomerStats.totalPurchases}</span>
                                    </div>
                                </div>
                                <div class="icon-bg bg-danger bg-opacity-10">
                                    <i class="fas fa-dollar-sign text-danger fa-2x"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Charts Row -->
                <div class="row mb-4">
                    <!-- User Status Chart -->
                    <div class="col-md-6">
                        <div class="card dashboard-card">
                            <div class="card-header bg-white">
                                <h5 class="card-title mb-0">Biểu đồ phân phối trạng thái người dùng</h5>
                            </div>
                            <div class="card-body">
                                <div class="chart-container">
                                    <canvas id="userStatusChart"></canvas>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Category Distribution Chart -->
                    <div class="col-md-6">
                        <div class="card dashboard-card">
                            <div class="card-header bg-white">
                                <h5 class="card-title mb-0">Biểu đồ phân phối số lượng sản phẩm theo từng thể loại chính</h5>
                            </div>
                            <div class="card-body">
                                <div class="chart-container">
                                    <canvas id="categoryChart"></canvas>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Product Status & Customer Table Row -->
                <div class="row mb-4">
                    <!-- Product Status Chart -->
                    <div class="col-md-6">
                        <div class="card dashboard-card">
                            <div class="card-header bg-white">
                                <h5 class="card-title mb-0">Biểu đồ phân phối trạng thái sản phẩm</h5>
                            </div>
                            <div class="card-body">
                                <div class="chart-container">
                                    <canvas id="productStatusChart"></canvas>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Top Customers Table -->
                    <div class="col-md-6">
                        <div class="card dashboard-card">
                            <div class="card-header bg-white">
                                <h5 class="card-title mb-0">Top 5 khách hàng tiềm năng của cửa hàng</h5>
                            </div>
                            <div class="card-body table-container">
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th>Quý danh</th>
                                            <th>Số đơn hàng</th>
                                            <th>Số tiền đã chi</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="customer" items="${topCustomers}">
                                            <tr>
                                                <td>${customer.fullName}</td>
                                                <td>${customer.totalPurchases}</td>
                                                <td>
                                                    <fmt:formatNumber value="${customer.totalSpend}" type="number" groupingUsed="true" /> VNĐ
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Time-based Charts Row -->
                <div class="row mb-4">
                    <!-- Monthly Product Additions Chart -->
                    <div class="col-md-6">
                        <div class="card dashboard-card">
                            <div class="card-header bg-white">
                                <h5 class="card-title mb-0">Biểu đồ phân phối sản phẩm mới</h5>
                            </div>
                            <div class="card-body">
                                <div class="chart-container">
                                    <canvas id="monthlyProductChart"></canvas>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Monthly Orders Chart -->
                    <div class="col-md-6">
                        <div class="card dashboard-card">
                            <div class="card-header bg-white">
                                <h5 class="card-title mb-0">Biều đồ phân phối đơn hàng</h5>
                            </div>
                            <div class="card-body">
                                <div class="chart-container">
                                    <canvas id="monthlyOrderChart"></canvas>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>                    
        
        <!-- JavaScript for Charts -->
        <script>
            // User Status Chart
            const userStatusCtx = document.getElementById('userStatusChart').getContext('2d');
            const userStatusChart = new Chart(userStatusCtx, {
                type: 'doughnut',
                data: {
                    labels: ['Hoạt động', 'Không hoạt động', 'Chờ xác nhận'],
                    datasets: [{
                            data: [
            ${userStatusCount.activeCount},
            ${userStatusCount.inactiveCount},
            ${userStatusCount.pendingCount}
                            ],
                            backgroundColor: [
                                'rgba(40, 167, 69, 0.7)',
                                'rgba(220, 53, 69, 0.7)',
                                'rgba(255, 193, 7, 0.7)'
                            ],
                            borderColor: [
                                'rgba(40, 167, 69, 1)',
                                'rgba(220, 53, 69, 1)',
                                'rgba(255, 193, 7, 1)'
                            ],
                            borderWidth: 1
                        }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    plugins: {
                        legend: {
                            position: 'bottom'
                        }
                    }
                }
            });

            // Category Chart - Enhanced to better show product distribution
            const categoryData = ${categoryDataJson};
            const categoryNames = categoryData.map(item => item.name);
            const categoryProductCounts = categoryData.map(item => item.productCount);

            const categoryCtx = document.getElementById('categoryChart').getContext('2d');
            const categoryChart = new Chart(categoryCtx, {
                type: 'bar', // Changed from pie to bar for better product count visualization
                data: {
                    labels: categoryNames,
                    datasets: [{
                            label: 'Số lượng sản phẩm',
                            data: categoryProductCounts,
                            backgroundColor: [
                                'rgba(54, 162, 235, 0.7)',
                                'rgba(255, 99, 132, 0.7)',
                                'rgba(255, 206, 86, 0.7)',
                                'rgba(75, 192, 192, 0.7)',
                                'rgba(153, 102, 255, 0.7)',
                                'rgba(255, 159, 64, 0.7)',
                                'rgba(199, 199, 199, 0.7)'
                            ],
                            borderColor: [
                                'rgba(54, 162, 235, 1)',
                                'rgba(255, 99, 132, 1)',
                                'rgba(255, 206, 86, 1)',
                                'rgba(75, 192, 192, 1)',
                                'rgba(153, 102, 255, 1)',
                                'rgba(255, 159, 64, 1)',
                                'rgba(199, 199, 199, 1)'
                            ],
                            borderWidth: 1
                        }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    scales: {
                        y: {
                            beginAtZero: true,
                            title: {
                                display: true,
                                text: 'Số lượng sản phẩm'
                            },
                            ticks: {
                                precision: 0
                            }
                        },
                        x: {
                            title: {
                                display: true,
                                text: 'Thể loại'
                            }
                        }
                    },
                    plugins: {
                        legend: {
                            display: false
                        },
                        tooltip: {
                            callbacks: {
                                label: function (context) {
                                    return `${context.parsed.y} sản phẩm`;
                                }
                            }
                        }
                    }
                }
            });

            // Product Status Chart
            const productStatusCtx = document.getElementById('productStatusChart').getContext('2d');
            const productStatusChart = new Chart(productStatusCtx, {
                type: 'bar',
                data: {
                    labels: ['Hoạt động', 'Không hoạt động', 'Hết hàng'],
                    datasets: [{
                            label: 'Số lượng sản phẩm',
                            data: [
            ${productStatusCount.activeCount},
            ${productStatusCount.inactiveCount},
            ${productStatusCount.eoStockCount}
                            ],
                            backgroundColor: [
                                'rgba(40, 167, 69, 0.7)',
                                'rgba(220, 53, 69, 0.7)',
                                'rgba(255, 193, 7, 0.7)'
                            ],
                            borderColor: [
                                'rgba(40, 167, 69, 1)',
                                'rgba(220, 53, 69, 1)',
                                'rgba(255, 193, 7, 1)'
                            ],
                            borderWidth: 1
                        }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    scales: {
                        y: {
                            beginAtZero: true,
                            ticks: {
                                precision: 0
                            }
                        }
                    },
                    plugins: {
                        legend: {
                            display: false
                        }
                    }
                }
            });

            // Monthly Product Additions Chart
            const monthlyProductData = ${monthlyProductAdditionsJson};
            const monthlyProductLabels = monthlyProductData.map(item => item.period);
            const monthlyProductCounts = monthlyProductData.map(item => item.count);

            const monthlyProductCtx = document.getElementById('monthlyProductChart').getContext('2d');
            const monthlyProductChart = new Chart(monthlyProductCtx, {
                type: 'line',
                data: {
                    labels: monthlyProductLabels,
                    datasets: [{
                            label: 'Sản phẩm mới',
                            data: monthlyProductCounts,
                            backgroundColor: 'rgba(75, 192, 192, 0.2)',
                            borderColor: 'rgba(75, 192, 192, 1)',
                            borderWidth: 2,
                            tension: 0.1,
                            fill: true
                        }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    scales: {
                        y: {
                            beginAtZero: true,
                            title: {
                                display: true,
                                text: 'Số lượng sản phẩm'
                            },
                            ticks: {
                                precision: 0
                            }
                        },
                        x: {
                            title: {
                                display: true,
                                text: 'Tháng'
                            }
                        }
                    },
                    plugins: {
                        legend: {
                            position: 'top'
                        },
                        tooltip: {
                            callbacks: {
                                label: function (context) {
                                    return `${context.parsed.y} sản phẩm được thêm`;
                                }
                            }
                        }
                    }
                }
            });

            // Monthly Orders Chart
            const monthlyOrderData = ${monthlyOrderCountsJson};
            const monthlyOrderLabels = monthlyOrderData.map(item => item.period);
            const monthlyOrderCounts = monthlyOrderData.map(item => item.count);

            const monthlyOrderCtx = document.getElementById('monthlyOrderChart').getContext('2d');
            const monthlyOrderChart = new Chart(monthlyOrderCtx, {
                type: 'line',
                data: {
                    labels: monthlyOrderLabels,
                    datasets: [{
                            label: 'Số lượng đơn hàng',
                            data: monthlyOrderCounts,
                            backgroundColor: 'rgba(54, 162, 235, 0.2)',
                            borderColor: 'rgba(54, 162, 235, 1)',
                            borderWidth: 2,
                            tension: 0.1,
                            fill: true
                        }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    scales: {
                        y: {
                            beginAtZero: true,
                            title: {
                                display: true,
                                text: 'Số đơn hàng'
                            },
                            ticks: {
                                precision: 0
                            }
                        },
                        x: {
                            title: {
                                display: true,
                                text: 'Tháng'
                            }
                        }
                    },
                    plugins: {
                        legend: {
                            position: 'top'
                        },
                        tooltip: {
                            callbacks: {
                                label: function (context) {
                                    return `${context.parsed.y} orders`;
                                }
                            }
                        }
                    }
                }
            });
        </script>

        <!-- jQuery and Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        
        <script>
            $(document).ready(function () {
                // Toggle sidebar
                $('.sidebar-toggle').on('click', function () {
                    $('.sidebar').toggleClass('active');
                    $('.main-content').toggleClass('active');
                    $(this).hide();
                });

                // Close sidebar when clicking outside on mobile
                $(document).on('click', function (e) {
                    if ($(window).width() <= 768) {
                        if (!$(e.target).closest('.sidebar').length && !$(e.target).closest('.sidebar-toggle').length) {
                            $('.sidebar').removeClass('active');
                            $('.main-content').removeClass('active');
                            $('.sidebar-toggle').show();
                        }
                    }
                });
            });
        </script>
    </body>
</html>