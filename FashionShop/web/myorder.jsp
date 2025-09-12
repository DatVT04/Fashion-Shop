<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đơn hàng của tôi</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary-color: #0d6efd;
            --primary-dark: #0b5ed7;
            --secondary-color: #6c757d;
            --success-color: #28a745;
            --danger-color: #dc3545;
            --warning-color: #ffc107;
            --info-color: #17a2b8;
            --light-color: #f8f9fa;
            --dark-color: #212529;
            --border-color: #dee2e6;
            --shadow-sm: 0 2px 4px rgba(0, 0, 0, 0.05);
            --shadow-md: 0 4px 6px rgba(0, 0, 0, 0.1);
            --shadow-lg: 0 10px 15px rgba(0, 0, 0, 0.1);
            --border-radius-sm: 0.25rem;
            --border-radius-md: 0.5rem;
            --border-radius-lg: 1rem;
            --transition-fast: all 0.2s ease;
            --transition-normal: all 0.3s ease;
        }

        body {
            background-color: #f8f9fa;
            color: var(--dark-color);
            font-family: 'Roboto', sans-serif; /* Cập nhật phông chữ */
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 30px 15px;
        }

        /* Page Header */
        .page-header {
            margin-bottom: 30px;
            padding-bottom: 15px;
            border-bottom: 1px solid var(--border-color);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .page-header h1 {
            font-size: 28px;
            font-weight: 700;
            color: var(--dark-color);
            margin-bottom: 0;
            position: relative;
            padding-left: 15px;
        }

        .page-header h1::before {
            content: '';
            position: absolute;
            left: 0;
            top: 5px;
            height: 28px;
            width: 5px;
            background-color: var(--primary-color);
            border-radius: var(--border-radius-sm);
        }

        /* Search Section */
        .search-section {
            background-color: #fff;
            padding: 20px;
            border-radius: var(--border-radius-md);
            box-shadow: var(--shadow-md);
            margin-bottom: 30px;
            border: 1px solid rgba(0,0,0,0.05);
        }

        .search-section .form-control {
            border-radius: var(--border-radius-md);
            padding: 10px 15px;
            border: 1px solid var(--border-color);
            box-shadow: var(--shadow-sm);
        }

        .search-section .form-control:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 0.25rem rgba(13, 110, 253, 0.25);
        }

        .search-section .form-select {
            border-radius: var(--border-radius-md);
            padding: 10px 15px;
            height: auto;
            border: 1px solid var(--border-color);
            box-shadow: var(--shadow-sm);
        }

        .search-section .form-select:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 0.25rem rgba(13, 110, 253, 0.25);
        }

        .search-section .btn {
            padding: 10px 20px;
            border-radius: var(--border-radius-md);
            font-weight: 500;
            box-shadow: var(--shadow-sm);
            transition: var(--transition-fast);
        }

        .search-section .btn:hover {
            transform: translateY(-2px);
            box-shadow: var(--shadow-md);
        }

        .search-section .btn-primary {
            background-color: var(--primary-color);
            border-color: var(--primary-color);
        }

        .search-section .btn-primary:hover {
            background-color: var(--primary-dark);
            border-color: var(--primary-dark);
        }

        .search-section .btn-outline-secondary {
            color: var(--secondary-color);
            border-color: var(--secondary-color);
        }

        .search-section .btn-outline-secondary:hover {
            background-color: var(--secondary-color);
            color: white;
        }

        /* Order Card */
        .order-card {
            background-color: #fff;
            border-radius: var(--border-radius-md);
            box-shadow: var(--shadow-md);
            margin-bottom: 25px;
            overflow: hidden;
            transition: var(--transition-normal);
            border: 1px solid rgba(0,0,0,0.05);
        }

        .order-card:hover {
            transform: translateY(-5px);
            box-shadow: var(--shadow-lg);
        }

        .order-header {
            background-color: var(--light-color);
            padding: 18px 20px;
            border-bottom: 1px solid var(--border-color);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .order-id {
            font-weight: 700;
            font-size: 16px;
            color: var(--primary-color);
            display: flex;
            align-items: center;
        }

        .order-id i {
            margin-right: 8px;
            font-size: 18px;
        }

        .order-date {
            font-size: 14px;
            color: var(--secondary-color);
            margin-top: 5px;
            display: flex;
            align-items: center;
        }

        .order-date i {
            margin-right: 8px;
            font-size: 14px;
        }

        .order-status {
            display: inline-flex;
            align-items: center;
            padding: 8px 15px;
            border-radius: 30px;
            font-size: 14px;
            font-weight: 600;
        }

        .order-status i {
            margin-right: 6px;
        }

        .status-pending {
            background-color: #fff3cd;
            color: #856404;
        }

        .status-processing {
            background-color: #cff4fc;
            color: #055160;
        }

        .status-shipping {
            background-color: #d1e7ff;
            color: #084298;
        }

        .status-completed {
            background-color: #d1e7dd;
            color: #0f5132;
        }

        .status-cancelled {
            background-color: #f8d7da;
            color: #842029;
        }

        .order-body {
            padding: 20px;
        }

        .order-items {
            margin-bottom: 20px;
        }

        .item-row {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
            padding-bottom: 15px;
            border-bottom: 1px solid var(--border-color);
            position: relative;
        }

        .item-row:last-child {
            margin-bottom: 0;
            padding-bottom: 0;
            border-bottom: none;
        }

        .item-image {
            width: 75px;
            height: 75px;
            object-fit: cover;
            border-radius: var(--border-radius-sm);
            margin-right: 15px;
            box-shadow: var(--shadow-sm);
            border: 1px solid var(--border-color);
            padding: 2px;
            background-color: white;
        }

        .item-details {
            flex-grow: 1;
        }

        .item-title {
            font-weight: 600;
            margin-bottom: 5px;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
            overflow: hidden;
            color: var(--dark-color);
        }

        .item-variant {
            font-size: 14px;
            color: var(--secondary-color);
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
        }

        .item-variant span {
            display: inline-flex;
            align-items: center;
        }

        .item-variant i {
            margin-right: 5px;
            font-size: 12px;
        }

        .item-price {
            font-weight: 600;
            color: var(--dark-color);
            text-align: right;
            min-width: 120px;
        }

        .order-summary {
            padding: 15px;
            background-color: var(--light-color);
            border-radius: var(--border-radius-sm);
            margin-top: 20px;
            border: 1px solid var(--border-color);
        }

        .summary-row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 10px;
            font-size: 15px;
        }

        .summary-row:last-child {
            margin-bottom: 0;
            padding-top: 10px;
            border-top: 1px solid var(--border-color);
            font-weight: 700;
            font-size: 16px;
        }

        .summary-row span:first-child {
            color: var(--secondary-color);
        }

        .summary-row span:last-child {
            color: var(--dark-color);
        }

        .summary-row:last-child span:last-child {
            color: var(--primary-color);
        }

        .order-actions {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
            padding-top: 20px;
            border-top: 1px solid var(--border-color);
        }

        .btn-order-detail {
            background-color: var(--primary-color);
            color: #fff;
            font-weight: 500;
            padding: 10px 20px;
            border-radius: var(--border-radius-md);
            text-decoration: none;
            transition: var(--transition-normal);
            display: inline-flex;
            align-items: center;
            box-shadow: var(--shadow-sm);
        }

        .btn-order-detail:hover {
            background-color: var(--primary-dark);
            color: #fff;
            transform: translateY(-2px);
            box-shadow: var(--shadow-md);
        }

        .btn-order-detail i {
            margin-right: 8px;
        }

        .btn-cancel-order {
            background-color: var(--danger-color);
            color: #fff;
            font-weight: 500;
            padding: 10px 20px;
            border-radius: var(--border-radius-md);
            text-decoration: none;
            transition: var(--transition-normal);
            display: inline-flex;
            align-items: center;
            box-shadow: var(--shadow-sm);
        }

        .btn-cancel-order:hover {
            background-color: #bb2d3b;
            color: #fff;
            transform: translateY(-2px);
            box-shadow: var(--shadow-md);
        }

        .btn-cancel-order i {
            margin-right: 8px;
        }

        .btn-reorder {
            background-color: var(--secondary-color);
            color: #fff;
            font-weight: 500;
            padding: 10px 20px;
            border-radius: var(--border-radius-md);
            text-decoration: none;
            transition: var(--transition-normal);
            display: inline-flex;
            align-items: center;
            box-shadow: var(--shadow-sm);
        }

        .btn-reorder:hover {
            background-color: #5c636a;
            color: #fff;
            transform: translateY(-2px);
            box-shadow: var(--shadow-md);
        }

        .btn-feedback i {
            margin-right: 8px;
        }
        .btn-feedback {
            background-color: #0d6efd;
            color: #fff;
            font-weight: 500;
            padding: 10px 20px;
            border-radius: var(--border-radius-md);
            text-decoration: none;
            transition: var(--transition-normal);
            display: inline-flex;
            align-items: center;
            box-shadow: var(--shadow-sm);
        }

        .btn-feedback:hover {
            background-color: #blue;
            color: #fff;
            transform: translateY(-2px);
            box-shadow: var(--shadow-md);
        }

        .btn-feedback i {
            margin-right: 8px;
        }

        /* Pagination */
        .pagination {
            margin-top: 30px;
            display: flex;
            justify-content: center;
        }

        .pagination .page-item .page-link {
            color: var(--primary-color);
            background-color: #fff;
            border: 1px solid var(--border-color);
            padding: 10px 16px;
            margin: 0 5px;
            border-radius: var(--border-radius-md);
            transition: var(--transition-normal);
            box-shadow: var(--shadow-sm);
        }

        .pagination .page-item .page-link:hover {
            background-color: var(--light-color);
            transform: translateY(-2px);
            box-shadow: var(--shadow-md);
        }

        .pagination .page-item.active .page-link {
            background-color: var(--primary-color);
            color: #fff;
            border-color: var(--primary-color);
            transform: translateY(-2px);
            box-shadow: var(--shadow-md);
        }

        .pagination .page-item.disabled .page-link {
            color: var(--secondary-color);
            pointer-events: none;
            background-color: #fff;
            border-color: var(--border-color);
        }

        /* Empty Orders */
        .empty-orders {
            text-align: center;
            padding: 60px 20px;
            background-color: #fff;
            border-radius: var(--border-radius-md);
            box-shadow: var(--shadow-md);
            border: 1px solid rgba(0,0,0,0.05);
        }

        .empty-icon {
            font-size: 64px;
            color: var(--secondary-color);
            margin-bottom: 20px;
            opacity: 0.7;
        }

        .empty-message {
            font-size: 20px;
            color: var(--dark-color);
            margin-bottom: 30px;
            font-weight: 500;
        }

        .empty-orders .btn-primary {
            padding: 12px 25px;
            font-size: 16px;
            border-radius: var(--border-radius-md);
            box-shadow: var(--shadow-sm);
            transition: var(--transition-normal);
        }

        .empty-orders .btn-primary:hover {
            transform: translateY(-3px);
            box-shadow: var(--shadow-md);
        }

        /* Alerts */
        .alert {
            margin-bottom: 20px;
            border-radius: var(--border-radius-md);
            padding: 15px 20px;
            box-shadow: var(--shadow-sm);
            border: none;
        }

        .alert-success {
            background-color: #d1e7dd;
            color: #0f5132;
            border-left: 5px solid #198754;
        }

        .alert-danger {
            background-color: #f8d7da;
            color: #842029;
            border-left: 5px solid #dc3545;
        }

        /* Items count badge */
        .items-count {
            background-color: rgba(13, 110, 253, 0.1);
            color: var(--primary-color);
            padding: 5px 12px;
            border-radius: 20px;
            font-size: 14px;
            font-weight: 600;
            display: inline-flex;
            align-items: center;
        }

        .items-count i {
            margin-right: 5px;
        }

        /* Responsive Styles */
        @media (max-width: 767.98px) {
            .page-header {
                flex-direction: column;
                align-items: flex-start;
            }

            .order-header {
                flex-direction: column;
                align-items: flex-start;
            }

            .order-status {
                margin-top: 10px;
            }

            .item-row {
                flex-direction: column;
                align-items: flex-start;
            }

            .item-image {
                margin-bottom: 15px;
                width: 100px;
                height: 100px;
            }

            .item-price {
                text-align: left;
                margin-top: 10px;
            }

            .order-actions {
                flex-direction: column;
                gap: 10px;
            }

            .btn-order-detail, .btn-cancel-order, .btn-reorder {
                width: 100%;
                justify-content: center;
            }

            .search-section .row {
                row-gap: 15px !important;
            }
        }
    </style>
