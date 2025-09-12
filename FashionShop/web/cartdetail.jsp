<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chi tiết giỏ hàng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <style>
        .container {
            max-width: 1200px;
            padding: 20px 15px;
        }

        .page-header {
            border-bottom: 2px solid #f0f0f0;
            padding-bottom: 15px;
            margin-bottom: 30px;
        }

        .page-header h1 {
            font-size: 24px;
            font-weight: 700;
            color: #333;
        }

        .page-header:after {
            content: '';
            display: block;
            width: 80px;
            height: 3px;
            background-color: var(--primary-color, #007bff);
            margin-top: 12px;
            border-radius: 2px;
        }

        .links-card {
            margin-bottom: 30px;
            box-shadow: 0 2px 6px rgba(0,0,0,0.05);
        }

        .links-card .card-body {
            padding: 16px;
        }

        .links-card a {
            padding: 8px 16px;
            border-radius: 20px;
            transition: all 0.2s;
        }

        .links-card a:hover {
            background-color: rgba(59, 130, 246, 0.1);
            transform: translateY(-2px);
        }

        .table {
            margin-bottom: 0;
        }

        .table th, .table td {
            vertical-align: middle;
            text-align: center;
            padding: 16px 12px;
        }

        .table td:nth-child(2) {
            text-align: left;
        }

        .form-check {
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .form-check-input[type=checkbox] {
            width: 20px;
            height: 20px;
            cursor: pointer;
            border-width: 2px; 
            border-color: #D2D2D2; 
        }

        .form-check-label {
            margin-left: 8px;
            font-weight: 500;
            font-size: 14px;
        }

        .product-image {
            width: 80px;
            height: 80px;
            object-fit: cover;
            border-radius: 8px;
            border: 1px solid #f0f0f0;
        }

        .product-title {
            font-size: 15px;
            font-weight: 600;
            margin-bottom: 5px;
            line-height: 1.4;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
            overflow: hidden;
            max-width: 250px;
        }

        .product-meta {
            font-size: 13px;
            color: #64748b;
        }

        .price {
            font-weight: 700;
            color: #333;
            font-size: 16px;
        }

        .quantity-control {
            margin: 0 auto;
            max-width: 120px;
        }

        .quantity-control .input-group {
            flex-wrap: nowrap;
            padding-left: 8px;
            border-radius: 4px;
        }

        .quantity-control .btn {
            width: 34px;
            height: 34px;
            padding: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            background-color: #f8f9fa;
            border-color: #dee2e6;
            color: #333;
            font-size: 14px;
            z-index: 0;
        }

        .quantity-control .btn:hover {
            background-color: #e9ecef;
        }

        .quantity-input {
            width: 40px !important;
            min-width: 40px !important;
            max-width: 40px !important;
            text-align: center !important;
            padding: 0 !important;
            font-weight: 600;
            color: #333;
            border-left: 0;
            border-right: 0;
            background-color: white;
        }

        input[type=number]::-webkit-inner-spin-button,
        input[type=number]::-webkit-outer-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }

        input[type=number] {
            -moz-appearance: textfield;
        }

        .stock-status {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            padding: 6px 12px;
            border-radius: 20px;
            font-weight: 500;
            font-size: 13px;
            margin: 0 auto;
            min-width: 100px;
        }

        .stock-status.in-stock {
            background-color: rgba(40, 167, 69, 0.1);
            color: #28a745;
        }

        .stock-status.out-of-stock {
            background-color: rgba(255, 193, 7, 0.1);
            color: #ffc107;
        }

        .stock-status.paused {
            background-color: rgba(220, 53, 69, 0.1);
            color: #dc3545;
        }

        .stock-status i {
            margin-right: 6px;
            font-size: 12px;
        }

        .btn-delete {
            width: 34px;
            height: 34px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 50%;
            transition: all 0.2s;
            margin: 0 auto;
            color: #94a3b8;
        }

        .btn-delete:hover {
            background-color: rgba(220, 53, 69, 0.1);
            color: #dc3545;
        }

        tr[data-id] .quantity-input:disabled {
            background-color: #f8f9fa !important;
            opacity: 0.6;
        }

        .form-check-input:disabled {
            opacity: 0.5;
            background-color: #f8f9fa;
        }

        .cart-summary .card {
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 10px rgba(0,0,0,0.05);
        }

        .cart-summary .card-body {
            padding: 20px;
        }

        .cart-summary .card-title {
            font-size: 18px;
            margin-bottom: 20px;
            color: #333;
        }

        .summary-item {
            display: flex;
            justify-content: space-between;
            margin-bottom: 15px;
            color: #64748b;
        }

        .summary-total {
            display: flex;
            justify-content: space-between;
            font-size: 18px;
            font-weight: 700;
            color: #333;
            margin-top: 15px;
            padding-top: 15px;
            border-top: 1px solid #f1f5f9;
        }

        .summary-total .price {
            color: var(--primary-color, #007bff);
        }

        .checkout-btn {
            padding: 12px;
            font-weight: 600;
            font-size: 16px;
            margin-top: 15px;
            border-radius: 6px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .btn-outline-primary {
            padding: 10px 24px;
            border-radius: 6px;
            font-weight: 500;
            transition: all 0.3s;
        }

        .btn-outline-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 10px rgba(59, 130, 246, 0.2);
        }

        @media (max-width: 768px) {
            .table-responsive {
                border: none;
            }

            .product-title {
                max-width: 150px;
                -webkit-line-clamp: 3;
            }

            .quantity-control {
                max-width: 110px;
            }

            .table th, .table td {
                padding: 12px 8px;
            }
        }

        .table tr:hover {
            background-color: rgba(59, 130, 246, 0.02);
        }

        .quantity-input {
            font-family: 'Segoe UI', Roboto, Arial, sans-serif;
            font-size: 15px;
            line-height: 1;
        }

        .alert {
            margin-bottom: 20px;
            padding: 10px 15px;
            border-radius: 6px;
            font-size: 14px;
        }

        .alert-danger {
            background-color: rgba(220, 53, 69, 0.1);
            color: #dc3545;
            border: 1px solid rgba(220, 53, 69, 0.2);
        }

        /* CSS cho modal mã giảm giá */
        .coupon-item {
            border: 1px solid #dee2e6;
            transition: all 0.3s;
        }

        .coupon-item:hover {
            background-color: #e9ecef;
        }

        .coupon-item p {
            font-size: 14px;
            color: #333;
        }

        .coupon-item .fw-bold {
            font-weight: 600;
        }

        .coupon-item .text-muted {
            font-size: 12px;
            color: #6c757d;
        }

        .modal-body {
            max-height: 400px;
            overflow-y: auto;
        }

        .modal-content {
            border-radius: 10px;
        }

        .modal-header {
            border-bottom: 1px solid #dee2e6;
        }

        .modal-footer {
            border-top: 1px solid #dee2e6;
        }

        .modal-footer .btn {
            padding: 8px 20px;
        }
    </style>
</head>
<body>
    <jsp:include page="/header.jsp" />
    <div class="container py-5">
        <!-- Header -->
        <div class="page-header mb-4">
            <h1 class="h3">Giỏ hàng của bạn</h1>
        </div>

        <!-- Hiển thị thông báo lỗi chung nếu có -->
        <c:if test="${not empty error}">
            <div class="alert alert-danger">
                <i class="fas fa-exclamation-circle me-2"></i>${error}
            </div>
        </c:if>

        <!-- Links -->
        <div class="card mb-4 links-card">
            <div class="card-body py-3">
                <div class="row text-center">
                    <div class="col-md-4 mb-2 mb-md-0">
                        <a href="footer.jsp" class="text-decoration-none d-inline-block">
                            <i class="fas fa-envelope"></i> Liên hệ
                        </a>
                    </div>
                    <div class="col-md-4 mb-2 mb-md-0">
                        <a href="footer.jsp" class="text-decoration-none d-inline-block">
                            <i class="fas fa-info-circle"></i> Về chúng tôi
                        </a>
                    </div>
                    <div class="col-md-4">
                        <a href="footer.jsp" class="text-decoration-none d-inline-block">
                            <i class="fas fa-question-circle"></i> Trợ giúp
                        </a>
                    </div>
                </div>
            </div>
        </div>

        <div class="row g-4">
            <!-- Cart Items -->
            <div class="col-lg-8">
                <div class="card mb-4">
                    <div class="card-body p-0 p-md-3">
                        <c:choose>
                            <c:when test="${empty cart.items}">
                                <div class="text-center empty-cart-container">
                                    <i class="fas fa-shopping-cart empty-cart-icon"></i>
                                    <h5 class="mb-3">Giỏ hàng trống</h5>
                                    <p class="text-muted mb-4">Hãy thêm sản phẩm vào giỏ hàng của bạn</p>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <form id="checkoutForm" action="cartdetail" method="POST">
                                    <input type="hidden" name="action" value="checkout">
                                    <div class="table-responsive">
                                        <table class="table align-middle mb-0">
                                            <thead>
                                                <tr>
                                                    <th scope="col">
                                                        <div class="form-check">
                                                            <input type="checkbox" class="form-check-input" id="selectAll" onchange="toggleAllProducts()">
                                                            <label class="form-check-label" for="selectAll"></label>
                                                        </div>
                                                    </th>
                                                    <th scope="col">Sản phẩm</th>
                                                    <th scope="col">Giá</th>
                                                    <th scope="col">Số lượng</th>
                                                    <th scope="col">Trạng thái</th>
                                                    <th scope="col"></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${cart.items}" var="item">
                                                    <tr data-id="${item.id}" data-product-id="${item.productId}" data-variant-id="${item.variantId}">
                                                        <td>
                                                            <div class="form-check">
                                                                <input type="checkbox" class="form-check-input product-select" 
                                                                       name="selectedItems" value="${item.id}"
                                                                       onchange="updateTotalAmount()"
                                                                       ${stockMap[item.id] <= 0 || productStatusMap[item.id] == 'inactive' ? 'disabled' : ''}
                                                                       data-stock="${stockMap[item.id]}"
                                                                       data-status="${productStatusMap[item.id]}">
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="d-flex align-items-center">
                                                                <a href="productdetail?id=${item.productId}" class="product-link">
                                                                    <img src="${item.productThumbnail}" alt="${item.productTitle}" 
                                                                         class="product-image me-3">
                                                                </a>
                                                                <div>
                                                                    <h6 class="product-title">
                                                                        <a href="productdetail?id=${item.productId}" class="product-link text-decoration-none">
                                                                            ${item.productTitle}
                                                                        </a>
                                                                    </h6>
                                                                    <div class="product-meta">
                                                                        Size: <span class="fw-semibold">${item.size}</span> | Màu: <span class="fw-semibold">${item.color}</span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="price">
                                                                <fmt:formatNumber value="${item.productPrice}" type="currency" currencySymbol="₫" maxFractionDigits="0"/>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="quantity-control">
                                                                <div class="input-group">
                                                                    <button type="button" class="btn btn-outline-secondary" 
                                                                            onclick="updateQuantity(this, -1)"
                                                                            ${stockMap[item.id] <= 0 || productStatusMap[item.id] == 'inactive' ? 'disabled' : ''}>
                                                                        <i class="fas fa-minus"></i>
                                                                    </button>
                                                                    <input type="number" value="${item.quantity}" min="1" max="${stockMap[item.id]}"
                                                                           class="form-control text-center quantity-input ${stockMap[item.id] <= 0 || productStatusMap[item.id] == 'inactive' ? 'bg-light' : ''}"
                                                                           data-item-id="${item.id}"
                                                                           data-variant-id="${item.variantId}"
                                                                           data-max-stock="${stockMap[item.id]}"
                                                                           data-status="${productStatusMap[item.id]}"
                                                                           onchange="handleQuantityChange(this)"
                                                                           ${stockMap[item.id] <= 0 || productStatusMap[item.id] == 'inactive' ? 'disabled' : ''}>
                                                                    <button type="button" class="btn btn-outline-secondary" 
                                                                            onclick="updateQuantity(this, 1)"
                                                                            ${stockMap[item.id] <= 0 || productStatusMap[item.id] == 'inactive' ? 'disabled' : ''}>
                                                                        <i class="fas fa-plus"></i>
                                                                    </button>
                                                                </div>
                                                                <div class="stock-message text-danger mt-1" style="display: none; font-size: 12px;"></div>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="stock-status ${productStatusMap[item.id] == 'inactive' ? 'paused' : stockMap[item.id] > 0 ? 'in-stock' : 'out-of-stock'}">
                                                                <i class="fas ${productStatusMap[item.id] == 'inactive' ? 'fa-times-circle' : stockMap[item.id] > 0 ? 'fa-check-circle' : 'fa-pause-circle'}"></i>
                                                                <span class="ms-2">
                                                                    ${productStatusMap[item.id] == 'inactive' ? 'Ngưng Bán' : stockMap[item.id] > 0 ? 'Còn Hàng' : 'Hết Hàng'}
                                                                </span>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <button type="button" class="btn btn-delete" 
                                                                    onclick="deleteItem(${item.id})">
                                                                <i class="fas fa-trash"></i>
                                                            </button>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </form>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>

                <div class="text-center mb-4">
                    <a href="listproduct" class="btn btn-outline-primary">
                        <i class="fas fa-plus me-2"></i> Tiếp tục mua sắm
                    </a>
                </div>
            </div>

            <!-- Cart Summary -->
            <div class="col-lg-4">
                <div class="card mb-3">
                    <div class="card-body">
                        <h5 class="card-title fw-bold mb-3">Mã giảm giá</h5>
                        <div class="d-flex align-items-center">
                            <button type="button" class="btn btn-outline-primary w-100" data-bs-toggle="modal" data-bs-target="#couponModal">
                                <i class="fas fa-ticket-alt me-2"></i> Chọn mã giảm giá
                            </button>
                            <c:if test="${not empty appliedCoupon}">
                                <form action="cartdetail" method="post" class="ms-2">
                                    <input type="hidden" name="action" value="clearCoupon">
                                    <button type="submit" class="btn btn-outline-danger btn-sm">
                                        <i class="fas fa-times"></i> Xóa
                                    </button>
                                </form>
                            </c:if>
                        </div>
                        <div id="couponMinAmount" class="small text-muted mt-2">
                            Giá trị đơn hàng tối thiểu: ₫<span id="minOrderAmount">0</span>
                        </div>
                        <c:if test="${not empty appliedCoupon}">
                            <div class="small text-success mt-2">
                                <i class="fas fa-check-circle me-1"></i> Đang áp dụng mã: ${appliedCoupon}
                            </div>
                        </c:if>
                        <c:if test="${not empty couponError}">
                            <div class="alert alert-danger mt-2">
                                <i class="fas fa-exclamation-circle me-2"></i> ${couponError}
                            </div>
                        </c:if>
                        <div id="couponError" class="alert alert-danger mt-2" style="display: none;">
                            <i class="fas fa-exclamation-circle me-2"></i> <span id="couponErrorMessage"></span>
                        </div>
                    </div>
                </div>

                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title fw-bold mb-4">Tổng đơn hàng</h5>

                        <div class="summary-item">
                            <span>Số sản phẩm đã chọn:</span>
                            <span id="selectedCount" class="fw-semibold">0</span>
                        </div>

                        <div class="summary-item">
                            <span>Tổng tiền hàng:</span>
                            <span id="selectedTotal" class="fw-semibold">₫0</span>
                        </div>

                        <div class="summary-item text-success" id="discountRow" style="display: none;">
                            <span>Giảm giá:</span>
                            <span id="discountAmount" class="fw-semibold">-₫0</span>
                        </div>

                        <div class="summary-total">
                            <span>Tổng thanh toán:</span>
                            <span id="finalTotal" class="price">₫0</span>
                        </div>

                        <button type="button" onclick="submitCheckout()" class="btn btn-primary w-100 checkout-btn" id="checkoutBtn" disabled>
                            Thanh toán <i class="fas fa-arrow-right ms-2"></i>
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Coupon Modal -->
        <!-- Coupon Modal -->
<div class="modal fade" id="couponModal" tabindex="-1" aria-labelledby="couponModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="couponModalLabel">Chọn Voucher</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <c:if test="${not empty availableCoupons}">
                    <c:forEach items="${availableCoupons}" var="coupon">
                        <c:if test="${(coupon.couponType == 'normal') || (coupon.couponType == 'vip' && isUserVip)}">
                            <div class="coupon-item mb-2 p-2 border rounded" style="background-color: #f8f9fa;">
                                <div class="d-flex justify-content-between align-items-center">
                                    <div>
                                        <p class="mb-1 fw-bold">
                                            ${coupon.code} - 
                                            <c:choose>
                                                <c:when test="${coupon.discount_type == 'percentage'}">
                                                    Giảm ${coupon.discount_value}%
                                                </c:when>
                                                <c:otherwise>
                                                    Giảm ₫<fmt:formatNumber value="${coupon.discount_value}" type="number"/>
                                                </c:otherwise>
                                            </c:choose>
                                        </p>
                                        <p class="mb-1 small text-muted">
                                            <c:if test="${coupon.discount_type == 'percentage' && coupon.max_discount > 0}">
                                                Giảm tối đa ₫<fmt:formatNumber value="${coupon.max_discount}" type="number"/>
                                            </c:if>
                                            <c:if test="${coupon.discount_type != 'percentage'}">
                                                Giảm tối đa ₫<fmt:formatNumber value="${coupon.discount_value}" type="number"/>
                                            </c:if>
                                        </p>
                                        <p class="mb-0 small text-muted">
                                            Đơn tối thiểu ₫<fmt:formatNumber value="${coupon.min_order_amount}" type="number"/>
                                        </p>
                                    </div>
                                    <div>
                                        <input type="radio" name="selectedCoupon" value="${coupon.code}" 
                                               data-type="${coupon.discount_type}" 
                                               data-value="${coupon.discount_value}" 
                                               data-min="${coupon.min_order_amount}" 
                                               data-max="${coupon.max_discount}"
                                               ${coupon.code eq appliedCoupon ? 'checked' : ''}>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </c:if>
                <c:if test="${empty availableCoupons}">
                    <p class="text-muted text-center">Không có mã giảm giá nào khả dụng.</p>
                </c:if>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">Trở lại</button>
                <button type="button" class="btn btn-primary" onclick="applyCoupon()">OK</button>
            </div>
        </div>
    </div>
</div>
    </div>
    
    <jsp:include page="chat.jsp" />    

    <jsp:include page="/footer.jsp" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

    <script>
        // Hiển thị thông báo lỗi tồn kho
        function showStockMessage(input, message, isError) {
            const row = input.closest('tr');
            const messageEl = row.querySelector('.stock-message');

            if (messageEl) {
                if (message) {
                    messageEl.textContent = message;
                    messageEl.style.display = 'block';
                    messageEl.className = isError ?
                        'stock-message text-danger mt-1' :
                        'stock-message text-success mt-1';

                    if (isError) {
                        input.classList.add('quantity-error');
                    } else {
                        input.classList.remove('quantity-error');
                    }
                } else {
                    messageEl.style.display = 'none';
                    input.classList.remove('quantity-error');
                }
            }
        }

        // Hiển thị thông báo lỗi mã giảm giá
        function showCouponError(message) {
            const couponError = document.getElementById('couponError');
            const couponErrorMessage = document.getElementById('couponErrorMessage');
            if (message) {
                couponErrorMessage.textContent = message;
                couponError.style.display = 'block';
            } else {
                couponError.style.display = 'none';
            }
        }

        // Xử lý thanh toán
        function submitCheckout() {
            const form = document.getElementById('checkoutForm');
            const checkboxes = document.getElementsByClassName('product-select');
            let hasSelectedItems = false;
            let hasInvalidItemSelected = false;

            for (let checkbox of checkboxes) {
                if (checkbox.checked) {
                    if (checkbox.disabled || parseInt(checkbox.dataset.stock) <= 0 || checkbox.dataset.status === 'inactive') {
                        hasInvalidItemSelected = true;
                        continue;
                    }

                    hasSelectedItems = true;
                    const row = checkbox.closest('tr');
                    const itemId = checkbox.value;
                    const quantity = row.querySelector('.quantity-input').value;

                    const quantityInput = document.createElement('input');
                    quantityInput.type = 'hidden';
                    quantityInput.name = 'quantity_' + itemId;
                    quantityInput.value = quantity;
                    form.appendChild(quantityInput);
                }
            }

            if (hasInvalidItemSelected) {
                alert('Không thể thanh toán sản phẩm hết hàng hoặc ngưng bán. Vui lòng bỏ chọn những sản phẩm này và thử lại.');
                return;
            }

            if (!hasSelectedItems) {
                alert('Vui lòng chọn ít nhất một sản phẩm');
                return;
            }

            const selectedCoupon = document.querySelector('input[name="selectedCoupon"]:checked');
            if (selectedCoupon) {
                const totalAmount = calculateTotalAmount();
                const minAmount = parseFloat(selectedCoupon.dataset.min || 0);
                if (totalAmount < minAmount) {
                    alert('Tổng tiền hàng chưa đủ để áp dụng mã giảm giá này.');
                    return;
                }

                const couponInput = document.createElement('input');
                couponInput.type = 'hidden';
                couponInput.name = 'couponCode';
                couponInput.value = selectedCoupon.value;
                form.appendChild(couponInput);
            }

            form.submit();
        }

        // Tính tổng tiền hàng
        function calculateTotalAmount() {
            const checkboxes = document.getElementsByClassName('product-select');
            let totalAmount = 0;

            for (let checkbox of checkboxes) {
                if (checkbox.checked && !checkbox.disabled) {
                    const row = checkbox.closest('tr');
                    const priceText = row.querySelector('td:nth-child(3)').textContent;
                    const price = parseFloat(priceText.replace(/[^\d]/g, ''));
                    const quantity = parseInt(row.querySelector('.quantity-input').value);
                    totalAmount += price * quantity;
                }
            }

            return totalAmount;
        }

        // Cập nhật tổng tiền
        function updateTotalAmount() {
            const checkboxes = document.getElementsByClassName('product-select');
            let totalAmount = 0;
            let selectedCount = 0;

            for (let checkbox of checkboxes) {
                if (checkbox.checked && !checkbox.disabled) {
                    const row = checkbox.closest('tr');
                    const priceText = row.querySelector('td:nth-child(3)').textContent;
                    const price = parseFloat(priceText.replace(/[^\d]/g, ''));
                    const quantity = parseInt(row.querySelector('.quantity-input').value);
                    totalAmount += price * quantity;
                    selectedCount++;
                }
            }

            document.getElementById('selectedCount').textContent = selectedCount;
            document.getElementById('selectedTotal').textContent = formatCurrency(totalAmount);

            // Cập nhật giá trị đơn hàng tối thiểu cho coupon
            const selectedCoupon = document.querySelector('input[name="selectedCoupon"]:checked');
            if (selectedCoupon) {
                const minAmount = parseFloat(selectedCoupon.dataset.min || 0);
                document.getElementById('minOrderAmount').textContent = new Intl.NumberFormat('vi-VN').format(minAmount);
            } else {
                document.getElementById('minOrderAmount').textContent = '0';
            }

            const { discount, error } = calculateDiscount(totalAmount);
            showCouponError(error);
            updateDiscountDisplay(discount);

            const finalTotal = Math.max(0, totalAmount - discount);
            document.getElementById('finalTotal').textContent = formatCurrency(finalTotal);

            document.getElementById('checkoutBtn').disabled = selectedCount === 0;

            const selectAll = document.getElementById('selectAll');
            if (checkboxes.length > 0) {
                const enabledCheckboxes = Array.from(checkboxes).filter(checkbox => !checkbox.disabled);
                const checkedEnabledCheckboxes = Array.from(checkboxes).filter(checkbox => checkbox.checked && !checkbox.disabled);

                if (enabledCheckboxes.length > 0) {
                    selectAll.checked = checkedEnabledCheckboxes.length === enabledCheckboxes.length;
                    selectAll.indeterminate = checkedEnabledCheckboxes.length > 0 && checkedEnabledCheckboxes.length < enabledCheckboxes.length;
                } else {
                    selectAll.checked = false;
                    selectAll.indeterminate = false;
                }
            }
        }

        // Tính giảm giá dựa trên mã coupon
        function calculateDiscount(totalAmount) {
            let discount = 0;
            let error = null;
            const selectedCoupon = document.querySelector('input[name="selectedCoupon"]:checked');

            if (selectedCoupon && totalAmount > 0) {
                const type = selectedCoupon.dataset.type;
                const value = parseFloat(selectedCoupon.dataset.value);
                const minAmount = parseFloat(selectedCoupon.dataset.min || 0);
                const maxDiscount = parseFloat(selectedCoupon.dataset.max || 0);

                if (totalAmount < minAmount) {
                    error = `Tổng tiền hàng chưa đủ để áp dụng mã giảm giá này.`;
                    return { discount: 0, error };
                }

                if (type === 'percentage') {
                    discount = (totalAmount * value) / 100;
                    if (maxDiscount > 0 && discount > maxDiscount) {
                        discount = maxDiscount;
                    }
                } else {
                    discount = value;
                }
            }

            return { discount, error };
        }

        // Hiển thị giảm giá
        function updateDiscountDisplay(discount) {
            const discountRow = document.getElementById('discountRow');
            if (discount > 0) {
                document.getElementById('discountAmount').textContent = '-' + formatCurrency(discount);
                discountRow.style.display = 'flex';
            } else {
                discountRow.style.display = 'none';
            }
        }

        // Định dạng tiền tệ
        function formatCurrency(amount) {
            return '₫' + amount.toLocaleString('vi-VN');
        }

        // Chọn hoặc bỏ chọn tất cả sản phẩm
        function toggleAllProducts() {
            const selectAll = document.getElementById('selectAll');
            const checkboxes = document.getElementsByClassName('product-select');
            for (let checkbox of checkboxes) {
                if (!checkbox.disabled) {
                    checkbox.checked = selectAll.checked;
                }
            }
            updateTotalAmount();
        }

        // Cập nhật số lượng sản phẩm
        function updateQuantity(button, change) {
            const input = button.parentElement.querySelector('input');
            const currentValue = parseInt(input.value) || 1;
            const maxStock = parseInt(input.dataset.maxStock) || 0;
            const status = input.dataset.status;
            const newValue = currentValue + change;

            if (status === 'inactive') {
                showStockMessage(input, `Sản phẩm đã ngưng kinh doanh.`, true);
                return;
            }

            if (newValue >= 1) {
                if (maxStock > 0 && newValue > maxStock) {
                    showStockMessage(input, `Vượt quá số lượng trong kho.`, true);
                    return;
                }

                showStockMessage(input, null);
                input.value = newValue;
                const itemId = input.dataset.itemId;
                if (itemId) {
                    updateQuantityOnServer(itemId, newValue);
                    updateTotalAmount();
                }
            }
        }

        // Xử lý thay đổi số lượng
        function handleQuantityChange(input) {
            let value = parseInt(input.value) || 1;
            const maxStock = parseInt(input.dataset.maxStock) || 0;
            const status = input.dataset.status;

            if (status === 'inactive') {
                input.value = 0;
                showStockMessage(input, `Sản phẩm đã ngưng kinh doanh.`, true);
                return;
            }

            if (value < 1) {
                value = 1;
            }

            if (maxStock > 0 && value > maxStock) {
                value = maxStock;
                showStockMessage(input, `Vượt quá số lượng trong kho.`, true);
            } else {
                showStockMessage(input, null);
            }

            input.value = value;
            const itemId = input.dataset.itemId;
            if (itemId) {
                updateQuantityOnServer(itemId, value);
                updateTotalAmount();
            }
        }

        // Cập nhật số lượng trên server
        function updateQuantityOnServer(itemId, quantity) {
            if (!itemId || !quantity || quantity < 1) {
                console.error('Invalid itemId or quantity');
                return;
            }

            const formData = new URLSearchParams();
            formData.append('action', 'update');
            formData.append('cartItemId', itemId);
            formData.append('quantity', quantity);

            fetch('cartdetail', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded',
                },
                body: formData.toString()
            })
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.json();
            })
            .then(data => {
                if (data.success && data.updatedQuantity < quantity) {
                    const inputs = document.querySelectorAll(`.quantity-input[data-item-id="${itemId}"]`);
                    inputs.forEach(input => {
                        input.value = data.updatedQuantity;
                        showStockMessage(input, `Số lượng đã được điều chỉnh do tồn kho chỉ còn ${data.updatedQuantity} sản phẩm.`, true);
                    });
                    updateTotalAmount();
                }
            })
            .catch(error => {
                console.error('Error updating quantity:', error);
            });
        }

        // Xóa sản phẩm khỏi giỏ hàng
        function deleteItem(itemId) {
            if (confirm('Bạn có chắc muốn xóa sản phẩm này khỏi giỏ hàng?')) {
                const formData = new URLSearchParams();
                formData.append('action', 'delete');
                formData.append('cartItemId', itemId);

                fetch('cartdetail', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded',
                    },
                    body: formData.toString()
                })
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Network response was not ok');
                    }
                    location.reload();
                })
                .catch(error => {
                    console.error('Error deleting item:', error);
                    alert('Có lỗi xảy ra khi xóa sản phẩm. Vui lòng thử lại sau.');
                });
            }
        }

        // Áp dụng mã giảm giá từ modal
        function applyCoupon() {
            const selectedCoupon = document.querySelector('input[name="selectedCoupon"]:checked');
            if (selectedCoupon) {
                const couponCode = selectedCoupon.value;
                const formData = new URLSearchParams();
                formData.append('action', 'applyCoupon');
                formData.append('couponCode', couponCode);

                fetch('cartdetail', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded',
                    },
                    body: formData.toString()
                })
                .then(response => {
                    if (response.ok) {
                        const modal = bootstrap.Modal.getInstance(document.getElementById('couponModal'));
                        modal.hide();
                        location.reload();
                    } else {
                        alert('Có lỗi xảy ra khi áp dụng mã giảm giá. Vui lòng thử lại.');
                    }
                })
                .catch(error => {
                    console.error('Error applying coupon:', error);
                    alert('Có lỗi xảy ra khi áp dụng mã giảm giá. Vui lòng thử lại.');
                });
            } else {
                alert('Vui lòng chọn một mã giảm giá.');
            }
        }

        // Kiểm tra tất cả số lượng khi trang được tải
        function validateAllQuantities() {
            const inputs = document.querySelectorAll('.quantity-input');

            for (const input of inputs) {
                const maxStock = parseInt(input.dataset.maxStock) || 0;
                const currentValue = parseInt(input.value) || 1;
                const status = input.dataset.status;

                if ((maxStock > 0 && currentValue > maxStock) || status === 'inactive') {
                    if (status === 'inactive') {
                        input.value = 0;
                        showStockMessage(input, `Sản phẩm đã ngưng kinh doanh.`, true);
                    } else {
                        input.value = maxStock;
                        showStockMessage(input, `Số lượng đã được điều chỉnh do tồn kho chỉ còn ${maxStock} sản phẩm.`, true);
                    }

                    const itemId = input.dataset.itemId;
                    if (itemId) {
                        updateQuantityOnServer(itemId, status === 'inactive' ? 0 : maxStock);
                    }
                }
            }

            updateTotalAmount();
        }

        // Khởi tạo trang
        document.addEventListener('DOMContentLoaded', function () {
            const checkboxes = document.getElementsByClassName('product-select');
            if (checkboxes.length > 0) {
                validateAllQuantities();
                updateTotalAmount();

                const enabledCheckboxes = Array.from(checkboxes).filter(checkbox => !checkbox.disabled);
                if (enabledCheckboxes.length === 0) {
                    document.getElementById('selectAll').disabled = true;
                }
            }
        });
    </script>
</body>
</html>