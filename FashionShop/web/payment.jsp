<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Thanh toán đơn hàng</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
        <style>
            .container {
                padding-top: 30px;
                padding-bottom: 30px;
            }

            .page-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 30px;
                padding-bottom: 15px;
                border-bottom: 1px solid #e9ecef;
            }

            .page-title {
                font-weight: 700;
                margin: 0;
            }

            .back-button {
                text-decoration: none;
            }

            .card {
                border: none;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0,0,0,0.05);
                margin-bottom: 20px;
                overflow: hidden;
            }

            .card-header {
                background-color: #f8f9fa;
                border-bottom: 1px solid #e9ecef;
                padding: 15px 20px;
            }

            .card-title {
                margin: 0;
                font-weight: 600;
            }

            .card-body {
                padding: 20px;
            }

            .payment-option {
                padding: 20px;
                margin-bottom: 15px;
                border: 2px solid #e9ecef;
                border-radius: 10px;
                cursor: pointer;
                transition: all 0.3s ease;
            }

            .payment-option:hover {
                background-color: #f8f9fa;
                border-color: #bbd6fe;
            }

            .payment-option.selected {
                border-color: #0d6efd;
                background-color: #f0f7ff;
            }

            .payment-option .payment-logo {
                height: 40px;
                object-fit: contain;
                margin-right: 10px;
            }

            .order-summary {
                background-color: #f8f9fa;
                padding: 15px;
                border-radius: 5px;
            }

            .summary-row {
                display: flex;
                justify-content: space-between;
                margin-bottom: 10px;
            }

            .summary-row:last-child {
                margin-bottom: 0;
                padding-top: 10px;
                border-top: 1px solid #e9ecef;
                font-weight: 700;
            }

            .btn-payment {
                width: 100%;
                margin-top: 20px;
                padding: 12px 0;
                font-weight: 600;
            }
        </style>
    </head>
    <body>
        <div><jsp:include page="/header.jsp" /></div>

        <div class="container">
            <div class="page-header">
                <h2 class="page-title">Thanh toán đơn hàng</h2>
                <a href="cartcontact" class="back-button">
                    <i class="fas fa-arrow-left"></i> Quay lại
                </a>
            </div>

            <!-- Thông báo lỗi nếu có -->
            <c:if test="${not empty errorMessage}">
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    ${errorMessage}
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            </c:if>

            <div class="row">
                <div class="col-md-8">
                    <div class="card">
                        <div class="card-header">
                            <h5 class="card-title">Chọn phương thức thanh toán</h5>
                        </div>
                        <div class="card-body">
                            <form action="payment" method="post" id="paymentForm">
                                <div class="payment-option selected" onclick="selectPayment('vnpay')">
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="payment_method" id="vnpay" value="vnpay" checked>
                                        <label class="form-check-label d-flex align-items-center" for="vnpay">
                                            <img src="https://cdn.haitrieu.com/wp-content/uploads/2022/10/Logo-VNPAY-QR-1.png" alt="VNPay" class="payment-logo">
                                            <div>
                                                <strong>VNPay</strong>
                                                <p class="text-muted mb-0">Thanh toán qua cổng VNPay bằng QR Code hoặc thẻ ATM/Credit Card</p>
                                            </div>
                                        </label>
                                    </div>
                                </div>

                                <div class="payment-option" onclick="selectPayment('momo')">
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="payment_method" id="momo" value="momo">
                                        <label class="form-check-label d-flex align-items-center" for="momo">
                                            <img src="https://upload.wikimedia.org/wikipedia/vi/f/fe/MoMo_Logo.png" alt="MoMo" class="payment-logo">
                                            <div>
                                                <strong>Ví MoMo</strong>
                                                <p class="text-muted mb-0">Thanh toán qua ví điện tử MoMo</p>
                                            </div>
                                        </label>
                                    </div>
                                </div>

                                <div class="payment-option" onclick="selectPayment('zalopay')">
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="payment_method" id="zalopay" value="zalopay">
                                        <label class="form-check-label d-flex align-items-center" for="zalopay">
                                            <img src="https://cdn.haitrieu.com/wp-content/uploads/2022/10/Logo-ZaloPay.png" alt="ZaloPay" class="payment-logo">
                                            <div>
                                                <strong>ZaloPay</strong>
                                                <p class="text-muted mb-0">Thanh toán qua ví điện tử ZaloPay</p>
                                            </div>
                                        </label>
                                    </div>
                                </div>

                                <button type="submit" class="btn btn-primary btn-payment">
                                    Tiếp tục thanh toán
                                </button>
                            </form>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card">
                        <div class="card-header">
                            <h5 class="card-title">Thông tin đơn hàng</h5>
                        </div>
                        <div class="card-body">
                            <!-- Debug: Kiểm tra pending_order -->
                            <c:if test="${empty pending_order}">
                                <div class="text-danger">Debug: pending_order is null</div>
                            </c:if>
                            <c:if test="${not empty pending_order}">
                                <div class="mb-4">
                                    <div class="fw-bold mb-2">Thông tin giao hàng:</div>
                                    <div>${order.recipientName}</div>
                                    <div>${order.phone}</div>
                                    <div>${order.address}</div>
                                </div>

                                <div class="mb-4">
                                    <div class="fw-bold mb-2">Sản phẩm:</div>
                                    <c:if test="${empty order.items}">
                                        <div class="text-danger">Debug: order.items is empty</div>
                                    </c:if>
                                    <c:forEach items="${order.items}" var="item" varStatus="loop">
                                        <div class="d-flex justify-content-between align-items-center mb-2">
                                            <div>
                                                <span class="fw-bold">${item.quantity}x</span> ${item.productTitle}
                                                <div class="small text-muted">Size: ${item.size}, Màu: ${item.color}</div>
                                            </div>
                                            <div>
                                                <fmt:formatNumber value="${item.productPrice * item.quantity}" type="currency" currencySymbol="₫" maxFractionDigits="0"/>
                                            </div>
                                        </div>
                                        <c:if test="${!loop.last}">
                                            <hr class="my-2">
                                        </c:if>
                                    </c:forEach>
                                </div>

                                <div class="order-summary">
                                    <div class="summary-row">
                                        <span>Tổng tiền hàng:</span>
                                        <span>
                                            <c:set var="subtotal" value="0" />
                                            <c:forEach items="${order.items}" var="item">
                                                <c:set var="subtotal" value="${subtotal + (item.productPrice * item.quantity)}" />
                                            </c:forEach>
                                            <c:if test="${empty order.items}">
                                                <span class="text-danger">Không có sản phẩm nào</span>
                                            </c:if>
                                            <c:if test="${not empty order.items}">
                                                <fmt:formatNumber value="${subtotal}" type="currency" currencySymbol="₫" maxFractionDigits="0"/>
                                            </c:if>
                                        </span>
                                    </div>

                                    <!-- Hiển thị giảm giá -->
                                    <div class="summary-row text-success">
                                        <span>Giảm giá:</span>
                                        <span>
                                            <c:choose>
                                                <c:when test="${not empty order.discountAmount && order.discountAmount > 0}">
                                                    -<fmt:formatNumber value="${order.discountAmount}" type="currency" currencySymbol="₫" maxFractionDigits="0"/>
                                                </c:when>
                                                <c:otherwise>
                                                    0₫
                                                </c:otherwise>
                                            </c:choose>
                                        </span>
                                    </div>

                                    <!-- Phí vận chuyển -->
                                    <div class="summary-row">
                                        <span>Phí vận chuyển:</span>
                                        <span>
                                            <c:set var="shipping" value="${order.shippingMethod eq 'express' ? 45000 : 30000}" />
                                            <fmt:formatNumber value="${shipping}" type="currency" currencySymbol="₫" maxFractionDigits="0"/>
                                        </span>
                                    </div>

                                    <div class="summary-row">
                                        <span>Tổng thanh toán:</span>
                                        <span><fmt:formatNumber value="${order.total}" type="currency" currencySymbol="₫" maxFractionDigits="0"/></span>
                                    </div>
                                </div>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div><jsp:include page="/footer.jsp" /></div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <script>
                                    function selectPayment(method) {
                                        // Remove selected class from all payment options
                                        document.querySelectorAll('.payment-option').forEach(option => {
                                            option.classList.remove('selected');
                                        });

                                        // Add selected class to clicked option
                                        document.getElementById(method).closest('.payment-option').classList.add('selected');

                                        // Check the radio button
                                        document.getElementById(method).checked = true;
                                    }

                                    // Form validation before submission
                                    document.getElementById('paymentForm').addEventListener('submit', function (e) {
                                        // Check if a payment method is selected
                                        let paymentMethod = document.querySelector('input[name="payment_method"]:checked');

                                        if (!paymentMethod) {
                                            e.preventDefault();
                                            alert('Vui lòng chọn phương thức thanh toán');
                                            return false;
                                        }

                                        // You can add additional validations if needed

                                        return true;
                                    });
        </script>
    </body>
</html>