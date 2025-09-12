<%-- 
    Document   : orderDetails
    Created on : Mar 23, 2025, 2:19:33 AM
    Author     : tphon
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Chi tiết đơn hàng</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
        <style>
    /* Order Details Specific Styling */
    .main-content {
        margin-left: 250px;
        padding: 20px;
    }

    /* Card Enhancements */
    .main-content .card {
        border-radius: 8px;
        box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        margin-bottom: 20px;
        border: 1px solid #e9ecef;
    }

    .main-content .card-header {
        background-color: #f8f9fa;
        border-bottom: 1px solid #e9ecef;
        font-weight: 600;
        color: #2c3e50;
        padding: 12px 15px;
    }

    /* Page Title Styling */
    .page-title {
        margin-bottom: 20px;
        color: #2c3e50;
        display: flex;
        align-items: center;
    }

    .page-title i {
        margin-right: 10px;
        color: #3498db;
    }

    /* Status Badge */
    .status-badge {
        padding: 5px 10px;
        border-radius: 5px;
        font-weight: 600;
        text-transform: uppercase;
        font-size: 0.85em;
    }

    .bg-success { 
        background-color: #28a745; 
        color: white; 
    }
    .bg-danger { 
        background-color: #dc3545; 
        color: white; 
    }
    .bg-warning { 
        background-color: #ffc107; 
        color: #212529; 
    }

    /* Table Styling */
    .main-content .table {
        margin-bottom: 0;
    }

    .main-content .table thead {
        background-color: #f1f3f5;
    }

    .main-content .table th {
        font-weight: 600;
        color: #2c3e50;
        vertical-align: middle;
        border: 1px solid #dee2e6;
    }

    .main-content .table td {
        vertical-align: middle;
        border: 1px solid #dee2e6;
    }

    /* Product Image */
    .main-content .table img {
        max-width: 150px;
        max-height: 150px;
        object-fit: cover;
        border-radius: 4px;
    }

    /* Form Buttons */
    .main-content .btn {
        display: flex;
        align-items: center;
        justify-content: center;
        margin-bottom: 10px;
    }

    .main-content .btn i {
        margin-right: 5px;
    }
    
        /* Back Button Styling */
    .back-button-container {
        display: flex;
        justify-content: flex-start;
        margin-top: 20px;
    }

    .btn-back {
        background-color: #6c757d;
        color: white;
        border: none;
        display: flex;
        align-items: center;
        padding: 10px 15px;
        border-radius: 5px;
        transition: background-color 0.3s ease;
    }

    .btn-back:hover {
        background-color: #5a6268;
        color: white;
    }

    .btn-back i {
        margin-right: 8px;
    }

    /* Responsive Adjustments */
    @media (max-width: 768px) {
        .main-content {
            margin-left: 0;
            padding: 10px;
        }
    }

    /* Alert Styling */
    .alert-success {
        background-color: #d4edda;
        border-color: #c3e6cb;
        color: #155724;
    }

    .alert-danger {
        background-color: #f8d7da;
        border-color: #f5c6cb;
        color: #721c24;
    }
