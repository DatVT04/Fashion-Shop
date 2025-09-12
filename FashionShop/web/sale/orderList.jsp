<%-- 
    Document   : orderList
    Created on : Mar 23, 2025, 12:33:14 AM
    Author     : tphon
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Danh sách đơn hàng</title>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css" rel="stylesheet" />
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

            .sort-link {
                text-decoration: none;
                color: var(--primary-color);
                font-weight: 600;
                display: flex;
                align-items: center;
                justify-content: space-between;
            }

            .sort-link:hover {
                color: var(--accent-color);
            }

            .sort-icons {
                margin-left: 5px;
            }

            .main-content {
                margin-left: 250px;
                transition: all 0.3s;
                padding: 20px;
                min-height: 100vh;
            }

            .card {
                border-radius: 8px;
                box-shadow: 0 2px 10px rgba(0,0,0,0.1);
                border: 1px solid var(--border-color);
                margin-bottom: 20px;
            }

            .card-header {
                background-color: #fff;
                border-bottom: 1px solid var(--border-color);
                padding: 15px 20px;
                font-weight: 600;
            }

            .table {
                margin-bottom: 0;
            }

            .table th {
                font-weight: 600;
                border-top: none;
                background-color: rgba(52, 152, 219, 0.05);
                vertical-align: middle;
            }

            .table td {
                vertical-align: middle;
            }

            .table tbody tr:hover {
                background-color: var(--hover-color);
            }

            .action-btn {
                padding: 5px 15px;
                border-radius: 4px;
                transition: all 0.3s;
            }

            .action-btn:hover {
                transform: translateY(-2px);
                box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            }

            .search-box {
                border-radius: 50px;
                padding-left: 15px;
                border: 1px solid var(--border-color);
            }

            .search-btn {
                border-radius: 50px;
                padding: 8px 20px;
            }

            .filter-card {
                background-color: white;
                border-radius: 8px;
                margin-bottom: 20px;
            }

            .page-title {
                color: var(--primary-color);
                margin-bottom: 20px;
                padding-bottom: 10px;
                border-bottom: 2px solid var(--accent-color);
                display: inline-block;
            }

            .empty-state {
                padding: 40px;
                text-align: center;
                color: #6c757d;
            }

            .status-badge {
                padding: 5px 10px;
                border-radius: 50px;
                font-weight: 500;
                color: white;
            }

            .pagination .page-item .page-link {
                color: var(--primary-color);
                border: 1px solid var(--border-color);
                min-width: 40px;
                text-align: center;
            }

            .pagination .page-item.active .page-link {
                background-color: var(--accent-color);
                border-color: var(--accent-color);
                color: white;
            }

            .pagination .page-item .page-link:hover {
                background-color: var(--hover-color);
            }

            /* Sidebar styling */
            .sidebar {
                position: fixed;
                top: 0;
                left: 0;
                height: 100%;
                width: 250px;
                z-index: 1000;
                transition: all 0.3s;
            }

            .sidebar-toggle {
                position: fixed;
                left: 10px;
                top: 10px;
                z-index: 1001;
                display: none;
                border-radius: 50%;
                width: 42px;
                height: 42px;
                box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            }

            /* Table responsiveness */
            .table-responsive {
                overflow-x: auto;
                -webkit-overflow-scrolling: touch;
            }

            /* Select2 styling */
            .select2-container--default .select2-selection--single {
                height: 38px;
                padding: 5px 15px;
            }

            .select2-container--default .select2-selection--single .select2-selection__arrow {
                height: 38px;
                right: 10px;
            }

            .select2-container--default .select2-selection--single .select2-selection__placeholder {
                color: #6c757d;
            }

            .select2-container--default.select2-container--focus .select2-selection--single {
                border-color: var(--accent-color);
                box-shadow: 0 0 0 0.2rem rgba(52, 152, 219, 0.25);
            }

            .select2-container--default .select2-dropdown {
                border: 1px solid var(--border-color);
                border-radius: 0px;
                box-shadow: 0 2px 10px rgba(0,0,0,0.1);
                background-color: #fff;
                margin-top: 5px;
            }

            .select2-container--default .select2-results__option {
                padding: 8px 15px;
                color: var(--primary-color);
            }

            .select2-container--default .select2-results__option--highlighted[aria-selected] {
                background-color: var(--hover-color);
                color: var(--primary-color);
            }

            .select2-container--default .select2-search--dropdown .select2-search__field {
                border: 1px solid var(--border-color);
                border-radius: 10px;
                padding: 5px 15px;
            }

            .select2-container--default .select2-selection--single .select2-selection__clear {
                color: var(--accent-color);
                font-weight: bold;
                margin-right: 10px;
            }

            .select2-container--default .select2-results > .select2-results__options {
                max-height: 400px;
                overflow-y: auto;
            }

            .select2-container--default .select2-dropdown {
                max-height: none;
            }

            /* Responsive adjustments */
            @media (max-width: 1550px) {
                /* Adjust table cells padding */
                .table td, .table th {
                    padding: 0.5rem;
                }

                /* Make columns more adaptable */
                .table th:nth-child(1),
                .table td:nth-child(1) {
                    width: 40px;
                }

                .table th:nth-child(2),
                .table td:nth-child(2) {
                    min-width: 100px;
                }

                .table th:nth-child(3),
                .table td:nth-child(3) {
                    min-width: 120px;
                }

                .table th:nth-child(4),
                .table td:nth-child(4),
                .table th:nth-child(5),
                .table td:nth-child(5) {
                    min-width: 150px;
                }

                .table th:nth-child(6),
                .table td:nth-child(6) {
                    min-width: 200px;
                }

                .table th:nth-child(7),
                .table td:nth-child(7) {
                    min-width: 100px;
                }

                .table th:nth-child(8),
                .table td:nth-child(8) {
                    min-width: 120px;
                }

                .table th:nth-child(9),
                .table td:nth-child(9) {
                    min-width: 80px;
                }

                /* Status badge and action buttons adjustments */
                .status-badge {
                    padding: 3px 6px;
                    font-size: 0.8rem;
                }

                .action-btn {
                    padding: 3px 8px;
                }
            }

            /* Medium devices (tablets) */
            @media (max-width: 992px) {
                .filter-card .row {
                    flex-direction: column;
                }

                .filter-card .col-md-4,
                .filter-card .col-md-2 {
                    width: 100%;
                    margin-bottom: 10px;
                }

                .d-grid.gap-2.d-md-flex {
                    flex-direction: row;
                    justify-content: space-between;
                }

                .card-body {
                    padding: 15px 10px;
                }
            }

            /* Small devices (phones) */
            @media (max-width: 768px) {
                .main-content {
                    margin-left: 0;
                }

                .main-content.active {
                    margin-left: 250px;
                }

                .sidebar-toggle {
                    display: block;
                }

                /* Hide less important columns */
                .table th:nth-child(4),
                .table td:nth-child(4),
                .table th:nth-child(6),
                .table td:nth-child(6) {
                    display: none;
                }

                /* Sidebar gets pushed off-screen when not active */
                .sidebar {
                    left: -250px;
                }

                .sidebar.active {
                    left: 0;
                }
            }

            /* Extra small devices */
            @media (max-width: 576px) {
                .table th:nth-child(5),
                .table td:nth-child(5) {
                    display: none;
                }

                .pagination .page-link {
                    padding: 0.25rem 0.5rem;
                    font-size: 0.875rem;
                }

                .page-title {
                    font-size: 1.5rem;
                }

                .card-header {
                    padding: 10px 15px;
                }

                .action-btn {
                    padding: 2px 5px;
                    font-size: 0.75rem;
                }
            }
        </style>
    </head>
    <body>
        <!-- Include the sidebar -->
        <jsp:include page="sidebar.jsp" />

        <button class="btn btn-primary sidebar-toggle">
            <i class="fas fa-bars"></i>
        </button>

        <div class="main-content">
            <div class="container-fluid p-4">
                <h2 class="page-title">
                    <i class="fas fa-shopping-cart me-2"></i>Danh sách đơn hàng
                </h2>

                <!-- Filter Section -->
                <div class="card filter-card">
                    <div class="card-header">
                        <i class="fas fa-filter me-2"></i>Bộ lọc tìm kiếm
                    </div>
                    <div class="card-body">
                        <form action="orderlist" method="GET" class="row g-3">
                            <div class="col-md-4">
                                <div class="input-group">
                                    <span class="input-group-text bg-white">
                                        <i class="fas fa-search text-muted"></i>
                                    </span>
                                    <input type="text" name="keyword" value="${keyword}" class="form-control search-box" placeholder="Tìm kiếm mã đơn hàng hoặc tên hoặc email khách hàng">
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="input-group">
                                    <span class="input-group-text bg-white">
                                        <i class="fas fa-calendar-alt text-muted"></i>
                                    </span>
                                    <input type="date" name="dateFrom" value="${dateFrom}" class="form-control" placeholder="Từ ngày">
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="input-group">
                                    <span class="input-group-text bg-white">
                                        <i class="fas fa-calendar-alt text-muted"></i>
                                    </span>
                                    <input type="date" name="dateTo" value="${dateTo}" class="form-control" placeholder="Đến ngày">
                                </div>
                            </div>
                            <div class="col-md-2">
                                <select name="status" class="form-select select2">
                                    <option value="all">Tất cả trạng thái</option>
                                    <option value="pending_pay" ${status == 'pending_pay' ? 'selected' : ''}>Chờ thanh toán</option>
                                    <option value="pending" ${status == 'pending' ? 'selected' : ''}>Chờ xử lý</option>
                                    <option value="processing" ${status == 'processing' ? 'selected' : ''}>Đang xử lý</option>
                                    <option value="shipping" ${status == 'shipping' ? 'selected' : ''}>Đang giao</option>
                                    <option value="completed" ${status == 'completed' ? 'selected' : ''}>Hoàn thành</option>
                                    <option value="cancelled" ${status == 'cancelled' ? 'selected' : ''}>Đã hủy</option>
                                    <option value="returned" ${status == 'returned' ? 'selected' : ''}>Đã hoàn trả</option>
                                </select>
                            </div>
                            <div class="col-md-2">
                                <div class="d-grid gap-2 d-md-flex">
                                    <button type="submit" class="btn btn-primary me-md-2">
                                        <i class="fas fa-filter me-2"></i>Lọc
                                    </button>
                                    <a href="orderlist" class="btn btn-secondary">
                                        <i class="fas fa-eraser me-2"></i>Xóa bộ lọc
                                    </a>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>

                <!-- Orders Table -->
                <div class="card">
                    <div class="card-header">
                        <i class="fas fa-list me-2"></i>Danh sách đơn hàng
                    </div>
                    <div class="card-body p-0">
                        <div class="table-responsive">
                            <table class="table table-hover table-bordered mb-0">
                                <thead>
                                    <tr>
                                        <th style="width: 50px;">STT</th>
                                        <th>Mã đơn hàng</th>
                                        <th>
                                            <a href="orderlist?sortField=orderDate&sortDir=${sortField == 'orderDate' && sortDir == 'asc' ? 'desc' : 'asc'}&page=${currentPage}&dateFrom=${dateFrom}&dateTo=${dateTo}&customerName=${customerName}&status=${status}&keyword=${keyword}" class="sort-link">
                                                Ngày đặt hàng
                                                <span class="sort-icons">
                                                    ${sortField == 'orderDate' ? (sortDir == 'asc' ? '<i class="fas fa-sort-up"></i>' : '<i class="fas fa-sort-down"></i>') : '<i class="fas fa-sort text-muted"></i>'}
                                                </span>
                                            </a>
                                        </th>
                                        <th>
                                            <a href="orderlist?sortField=recipientEmail&sortDir=${sortField == 'recipientEmail' && sortDir == 'asc' ? 'desc' : 'asc'}&page=${currentPage}&dateFrom=${dateFrom}&dateTo=${dateTo}&customerName=${customerName}&status=${status}&keyword=${keyword}" class="sort-link">
                                                Email khách hàng
                                                <span class="sort-icons">
                                                    ${sortField == 'recipientEmail' ? (sortDir == 'asc' ? '<i class="fas fa-sort-up"></i>' : '<i class="fas fa-sort-down"></i>') : '<i class="fas fa-sort text-muted"></i>'}
                                                </span>
                                            </a>
                                        </th>
                                        <th>
                                            <a href="orderlist?sortField=recipientName&sortDir=${sortField == 'recipientName' && sortDir == 'asc' ? 'desc' : 'asc'}&page=${currentPage}&dateFrom=${dateFrom}&dateTo=${dateTo}&customerName=${customerName}&status=${status}&keyword=${keyword}" class="sort-link">
                                                Tên khách hàng
                                                <span class="sort-icons">
                                                    ${sortField == 'recipientName' ? (sortDir == 'asc' ? '<i class="fas fa-sort-up"></i>' : '<i class="fas fa-sort-down"></i>') : '<i class="fas fa-sort text-muted"></i>'}
                                                </span>
                                            </a>
                                        </th>
                                        <th>Sản phẩm</th>
                                        <th>
                                            <a href="orderlist?sortField=total&sortDir=${sortField == 'total' && sortDir == 'asc' ? 'desc' : 'asc'}&page=${currentPage}&dateFrom=${dateFrom}&dateTo=${dateTo}&customerName=${customerName}&status=${status}&keyword=${keyword}" class="sort-link">
                                                Tổng chi phí
                                                <span class="sort-icons">
                                                    ${sortField == 'total' ? (sortDir == 'asc' ? '<i class="fas fa-sort-up"></i>' : '<i class="fas fa-sort-down"></i>') : '<i class="fas fa-sort text-muted"></i>'}
                                                </span>
                                            </a>
                                        </th>
                                        <th>
                                            <a href="orderlist?sortField=status&sortDir=${sortField == 'status' && sortDir == 'asc' ? 'desc' : 'asc'}&page=${currentPage}&dateFrom=${dateFrom}&dateTo=${dateTo}&customerName=${customerName}&status=${status}&keyword=${keyword}" class="sort-link">
                                                Trạng thái
                                                <span class="sort-icons">
                                                    ${sortField == 'status' ? (sortDir == 'asc' ? '<i class="fas fa-sort-up"></i>' : '<i class="fas fa-sort-down"></i>') : '<i class="fas fa-sort text-muted"></i>'}
                                                </span>
                                            </a>
                                        </th>
                                        <th class="text-center">Hành động</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${orders}" var="order" varStatus="loop">
                                        <tr>
                                            <td>${loop.index + 1}</td>
                                            <td><span href="orderdetails?id=${order.id}" class="text-primary fw-bold">${order.orderCode}</span></td>
                                            <td><fmt:formatDate value="${order.orderDate}" pattern="dd/MM/yyyy HH:mm"/></td>
                                            <td>${order.recipientEmail}</td>
                                            <td>${order.recipientName}</td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${not empty order.items and order.items.size() > 0}">
                                                        ${order.getItems().get(0).getProductTitle()}
                                                        <c:if test="${order.items.size() > 1}">
                                                            và ${order.items.size() - 1} sản phẩm khác
                                                        </c:if>
                                                    </c:when>
                                                    <c:otherwise>Không có sản phẩm</c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td><fmt:formatNumber value="${order.total}" type="currency" currencySymbol="₫" maxFractionDigits="0"/></td>
                                            <td>
                                                <span class="status-badge bg-${order.status == 'completed' ? 'success' : order.status == 'cancelled' ? 'danger' : order.status == 'returned' ? 'danger' : order.status == 'pending_pay' ? 'warning' : order.status == 'processing' ? 'info' : order.status == 'shipping' ? 'primary' : 'secondary'}">
                                                    ${order.status == 'pending_pay' ? 'Chờ thanh toán' : 
                                                      order.status == 'pending' ? 'Chờ xử lý' : 
                                                      order.status == 'processing' ? 'Đang xử lý' : 
                                                      order.status == 'shipping' ? 'Đang giao' : 
                                                      order.status == 'returned' ? 'Đã hoàn trả' : 
                                                      order.status == 'completed' ? 'Hoàn thành' : 'Đã hủy'}
                                                </span>
                                            </td>
                                            <td class="text-center">
