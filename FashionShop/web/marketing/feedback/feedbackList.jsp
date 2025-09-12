<%-- 
    Document   : feedbackList
    Created on : Mar 17, 2025, 3:08:26 AM
    Author     : nguye
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Quản lý phản hồi khách hàng</title>
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
                --danger-color: #e74c3c;
                --success-color: #2ecc71;
                --warning-color: #f39c12;
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

            /* Main content styles */
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

            .btn-view {
                background-color: var(--accent-color);
                color: white;
            }

            .btn-view:hover {
                background-color: #2980b9;
                color: white;
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

            /* Badge Styles */
            .badge-status {
                font-weight: 600;
                padding: 5px 10px;
                border-radius: 50px;
            }

            .badge-active {
                background-color: var(--success-color);
                color: white;
            }

            .badge-expired {
                background-color: var(--danger-color);
                color: white;
            }

            .badge-discount-type {
                background-color: rgba(52, 152, 219, 0.2);
                color: var(--accent-color);
                font-weight: 600;
                padding: 5px 10px;
                border-radius: 50px;
                white-space: nowrap;
            }

            /* Toggle button */
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

            /* Pagination styling */
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

            .hidden {
                display: none;
            }

            /* Responsive */
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
            }

            /* Table responsiveness */
            @media (max-width: 768px) {
                .table-responsive {
                    display: block;
                    width: 100%;
                    overflow-x: auto;
                }
            }
        </style>
    </head>
    <body>
        <!-- Include the sidebar -->
        <jsp:include page="../sidebar.jsp" />
        <button class="btn btn-primary sidebar-toggle">
            <i class="fas fa-bars"></i>
        </button>

        <div class="main-content">
            <div class="container-fluid p-4">
                <!-- Thông báo thành công -->
                <c:if test="${not empty param.success}">
                    <div class="alert alert-success alert-dismissible fade show" role="alert" id="successAlert">
                        <c:choose>
                            <c:when test="${param.success eq 'update'}">
                                Cập nhật trạng thái phản hồi thành công!
                            </c:when>
                            <c:otherwise>
                                Thao tác thành công!
                            </c:otherwise>
                        </c:choose>
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </c:if>

                <!-- Thông báo lỗi -->
                <c:if test="${param.error eq 'update'}">
                    <div class="alert alert-danger alert-dismissible fade show" role="alert" id="errorAlert">
                        Không thể cập nhật trạng thái phản hồi. Vui lòng thử lại!
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </c:if>
                
                <h2 class="page-title">
                    <i class="fas fa-comments me-2"></i>Quản lý phản hồi sản phẩm
                </h2>

                <!-- Filter Section -->
                <div class="card filter-card">
                    <div class="card-header">
                        <i class="fas fa-filter me-2"></i>Bộ lọc tìm kiếm
                    </div>
                    <div class="card-body">
                        <form action="feedbacklist" method="GET" class="row g-3">
                            <div class="col-md-4">
                                <div class="input-group">
                                    <span class="input-group-text bg-white">
                                        <i class="fas fa-search text-muted"></i>
                                    </span>
                                    <input type="text" name="searchKeyword" value="${searchKeyword}" class="form-control search-box" placeholder="Tìm kiếm theo sản phẩm">
                                </div>
                            </div>
                            <div class="col-md-3">
                                <select class="form-select" id="filterRating" name="filterRating">
                                    <option value="">Tất cả đánh giá</option>
                                    <c:forEach begin="0" end="4" var="i">
                                        <c:set var="rating" value="${5 - i}" />
                                        <option value="${rating}" ${filterRating == rating ? 'selected' : ''}>
                                            <c:forEach begin="1" end="${rating}">
                                                ★
                                            </c:forEach>
                                        </option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="col-md-4">
                                <div class="d-grid gap-2 d-md-flex">
                                    <button type="submit" class="btn btn-primary me-md-2">
                                        <i class="fas fa-filter me-2"></i>Lọc
                                    </button>
                                    <a href="feedbacklist" class="btn btn-secondary">
                                        <i class="fas fa-eraser me-2"></i>Xóa bộ lọc
                                    </a>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>

                <!-- Feedback List Table -->
                <div class="card">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <div>
                            <i class="fas fa-list me-2"></i>Danh sách phản hồi theo sản phẩm
                        </div>
                        <div>
                            <a href="feedbackall" class="btn btn-info btn-sx">
                                <i class="fas fa-list-alt me-2"></i>Xem tất cả phản hồi
                            </a>
                        </div>
                    </div>
                    <div class="card-body p-0">
                        <div class="table-responsive">
                            <table class="table table-hover table-bordered mb-0">
                                <thead>
                                    <tr class="bg-light">
                                        <th class="text-center" style="width: 60px;">STT</th>
                                        <th>
                                            Sản phẩm
                                        </th>
                                        <th>
                                            <a href="feedbacklist?searchKeyword=${searchKeyword}&filterRating=${filterRating}&filterStatus=${filterStatus}&sortField=avg_rating&sortOrder=${sortField == 'avg_rating' && sortOrder == 'asc' ? 'desc' : 'asc'}" class="sort-link">
                                                Đánh giá trung bình
                                                <span class="sort-icons">
                                                    ${sortField == 'avg_rating' ? (sortOrder == 'asc' ? '<i class="fas fa-sort-up"></i>' : '<i class="fas fa-sort-down"></i>') : '<i class="fas fa-sort text-muted"></i>'}
                                                </span>
                                            </a>
                                        </th>
                                        <th>
                                            <a href="feedbacklist?searchKeyword=${searchKeyword}&filterRating=${filterRating}&filterStatus=${filterStatus}&sortField=feedback_count&sortOrder=${sortField == 'feedback_count' && sortOrder == 'asc' ? 'desc' : 'asc'}" class="sort-link">
                                                Tổng số phản hồi
                                                <span class="sort-icons">
                                                    ${sortField == 'feedback_count' ? (sortOrder == 'asc' ? '<i class="fas fa-sort-up"></i>' : '<i class="fas fa-sort-down"></i>') : '<i class="fas fa-sort text-muted"></i>'}
                                                </span>
                                            </a>
                                        </th>
                                        <th class="text-center">Thao tác</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:choose>
                                        <c:when test="${not empty feedbackList}">
                                            <c:forEach items="${feedbackList}" var="feedback" varStatus="status">
                                                <tr>
                                                    <td class="text-center">${status.index + 1 + (currentPage - 1)*10}</td>
                                                    <td>
                                                        <img src="${feedback.productThumbnail}" alt="Thumbnail" style="width: 50px; height: 50px; object-fit: cover;">
                                                        ${feedback.productTitle}
                                                    </td>
                                                    <td>
                                                        <span class="rating">
                                                            <c:forEach begin="1" end="5" var="i">
                                                                <c:choose>
                                                                    <c:when test="${i <= feedback.rating}">
                                                                        <i class="fas fa-star" style="color: #f39c12;"></i>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <i class="far fa-star" style="color: #ccc;"></i>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </c:forEach>
                                                        </span>
                                                    </td>
                                                    <td>${feedback.comment}</td> <!-- feedback_count lưu trong comment -->
                                                    <td class="text-center">
                                                        <a href="feedbackdetail?productId=${feedback.productId}" class="btn btn-outline-primary btn-sm">
                                                            <i class="fas fa-eye"></i> Xem chi tiết
                                                        </a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </c:when>
                                        <c:otherwise>
                                            <tr>
                                                <td colspan="5" class="empty-state">
                                                    <i class="fas fa-comments fa-3x mb-3" style="opacity: 0.5;"></i>
                                                    <p>Không tìm thấy phản hồi nào.</p>
                                                </td>
                                            </tr>
                                        </c:otherwise>
                                    </c:choose>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <div class="d-flex justify-content-between align-items-center mt-3">
                    <div class="text-muted small">
                        Hiển thị ${feedbackList.size()} / ${totalItems} phản hồi
                    </div>
                    <nav>
                        <ul class="pagination">
                            <c:if test="${currentPage > 1}">
                                <li class="page-item">
                                    <a class="page-link" href="feedbacklist?page=${currentPage-1}&sortField=${sortField}&sortOrder=${sortOrder}&searchKeyword=${searchKeyword}&filterRating=${filterRating}&filterStatus=${filterStatus}" aria-label="Previous">
                                        <i class="fas fa-chevron-left"></i>
                                    </a>
                                </li>
                            </c:if>
                            <c:forEach begin="1" end="${totalPages}" var="i">
                                <c:choose>
                                    <c:when test="${i == currentPage}">
                                        <li class="page-item active">
                                            <span class="page-link">${i}</span>
                                        </li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="page-item">
                                            <a class="page-link" href="feedbacklist?page=${i}&sortField=${sortField}&sortOrder=${sortOrder}&searchKeyword=${searchKeyword}&filterRating=${filterRating}&filterStatus=${filterStatus}">${i}</a>
                                        </li>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                            <c:if test="${currentPage < totalPages}">
                                <li class="page-item">
                                    <a class="page-link" href="feedbacklist?page=${currentPage+1}&sortField=${sortField}&sortOrder=${sortOrder}&searchKeyword=${searchKeyword}&filterRating=${filterRating}&filterStatus=${filterStatus}" aria-label="Next">
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
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
        <script>
            $(document).ready(function () {
                if ($('#successAlert').length) {
                    setTimeout(function () {
                        $('#successAlert').alert('close');
                    }, 3000);
                }
                if ($('#errorAlert').length) {
                    setTimeout(function () {
                        $('#errorAlert').alert('close');
                    }, 3000);
                }
                $('.sidebar-toggle').on('click', function () {
                    $('.sidebar').toggleClass('active');
                    $('.main-content').toggleClass('active');
                    $(this).hide();
                });
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