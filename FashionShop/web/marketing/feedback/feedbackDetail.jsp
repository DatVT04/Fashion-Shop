<%-- 
    Document   : feedbackDetail
    Created on : Mar 17, 2025, 3:09:38 AM
    Author     : nguye
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Chi tiết phản hồi - ${feedbackList[0].productTitle}</title>
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

            .badge-vip {
                background-color: #ffd700; /* Màu vàng kim cho VIP */
                color: #2c3e50; /* Màu chữ tối để tương phản */
                font-weight: 600;
                padding: 5px 10px;
                border-radius: 50px;
            }

            .badge-normal {
                background-color: #6c757d; /* Màu xám cho Normal */
                color: white; /* Màu chữ trắng để tương phản */
                font-weight: 600;
                padding: 5px 10px;
                border-radius: 50px;
            }
            
            select[name="status"] {
                width: 100%; /* Đảm bảo chiếm toàn bộ chiều rộng của container */
                padding: 5px; /* Tăng khoảng cách bên trong */
                border: 1px solid var(--border-color); /* Đồng bộ với màu viền */
                border-radius: 5px; /* Bo tròn góc */
                background-color: var(--light-color); /* Màu nền nhẹ nhàng */
                color: var(--primary-color); /* Màu chữ chính */
                font-size: 14px; /* Kích thước chữ */
                transition: all 0.3s ease-in-out; /* Hiệu ứng mượt khi hover hoặc focus */
            }

            select[name="status"]:hover {
                background-color: var(--hover-color); /* Màu nền khi hover */
            }

            select[name="status"]:focus {
                outline: none; /* Loại bỏ viền mặc định khi focus */
                border-color: var(--accent-color); /* Đổi màu viền khi focus */
                box-shadow: 0 0 5px rgba(52, 152, 219, 0.5); /* Hiệu ứng ánh sáng viền */
            }            
            select[name="status"] {
                width: 100%; /* Đảm bảo chiếm toàn bộ chiều rộng của container */
                padding: 5px; /* Tăng khoảng cách bên trong */
                border: 1px solid var(--border-color); /* Đồng bộ với màu viền */
                border-radius: 5px; /* Bo tròn góc */
                background-color: var(--light-color); /* Màu nền nhẹ nhàng */
                color: var(--primary-color); /* Màu chữ chính */
                font-size: 14px; /* Kích thước chữ */
                transition: all 0.3s ease-in-out; /* Hiệu ứng mượt khi hover hoặc focus */
            }

            select[name="status"]:hover {
                background-color: var(--hover-color); /* Màu nền khi hover */
            }

            select[name="status"]:focus {
                outline: none; /* Loại bỏ viền mặc định khi focus */
                border-color: var(--accent-color); /* Đổi màu viền khi focus */
                box-shadow: 0 0 5px rgba(52, 152, 219, 0.5); /* Hiệu ứng ánh sáng viền */
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
        <jsp:include page="../sidebar.jsp" />
        <button class="btn btn-primary sidebar-toggle">
            <i class="fas fa-bars"></i>
        </button>

        <div class="main-content">
            <div class="container-fluid p-4">
                <!-- Thông báo thành công -->
                <c:if test="${param.success eq 'update'}">
                    <div class="alert alert-success alert-dismissible fade show" role="alert" id="successAlert">
                        Cập nhật trạng thái phản hồi thành công!
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </c:if>
                <c:if test="${param.error eq 'update'}">
                    <div class="alert alert-danger alert-dismissible fade show" role="alert" id="errorAlert">
                        Không thể cập nhật trạng thái phản hồi. Vui lòng thử lại!
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </c:if>

                <c:if test="${param.success == 'delete_feedback'}">
                    <div class="alert alert-success alert-dismissible fade show" role="alert" id="successAlert">
                        Xóa feedback thành công!
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </c:if>
                <c:if test="${param.error == 'delete_feedback'}">
                    <div class="alert alert-danger alert-dismissible fade show" role="alert" id="errorAlert">
                        Không thể xóa feedback. Vui lòng thử lại!
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </c:if>
                
                
                <h2 class="page-title">
                    <i class="fas fa-comments me-2"></i>Chi tiết phản hồi - ${feedbackList[0].productTitle}
                </h2>

                <div class="card filter-card">
                    <div class="card-header">
                        <i class="fas fa-filter me-2"></i>Bộ lọc tìm kiếm
                    </div>
                    <div class="card-body">
                        <form action="feedbackdetail" method="GET" class="row g-3">
                            <input type="hidden" name="productId" value="${productId}">
                            <div class="col-md-4">
                                <div class="input-group">
                                    <span class="input-group-text bg-white">
                                        <i class="fas fa-search text-muted"></i>
                                    </span>
                                    <input type="text" name="searchKeyword" value="${searchKeyword}" class="form-control search-box" placeholder="Tìm kiếm theo nội dung hoặc người dùng">
                                </div>
                            </div>
                            <div class="col-md-2">
                                <select class="form-select" id="filterRating" name="filterRating">
                                    <option value="">Tất cả đánh giá</option>
                                    <c:forEach begin="0" end="4" var="i">
                                        <c:set var="rating" value="${5 - i}" />
                                        <option value="${rating}" ${filterRating == rating ? 'selected' : ''}>
                                            <c:forEach begin="1" end="${rating}">
                                                ★
                                            </c:forEach>
                                            ${ratingCounts[5 - i - 1]}
                                        </option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="col-md-2">
                                <select class="form-select" name="filterStatus">
                                    <option value="">Tất cả trạng thái</option>
                                    <option value="pending" ${filterStatus == 'pending' ? 'selected' : ''}>Chưa xem</option>
                                    <option value="approved" ${filterStatus == 'approved' ? 'selected' : ''}>Hiện</option>
                                    <option value="rejected" ${filterStatus == 'rejected' ? 'selected' : ''}>Ẩn</option>
                                </select>
                            </div>
                            <div class="col-md-4">
                                <div class="d-grid gap-2 d-md-flex">
                                    <button type="submit" class="btn btn-primary me-md-2">
                                        <i class="fas fa-filter me-2"></i>Lọc
                                    </button>
                                    <a href="feedbackdetail?productId=${productId}" class="btn btn-secondary">
                                        <i class="fas fa-eraser me-2"></i>Xóa bộ lọc
                                    </a>
                                </div>
                            </div>
                            <div>
                                <a href="feedbacklist" class="btn btn-view">
                                    <i class="fas fa-arrow-left me-2"></i>Quay lại
                                </a>
                            </div>
                        </form>
                    </div>
                </div>

                <div class="card">
                    <div class="card-header">
                        <i class="fas fa-list me-2"></i>Danh sách phản hồi
                    </div>
                    <div class="card-body p-0">
                        <div class="table-responsive">
                            <table class="table table-hover table-bordered mb-0">
                                <thead>
                                    <tr class="bg-light">
                                        <th class="text-center" style="width: 60px;">STT</th>
                                        <th>
                                            <a href="feedbackdetail?productId=${productId}&searchKeywordfeedbackdetail?productId=${productId}&searchKeyword=${searchKeyword}&filterRating=${filterRating}&filterStatus=${filterStatus}&sortField=username&sortOrder=${sortField == 'username' && sortOrder == 'asc' ? 'desc' : 'asc'}" class="sort-link">
                                                Tài khoản
                                                <span class="sort-icons">
                                                    ${sortField == 'username' ? (sortOrder == 'asc' ? '<i class="fas fa-sort-up"></i>' : '<i class="fas fa-sort-down"></i>') : '<i class="fas fa-sort text-muted"></i>'}
                                                </span>
                                            </a>
                                        </th>
                                        <th>
                                            <a href="feedbackdetail?productId=${productId}&searchKeywordfeedbackdetail?productId=${productId}&searchKeyword=${searchKeyword}&filterRating=${filterRating}&filterStatus=${filterStatus}&sortField=rating&sortOrder=${sortField == 'rating' && sortOrder == 'asc' ? 'desc' : 'asc'}" class="sort-link">
                                                Đánh giá
                                                <span class="sort-icons">
                                                    ${sortField == 'rating' ? (sortOrder == 'asc' ? '<i class="fas fa-sort-up"></i>' : '<i class="fas fa-sort-down"></i>') : '<i class="fas fa-sort text-muted"></i>'}
                                                </span>
                                            </a>
                                        </th>
                                        <th>Nội dung</th>
                                        <th>
                                        <a href="feedbackdetail?productId=${productId}&searchKeywordfeedbackdetail?productId=${productId}&searchKeyword=${searchKeyword}&filterRating=${filterRating}&filterStatus=${filterStatus}&sortField=created_at&sortOrder=${sortField == 'created_at' && sortOrder == 'asc' ? 'desc' : 'asc'}" class="sort-link">
                                            Ngày tạo
                                            <span class="sort-icons">
                                                ${sortField == 'created_at' ? (sortOrder == 'asc' ? '<i class="fas fa-sort-up"></i>' : '<i class="fas fa-sort-down"></i>') : '<i class="fas fa-sort text-muted"></i>'}
                                            </span>
                                        </a>
                                    </th>
                                        <th>
                                            <a href="feedbackdetail?productId=${productId}&searchKeywordfeedbackdetail?productId=${productId}&searchKeyword=${searchKeyword}&filterRating=${filterRating}&filterStatus=${filterStatus}&sortField=status&sortOrder=${sortField == 'status' && sortOrder == 'asc' ? 'desc' : 'asc'}" class="sort-link">
                                                Trạng thái
                                                <span class="sort-icons">
                                                    ${sortField == 'status' ? (sortOrder == 'asc' ? '<i class="fas fa-sort-up"></i>' : '<i class="fas fa-sort-down"></i>') : '<i class="fas fa-sort text-muted"></i>'}
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
                                                    <td>${feedback.userName}</td>
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
                                                    <td>
                                                        <c:choose>
                                                            <c:when test="${fn:length(feedback.comment) > 25}">
                                                                ${fn:substring(feedback.comment, 0, 25)}...
                                                                <span class="full-comment" style="display: none;">${feedback.comment}</span>
                                                            </c:when>
                                                            <c:otherwise>
                                                                ${feedback.comment}
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                    <td class="time-display">
                                                    <fmt:formatDate value="${feedback.createdAt}" pattern="dd/MM/yyyy" />
                                                    <br/>
                                                    <fmt:formatDate value="${feedback.createdAt}" pattern="HH:mm:ss" />
                                                </td>
                                                    <td>
                                                        <c:choose>
                                                            <c:when test="${feedback.status == 'approved'}">
                                                                <span class="badge badge-status badge-active">Hiện</span>
                                                            </c:when>
                                                            <c:when test="${feedback.status == 'rejected'}">
                                                                <span class="badge badge-status badge-expired">Ẩn</span>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <span class="badge badge-status badge-discount-type">Chưa xem</span>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                    <td class="text-center">
                                                        <div class="btn-group" role="group">
                                                            <form action="feedbackdetail" method="POST" style="display: inline;">
                                                                <input type="hidden" name="action" value="updateStatus">
                                                                <input type="hidden" name="id" value="${feedback.id}">
                                                                <input type="hidden" name="productId" value="${feedback.productId}">
                                                                <select name="status" onchange="this.form.submit()">
                                                                    <option value="pending" ${feedback.status == 'pending' ? 'selected' : ''}>Chưa xem</option>
                                                                    <option value="approved" ${feedback.status == 'approved' ? 'selected' : ''}>Hiện</option>
                                                                    <option value="rejected" ${feedback.status == 'rejected' ? 'selected' : ''}>Ẩn</option>
                                                                </select>
                                                            </form>
                                                        </div>
                                                        <button type="button" class="btn btn-outline-danger btn-sm ms-1" title="Xóa feedback" data-bs-toggle="modal" data-bs-target="#deleteModal${feedback.id}">
                                                            <i class="fas fa-trash"></i>
                                                        </button>
                                                        <a href="feedbackreply?feedbackId=${feedback.id}&returnUrl=feedbackdetail&productId=${feedback.productId}" class="btn btn-outline-primary btn-sm ms-1" title="Phản hồi">
                                                            <i class="fas fa-reply"></i>
                                                        </a>
                                                    </td>
                                                </tr>
                                                <!-- Delete Modal -->
                                            <div class="modal fade" id="deleteModal${feedback.id}" tabindex="-1" aria-labelledby="deleteModalLabel${feedback.id}" aria-hidden="true">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="deleteModalLabel${feedback.id}">Xác nhận xóa</h5>
                                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                        </div>
                                                        <div class="modal-body">
                                                            Bạn có chắc chắn muốn xóa đánh giá này?
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                                                            <form action="feedbackdetail" method="POST">
                                                                <input type="hidden" name="action" value="deleteFeedback">
                                                                <input type="hidden" name="id" value="${feedback.id}">
                                                                <input type="hidden" name="productId" value="${feedback.productId}">
                                                                <button type="submit" class="btn btn-danger">Xóa</button>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                        <tr>
                                            <td colspan="7" class="empty-state">
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
                                    <a class="page-link" href="feedbackdetail?productId=${productId}&page=${currentPage-1}&sortField=${sortField}&sortOrder=${sortOrder}&searchKeyword=${searchKeyword}&filterRating=${filterRating}&filterStatus=${filterStatus}" aria-label="Previous">
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
                                            <a class="page-link" href="feedbackdetail?productId=${productId}&page=${i}&sortField=${sortField}&sortOrder=${sortOrder}&searchKeyword=${searchKeyword}&filterRating=${filterRating}&filterStatus=${filterStatus}">${i}</a>
                                        </li>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                            <c:if test="${currentPage < totalPages}">
                                <li class="page-item">
                                    <a class="page-link" href="feedbackdetail?productId=${productId}&page=${currentPage+1}&sortField=${sortField}&sortOrder=${sortOrder}&searchKeyword=${searchKeyword}&filterRating=${filterRating}&filterStatus=${filterStatus}" aria-label="Next">
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
