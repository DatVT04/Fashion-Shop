<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Chi tiết đơn hàng #${order.orderCode}</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
        <style>
            body {
                font-family: 'Roboto', sans-serif; /* Thêm phông chữ */
            }

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

            .order-section {
                margin-bottom: 30px;
            }

            .section-title {
                font-weight: 600;
                margin-bottom: 15px;
                padding-bottom: 10px;
                border-bottom: 1px solid #e9ecef;
            }

            .info-item {
                display: flex;
                margin-bottom: 10px;
            }

            .info-label {
                width: 150px;
                font-weight: 500;
                color: #6c757d;
            }

            .product-item {
                padding: 15px 0;
                border-bottom: 1px solid #e9ecef;
            }

            .product-item:last-child {
                border-bottom: none;
            }

            .product-img {
                width: 70px;
                height: 70px;
                object-fit: cover;
                border-radius: 5px;
            }

            .product-name {
                font-weight: 600;
                margin-bottom: 5px;
            }

            .product-variant {
                font-size: 0.85rem;
                color: #6c757d;
            }

            .price {
                font-weight: 600;
                color: #212529;
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

            .order-status {
                display: inline-block;
                padding: 5px 10px;
                border-radius: 5px;
                font-size: 0.9rem;
                font-weight: 600;
                text-transform: uppercase;
            }

            .status-pending {
                background-color: #fff3cd;
                color: #856404;
            }

            .status-processing {
                background-color: #cce5ff;
                color: #004085;
            }

            .status-shipped {
                background-color: #d1ecf1;
                color: #0c5460;
            }

            .status-completed {
                background-color: #d4edda;
                color: #155724;
            }

            .status-cancelled {
                background-color: #f8d7da;
                color: #721c24;
            }

            /* CSS cho timeline ngang */
            .horizontal-timeline {
                display: flex;
                justify-content: space-between;
                align-items: center;
                position: relative;
                padding: 20px 0;
            }

            .horizontal-timeline .timeline-step {
                text-align: center;
                position: relative;
                flex: 1;
            }

            .horizontal-timeline .timeline-step:not(:last-child)::after {
                content: '';
                position: absolute;
                top: 30px;
                left: 50%;
                width: 100%;
                height: 2px;
                background-color: #e9ecef; /* Màu xám mặc định */
                z-index: 1;
            }

            .horizontal-timeline .timeline-step.active:not(:last-child)::after {
                background-color: #28a745; /* Màu xanh cho các bước đã hoàn thành */
            }

            /* CSS cho trạng thái hủy */
            .horizontal-timeline .timeline-step.cancelled .timeline-icon {
                background-color: #dc3545; /* Màu đỏ cho bước hủy */
                color: white;
                border: 2px solid #dc3545;
            }

            .horizontal-timeline .timeline-step.cancelled:not(:last-child)::after {
                background-color: #dc3545; /* Màu đỏ cho đường nối */
            }

            .horizontal-timeline .timeline-step .timeline-icon {
                width: 40px;
                height: 40px;
                background-color: #e9ecef; /* Màu xám mặc định */
                color: #6c757d;
                border-radius: 50%;
                display: flex;
                align-items: center;
                justify-content: center;
                margin: 0 auto 10px;
                border: 2px solid #e9ecef;
                z-index: 2;
                position: relative;
            }

            .horizontal-timeline .timeline-step.active .timeline-icon {
                background-color: #28a745; /* Màu xanh cho các bước đã hoàn thành */
                color: white;
                border: 2px solid #28a745;
            }

            .horizontal-timeline .timeline-step .timeline-text {
                font-size: 0.9rem;
                font-weight: 500;
                margin-bottom: 5px;
            }

            .horizontal-timeline .timeline-step .timeline-date {
                font-size: 0.85rem;
                color: #6c757d;
            }

            .action-buttons {
                margin-top: 20px;
            }

            .action-buttons .btn {
                margin-right: 10px;
            }

            .payment-info {
                margin-top: 15px;
            }

            .discount-badge {
                background-color: #28a745;
                color: white;
                padding: 2px 8px;
                border-radius: 4px;
                font-size: 0.8rem;
                display: inline-block;
                margin-left: 5px;
            }

            @media (max-width: 768px) {
                .info-item {
                    flex-direction: column;
                    margin-bottom: 15px;
                }

                .info-label {
                    width: 100%;
                    margin-bottom: 5px;
                }

                .product-img {
                    width: 60px;
                    height: 60px;
                }

                .action-buttons .btn {
                    display: block;
                    width: 100%;
                    margin-bottom: 10px;
                    margin-right: 0;
                }

                .horizontal-timeline {
                    flex-direction: column;
                    align-items: flex-start;
                }

                .horizontal-timeline .timeline-step:not(:last-child)::after {
                    display: none;
                }

                .horizontal-timeline .timeline-step {
                    display: flex;
                    align-items: center;
                    margin-bottom: 20px;
                    text-align: left;
                }

                .horizontal-timeline .timeline-step .timeline-icon {
                    margin: 0 10px 0 0;
                }

                .horizontal-timeline .timeline-step .timeline-text,
                .horizontal-timeline .timeline-step .timeline-date {
                    margin: 0;
                }
            }
        </style>
    </head>
    <body>
        <div><jsp:include page="/header.jsp" /></div>

        <div class="container">
            <div class="page-header">
                <h2 class="page-title">Chi tiết đơn hàng #${order.orderCode}</h2>
                <a href="myorder" class="back-button">
                    <i class="fas fa-arrow-left"></i> Quay lại đơn hàng
                </a>
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

            <div class="card order-section">
                <div class="card-header">
                    <h5 class="card-title">Lịch sử đơn hàng</h5>
                </div>
                <div class="card-body">
                    <div class="horizontal-timeline">
                        <!-- Định nghĩa các bước và trạng thái -->
                        <c:set var="steps" value="pending,processing,shipping,completed" />
                        <c:set var="stepsArray" value="${fn:split(steps, ',')}" />
                        <c:set var="isCancelled" value="${order.status eq 'cancelled'}" />

                        <!-- Xác định bước hiện tại -->
                        <c:set var="currentStepIndex" value="0" />
                        <c:choose>
                            <c:when test="${order.status eq 'pending_pay'}">
                                <c:set var="currentStepIndex" value="1" />
                            </c:when>
                            <c:when test="${order.status eq 'processing'}">
                                <c:set var="currentStepIndex" value="2" />
                            </c:when>
                            <c:when test="${order.status eq 'shipping'}">
                                <c:set var="currentStepIndex" value="3" />
                            </c:when>
                            <c:when test="${order.status eq 'completed'}">
                                <c:set var="currentStepIndex" value="4" />
                            </c:when>
                            <c:when test="${order.status eq 'returned'}">
                                <c:set var="currentStepIndex" value="5" />
                            </c:when>
                            <c:when test="${order.status eq 'cancelled'}">
                                <c:set var="currentStepIndex" value="0" />
                            </c:when>
                        </c:choose>

                        <!-- Bước 1: Đơn Hàng Đã Đặt -->
                        <div class="timeline-step ${currentStepIndex >= 0 ? 'active' : ''}">
                            <div class="timeline-icon"><i class="fas fa-file-alt"></i></div>
                            <div class="timeline-text">Đơn Hàng Đã Đặt</div>
                            <div class="timeline-date">
                                <fmt:formatDate value="${order.orderDate}" pattern="dd/MM/yyyy HH:mm"/>
                            </div>
                        </div>

                        <!-- Trường hợp hủy đơn -->
                        <c:if test="${isCancelled}">
                            <div class="timeline-step active cancelled">
                                <div class="timeline-icon"><i class="fa-solid fa-circle-xmark"></i></div>
                                <div class="timeline-text">Đã Hủy Đơn Hàng</div>
                                <div class="timeline-date">
                                    <c:forEach items="${orderHistory}" var="history">
                                        <c:if test="${history.status eq 'cancelled'}">
                                            <fmt:formatDate value="${history.updatedAt}" pattern="dd/MM/yyyy HH:mm"/>
                                        </c:if>
                                    </c:forEach>
                                </div>
                            </div>
                        </c:if>

                        <!-- Chỉ hiển thị các bước tiếp theo nếu đơn hàng không bị hủy -->
                        <c:if test="${not isCancelled}">
                            <!-- Bước 2: Chờ Xác Nhận -->
                            <div class="timeline-step ${currentStepIndex >= 1 ? 'active' : ''}">
                                <div class="timeline-icon"><i class="far fa-check-circle"></i></div>
                                <div class="timeline-text">Chờ Xác Nhận</div>
                                <div class="timeline-date">
                                    <c:forEach items="${orderHistory}" var="history">
                                        <c:if test="${history.status eq 'pending'}">
                                            <fmt:formatDate value="${history.updatedAt}" pattern="dd/MM/yyyy HH:mm"/>
                                        </c:if>
                                    </c:forEach>
                                </div>
                            </div>

                            <!-- Chờ Thanh Toán (nếu có) -->
                            <c:if test="${order.status eq 'pending_pay' && order.paymentStatus eq 'pending' && (order.paymentMethod eq 'bank_transfer' || order.paymentMethod eq 'cod')}">
                                <div class="timeline-step ${currentStepIndex >= 1 ? 'active' : ''}">
                                    <div class="timeline-icon"><i class="fas fa-money-check-alt"></i></div>
                                    <div class="timeline-text">Chờ Thanh Toán</div>
                                    <div class="timeline-date">
                                        <c:forEach items="${orderHistory}" var="history">
                                            <c:if test="${history.status eq 'pending_pay'}">
                                                <fmt:formatDate value="${history.updatedAt}" pattern="dd/MM/yyyy HH:mm"/>
                                            </c:if>
                                        </c:forEach>
                                    </div>
                                </div>
                            </c:if>

                            <!-- Bước 3: Đã Xác Nhận -->
                            <div class="timeline-step ${currentStepIndex >= 2 ? 'active' : ''}">
                                <div class="timeline-icon"><i class="fas fa-truck"></i></div>
                                <div class="timeline-text">Đã Xác Nhận</div>
                                <div class="timeline-date">
                                    <c:forEach items="${orderHistory}" var="history">
                                        <c:if test="${history.status eq 'processing'}">
                                            <fmt:formatDate value="${history.updatedAt}" pattern="dd/MM/yyyy HH:mm"/>
                                        </c:if>
                                    </c:forEach>
                                </div>
                            </div>

                            <!-- Bước 4: Chờ Giao Hàng -->
                            <div class="timeline-step ${currentStepIndex >= 3 ? 'active' : ''}">
                                <div class="timeline-icon"><i class="fas fa-box"></i></div>
                                <div class="timeline-text">Chờ Giao Hàng</div>
                                <div class="timeline-date">
                                    <c:forEach items="${orderHistory}" var="history">
                                        <c:if test="${history.status eq 'shipping'}">
                                            <fmt:formatDate value="${history.updatedAt}" pattern="dd/MM/yyyy HH:mm"/>
                                        </c:if>
                                    </c:forEach>
                                </div>
                            </div>

                            <!-- Bước 5: Đã Giao -->
                            <c:if test="${order.status eq 'completed'}">
                                <div class="timeline-step ${currentStepIndex >= 4 ? 'active' : ''}">
                                    <div class="timeline-icon"><i class="fas fa-star"></i></div>
                                    <div class="timeline-text">Đã Giao</div>
                                    <div class="timeline-date">
                                        <c:forEach items="${orderHistory}" var="history">
                                            <c:if test="${history.status eq 'completed'}">
                                                <fmt:formatDate value="${history.updatedAt}" pattern="dd/MM/yyyy HH:mm"/>
                                            </c:if>
                                        </c:forEach>
                                    </div>
                                </div></c:if>
                            <c:if test="${order.status eq 'returned'}">
                                <div class="timeline-step ${currentStepIndex >= 4 ? 'active' : ''}">
                                    <div class="timeline-icon"><i class="fas fa-redo"></i></div>
                                    <div class="timeline-text">Đã Hoàn Trả</div>
                                    <div class="timeline-date">
                                        <c:forEach items="${orderHistory}" var="history">
                                            <c:if test="${history.status eq 'returned'}">
                                                <fmt:formatDate value="${history.updatedAt}" pattern="dd/MM/yyyy HH:mm"/>
                                            </c:if>
                                        </c:forEach>
                                    </div>
                                </div></c:if>

                        </c:if>
                    </div>
                </div>
            </div>

            <!-- Thông tin giao hàng -->
            <div class="card order-section">
                <div class="card-header">
                    <h5 class="card-title">Thông tin giao hàng</h5>
                </div>
                <div class="card-body">
                    <div class="info-item">
                        <div class="info-label">Người nhận:</div>
                        <div class="info-value">${order.recipientName}</div>
                    </div>
                    <div class="info-item">
                        <div class="info-label">Số điện thoại:</div>
                        <div class="info-value">${order.phone}</div>
                    </div>
                    <div class="info-item">
                        <div class="info-label">Địa chỉ:</div>
                        <div class="info-value">${order.address}</div>
                    </div>

                    <c:if test="${order.status eq 'shipping' || order.status eq 'completed'}">
                        <div class="info-item">
                            <div class="info-label">Mã vận đơn:</div>
                            <div class="info-value">
                                <c:choose>
                                    <c:when test="${not empty order.trackingNumber}">
                                        ${order.trackingNumber}
                                    </c:when>
                                    <c:otherwise>
                                        Chưa có thông tin
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                        <div class="info-item">
                            <div class="info-label">Đơn vị vận chuyển:</div>&nbsp;&nbsp;
                            <div class="info-value">
                                <c:choose>
                                    <c:when test="${not empty order.shippingProvider}">
                                        ${order.shippingProvider}
                                    </c:when>
                                    <c:otherwise>
                                        Chưa có thông tin
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </c:if>
                </div>
            </div>

            <div class="row">
                <div class="col-12">
                    <!-- Thông tin đơn hàng -->
                    <div class="card order-section">
                        <div class="card-header d-flex justify-content-between align-items-center">
                            <h5 class="card-title">Thông tin đơn hàng</h5>
                            <c:choose>
                                <c:when test="${order.status eq 'pending_pay'}">
                                    <span class="order-status status-pending">Chờ thanh toán</span>
                                </c:when>
                                <c:when test="${order.status eq 'pending'}">
                                    <span class="order-status status-pending">Chờ xử lý</span>
                                </c:when>
                                <c:when test="${order.status eq 'processing'}">
                                    <span class="order-status status-processing">Đang xử lý</span>
                                </c:when>
                                <c:when test="${order.status eq 'shipping'}">
                                    <span class="order-status status-shipped">Đang giao hàng</span>
                                </c:when>
                                <c:when test="${order.status eq 'completed'}">
                                    <span class="order-status status-completed">Hoàn thành</span>
                                </c:when>
                                <c:when test="${order.status eq 'cancelled'}">
                                    <span class="order-status status-cancelled">Đã hủy</span>
                                </c:when>
                                <c:when test="${order.status eq 'returned'}">
                                    <span class="order-status status-cancelled">Đã hoàn trả</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="order-status">${order.status}</span>
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <div class="card-body">
                            <div class="info-item">
                                <div class="info-label">Mã đơn hàng:</div>
                                <div class="info-value">${order.orderCode}</div>
                            </div>
                            <div class="info-item">
                                <div class="info-label">Ngày đặt hàng:</div>
                                <div class="info-value">
                                    <fmt:formatDate value="${order.orderDate}" pattern="dd/MM/yyyy HH:mm:ss"/>
                                </div>
                            </div>
                            <div class="info-item">
                                <div class="info-label">Phương thức thanh toán:</div>
                                <div class="info-value">
                                    <c:choose>
                                        <c:when test="${order.paymentMethod eq 'cod'}">
                                            <i class="fas fa-money-bill-wave me-1"></i> Thanh toán khi nhận hàng (COD)
                                        </c:when>
                                        <c:when test="${order.paymentMethod eq 'bank_transfer' || order.paymentMethod eq 'bank'}">
                                            <i class="fas fa-university me-1"></i> Chuyển khoản ngân hàng
                                        </c:when>
                                        <c:otherwise>
                                            <i class="fas fa-credit-card me-1"></i> ${order.paymentMethod}
                                        </c:otherwise>
                                    </c:choose>
                                    <div class="payment-info text-muted">
                                        <small>Trạng thái thanh toán: 
                                            <c:choose>
                                                <c:when test="${order.paymentStatus eq 'pending'}"><span class="text-warning">Chờ thanh toán</span></c:when>
                                                <c:when test="${order.paymentStatus eq 'completed'}"><span class="text-success">Đã thanh toán</span></c:when>
                                                <c:when test="${order.paymentStatus eq 'failed'}"><span class="text-danger">Thanh toán thất bại</span></c:when>
                                                <c:when test="${order.paymentStatus eq 'refunded'}"><span class="text-info">Đã hoàn trả</span></c:when>
                                                <c:otherwise>${order.paymentStatus}</c:otherwise>
                                            </c:choose>
                                        </small>
                                    </div>
                                </div>
                            </div>

                            <!-- Hiện thị thông tin vận chuyển nếu có -->
                            <div class="info-item">
                                <div class="info-label">Phương thức vận chuyển:</div>
                                <div class="info-value">
                                    <c:choose>
                                        <c:when test="${order.shippingMethod eq 'standard'}">
                                            <i class="fas fa-truck me-1"></i> Giao hàng tiêu chuẩn (3-5 ngày)
                                            <div class="small text-muted mt-1">
                                                Phí vận chuyển: <fmt:formatNumber value="${shippingFee}" type="currency" currencySymbol="₫" maxFractionDigits="0"/>
                                            </div>
                                        </c:when>
                                        <c:when test="${order.shippingMethod eq 'express'}">
                                            <i class="fas fa-shipping-fast me-1"></i> Giao hàng nhanh (1-2 ngày)
                                            <div class="small text-muted mt-1">
                                                Phí vận chuyển: <fmt:formatNumber value="${shippingFee}" type="currency" currencySymbol="₫" maxFractionDigits="0"/>
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <i class="fas fa-truck me-1"></i> Không xác định
                                            <div class="small text-muted mt-1">
                                                Phí vận chuyển: <fmt:formatNumber value="${shippingFee}" type="currency" currencySymbol="₫" maxFractionDigits="0"/>
                                            </div>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>

                            <!-- Nút hành động -->
                            <c:if test="${order.status eq 'pending_pay' && order.paymentStatus eq 'pending' && (order.paymentMethod eq 'bank_transfer' || order.paymentMethod eq 'cod')}">
                                <div class="action-buttons">
                                    <!-- Nút "Thanh toán lại" chỉ hiển thị cho bank_transfer -->
                                    <c:if test="${order.status == 'pending_pay'}">
                                        <a href="orderdrtail?action=cancel&id=${order.id}" class="btn btn-danger" onclick="return confirm('Bạn có chắc muốn hủy đơn hàng này?')">
                                            <i class="fas fa-times me-2"></i> Hủy đơn hàng
                                        </a>
                                        <c:if test="${order.paymentStatus == 'pending' && order.paymentMethod == 'bank_transfer'}">
                                            <a href="myorder?action=retry_payment&id=${order.id}" class="btn btn-primary">
                                                <i class="fas fa-money-check-alt me-2"></i> Thanh toán lại
                                            </a>
                                        </c:if>
                                    </c:if>

                                </div>
                            </c:if>
                            <c:if test="${order.status eq 'pending'}">
                                <div class="action-buttons">
                                    <!-- Nút "Hủy đơn hàng" hiển thị cho cả bank_transfer và cod -->
                                    <a href="orderdetail?action=cancel&id=${order.id}" class="btn btn-danger" onclick="return confirm('Bạn có chắc chắn muốn hủy đơn hàng này?')">
                                        <i class="fas fa-times"></i> Hủy đơn hàng
                                    </a>
                                </div>
                            </c:if>
                            <c:if test="${order.status eq 'completed'}">
                                <div class="action-buttons">
                                    <c:if test="${!isFeedBack}">
                                        <a href="submitfeedback?orderId=${order.id}" class="btn btn-primary">
                                            <i class="fas fa-star"></i> Đánh giá sản phẩm
                                        </a>
                                    </c:if>
                                    <c:if test="${isFeedBack}">
                                        <a onclick="return false;" class="btn btn-warning">
                                            <i class="fas fa-star"></i> Đã đánh giá
                                        </a>
                                    </c:if>
                                    <a href="orderdetail?action=reorder&id=${order.id}" class="btn btn-outline-primary">
                                        <i class="fas fa-redo"></i> Mua lại
                                    </a>
                                </div>
                            </c:if>
                        </div>
                    </div>

                    <!-- Danh sách sản phẩm -->
                    <div class="card order-section">
                        <div class="card-header">
                            <h5 class="card-title">Sản phẩm đã đặt</h5>
                        </div>
                        <div class="card-body">
                            <c:if test="${empty order.items}">
                                <div class="text-danger">Debug: order.items is empty</div>
                            </c:if>
                            <c:forEach items="${order.items}" var="item">
                                <div class="product-item">
                                    <div class="row align-items-center">
                                        <div class="col-2 col-md-1">
                                            <img src="${item.productThumbnail}" alt="${item.productTitle}" class="product-img">
                                        </div>
                                        <div class="col-10 col-md-6">
                                            <div class="product-name">${item.productTitle}</div>
                                            <div class="product-variant">Size: ${item.size} | Màu: ${item.color}</div>
                                        </div>
                                        <div class="col-md-2 text-center">
                                            <div class="quantity">x${item.quantity}</div>
                                        </div>
                                        <div class="col-md-3 text-end">
                                            <div class="price">
                                                <fmt:formatNumber value="${item.productPrice * item.quantity}" type="currency" currencySymbol="₫" maxFractionDigits="0"/>
                                            </div>
                                            <small class="text-muted">
                                                <fmt:formatNumber value="${item.productPrice}" type="currency" currencySymbol="₫" maxFractionDigits="0"/> / sản phẩm
                                            </small>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>

                            <!-- Tổng kết -->
                            <div class="order-summary mt-4">
                                <div class="summary-row">
                                    <span>Tổng tiền hàng:</span>
                                    <span>
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
                                    <span>
                                        Giảm giá:
                                        <c:if test="${not empty order.couponCode}">
                                            <span class="discount-badge">
                                                Mã ${order.couponCode}
                                            </span>
                                        </c:if>
                                    </span>
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
                                        <fmt:formatNumber value="${shippingFee}" type="currency" currencySymbol="₫" maxFractionDigits="0"/>
                                    </span>
                                </div>

                                <div class="summary-row">
                                    <span>Tổng thanh toán:</span>
                                    <span><fmt:formatNumber value="${order.total}" type="currency" currencySymbol="₫" maxFractionDigits="0"/></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div><jsp:include page="/footer.jsp" /></div>

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