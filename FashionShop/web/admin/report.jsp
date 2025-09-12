<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin Reports</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
        <!-- DataTables CSS -->
        <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap5.min.css">
        <style>
            /* Add spacing between report sections */
            .report-card {
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                overflow: hidden;
                margin-bottom: 30px;
            }

            /* Custom headers for each section */
            .report-card .card-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                padding: 15px 20px;
                font-weight: bold;
                font-size: 1.1rem;
            }

            /* Table styling */
            .table {
                margin-bottom: 0;
            }

            .table thead th {
                font-weight: bold;
            }

            .summary-row {
                font-weight: bold;
            }

            /* Filter section styling */
            .filters {
                border: 1px solid rgba(0, 0, 0, 0.1);
            }

            /* Badge styling for better visibility */
            .badge {
                font-size: 85%;
                padding: 0.35em 0.65em;
            }

            /* Export buttons styling */
            .btn-export {
                font-weight: 500;
            }
            :root {
                --primary-color: #2c3e50;
                --secondary-color: #34495e;
                --accent-color: #3498db;
                --light-color: #ecf0f1;
                --border-color: #dee2e6;
                --hover-color: #f8f9fa;
                --success-color: #28a745;
                --danger-color: #dc3545;
                --warning-color: #ffc107;
                --info-color: #17a2b8;
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
                display: flex;
                justify-content: space-between;
                align-items: center;
            }

            .filters {
                background: white;
                border-radius: 8px;
                padding: 15px;
                margin-bottom: 20px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
            }

            .table-container {
                max-height: 500px;
                overflow-y: auto;
                border-radius: 8px;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
                background-color: white;
            }

            .table {
                margin-bottom: 0;
            }

            .table th {
                position: sticky;
                top: 0;
                background-color: var(--primary-color);
                color: white;
                font-weight: 600;
                z-index: 1;
            }

            .table-hover tbody tr:hover {
                background-color: var(--hover-color);
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

            .btn-export {
                background-color: var(--accent-color);
                color: white;
                border: none;
                border-radius: 4px;
                padding: 0.375rem 0.75rem;
                transition: background-color 0.3s;
            }

            .btn-export:hover {
                background-color: #2980b9;
                color: white;
            }

            .summary-row {
                background-color: var(--light-color);
                font-weight: bold;
            }

            .status-badge {
                font-size: 0.8rem;
                padding: 0.35em 0.65em;
                border-radius: 30px;
                font-weight: 500;
            }

            .dataTables_wrapper .dataTables_length,
            .dataTables_wrapper .dataTables_filter,
            .dataTables_wrapper .dataTables_info,
            .dataTables_wrapper .dataTables_processing,
            .dataTables_wrapper .dataTables_paginate {
                margin-top: 10px;
                margin-bottom: 10px;
                padding: 0 15px;
            }

            .dataTables_wrapper .dataTables_paginate .paginate_button {
                border-radius: 4px;
                margin: 0 2px;
            }

            .dataTables_wrapper .dataTables_paginate .paginate_button.current {
                background: var(--accent-color);
                border-color: var(--accent-color);
                color: white !important;
            }

            .dataTables_wrapper .dataTables_paginate .paginate_button:hover {
                background: var(--hover-color);
                border-color: var(--border-color);
            }

            @media (max-width: 768px) {
                .main-content {
                    margin-left: 0;
                }
                .sidebar-toggle {
                    display: block;
                }
            }
            /* Add these new styles for navigation and report switching */
            .report-nav {
                margin-bottom: 20px;
            }
            .report-section {
                display: none;
            }
            .report-section.active {
                display: block;
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
                    <i class="fas fa-file-alt me-2"></i>Báo cáo dữ liệu
                </h2>

                <!-- Navigation Bar for Reports -->
                <ul class="nav nav-pills report-nav">
                    <li class="nav-item">
                        <a class="nav-link active" href="#user-report" data-report="user-report">Báo cáo người dùng</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#order-report" data-report="order-report">Báo cáo đơn hàng</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#product-report" data-report="product-report">Báo cáo sản phẩm</a>
                    </li>
                </ul>

                <!-- Stats Cards -->
                <!--                <div class="row g-3 mb-4">
                                     User Stats 
                                    <div class="col-md-4">
                                        <div class="card dashboard-card h-100">
                                            <div class="card-body d-flex justify-content-between align-items-start">
                                                <div>
                                                    <p class="stat-title mb-1">Tổng người dùng</p>
                                                    <h3 class="stat-value">${userSummary.totalUsers}</h3>
                                                    <div class="mt-2">
                                                        <span class="badge bg-success">${userSummary.activeCount} Hoạt động</span>
                                                        <span class="badge bg-danger">${userSummary.inactiveCount} Không hoạt động</span>
                                                        <span class="badge bg-warning">${userSummary.pendingCount} Chờ xác nhận</span>
                                                    </div>
                                                </div>
                                                <div class="icon-bg bg-primary bg-opacity-10">
                                                    <i class="fas fa-users text-primary fa-2x"></i>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                
                                     Order Stats 
                                    <div class="col-md-4">
                                        <div class="card dashboard-card h-100">
                                            <div class="card-body d-flex justify-content-between align-items-start">
                                                <div>
                                                    <p class="stat-title mb-1">Tổng đơn hàng</p>
                                                    <h3 class="stat-value">${orderSummary.totalOrders}</h3>
                                                    <div class="mt-2">
                                                        <span class="badge bg-success">${orderSummary.completedCount} Hoàn thành</span>
                                                        <span class="badge bg-warning">${orderSummary.pendingPayCount + orderSummary.pendingCount + orderSummary.processingCount + orderSummary.shippingCount} Đang xử lý</span>
                                                        <span class="badge bg-danger">${orderSummary.cancelledCount} Đã hủy</span>
                                                    </div>
                                                </div>
                                                <div class="icon-bg bg-success bg-opacity-10">
                                                    <i class="fas fa-shopping-cart text-success fa-2x"></i>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                
                                     Product Stats 
                                    <div class="col-md-4">
                                        <div class="card dashboard-card h-100">
                                            <div class="card-body d-flex justify-content-between align-items-start">
                                                <div>
                                                    <p class="stat-title mb-1">Tổng sản phẩm</p>
                                                    <h3 class="stat-value">${productSummary.totalProducts}</h3>
                                                    <div class="mt-2">
                                                        <span class="badge bg-success">${productSummary.activeCount} Có sẵn</span>
                                                        <span class="badge bg-danger">${productSummary.inactiveCount} Không hoạt động</span>
                                                        <span class="badge bg-warning">${productSummary.eoStockCount} Hết hàng</span>
                                                    </div>
                                                </div>
                                                <div class="icon-bg bg-warning bg-opacity-10">
                                                    <i class="fas fa-boxes text-warning fa-2x"></i>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>-->

                <!-- User Reports Section -->
                <div id="user-report" class="report-section report-card active">
                    <div class="card-header bg-primary text-white">
                        <span><i class="fas fa-users me-2"></i>Báo cáo người dùng</span>
                        <button class="btn btn-light" id="exportUserBtn">
                            <i class="fas fa-file-export me-1"></i>Xuất báo cáo
                        </button>
                    </div>
                    <div class="card-body">
                        <!-- User Role Table -->
                        <div class="table-responsive mt-3">
                            <table class="table table-striped table-hover" id="userTable">
                                <thead class="table-primary">
                                    <tr>
                                        <th>Vai trò</th>
                                        <th>Tổng số người dùng</th>
                                        <th>Đang hoạt động</th>
                                        <th>Không hoạt động</th>
                                        <th>Tổng doanh thu từ khách</th>
                                        <th>Tổng số đơn hàng</th>
                                        <th>Giá trị đơn trung bình</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${userRoleReports}" var="report">
                                        <tr>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${report.role eq 'admin'}">
                                                        <span class="badge bg-danger">Quản trị viên</span>
                                                    </c:when>
                                                    <c:when test="${report.role eq 'sale'}">
                                                        <span class="badge bg-primary">Nhân viên bán hàng</span>
                                                    </c:when>
                                                    <c:when test="${report.role eq 'marketing'}">
                                                        <span class="badge bg-info">Nhân viên tiếp thị</span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="badge bg-secondary">Khách hàng</span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td>${report.totalUsers}</td>
                                            <td>${report.activeCount}</td>
                                            <td>${report.inactiveCount}</td>
                                            <td><fmt:formatNumber type="currency" value="${report.totalRevenue}" currencySymbol="₫" maxFractionDigits="0"/></td>
                                            <td>${report.totalOrders}</td>
                                            <td><fmt:formatNumber type="currency" value="${report.avgOrderValue}" currencySymbol="₫" maxFractionDigits="0"/></td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                                <tfoot class="table-primary fw-bold">
                                    <tr class="summary-row">
                                        <td>Tổng cộng</td>
                                        <td>${userCount}</td>
                                        <td>${userRoleTotalActive}</td>
                                        <td>${userRoleTotalInactive}</td>
                                        <td><fmt:formatNumber type="currency" value="${userRoleTotalRevenue}" currencySymbol="₫" maxFractionDigits="0"/></td>
                                        <td>${userRoleTotalOrders}</td>
                                        <td><fmt:formatNumber type="currency" value="${userRoleAvgOrderValue}" currencySymbol="₫" maxFractionDigits="0"/></td>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>

                        <!-- Phân tích và nhận xét về dữ liệu -->
                        <div class="analytics-section mt-4">
                            <h5 class="text-primary"><i class="fas fa-chart-line me-2"></i>Nhận xét</h5>
                            <div class="card">
                                <div class="card-body">
                                    <div class="analytics-insights">
                                        <c:set var="activePercentage" value="${userRoleTotalActive / userCount * 100}" />
                                        

                                        <div class="insight-item mb-2">
                                            <i class="fas fa-user-check text-success me-2"></i>
                                            <span>
                                                <strong>Tình trạng người dùng:</strong> 
                                                <c:choose>
                                                    <c:when test="${activePercentage gt 80}">
                                                        Tỷ lệ người dùng hoạt động rất cao (${activePercentage}%), chứng tỏ nền tảng có khả năng giữ chân người dùng tốt.
                                                    </c:when>
                                                    <c:when test="${activePercentage gt 60}">
                                                        Tỷ lệ người dùng hoạt động khá tốt (${activePercentage}%), nhưng vẫn có thể cải thiện.
                                                    </c:when>
                                                    <c:otherwise>
                                                        Tỷ lệ người dùng hoạt động thấp (${activePercentage}%), cần xem xét các chiến lược kích hoạt lại tài khoản.
                                                    </c:otherwise>
                                                </c:choose>
                                            </span>
                                        </div>

                                        <div class="insight-item mb-2">
                                            <i class="fas fa-shopping-cart text-primary me-2"></i>
                                            <span>
                                                <strong>Hiệu suất mua hàng:</strong> 
                                                <c:choose>
                                                    <c:when test="${userRoleTotalOrders gt 1000 && userRoleAvgOrderValue gt 500000}">
                                                        Doanh số bán hàng mạnh với ${userRoleTotalOrders} đơn hàng và giá trị đơn trung bình cao.
                                                    </c:when>
                                                    <c:when test="${userRoleTotalOrders gt 500}">
                                                        Doanh số ở mức trung bình với ${userRoleTotalOrders} đơn hàng. Cần chiến lược tăng giá trị đơn hàng.
                                                    </c:when>
                                                    <c:otherwise>
                                                        Doanh số cần cải thiện với chỉ ${userRoleTotalOrders} đơn hàng. Nên xem xét chiến dịch khuyến mãi mới.
                                                    </c:otherwise>
                                                </c:choose>
                                            </span>
                                        </div>

                                        

                                        <div class="insight-item">
                                            <i class="fas fa-money-bill-wave text-success me-2"></i>
                                            <span>
                                                <strong>Doanh thu:</strong> 
                                                <c:choose>
                                                    <c:when test="${userRoleTotalRevenue gt 1000000000}">
                                                        Doanh thu rất tốt đạt <fmt:formatNumber type="currency" value="${userRoleTotalRevenue}" currencySymbol="₫" maxFractionDigits="0"/>, 
                                                        vượt chỉ tiêu kỳ vọng.
                                                    </c:when>
                                                    <c:when test="${userRoleTotalRevenue gt 500000000}">
                                                        Doanh thu khả quan đạt <fmt:formatNumber type="currency" value="${userRoleTotalRevenue}" currencySymbol="₫" maxFractionDigits="0"/>, 
                                                        đang đi đúng kế hoạch.
                                                    </c:when>
                                                    <c:otherwise>
                                                        Doanh thu còn khiêm tốn đạt <fmt:formatNumber type="currency" value="${userRoleTotalRevenue}" currencySymbol="₫" maxFractionDigits="0"/>, 
                                                        cần thúc đẩy mạnh hơn.
                                                    </c:otherwise>
                                                </c:choose>
                                            </span>
                                        </div>
                                    </div>

                                    <!-- Đề xuất hành động -->
                                    <div class="action-recommendations mt-3 pt-3 border-top">
                                        <h6 class="text-primary">Đề xuất:</h6>
                                        <ul class="action-list">
                                            <c:if test="${activePercentage lt 80}">
                                                <li>Gửi email kích hoạt lại cho ${userRoleTotalInactive} tài khoản không hoạt động</li>
                                                </c:if>
                                                <c:if test="${userRoleAvgOrderValue lt 500000}">
                                                <li>Tạo chiến dịch up-sell để tăng giá trị đơn hàng trung bình</li>
                                                </c:if>
                                                <c:if test="${userRoleTotalOrders lt 500}">
                                                <li>Tạo chương trình khuyến mãi để thu hút đơn hàng mới</li>
                                                </c:if>
                                            <li>Tiếp tục theo dõi tỷ lệ chuyển đổi của khách hàng để đánh giá hiệu quả</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Order Reports Section -->
                <div id="order-report" class="report-section report-card">
                    <div class="card-header bg-success text-white">
                        <span><i class="fas fa-shopping-cart me-2"></i>Báo cáo đơn hàng</span>
                        <button class="btn btn-light" id="exportOrderBtn">
                            <i class="fas fa-file-export me-1"></i>Xuất báo cáo
                        </button>
                    </div>
                    <div class="card-body">
                        <!-- Filters -->
                        <div class="filters p-3 bg-light rounded mb-3">
                            <form action="${pageContext.request.contextPath}/admin/report" method="get" class="row">
                                <div class="col-md-10 mb-3 mb-md-0">
                                    <label for="orderStatus" class="form-label">Trạng thái đơn hàng</label>
                                    <select class="form-select" id="orderStatus" name="orderStatus" onchange="this.form.submit()">
                                        <option value="all" ${orderStatusFilter eq 'all' ? 'selected' : ''}>Tất cả trạng thái</option>
                                        <option value="pending_pay" ${orderStatusFilter eq 'pending_pay' ? 'selected' : ''}>Chờ thanh toán</option>
                                        <option value="pending" ${orderStatusFilter eq 'pending' ? 'selected' : ''}>Đang chờ</option>
                                        <option value="processing" ${orderStatusFilter eq 'processing' ? 'selected' : ''}>Đang xử lý</option>
                                        <option value="shipping" ${orderStatusFilter eq 'shipped' ? 'selected' : ''}>Đã gửi hàng</option>
                                        <option value="completed" ${orderStatusFilter eq 'completed' ? 'selected' : ''}>Đã hoàn thành</option>
                                        <option value="cancelled" ${orderStatusFilter eq 'cancelled' ? 'selected' : ''}>Đã hủy</option>
                                    </select>
                                </div>
                                <div class="col-md-2 d-flex align-items-end">
                                    <button type="submit" class="btn btn-success w-100">Lọc</button>
                                </div>
                            </form>
                        </div>

                        <!-- Order Table -->
                        <div class="table-responsive mt-3">
                            <table class="table table-striped table-hover" id="orderTable">
                                <thead class="table-success">
                                    <tr>
                                        <th>Trạng thái đơn hàng</th>
                                        <th>Tổng số đơn hàng</th>
                                        <th>Tổng giá trị đơn</th>
                                        <th>Doanh thu thực tế</th>
                                        <th>Tổng giảm giá áp dụng</th>
                                        <th>Đơn hàng dùng mã giảm giá</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${orderReports}" var="order">
                                        <tr>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${order.status eq 'pending_pay'}">
                                                        <span class="badge bg-secondary">Chờ thanh toán</span>
                                                    </c:when>
                                                    <c:when test="${order.status eq 'pending'}">
                                                        <span class="badge bg-warning">Đang phê duyệt</span>
                                                    </c:when>
                                                    <c:when test="${order.status eq 'processing'}">
                                                        <span class="badge bg-info">Đang xử lý</span>
                                                    </c:when>
                                                    <c:when test="${order.status eq 'shipping'}">
                                                        <span class="badge bg-primary">Đã giao</span>
                                                    </c:when>
                                                    <c:when test="${order.status eq 'completed'}">
                                                        <span class="badge bg-success">Đã hoàn thành</span>
                                                    </c:when>
                                                    <c:when test="${order.status eq 'cancelled'}">
                                                        <span class="badge bg-danger">Đã huỷ</span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="badge bg-dark">Đã trả lại</span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td>${order.orderCount}</td>
                                            <td><fmt:formatNumber type="currency" value="${order.totalAmount}" currencySymbol="₫" maxFractionDigits="0"/></td>
                                            <td><fmt:formatNumber type="currency" value="${order.actualRevenue}" currencySymbol="₫" maxFractionDigits="0"/></td>
                                            <td><fmt:formatNumber type="currency" value="${order.totalDiscount}" currencySymbol="₫" maxFractionDigits="0"/></td>
                                            <td>${order.discountedOrderCount}</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                                <tfoot class="table-success fw-bold">
                                    <tr class="summary-row">
                                        <td>Tổng cộng</td>
                                        <td>${orderReportTotalOrders}</td>
                                        <td><fmt:formatNumber type="currency" value="${orderReportTotalAmount}" currencySymbol="₫" maxFractionDigits="0"/></td>
                                        <td><fmt:formatNumber type="currency" value="${orderReportTotalActualRevenue}" currencySymbol="₫" maxFractionDigits="0"/></td>
                                        <td><fmt:formatNumber type="currency" value="${orderReportTotalDiscount}" currencySymbol="₫" maxFractionDigits="0"/></td>
                                        <td>${orderReportTotalDiscountedOrders}</td>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>

                        <!-- Phần nhận xét tự động dựa vào số liệu đơn hàng -->
                        <div class="mt-4 p-3 bg-light rounded">
                            <h5 class="mb-3 text-success"><i class="fas fa-chart-pie me-2"></i>Nhận xét</h5>
                            <div class="row">
                                <div class="col-md-12">
                                    <ul class="list-group">
                                        <!-- Phân tích tỷ lệ hoàn thành đơn hàng -->
                                        <li class="list-group-item">
                                            <c:set var="completionRate" value="${0}" />
                                            <c:forEach items="${orderReports}" var="order">
                                                <c:if test="${order.status eq 'completed'}">
                                                    <c:set var="completionRate" value="${(order.orderCount / orderReportTotalOrders) * 100}" />
                                                </c:if>
                                            </c:forEach>
                                            <div class="d-flex justify-content-between align-items-center">
                                                <span>Tỷ lệ hoàn thành đơn hàng: <span class="fw-bold"><fmt:formatNumber value="${completionRate}" maxFractionDigits="1"/>%</span></span>
                                                <c:choose>
                                                    <c:when test="${completionRate > 80}">
                                                        <span class="badge bg-success">Tốt</span>
                                                    </c:when>
                                                    <c:when test="${completionRate > 60}">
                                                        <span class="badge bg-info">Bình thường</span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="badge bg-warning text-dark">Cần cải thiện</span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                        </li>

                                        <!-- Phân tích tỷ lệ hủy đơn hàng -->
                                        <li class="list-group-item">
                                            <c:set var="cancellationRate" value="${0}" />
                                            <c:forEach items="${orderReports}" var="order">
                                                <c:if test="${order.status eq 'cancelled'}">
                                                    <c:set var="cancellationRate" value="${(order.orderCount / orderReportTotalOrders) * 100}" />
                                                </c:if>
                                            </c:forEach>
                                            <div class="d-flex justify-content-between align-items-center">
                                                <span>Tỷ lệ hủy đơn hàng: <span class="fw-bold"><fmt:formatNumber value="${cancellationRate}" maxFractionDigits="1"/>%</span></span>
                                                <c:choose>
                                                    <c:when test="${cancellationRate < 5}">
                                                        <span class="badge bg-success">Tốt</span>
                                                    </c:when>
                                                    <c:when test="${cancellationRate < 10}">
                                                        <span class="badge bg-info">Bình thường</span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="badge bg-danger">Cần xem xét nguyên nhân</span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                        </li>

                                        <!-- Phân tích hiệu quả của mã giảm giá -->
                                        <li class="list-group-item">
                                            <c:set var="discountEffectiveness" value="${(orderReportTotalDiscountedOrders / orderReportTotalOrders) * 100}" />
                                            <c:set var="avgDiscountValue" value="${orderReportTotalDiscount / orderReportTotalDiscountedOrders}" />
                                            <div class="d-flex justify-content-between align-items-center">
                                                <span>Tỷ lệ sử dụng mã giảm giá: <span class="fw-bold"><fmt:formatNumber value="${discountEffectiveness}" maxFractionDigits="1"/>%</span></span>
                                                <c:choose>
                                                    <c:when test="${discountEffectiveness > 40}">
                                                        <span class="badge bg-success">Hiệu quả cao</span>
                                                    </c:when>
                                                    <c:when test="${discountEffectiveness > 20}">
                                                        <span class="badge bg-info">Hiệu quả trung bình</span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="badge bg-warning text-dark">Hiệu quả thấp</span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                            <div class="mt-2">
                                                <span>Giá trị giảm giá trung bình: <span class="fw-bold"><fmt:formatNumber type="currency" value="${avgDiscountValue}" currencySymbol="₫" maxFractionDigits="0"/></span></span>
                                            </div>
                                        </li>

                                        <!-- Phân tích tỷ lệ doanh thu thực tế so với tổng giá trị đơn -->
                                        <li class="list-group-item">
                                            <c:set var="revenueRatio" value="${(orderReportTotalActualRevenue / orderReportTotalAmount) * 100}" />
                                            <div class="d-flex justify-content-between align-items-center">
                                                <span>Tỷ lệ doanh thu thực tế/tổng giá trị: <span class="fw-bold"><fmt:formatNumber value="${revenueRatio}" maxFractionDigits="1"/>%</span></span>
                                                <c:choose>
                                                    <c:when test="${revenueRatio > 90}">
                                                        <span class="badge bg-success">Rất tốt</span>
                                                    </c:when>
                                                    <c:when test="${revenueRatio > 80}">
                                                        <span class="badge bg-info">Tốt</span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="badge bg-warning text-dark">Cần xem xét chiến lược giảm giá</span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                        </li>

                                        <!-- Đơn hàng đang xử lý -->
                                        <li class="list-group-item">
                                            <c:set var="pendingOrdersCount" value="${0}" />
                                            <c:forEach items="${orderReports}" var="order">
                                                <c:if test="${order.status eq 'pending' || order.status eq 'pending_pay' || order.status eq 'processing'}">
                                                    <c:set var="pendingOrdersCount" value="${pendingOrdersCount + order.orderCount}" />
                                                </c:if>
                                            </c:forEach>
                                            <c:set var="pendingOrdersRate" value="${(pendingOrdersCount / orderReportTotalOrders) * 100}" />
                                            <div class="d-flex justify-content-between align-items-center">
                                                <span>Đơn hàng đang xử lý: <span class="fw-bold">${pendingOrdersCount} đơn (<fmt:formatNumber value="${pendingOrdersRate}" maxFractionDigits="1"/>%)</span></span>
                                                <c:choose>
                                                    <c:when test="${pendingOrdersRate > 30}">
                                                        <span class="badge bg-warning text-dark">Cần tăng tốc xử lý</span>
                                                    </c:when>
                                                    <c:when test="${pendingOrdersRate > 15}">
                                                        <span class="badge bg-info">Bình thường</span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="badge bg-success">Tốc độ xử lý tốt</span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                        </li>

                                        <!-- Đề xuất hành động -->
                                        <li class="list-group-item bg-light">
                                            <strong>Đề xuất:</strong>
                                            <ul class="mt-2">
                                                <c:if test="${cancellationRate > 10}">
                                                    <li>Kiểm tra nguyên nhân hủy đơn cao (${cancellationRate}%) và có biện pháp khắc phục.</li>
                                                    </c:if>
                                                    <c:if test="${pendingOrdersRate > 25}">
                                                    <li>Cần tăng cường nhân sự xử lý đơn hàng đang chờ (${pendingOrdersCount} đơn).</li>
                                                    </c:if>
                                                    <c:if test="${discountEffectiveness < 20}">
                                                    <li>Xem xét lại chiến dịch giảm giá để tăng tỷ lệ sử dụng.</li>
                                                    </c:if>
                                                    <c:if test="${revenueRatio < 80}">
                                                    <li>Đánh giá lại chính sách giảm giá để tối ưu doanh thu thực tế.</li>
                                                    </c:if>
                                                    <c:if test="${completionRate < 60}">
                                                    <li>Cải thiện quy trình để tăng tỷ lệ hoàn thành đơn hàng.</li>
                                                    </c:if>
                                            </ul>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Product Reports Section -->
                <div id="product-report" class="report-section report-card">
                    <div class="card-header bg-warning text-dark">
                        <span><i class="fas fa-boxes me-2"></i>Báo cáo sản phẩm</span>
                        <div>
                            <button class="btn btn-danger me-2" id="showLowStockBtn" data-bs-toggle="modal" data-bs-target="#lowStockModal">
                                <i class="fas fa-exclamation-triangle me-1"></i>Sản phẩm tồn thấp
                            </button>
                            <button class="btn btn-dark" id="exportProductBtn">
                                <i class="fas fa-file-export me-1"></i>Xuất báo cáo
                            </button>
                        </div>
                    </div>
                    <div class="card-body">
                        <!-- Filters -->
                        <div class="filters p-3 bg-light rounded mb-3">
                            <form action="${pageContext.request.contextPath}/admin/report" method="get" class="row">
                                <div class="col-md-10 mb-3 mb-md-0">
                                    <label for="productStatus" class="form-label">Trạng thái sản phẩm</label>
                                    <select class="form-select" id="productStatus" name="productStatus" onchange="this.form.submit()">
                                        <option value="all" ${productStatusFilter eq 'all' ? 'selected' : ''}>Tất cả trạng thái</option>
                                        <option value="active" ${productStatusFilter eq 'active' ? 'selected' : ''}>Hoạt động</option>
                                        <option value="inactive" ${productStatusFilter eq 'inactive' ? 'selected' : ''}>Không hoạt động</option>
                                        <option value="EOStock" ${productStatusFilter eq 'EOStock' ? 'selected' : ''}>Hết hàng</option>
                                    </select>
                                </div>
                                <div class="col-md-2 d-flex align-items-end">
                                    <button type="submit" class="btn btn-warning w-100">Lọc</button>
                                </div>
                            </form>
                        </div>

                        <!-- Product Inventory Table -->
                        <div class="table-responsive mt-3">
                            <table class="table table-striped table-hover" id="productTable">
                                <thead class="table-warning">
                                    <tr>
                                        <th>Trạng thái sản phẩm</th>
                                        <th>Tổng số sản phẩm</th>
                                        <th>Tổng tồn kho</th>
                                        <th>Sản phẩm tồn thấp</th>
                                        <th>Tổng số lượng bán ra</th>
                                        <!--                        <th>Tổng doanh thu</th>-->
                                        <th>Sản phẩm bán chạy</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:if test="${empty productInventoryReports}">
                                        <tr>
                                            <td colspan="7" class="text-center">Không có dữ liệu để hiển thị</td>
                                        </tr>
                                    </c:if>
                                    <c:forEach items="${productInventoryReports}" var="product">
                                        <tr>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${product.status eq 'active'}">
                                                        <span class="badge bg-success">Hoạt động</span>
                                                    </c:when>
                                                    <c:when test="${product.status eq 'inactive'}">
                                                        <span class="badge bg-danger">Không hoạt động</span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="badge bg-warning text-dark">Hết hàng</span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td>${product.totalProducts}</td>
                                            <td>${product.totalStock}</td>
                                            <td>${product.lowStockCount}</td>
                                            <td>${product.totalSoldQuantity}</td>
                <!--                            <td><fmt:formatNumber type="currency" value="${product.totalRevenue}" currencySymbol="₫" maxFractionDigits="0"/></td>-->
                                            <td>${product.bestSellerCount}</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                                <tfoot class="table-warning fw-bold">
                                    <tr class="summary-row">
                                        <td>Tổng cộng</td>
                                        <td>${productCount}</td>
                                        <td>${totalStock}</td>
                                        <td>${totalLowStockCount}</td>
                                        <td>${totalSoldQuantity}</td>
                <!--                        <td><fmt:formatNumber type="currency" value="${productTotalRevenue}" currencySymbol="₫" maxFractionDigits="0"/></td>-->
                                        <td>${totalBestSellerCount}</td>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>

                        <!-- Phần nhận xét tự động dựa vào số liệu -->
                        <div class="mt-4 p-3 bg-light rounded">
                            <h5 class="mb-3 text-primary"><i class="fas fa-chart-line me-2"></i>Nhận xét</h5>
                            <div class="row">
                                <div class="col-md-12">
                                    <ul class="list-group">
                                        <!-- Nhận xét về tỷ lệ sản phẩm tồn thấp -->
                                        <li class="list-group-item">
                                            <c:set var="lowStockPercentage" value="${(totalLowStockCount / productCount) * 100}" />
                                            <div class="d-flex justify-content-between align-items-center">
                                                <span>Tỷ lệ sản phẩm tồn thấp: <span class="fw-bold"><fmt:formatNumber value="${lowStockPercentage}" maxFractionDigits="1"/>%</span></span>
                                                <c:choose>
                                                    <c:when test="${lowStockPercentage > 20}">
                                                        <span class="badge bg-danger">Cần nhập thêm hàng</span>
                                                    </c:when>
                                                    <c:when test="${lowStockPercentage > 10}">
                                                        <span class="badge bg-warning text-dark">Cần chú ý</span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="badge bg-success">Bình thường</span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                        </li>

                                        <!-- Phân tích tốc độ bán hàng -->
                                        <li class="list-group-item">
                                            <c:set var="sellThroughRate" value="${(totalSoldQuantity / (totalSoldQuantity + totalStock)) * 100}" />
                                            <div class="d-flex justify-content-between align-items-center">
                                                <span>Tỷ lệ bán hàng: <span class="fw-bold"><fmt:formatNumber value="${sellThroughRate}" maxFractionDigits="1"/>%</span></span>
                                                <c:choose>
                                                    <c:when test="${sellThroughRate > 70}">
                                                        <span class="badge bg-success">Tốt</span>
                                                    </c:when>
                                                    <c:when test="${sellThroughRate > 40}">
                                                        <span class="badge bg-info">Bình thường</span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="badge bg-warning text-dark">Chậm</span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                        </li>

                                        <!-- Phân tích sản phẩm bán chạy -->
                                        <li class="list-group-item">
                                            <c:set var="bestSellerPercentage" value="${(totalBestSellerCount / productCount) * 100}" />
                                            <div class="d-flex justify-content-between align-items-center">
                                                <span>Tỷ lệ sản phẩm bán chạy: <span class="fw-bold"><fmt:formatNumber value="${bestSellerPercentage}" maxFractionDigits="1"/>%</span></span>
                                                <c:choose>
                                                    <c:when test="${bestSellerPercentage < 10}">
                                                        <span class="badge bg-warning text-dark">Cần đa dạng hóa</span>
                                                    </c:when>
                                                    <c:when test="${bestSellerPercentage > 30}">
                                                        <span class="badge bg-success">Danh mục sản phẩm hiệu quả</span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="badge bg-info">Bình thường</span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                        </li>

                                        <!-- Đề xuất hành động -->
                                        <li class="list-group-item bg-light">
                                            <strong>Đề xuất:</strong>
                                            <ul class="mt-2">
                                                <c:if test="${lowStockPercentage > 15}">
                                                    <li>Cần nhập thêm hàng cho ${totalLowStockCount} sản phẩm đang tồn thấp.</li>
                                                    </c:if>
                                                    <c:if test="${sellThroughRate < 40}">
                                                    <li>Xem xét áp dụng chương trình khuyến mãi để tăng tốc độ bán hàng.</li>
                                                    </c:if>
                                                    <c:if test="${bestSellerPercentage < 15}">
                                                    <li>Cần phân tích và đẩy mạnh tiếp thị các sản phẩm tiềm năng.</li>
                                                    </c:if>

                                            </ul>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Low Stock Products Modal -->
            <div class="modal fade" id="lowStockModal" tabindex="-1" aria-labelledby="lowStockModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-xl">
                    <div class="modal-content">
                        <div class="modal-header bg-danger text-white">
                            <h5 class="modal-title" id="lowStockModalLabel"><i class="fas fa-exclamation-triangle me-2"></i>Sản phẩm tồn thấp</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-hover" id="lowStockTable">
                                    <thead class="table-danger">
                                        <tr>
                                            <th>Mã sản phẩm</th>
                                            <th>Tên sản phẩm</th>
                                            <th>Danh mục</th>
                                            <th>Kích thước</th>
                                            <th>Màu sắc</th>
                                            <th>Số lượng tồn kho</th>
                                        </tr>
                                    </thead>
                                    <tbody id="lowStockTableBody">
                                        <!-- Data will be loaded via AJAX -->
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                            <button type="button" class="btn btn-danger" id="exportLowStockBtn">Xuất báo cáo</button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- jQuery -->
            <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
            <!-- Bootstrap JS Bundle with Popper -->
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
            <!-- DataTables JS -->
            <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
            <script src="https://cdn.datatables.net/1.11.5/js/dataTables.bootstrap5.min.js"></script>
            <!-- SheetJS (XLSX) for exporting -->
            <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.18.5/xlsx.full.min.js"></script>

            <script>
                                        $(document).ready(function () {
                                            // Initialize DataTables
                                            const userTable = $('#userTable').DataTable({
                                                "language": {
                                                    "lengthMenu": "Hiển thị _MENU_ dòng mỗi trang",
                                                    "zeroRecords": "Không tìm thấy dữ liệu",
                                                    "info": "Trang _PAGE_ trên _PAGES_",
                                                    "infoEmpty": "Không có dữ liệu",
                                                    "infoFiltered": "(lọc từ _MAX_ tổng số dòng)",
                                                    "search": "Tìm kiếm:",
                                                    "paginate": {
                                                        "first": "Đầu",
                                                        "last": "Cuối",
                                                        "next": "Tiếp",
                                                        "previous": "Trước"
                                                    }
                                                }
                                            });

                                            const orderTable = $('#orderTable').DataTable({
                                                "language": {
                                                    "lengthMenu": "Hiển thị _MENU_ dòng mỗi trang",
                                                    "zeroRecords": "Không tìm thấy dữ liệu",
                                                    "info": "Trang _PAGE_ trên _PAGES_",
                                                    "infoEmpty": "Không có dữ liệu",
                                                    "infoFiltered": "(lọc từ _MAX_ tổng số dòng)",
                                                    "search": "Tìm kiếm:",
                                                    "paginate": {
                                                        "first": "Đầu",
                                                        "last": "Cuối",
                                                        "next": "Tiếp",
                                                        "previous": "Trước"
                                                    }
                                                }
                                            });

                                            const productTable = $('#productTable').DataTable({
                                                "language": {
                                                    "lengthMenu": "Hiển thị _MENU_ dòng mỗi trang",
                                                    "zeroRecords": "Không tìm thấy dữ liệu",
                                                    "info": "Trang _PAGE_ trên _PAGES_",
                                                    "infoEmpty": "Không có dữ liệu",
                                                    "infoFiltered": "(lọc từ _MAX_ tổng số dòng)",
                                                    "search": "Tìm kiếm:",
                                                    "paginate": {
                                                        "first": "Đầu",
                                                        "last": "Cuối",
                                                        "next": "Tiếp",
                                                        "previous": "Trước"
                                                    }
                                                }
                                            });

                                            // Report navigation
                                            $('.nav-link').click(function (e) {
                                                e.preventDefault();
                                                $('.nav-link').removeClass('active');
                                                $(this).addClass('active');

                                                const reportId = $(this).data('report');
                                                $('.report-section').removeClass('active');
                                                $('#' + reportId).addClass('active');
                                            });

                                            // Export functions
                                            function exportTableToExcel(tableId, fileName) {
                                                const table = document.getElementById(tableId);
                                                const wb = XLSX.utils.table_to_book(table, {sheet: "Sheet1"});
                                                XLSX.writeFile(wb, fileName + '.xlsx');
                                            }

                                            $('#exportUserBtn').click(function () {
                                                exportTableToExcel('userTable', 'user_report');
                                            });

                                            $('#exportOrderBtn').click(function () {
                                                exportTableToExcel('orderTable', 'order_report');
                                            });

                                            $('#exportProductBtn').click(function () {
                                                exportTableToExcel('productTable', 'product_report');
                                            });

                                            // Low Stock Modal AJAX (unchanged)
                                            $('#lowStockModal').on('shown.bs.modal', function () {
                                                $.ajax({
                                                    url: '${pageContext.request.contextPath}/admin/low-stock-products',
                                                    method: 'GET',
                                                    dataType: 'json',
                                                    success: function (data) {
                                                        let table = $('#lowStockTable');
                                                        if ($.fn.DataTable.isDataTable(table)) {
                                                            table.DataTable().destroy();
                                                        }
                                                        table.DataTable({
                                                            "language": {
                                                                "lengthMenu": "Hiển thị _MENU_ dòng mỗi trang",
                                                                "zeroRecords": "Không tìm thấy dữ liệu",
                                                                "info": "Trang _PAGE_ trên _PAGES_",
                                                                "infoEmpty": "Không có dữ liệu",
                                                                "infoFiltered": "(lọc từ _MAX_ tổng số dòng)",
                                                                "search": "Tìm kiếm:",
                                                                "paginate": {
                                                                    "first": "Đầu",
                                                                    "last": "Cuối",
                                                                    "next": "Tiếp",
                                                                    "previous": "Trước"
                                                                }
                                                            },
                                                            "data": data,
                                                            "columns": [
                                                                {"data": "id"},
                                                                {"data": "title"},
                                                                {"data": "categoryName", "defaultContent": ""},
                                                                {"data": "size", "defaultContent": ""},
                                                                {"data": "color", "defaultContent": ""},
                                                                {"data": "stockQuantity"}
                                                            ]
                                                        });
                                                    },
                                                    error: function (xhr, status, error) {
                                                        console.error('Error loading low stock products:', error);
                                                        $('#lowStockTableBody').html('<tr><td colspan="6" class="text-center">Lỗi khi tải dữ liệu</td></tr>');
                                                    }
                                                });
                                            });

                                            $('#exportLowStockBtn').click(function () {
                                                const table = document.getElementById('lowStockTable');
                                                const wb = XLSX.utils.table_to_book(table, {sheet: "Sheet1"});
                                                XLSX.writeFile(wb, 'low_stock_products.xlsx');
                                            });
                                        });
            </script>

    </body>
</html>