</head>
<body>
    <jsp:include page="header.jsp" />

    <div class="container">
        <div class="page-header">
            <h1>Đơn hàng của tôi</h1>
        </div>

        <!-- Thông báo -->
        <c:if test="${not empty successMessage}">
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                ${successMessage}
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        </c:if>

        <c:if test="${not empty errorMessage}">
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                ${errorMessage}
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        </c:if>

        <!-- Tìm kiếm và lọc -->
        <div class="search-section">
            <form action="myorder" method="GET">
                <div class="row g-3">
                    <div class="col-md-6">
                        <div class="input-group">
                            <input type="text" class="form-control" name="keyword" value="${keyword}" placeholder="Tìm kiếm đơn hàng...">
                            <button class="btn btn-primary" type="submit">
                                <i class="fas fa-search"></i> Tìm kiếm
                            </button>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <select class="form-select" name="status" onchange="this.form.submit()">
                            <option value="" ${empty status ? 'selected' : ''}>Tất cả trạng thái</option>
                            <option value="pending" ${status == 'pending' ? 'selected' : ''}>Chờ xử lý</option>
                            <option value="pending_pay" ${status == 'pending_pay' ? 'selected' : ''}>Chờ thanh toán</option>
                            <option value="processing" ${status == 'processing' ? 'selected' : ''}>Đang xử lý</option>
                            <option value="shipping" ${status == 'shipping' ? 'selected' : ''}>Đang vận chuyển</option>
                            <option value="completed" ${status == 'completed' ? 'selected' : ''}>Đã hoàn thành</option>
                            <option value="cancelled" ${status == 'cancelled' ? 'selected' : ''}>Đã hủy</option>
                        </select>
                    </div>
                    <div class="col-md-2">
                        <a href="myorder" class="btn btn-outline-secondary w-100">
                            <i class="fas fa-redo"></i> Làm mới
                        </a>
                    </div>
                </div>
            </form>
        </div>

        <!-- Danh sách đơn hàng -->
        <c:choose>
            <c:when test="${empty orders}">
                <div class="empty-orders">
                    <div class="empty-icon">
                        <i class="fas fa-shopping-bag"></i>
                    </div>
                    <div class="empty-message">Bạn chưa có đơn hàng nào</div>
                    <a href="listproduct" class="btn btn-primary">Tiếp tục mua sắm</a>
                </div>
            </c:when>
            <c:otherwise>
                <c:forEach items="${orders}" var="order">
                    <div class="order-card">
                        <div class="order-header">
                            <c:if test="${order.status == 'pending_pay'}">
                                <div class="alert alert-warning mt-3">
                                    Đơn hàng sẽ tự động bị hủy nếu không thanh toán trong vòng 3 ngày kể từ 
                                    <fmt:formatDate value="${order.orderDate}" pattern="dd/MM/yyyy HH:mm"/>.
                                </div>
                            </c:if>
                            <div>
                                <div class="order-id">Đơn hàng #${order.orderCode}</div>
                                <div class="order-date">Ngày đặt: <fmt:formatDate value="${order.orderDate}" pattern="dd/MM/yyyy HH:mm"/></div>
                            </div>
                            <div>
                                <c:choose>
                                    <c:when test="${order.status == 'pending_pay'}">
                                        <span class="order-status status-pending">Chờ thanh toán</span>
                                    </c:when>
                                    <c:when test="${order.status == 'pending'}">
                                        <span class="order-status status-pending">Chờ xử lý</span>
                                    </c:when>
                                    <c:when test="${order.status == 'processing'}">
                                        <span class="order-status status-processing">Đang xử lý</span>
                                    </c:when>
                                    <c:when test="${order.status == 'shipping'}">
                                        <span class="order-status status-shipping">Đang vận chuyển</span>
                                    </c:when>
                                    <c:when test="${order.status == 'completed'}">
                                        <span class="order-status status-completed">Đã hoàn thành</span>
                                    </c:when>
                                    <c:when test="${order.status == 'cancelled'}">
                                        <span class="order-status status-cancelled">Đã hủy</span>
                                    </c:when>
                                    <c:when test="${order.status == 'returned'}">
                                        <span class="order-status status-cancelled">Đã hoàn trả</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="order-status">${order.status}</span>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                        <div class="order-body">
                            <div class="order-items">
                                <c:forEach items="${order.items}" var="item" varStatus="loop">
                                    <c:if test="${loop.index < 2}">
                                        <div class="item-row">
                                            <img src="${item.productThumbnail}" alt="${item.productTitle}" class="item-image">
                                            <div class="item-details">
                                                <div class="item-title">${item.productTitle}</div>
                                                <div class="item-variant">Size: ${item.size} | Màu: ${item.color} | Số lượng: ${item.quantity}</div>
                                            </div>
                                            <div class="item-price">
                                                <fmt:formatNumber value="${item.productPrice * item.quantity}" type="currency" currencySymbol="₫" maxFractionDigits="0"/>
                                            </div>
                                        </div>
                                    </c:if>
                                </c:forEach>

                                <c:if test="${order.items.size() > 2}">
                                    <div class="text-center mt-2">
                                        <span class="text-muted">Còn ${order.items.size() - 2} sản phẩm khác</span>
                                    </div>
                                </c:if>
                            </div>

                            <div class="order-summary">
                                <div class="summary-row">
                                    <span>Địa chỉ giao hàng:</span>
                                    <span>${order.address}</span>
                                </div>
                                <div class="summary-row">
                                    <span>Phương thức thanh toán:</span>
                                    <span>
                                        <c:choose>
                                            <c:when test="${order.paymentMethod == 'cod'}">Thanh toán khi nhận hàng (COD)</c:when>
                                            <c:when test="${order.paymentMethod == 'bank_transfer'}">Chuyển khoản ngân hàng</c:when>
                                            <c:otherwise>${order.paymentMethod}</c:otherwise>
                                        </c:choose>
                                    </span>
                                </div>
                                <div class="summary-row">
                                    <span>Tổng thanh toán:</span>
                                    <span><fmt:formatNumber value="${order.total}" type="currency" currencySymbol="₫" maxFractionDigits="0"/></span>
                                </div>
                            </div>

                            <div class="order-actions">
                                <a href="orderdetail?id=${order.id}" class="btn-order-detail">
                                    <i class="fas fa-eye me-2"></i> Xem chi tiết
                                </a>
                                <div>
                                    <c:if test="${order.status == 'pending_pay'}">
                                        <a href="myorder?action=cancel&id=${order.id}" class="btn-cancel-order" onclick="return confirm('Bạn có chắc muốn hủy đơn hàng này?')">
                                            <i class="fas fa-times me-2"></i> Hủy đơn hàng
                                        </a>
                                        <c:if test="${order.paymentStatus == 'pending' && order.paymentMethod == 'bank_transfer'}">
                                            <a href="myorder?action=retry_payment&id=${order.id}" class="btn-order-detail">
                                                <i class="fas fa-money-check-alt me-2"></i> Thanh toán lại
                                            </a>
                                        </c:if>
                                    </c:if>
                                    <c:if test="${order.status == 'pending'}">
                                        <a href="myorder?action=cancel&id=${order.id}" class="btn-cancel-order" onclick="return confirm('Bạn có chắc muốn hủy đơn hàng này?')">
                                            <i class="fas fa-times me-2"></i> Hủy đơn hàng
                                        </a>

                                    </c:if>
                                    <c:if test="${order.status == 'completed'}">
                                        <div>
                                            <c:choose>
                                                <c:when test="${!feedbackStatus[order.id]}">
                                                    <a href="submitfeedback?orderId=${order.id}" class="btn-feedback">
                                                        <i class="fas fa-star me-2"></i> Đánh giá sản phẩm
                                                    </a>
                                                </c:when>
                                                <c:otherwise>
                                                    <a href="#" class="btn-feedback" style="background-color: #ffc107; pointer-events: none;">
                                                        <i class="fas fa-star me-2"></i> Đã đánh giá
                                                    </a>
                                                </c:otherwise>
                                            </c:choose>
                                            <a href="myorder?action=reorder&id=${order.id}" class="btn-reorder">
                                                <i class="fas fa-redo me-2"></i> Mua lại
                                            </a>
                                        </div>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>

                <!-- Phân trang -->
                <c:if test="${noOfPages > 1}">
                    <nav aria-label="Page navigation">
                        <ul class="pagination">
                            <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
                                <a class="page-link" href="myorder?page=${currentPage - 1}${not empty keyword ? '&keyword='.concat(keyword) : ''}${not empty status ? '&status='.concat(status) : ''}" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>

                            <c:forEach begin="1" end="${noOfPages}" var="i">
                                <li class="page-item ${currentPage == i ? 'active' : ''}">
                                    <a class="page-link" href="myorder?page=${i}${not empty keyword ? '&keyword='.concat(keyword) : ''}${not empty status ? '&status='.concat(status) : ''}">${i}</a>
                                </li>
                            </c:forEach>

                            <li class="page-item ${currentPage == noOfPages ? 'disabled' : ''}">
                                <a class="page-link" href="myorder?page=${currentPage + 1}${not empty keyword ? '&keyword='.concat(keyword) : ''}${not empty status ? '&status='.concat(status) : ''}" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </ul>
                    </nav>
                </c:if>
            </c:otherwise>
        </c:choose>
    </div>
                        
    <jsp:include page="chat.jsp" />

    <jsp:include page="footer.jsp" />

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script>
                                            // Ẩn thông báo sau 5 giây
                                            window.setTimeout(function () {
                                                var alerts = document.querySelectorAll('.alert');
                                                alerts.forEach(function (alert) {
                                                    var bsAlert = new bootstrap.Alert(alert);
                                                    bsAlert.close();
                                                });
                                            }, 5000);
    </script>
</body>
</html>