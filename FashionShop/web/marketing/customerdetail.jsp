<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Chi tiết khách hàng</title>
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
                background-color: var(--primary-color);
                color: var(--light-color);
                border-radius: 8px 8px 0 0;
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

            .form-label {
                font-weight: 500;
                color: var(--secondary-color);
            }

            .form-control:focus, .form-select:focus {
                border-color: var(--accent-color);
                box-shadow: 0 0 0 0.2rem rgba(52, 152, 219, 0.25);
            }

            .btn-action {
                padding: 8px 16px;
            }

            .customer-info-box {
                background-color: white;
                padding: 15px;
                border-radius: 8px;
                margin-bottom: 10px;
                border: 1px solid var(--border-color);
            }

            .customer-info-label {
                color: var(--secondary-color);
                font-weight: 600;
                margin-bottom: 5px;
            }

            .customer-info-value {
                font-size: 1.1em;
            }

            .badge-lg {
                font-size: 1rem;
                padding: 8px 15px;
                border-radius: 50px;
            }

            .customer-stats {
                border-top: 1px solid var(--border-color);
                padding-top: 20px;
                margin-top: 20px;
            }

            .stat-card {
                background-color: white;
                border-radius: 8px;
                box-shadow: 0 2px 8px rgba(0,0,0,0.05);
                padding: 20px;
                text-align: center;
                height: 100%;
            }

            .stat-value {
                font-size: 1.8rem;
                font-weight: 600;
                color: var(--primary-color);
            }

            .stat-label {
                color: #6c757d;
                margin-top: 5px;
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

            .timestamp-info {
                color: #2c3e50;
                font-size: 0.9em;
                background: #f8f9fa;
                padding: 15px;
                border-radius: 5px;
                margin: 20px 0;
                border-left: 4px solid #2c3e50;
            }

            .btn-primary {
                background-color: #2c3e50;
                border-color: #2c3e50;
            }

            .btn-primary:hover {
                background-color: #34495e;
                border-color: #34495e;
            }

            .btn-secondary {
                background-color: #95a5a6;
                border-color: #95a5a6;
            }

            .btn-secondary:hover {
                background-color: #7f8c8d;
                border-color: #7f8c8d;
            }

            @media (max-width: 768px) {
                .main-content {
                    margin-left: 0;
                }
                .sidebar-toggle {
                    display: block;
                }
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
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <h2 class="page-title">
                        <i class="fas fa-user me-2"></i>Chi tiết khách hàng
                    </h2>

                </div>

                <!-- Alerts -->
                <c:if test="${sessionScope.successMessage != null}">
                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                        ${sessionScope.successMessage}
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                    <c:remove var="successMessage" scope="session" />
                </c:if>

                <c:if test="${sessionScope.errorMessage != null}">
                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        ${sessionScope.errorMessage}
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                    <c:remove var="errorMessage" scope="session" />
                </c:if>

                <div class="card">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <div>
                            <i class="fas fa-user-circle me-2"></i>Thông tin khách hàng
                        </div>
                    </div>
                    <div class="card-body">
                        <!-- Form chỉnh sửa thông tin khách hàng -->
                        <form action="${pageContext.request.contextPath}/marketing/customerdetail/edit" method="post" class="row g-3">
                            <input type="hidden" name="id" value="${customer.id}">

                            <div class="col-md-4">
                                <div class="customer-info-box">
                                    <div class="customer-info-label">ID Khách hàng</div>
                                    <div class="customer-info-value">#${customer.id}</div>
                                </div>
                            </div>

                            <div class="col-md-4 mb-3">
                                <label for="fullName" class="form-label">Họ và tên</label>
                                <input type="text" class="form-control" id="fullName" name="fullName" value="${customer.fullName}" readonly>
                            </div>

                            <div class="col-md-4 mb-3">
                                <label for="customerType" class="form-label">Loại khách hàng</label>
                                <select class="form-select" id="customerType" name="customerType" disabled>
                                    <option value="normal" ${customer.customerType == 'normal' ? 'selected' : ''}>Thường</option>
                                    <option value="vip" ${customer.customerType == 'vip' ? 'selected' : ''}>VIP</option>
                                </select>
                                <input type="hidden" name="customerType" value="${customer.customerType}">
                            </div>


                            <div class="col-md-4 mb-3">
                                <label for="email" class="form-label">Email</label>
                                <input type="email" class="form-control" id="email" name="email" value="${customer.email}" readonly>
                            </div>

                            <div class="col-md-4 mb-3">
                                <label for="mobile" class="form-label">Số điện thoại</label>
                                <input type="text" class="form-control" id="mobile" name="mobile" value="${customer.mobile}" readonly>
                            </div>

                            <div class="col-md-4 mb-3">
                                <label for="gender" class="form-label">Giới tính</label>
                                <select class="form-select" id="gender" name="gender" disabled>
                                    <option value="male" ${customer.gender == 'male' ? 'selected' : ''}>Nam</option>
                                    <option value="female" ${customer.gender == 'female' ? 'selected' : ''}>Nữ</option>
                                    <input type="hidden" name="gender" value="${customer.gender}">
                                </select>
                            </div>

                            <!--                            <div class="col-12 mb-3">
                                                            <label for="address" class="form-label">Địa chỉ</label>
                                                            <textarea class="form-control" id="address" name="address" rows="3">${customer.address} </textarea>
                                                        </div>-->

                            <div class="timestamp-info">
                                <div class="d-flex justify-content-between">
                                    <div>
                                        <i class="fas fa-shopping-cart me-2"></i><strong>Tổng đơn hàng:</strong> ${customer.totalPurchases}
                                    </div>
                                    <div>
                                        <i class="fas fa-money-bill-wave me-2"></i><strong>Tổng chi tiêu:</strong> 
                                            <fmt:formatNumber value="${customer.totalSpend}" type="currency" currencySymbol="₫" maxFractionDigits="0"/>
                                    </div>
                                </div>
                            </div>

<!--                            <div class="text-center mt-4">
                                <button type="submit" class="btn btn-primary">
                                    <i class="fas fa-save me-2"></i>Lưu thay đổi
                                </button>
                                <a href="${pageContext.request.contextPath}/marketing/customerlist" class="btn btn-secondary ms-2">
                                    <i class="fas fa-times me-2"></i>Hủy
                                </a>

                            </div>-->
                            <div class="text-center mt-3">
                                <a href="${pageContext.request.contextPath}/marketing/customerlist" class="btn btn-secondary">
                                    <i class="fas fa-arrow-left me-1"></i>Quay lại
                                </a>
                            </div>
                        </form>
                    </div>
                </div>
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
            });
        </script>
    </body>
</html>