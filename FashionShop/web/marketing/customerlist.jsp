<%-- 
    Document   : customerlist
    Created on : Mar 18, 2025, 10:34:50 AM
    Author     : VuxD4t
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Quản lý khách hàng</title>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
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

            .page-title {
                color: var(--primary-color);
                margin-bottom: 20px;
                padding-bottom: 10px;
                border-bottom: 2px solid var(--accent-color);
                display: inline-block;
            }

            .filter-card {
                background-color: white;
                border-radius: 8px;
                margin-bottom: 20px;
            }

            .search-box {
                border-radius: 50px;
                padding-left: 15px;
                border: 1px solid var(--border-color);
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

            .badge {
                padding: 6px 12px;
                border-radius: 50px;
            }

            .btn-action {
                padding: 5px 10px;
                margin: 0 2px;
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

            .pagination .page-link {
                color: var(--primary-color);
                border: 1px solid var(--border-color);
                min-width: 40px;
                text-align: center;
                margin: 0 3px;
            }

            .pagination .page-item.active .page-link {
                background-color: var(--accent-color);
                border-color: var(--accent-color);
                color: white;
            }

            @media (max-width: 768px) {
                .main-content {
                    margin-left: 0;
                }
                .sidebar-toggle {
                    display: block;
                }
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
        </style>
    </head>
    <body>
        <!-- Include the sidebar -->
        <jsp:include page="/marketing/sidebar.jsp" />

        <button class="btn btn-primary sidebar-toggle">
            <i class="fas fa-bars"></i>
        </button>

        <div class="main-content">
            <div class="container-fluid p-4">
                <h2 class="page-title">
                    <i class="fas fa-users me-2"></i>Quản lý khách hàng
                </h2>

                <!-- Alerts -->
                <c:if test="${param.message != null}">
                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                        ${param.message}
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </c:if>

                <c:if test="${param.error != null}">
                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        ${param.error}
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </c:if>

                <!-- Filter Section -->
                <div class="card filter-card">
                    <div class="card-header">
                        <i class="fas fa-filter me-2"></i>Bộ lọc tìm kiếm
                    </div>
                    <div class="card-body">
                        <form action="customerlist" method="get" class="row g-3">
                            <div class="col-md-4">
                                <div class="input-group">
                                    <span class="input-group-text bg-white">
                                        <i class="fas fa-search text-muted"></i>
                                    </span>
                                    <input type="text" name="search" value="${search}" class="form-control search-box" 
                                           placeholder="Tìm kiếm theo tên, email, SĐT">
                                </div>
                            </div>
                            <div class="col-md-3">
                                <select name="gender" class="form-select">
                                    <option value="">Tất cả giới tính</option>
                                    <option value="male" ${gender == 'male' ? 'selected' : ''}>Nam</option>
                                    <option value="female" ${gender == 'female' ? 'selected' : ''}>Nữ</option>
                                </select>
                            </div>
                            <div class="col-md-3">
                                <select name="customerType" class="form-select">
                                    <option value="">Tất cả loại khách hàng</option>
                                    <option value="vip" ${customerType == 'vip' ? 'selected' : ''}>VIP</option>
                                    <option value="normal" ${customerType == 'normal' ? 'selected' : ''}>Thường</option>

                                </select>
                            </div>
                            <div class="col-md-2 d-flex">
                                <button type="submit" class="btn btn-primary me-2">
                                    <i class="fas fa-filter me-1"></i>Lọc
                                </button>
                                <a href="customerlist" class="btn btn-secondary">Xóa lọc</a>
                            </div>
                        </form>
                    </div>
                </div>

                <!-- Customers Table -->
                <div class="card">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <div>
                            <i class="fas fa-list me-2"></i>Danh sách khách hàng
                        </div>
                        <!--                        <div class="d-flex">                        
                                                    <a href="addCustomer" class="btn btn-primary btn-sm">
                                                        <i class="fas fa-user-plus me-1"></i>Thêm mới
                                                    </a>
                                                </div>-->
                    </div>
                    <div class="card-body p-0">
                        <c:choose>
                            <c:when test="${not empty customers}">
                                <div class="table-responsive">
                                    <table class="table table-hover table-bordered mb-0">
                                        <thead>
                                            <tr class="bg-light">
                                                <th class="text-center" style="width: 60px;">STT</th>
                                                <th>
                                                    <a href="customerlist?sortField=full_name&sortDir=${sortField == 'full_name' && sortDir == 'asc' ? 'desc' : 'asc'}&page=${currentPage}&gender=${gender}&customerType=${customerType}&search=${search}" 
                                                       class="sort-link">
                                                        Tên
                                                        <span class="sort-icons">
                                                            ${sortField == 'full_name' ? (sortDir == 'asc' ? '<i class="fas fa-sort-up"></i>' : '<i class="fas fa-sort-down"></i>') : '<i class="fas fa-sort text-muted"></i>'}
                                                        </span>
                                                    </a>
                                                </th>
                                                <th>
                                                    <a href="customerlist?sortField=email&sortDir=${sortField == 'email' && sortDir == 'asc' ? 'desc' : 'asc'}&page=${currentPage}&gender=${gender}&customerType=${customerType}&search=${search}"
                                                       class="sort-link">
                                                        Email
                                                        <span class="sort-icons">
                                                            ${sortField == 'email' ? (sortDir == 'asc' ? '<i class="fas fa-sort-up"></i>' : '<i class="fas fa-sort-down"></i>') : '<i class="fas fa-sort text-muted"></i>'}
                                                        </span>
                                                    </a>
                                                </th>
                                                <th class="text-center" style="width: 100px;">
                                                    <a href="customerlist?sortField=gender&sortDir=${sortField == 'gender' && sortDir == 'asc' ? 'desc' : 'asc'}&page=${currentPage}&gender=${gender}&customerType=${customerType}&search=${search}"
                                                       class="sort-link">
                                                        Giới tính
                                                        <span class="sort-icons">
                                                            ${sortField == 'gender' ? (sortDir == 'asc' ? '<i class="fas fa-sort-up"></i>' : '<i class="fas fa-sort-down"></i>') : '<i class="fas fa-sort text-muted"></i>'}
                                                        </span>
                                                    </a>
                                                </th>
                                                <th>
                                                    <a href="customerlist?sortField=mobile&sortDir=${sortField == 'mobile' && sortDir == 'asc' ? 'desc' : 'asc'}&page=${currentPage}&gender=${gender}&customerType=${customerType}&search=${search}"
                                                       class="sort-link">
                                                        SĐT
                                                        <span class="sort-icons">
                                                            ${sortField == 'mobile' ? (sortDir == 'asc' ? '<i class="fas fa-sort-up"></i>' : '<i class="fas fa-sort-down"></i>') : '<i class="fas fa-sort text-muted"></i>'}
                                                        </span>
                                                    </a>
                                                </th>
                                                <!--                                                <th>
                                                                                                    <a href="customerlist?sortField=address&sortDir=${sortField == 'address' && sortDir == 'asc' ? 'desc' : 'asc'}&page=${currentPage}&gender=${gender}&customerType=${customerType}&search=${search}"
                                                                                                       class="sort-link">
                                                                                                        Địa chỉ
                                                                                                        <span class="sort-icons">
                                                ${sortField == 'address' ? (sortDir == 'asc' ? '<i class="fas fa-sort-up"></i>' : '<i class="fas fa-sort-down"></i>') : '<i class="fas fa-sort text-muted"></i>'}
                                            </span>
                                        </a>
                                    </th>-->
                                                <th class="text-center" style="width: 100px;">
                                                    <a href="customerlist?sortField=customer_type&sortDir=${sortField == 'customer_type' && sortDir == 'asc' ? 'desc' : 'asc'}&page=${currentPage}&gender=${gender}&customerType=${customerType}&search=${search}"
                                                       class="sort-link">
                                                        Loại KH
                                                        <span class="sort-icons">
                                                            ${sortField == 'customer_type' ? (sortDir == 'asc' ? '<i class="fas fa-sort-up"></i>' : '<i class="fas fa-sort-down"></i>') : '<i class="fas fa-sort text-muted"></i>'}
                                                        </span>
                                                    </a>
                                                </th>
                                                <th class="text-center" style="width: 100px;">
                                                    <a href="customerlist?sortField=total_purchases&sortDir=${sortField == 'total_purchases' && sortDir == 'asc' ? 'desc' : 'asc'}&page=${currentPage}&gender=${gender}&customerType=${customerType}&search=${search}"
                                                       class="sort-link">
                                                        Đơn hàng
                                                        <span class="sort-icons">
                                                            ${sortField == 'total_purchases' ? (sortDir == 'asc' ? '<i class="fas fa-sort-up"></i>' : '<i class="fas fa-sort-down"></i>') : '<i class="fas fa-sort text-muted"></i>'}
                                                        </span>
                                                    </a>
                                                </th>
                                                <th class="text-center" style="width: 100px;">
                                                    <a href="customerlist?sortField=total_spend&sortDir=${sortField == 'total_spend' && sortDir == 'asc' ? 'desc' : 'asc'}&page=${currentPage}&gender=${gender}&customerType=${customerType}&search=${search}"
                                                       class="sort-link">
                                                        Tổng chi
                                                        <span class="sort-icons">
                                                            ${sortField == 'total_spend' ? (sortDir == 'asc' ? '<i class="fas fa-sort-up"></i>' : '<i class="fas fa-sort-down"></i>') : '<i class="fas fa-sort text-muted"></i>'}
                                                        </span>
                                                    </a>
                                                </th>
                                                <th class="text-center" style="width: 120px;">Thao tác</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="customer" items="${customers}" varStatus="status">
                                                <tr>
                                                    <td class="text-center">${status.index + 1 + (currentPage - 1) * 10}</td>
                                                    <td>${customer.fullName}</td>
                                                    <td>${customer.email}</td>
                                                    <td class="text-center">
                                                        <c:choose>
                                                            <c:when test="${customer.gender == 'male' || customer.gender == 'Male'}">Nam</c:when>
                                                            <c:when test="${customer.gender == 'female' || customer.gender == 'Female'}">Nữ</c:when>
                                                            <c:otherwise>Khác</c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                    <td>${customer.mobile}</td>
<!--                                                    <td>${customer.address}</td>-->
                                                    <td>
                                                        <span class="badge ${customer.customerType == 'vip' ? 'bg-warning text-dark' : 'bg-success'}">
                                                            ${customer.customerType == 'vip' ? 'VIP' : 'Thường'}
                                                        </span>
                                                    </td>

                                                    <td class="text-center">${customer.totalPurchases}</td>
                                                    <td class="text-end">
                                                        <fmt:formatNumber value="${customer.totalSpend}" type="currency" currencySymbol="₫" maxFractionDigits="0"/>
                                                    </td>
                                                    <td class="text-center">

                                                        <a href="customerdetail/edit?id=${customer.id}" class="btn btn-primary btn-sm btn-action" title="Chỉnh sửa">
                                                            <i class="fas fa-eye"></i>
                                                        </a>
                                                        <a href="customerdetail/delete?id=${customer.id}" class="btn btn-danger btn-sm btn-action" title="Xóa"
                                                           onclick="return confirm('Bạn có chắc chắn muốn xóa khách hàng này không?');">
                                                            <i class="fas fa-trash-alt"></i>
                                                        </a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="text-center py-5">
                                    <i class="fas fa-user-slash fa-4x text-muted mb-3"></i>
                                    <h5 class="text-muted">Không tìm thấy khách hàng nào</h5>
                                    <p class="text-muted">Vui lòng thử lại với điều kiện tìm kiếm khác hoặc thêm khách hàng mới</p>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>

                <!-- Pagination -->
                <c:if test="${totalPages > 0}">
                    <div class="d-flex justify-content-between align-items-center mt-4">
                        <div class="text-muted">
                            Hiển thị ${(currentPage-1)*10 + 1} đến 
                            ${currentPage*10 > totalCustomers ? totalCustomers : currentPage*10} 
                            trong tổng số ${totalCustomers} khách hàng
                        </div>
                        <nav aria-label="Page navigation">
                            <ul class="pagination mb-0">
                                <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
                                    <a class="page-link" href="customerlist?page=${currentPage-1}&gender=${gender}&customerType=${customerType}&search=${search}&sortField=${sortField}&sortDir=${sortDir}">
                                        <i class="fas fa-chevron-left"></i>
                                    </a>
                                </li>

                                <c:forEach begin="1" end="${totalPages}" var="i">
                                    <li class="page-item ${currentPage == i ? 'active' : ''}">
                                        <a class="page-link" href="customerlist?page=${i}&gender=${gender}&customerType=${customerType}&search=${search}&sortField=${sortField}&sortDir=${sortDir}">${i}</a>
                                    </li>
                                </c:forEach>

                                <li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
                                    <a class="page-link" href="customerlist?page=${currentPage+1}&gender=${gender}&customerType=${customerType}&search=${search}&sortField=${sortField}&sortDir=${sortDir}">
                                        <i class="fas fa-chevron-right"></i>
                                    </a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </c:if>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>

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

                                                                   // Initialize tooltips
                                                                   var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
                                                                   var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
                                                                       return new bootstrap.Tooltip(tooltipTriggerEl)
                                                                   });
                                                               });
        </script>
    </body>
</html>
