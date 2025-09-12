
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Đặt hàng thành công</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
        <style>
            body {
                background-color: #f8f9fa;
                font-family: 'Roboto', sans-serif; /* Cập nhật phông chữ */
            }
            .container {
                max-width: 800px;
                margin: 30px auto;
            }
            .completion-card {
                background: white;
                border-radius: 10px;
                box-shadow: 0 0 20px rgba(0,0,0,0.1);
                padding: 30px;
                text-align: center;
            }
            .success-icon {
                color: #28a745;
                font-size: 64px;
                margin-bottom: 20px;
            }
            .order-info {
                background: #f8f9fa;
                border-radius: 8px;
                padding: 20px;
                margin: 20px 0;
                text-align: left;
            }
            .delivery-status {
                margin: 30px 0;
                position: relative;
            }
            .status-line {
                height: 3px;
                background: #e9ecef;
                position: absolute;
                top: 50%;
                left: 0;
                right: 0;
                z-index: 1;
            }
            .status-steps {
                position: relative;
                z-index: 2;
                display: flex;
                justify-content: space-between;
            }
            .status-step {
                background: white;
                padding: 0 10px;
            }
            .status-step.active {
                color: #28a745;
            }
            .status-step i {
                font-size: 24px;
                margin-bottom: 5px;
            }
        </style>
    </head>
    <body>
        <div><jsp:include page="/header.jsp" /></div>
        <div class="container">
            <div class="completion-card">
                <!-- Icon thành công -->
                <i class="fas fa-check-circle success-icon"></i>
                <h1 class="mb-3">Đặt hàng thành công!</h1>
                <p class="text-muted">Cảm ơn bạn đã mua hàng. Đơn hàng của bạn đang được xử lý.</p>

                <!-- Thông tin đơn hàng -->
                <div class="order-info">
                    <div class="row">
                        <div class="col-md-6">
                            <h5>Thông tin đơn hàng</h5>
                            <p><strong>Mã đơn hàng:</strong> #${orderCode}</p>
                            <p><strong>Ngày đặt:</strong> <fmt:formatDate value="${orderDate}" pattern="dd/MM/yyyy HH:mm" /></p>
                            <p><strong>Tổng tiền:</strong> 
                                <fmt:formatNumber value="${total}" type="currency" currencySymbol="₫" maxFractionDigits="0"/>
                            </p>
                            <p><strong>Phương thức thanh toán:</strong> 
                                <c:choose>
                                    <c:when test="${paymentMethod eq 'cod'}">Thanh toán khi nhận hàng (COD)</c:when>
                                    <c:when test="${paymentMethod eq 'bank_transfer' || paymentMethod eq 'bank'}">Thanh toán trực tuyến</c:when>
                                    <c:otherwise>${paymentMethod}</c:otherwise>
                                </c:choose>
                            </p>
                            <p><strong>Trạng thái thanh toán:</strong> 
                                <c:choose>
                                    <c:when test="${paymentStatus eq 'completed'}">
                                        <span class="text-success">Đã thanh toán</span>
                                    </c:when>
                                    <c:when test="${paymentStatus eq 'pending'}">
                                        <span class="text-warning">Chờ thanh toán</span>
                                    </c:when>
                                        <c:when test="${paymentStatus eq 'pending_pay'}">
                                        <span class="text-warning">Chờ thanh toán</span>
                                    </c:when>
                                    <c:when test="${paymentStatus eq 'failed'}">
                                        <span class="text-danger">Thanh toán thất bại</span>
                                    </c:when>
                                    <c:when test="${paymentStatus eq 'refunded'}">
                                        <span class="text-info">Đã hoàn tiền</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="text-secondary">Không xác định</span>
                                    </c:otherwise>
                                </c:choose>
                            </p>
                        </div>
                        <div class="col-md-6">
                            <h5>Thông tin giao hàng</h5>
                            <p><strong>Người nhận:</strong> ${shippingAddress.recipientName}</p>
                            <p><strong>Số điện thoại:</strong> ${shippingAddress.phone}</p>
                            <p><strong>Địa chỉ:</strong> ${shippingAddress.address}</p>
                            <p><strong>Phương thức vận chuyển:</strong>
                                <c:choose>
                                    <c:when test="${shippingMethod eq 'express'}">Giao hàng nhanh (1-2 ngày)</c:when>
                                    <c:otherwise>Giao hàng tiêu chuẩn (3-5 ngày)</c:otherwise>
                                </c:choose>
                            </p>
                        </div>
                    </div>
                </div>

                <!-- Trạng thái đơn hàng -->
                <div class="delivery-status">
                    <div class="status-line"></div>
                    <div class="status-steps">
                        <div class="status-step active text-center">
                            <i class="fas fa-shopping-cart"></i>
                            <div>Đặt hàng</div>
                            <small><fmt:formatDate value="${orderDate}" pattern="dd/MM HH:mm" /></small>
                        </div>
                        <div class="status-step text-center">
                            <i class="fas fa-box"></i>
                            <div>Xác nhận</div>
                            <small>Đang chờ</small>
                        </div>
                        <div class="status-step text-center">
                            <i class="fas fa-truck"></i>
                            <div>Vận chuyển</div>
                            <small>-</small>
                        </div>
                        <div class="status-step text-center">
                            <i class="fas fa-home"></i>
                            <div>Giao hàng</div>
                            <small>-</small>
                        </div>
                    </div>
                </div>

                <!-- Chi tiết sản phẩm -->
                <div class="order-info">
                    <h5>Chi tiết sản phẩm</h5>
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Sản phẩm</th>
                                    <th>Số lượng</th>
                                    <th>Giá</th>
                                    <th>Tổng</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${selectedItems}" var="item">
                                    <tr>
                                        <td>${item.productTitle} - ${item.color}, Size ${item.size}</td>
                                        <td>${item.quantity}</td>
                                        <td><fmt:formatNumber value="${item.productPrice}" type="currency" currencySymbol="₫" maxFractionDigits="0"/></td>
                                        <td><fmt:formatNumber value="${item.productPrice * item.quantity}" type="currency" currencySymbol="₫" maxFractionDigits="0"/></td>
                                    </tr>
                                </c:forEach>
                                <tr>
                                    <td colspan="3" class="text-end"><strong>Tạm tính:</strong></td>
                                    <td><fmt:formatNumber value="${subtotal}" type="currency" currencySymbol="₫" maxFractionDigits="0"/></td>
                                </tr>
                                <c:if test="${discount != null && discount > 0}">
                                    <tr>
                                        <td colspan="3" class="text-end"><strong>Giảm giá:</strong></td>
                                        <td class="text-success">-<fmt:formatNumber value="${discount}" type="currency" currencySymbol="₫" maxFractionDigits="0"/></td>
                                    </tr>
                                </c:if>
                                <tr>
                                    <td colspan="3" class="text-end"><strong>Phí vận chuyển:</strong></td>
                                    <td><fmt:formatNumber value="${shippingFee}" type="currency" currencySymbol="₫" maxFractionDigits="0"/></td>
                                </tr>
                                <tr>
                                    <td colspan="3" class="text-end"><strong>Tổng cộng:</strong></td>
                                    <td><strong><fmt:formatNumber value="${total}" type="currency" currencySymbol="₫" maxFractionDigits="0"/></strong></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>

                <!-- Nút điều hướng -->
                <div class="mt-4">
                    <c:if test="${not empty sessionScope.acc}">
                        <a href="myorder" class="btn btn-primary me-2">
                            <i class="fas fa-list me-2"></i>Xem đơn hàng của tôi
                        </a>
                    </c:if>
                    <a href="home" class="btn btn-outline-secondary">
                        <i class="fas fa-home me-2"></i>Về trang chủ
                    </a>
                </div>
            </div>
        </div>
        <div><jsp:include page="/footer.jsp" /></div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