<!--                                                <a href="orderdetails?id=${order.id}" class="btn btn-primary btn-sm action-btn" title="Xem chi tiết">
                                                    <i class="fas fa-eye"></i>
                                                </a>-->
                                                <a href="orderdetails?id=${order.id}" class="btn btn-info btn-sm action-btn" title="Chỉnh sửa">
                                                    <i class="fas fa-edit"></i>
                                                </a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    <c:if test="${empty orders}">
                                        <tr>
                                            <td colspan="7" class="empty-state">
                                                <i class="fas fa-shopping-cart fa-3x mb-3"></i>
                                                <p>Không tìm thấy đơn hàng nào!</p>
                                            </td>
                                        </tr>
                                    </c:if>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <!-- Pagination -->
                <div class="d-flex justify-content-between align-items-center mt-3">
                    <div class="text-muted small">
                        Hiển thị ${orders.size()} / ${totalItems} đơn hàng
                    </div>
                    <nav>
                        <ul class="pagination">
                            <c:if test="${currentPage > 1}">
                                <li class="page-item">
                                    <a class="page-link" href="orderlist?page=${currentPage-1}&dateFrom=${dateFrom}&dateTo=${dateTo}&customerName=${customerName}&status=${status}&keyword=${keyword}&sortField=${sortField}&sortDir=${sortDir}" aria-label="Previous">
                                        <i class="fas fa-chevron-left"></i>
                                    </a>
                                </li>
                            </c:if>
                            <c:forEach begin="1" end="${totalPages}" var="i">
                                <li class="page-item ${currentPage == i ? 'active' : ''}">
                                    <a class="page-link" href="orderlist?page=${i}&dateFrom=${dateFrom}&dateTo=${dateTo}&customerName=${customerName}&status=${status}&keyword=${keyword}&sortField=${sortField}&sortDir=${sortDir}">${i}</a>
                                </li>
                            </c:forEach>
                            <c:if test="${currentPage < totalPages}">
                                <li class="page-item">
                                    <a class="page-link" href="orderlist?page=${currentPage+1}&dateFrom=${dateFrom}&dateTo=${dateTo}&customerName=${customerName}&status=${status}&keyword=${keyword}&sortField=${sortField}&sortDir=${sortDir}" aria-label="Next">
                                        <i class="fas fa-chevron-right"></i>
                                    </a>
                                </li>
                            </c:if>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>

        <script>
            $(document).ready(function () {
                // Initialize select2
                $('.select2').select2({
                    placeholder: "Chọn trạng thái",
                    allowClear: true,
                    width: '100%'
                });

                // Sidebar toggle for mobile view
                $('.sidebar-toggle').on('click', function () {
                    $('.sidebar').toggleClass('active');
                    $('.main-content').toggleClass('active');
                    $(this).hide();
                });

                // Hide sidebar when clicking outside on mobile
                $(document).on('click', function (e) {
                    if ($(window).width() <= 768) {
                        if (!$(e.target).closest('.sidebar').length && !$(e.target).closest('.sidebar-toggle').length) {
                            $('.sidebar').removeClass('active');
                            $('.main-content').removeClass('active');
                            $('.sidebar-toggle').show();
                        }
                    }
                });

                // Initialize tooltips
                var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
                var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
                    return new bootstrap.Tooltip(tooltipTriggerEl);
                });
            });
        </script>
    </body>
</html>