</style>
    </head>
    <body>
        <jsp:include page="sidebar.jsp" />
        <div class="main-content" style="margin-left: 250px; padding: 20px;">
            <div class="container-fluid p-4">
                <h2 class="page-title"><i class="fas fa-file-invoice me-2"></i>Chi tiết đơn hàng #${order.orderCode}</h2>

                <!-- Thông báo -->
                <c:if test="${param.alert == 'SSU'}">
                    <div class="alert alert-success">Cập nhật trạng thái thành công!</div>
                </c:if>
                <c:if test="${param.alert == 'ERR'}">
                    <div class="alert alert-danger">Có lỗi xảy ra khi cập nhật trạng thái!</div>
                </c:if>

                <!-- Thông tin đơn hàng -->
                <div class="card">
                    <div class="card-header">Thông tin đơn hàng</div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-6">
                                <p><strong>ID đơn hàng:</strong> ${order.id}</p>
                                <p><strong>Ngày đặt hàng:</strong> <fmt:formatDate value="${order.orderDate}" pattern="dd/MM/yyyy HH:mm"/></p>
                                <p><strong>Tổng chi phí:</strong> <fmt:formatNumber value="${order.total}" type="currency" currencySymbol="₫" maxFractionDigits="0"/></p>
                                <p><strong>Trạng thái:</strong> 
                                    <span class="status-badge bg-${order.status == 'completed' ? 'success' : order.status == 'cancelled' ? 'danger' : 'warning'}">
                                        <c:choose>
                                            <c:when test="${order.status == 'pending_pay'}">Chờ thanh toán</c:when>
                                            <c:when test="${order.status == 'pending'}">Chờ xử lý</c:when>
                                            <c:when test="${order.status == 'processing'}">Đang xử lý</c:when>
                                            <c:when test="${order.status == 'shipping'}">Đang giao</c:when>
                                            <c:when test="${order.status == 'completed'}">Hoàn thành</c:when>
                                            <c:when test="${order.status == 'returned'}">Hoàn trả</c:when>
                                            <c:when test="${order.status == 'cancelled'}">Đã hủy</c:when>
                                            <c:otherwise>${order.status}</c:otherwise>
                                        </c:choose>
                                    </span>
                                </p>
                            </div>
                            <div class="col-md-6">
                                <c:if test="${order.status == 'shipping' || order.status == 'completed' || order.status == 'returned' || order.status == 'cancelled'}">
                                    <div>
                                        <div>
                                            <p><strong>Đơn vị vận chuyển:</strong> ${order.shippingProvider}</p>
                                            <p><strong>Mã vận đơn:</strong> ${order.trackingNumber}</p>
                                        </div>
                                    </div>
                                </c:if>
                                <!-- Xử lý trạng thái -->
                                <c:choose>

                                    <c:when test="${order.status == 'pending_pay'}">
                                        <!-- Chờ thanh toán: Nút hủy -->
                                        <form method="POST" action="orderdetails">
                                            <input type="hidden" name="orderId" value="${order.id}">
                                            <input type="hidden" name="status" value="cancelled">
                                            <button type="submit" class="btn btn-danger"><i class="fas fa-times me-2"></i>Hủy đơn hàng</button>
                                        </form>
                                    </c:when>
                                    <c:when test="${order.status == 'pending'}">
                                        <!-- Chờ xử lý: Nút xác nhận và hủy -->
                                        <form method="POST" action="orderdetails" class="mb-2">
                                            <input type="hidden" name="orderId" value="${order.id}">
                                            <input type="hidden" name="status" value="processing">
                                            <button type="submit" class="btn btn-success"><i class="fas fa-check me-2"></i>Xác nhận đơn hàng</button>
                                        </form>
                                        <form method="POST" action="orderdetails">
                                            <input type="hidden" name="orderId" value="${order.id}">
                                            <input type="hidden" name="status" value="cancelled">
                                            <button type="submit" class="btn btn-danger"><i class="fas fa-times me-2"></i>Hủy đơn hàng</button>
                                        </form>
                                    </c:when>
                                    <c:when test="${order.status == 'processing'}">
                                        <!-- Đang xử lý: Nhập đơn vị vận chuyển và mã vận đơn -->
                                        <form method="POST" action="orderdetails">
                                            <input type="hidden" name="orderId" value="${order.id}">
                                            <input type="hidden" name="status" value="shipping">
                                            <div class="mb-2">
                                                <label><strong>Đơn vị vận chuyển:</strong></label>
                                                <input type="text" name="shippingProvider" class="form-control" required>
                                            </div>
                                            <div class="mb-2">
                                                <label><strong>Mã vận đơn:</strong></label>
                                                <input type="text" name="trackingNumber" class="form-control" required>
                                            </div>
                                            <button type="submit" class="btn btn-primary"><i class="fas fa-save me-2"></i>Cập nhật</button>
                                        </form>
                                    </c:when>
                                    <c:when test="${order.status == 'shipping'}">
                                        <!-- Đang giao: Nút hoàn thành và hoàn trả -->
                                        <form method="POST" action="orderdetails" class="mb-2">
                                            <input type="hidden" name="orderId" value="${order.id}">
                                            <input type="hidden" name="status" value="completed">
                                            <button type="submit" class="btn btn-success"><i class="fas fa-check me-2"></i>Hoàn thành</button>
                                        </form>
                                        <form method="POST" action="orderdetails">
                                            <input type="hidden" name="orderId" value="${order.id}">
                                            <input type="hidden" name="status" value="returned">
                                            <button type="submit" class="btn btn-warning"><i class="fas fa-undo me-2"></i>Hoàn trả</button>
                                        </form>
                                    </c:when>

                                </c:choose>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Thông tin người nhận -->
                <div class="card">
                    <div class="card-header">Thông tin người nhận</div>
                    <div class="card-body">
                        <p><strong>Họ tên:</strong> ${order.recipientName}</p>
                        <p><strong>Giới tính:</strong> ${user != null ? user.gender : ''}</p>
                        <p><strong>Email:</strong> ${order.recipientEmail}</p>
                        <p><strong>Điện thoại:</strong> ${order.phone}</p>
                        <p><strong>Địa chỉ:</strong> ${order.address}</p>
                    </div>
                </div>

                <!-- Danh sách sản phẩm -->
                <div class="card">
                    <div class="card-header">Sản phẩm trong đơn hàng</div>
                    <div class="card-body">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>Ảnh sản phẩm</th>
                                    <th>Tên sản phẩm</th>
                                    <th>Kích thước</th>
                                    <th>Màu sắc</th>
                                    <th>Số lượng</th>
                                    <th>Đơn giá</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${order.items}" var="item">
                                    <tr>
                                        <td>
                                            <img src="${item.productThumbnail.contains('http') ? item.productThumbnail : pageContext.request.contextPath+item.productThumbnail}" alt="alt" height="150px"/>
                                        </td>
                                        <td>${item.productTitle}</td>
                                        <td>${item.size}</td>
                                        <td>${item.color}</td>
                                        <td>${item.quantity}</td>
                                        <td><fmt:formatNumber value="${item.productPrice}" type="currency" currencySymbol="₫" maxFractionDigits="0"/></td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>

                <!-- Lịch sử cập nhật -->
                <div class="card">
                    <div class="card-header">Lịch sử cập nhật</div>
                    <div class="card-body">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>Thời gian</th>
                                    <th>Người cập nhật</th>
                                    <th>Trạng thái</th>
                                    <th>Ghi chú</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${history}" var="entry">
                                    <tr>
                                        <td><fmt:formatDate value="${entry.updatedAt}" pattern="dd/MM/yyyy HH:mm"/></td>
                                        <td>${entry.updaterName}</td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${entry.status == 'pending_pay'}">Chờ thanh toán</c:when>
                                                <c:when test="${entry.status == 'pending'}">Chờ xử lý</c:when>
                                                <c:when test="${entry.status == 'processing'}">Đang xử lý</c:when>
                                                <c:when test="${entry.status == 'shipping'}">Đang giao</c:when>
                                                <c:when test="${entry.status == 'completed'}">Hoàn thành</c:when>
                                                <c:when test="${entry.status == 'returned'}">Hoàn trả</c:when>
                                                <c:when test="${entry.status == 'cancelled'}">Đã hủy</c:when>
                                                <c:otherwise>${entry.status}</c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td>${entry.notes}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="back-button-container">
                    <a href="${pageContext.request.contextPath}/sale/orderlist" class="btn btn-back">
                        <i class="fas fa-arrow-left"></i> Quay lại danh sách đơn hàng
                    </a>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>