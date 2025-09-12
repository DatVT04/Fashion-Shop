<%-- 
    Document   : addCoupon
    Created on : Feb 19, 2025, 9:15:00 PM
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
        <title>Thêm mã giảm giá mới</title>
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

            .form-label {
                font-weight: 500;
                color: var(--primary-color);
            }

            .form-control, .form-select {
                border-radius: 4px;
                border: 1px solid var(--border-color);
                padding: 8px 12px;
            }

            .form-control:focus, .form-select:focus {
                border-color: var(--accent-color);
                box-shadow: 0 0 0 0.2rem rgba(52, 152, 219, 0.25);
            }

            .form-text {
                color: #6c757d;
                font-size: 0.875rem;
            }

            .required-field::after {
                content: ' *';
                color: var(--danger-color);
            }

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

            .form-card {
                background-color: white;
                border-radius: 8px;
                margin-bottom: 20px;
            }

            .form-switch .form-check-input {
                width: 3em;
                height: 1.5em;
                margin-top: 0.25em;
            }

            .form-switch .form-check-input:checked {
                background-color: var(--success-color);
                border-color: var(--success-color);
            }

            .btn-submit {
                background-color: var(--accent-color);
                color: white;
                padding: 8px 24px;
                border-radius: 4px;
                transition: all 0.3s;
            }

            .btn-submit:hover {
                background-color: #2980b9;
                transform: translateY(-2px);
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }

            .btn-cancel {
                background-color: #6c757d;
                color: white;
                padding: 8px 24px;
                border-radius: 4px;
                transition: all 0.3s;
            }

            .btn-cancel:hover {
                background-color: #5a6268;
                transform: translateY(-2px);
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }

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
        </style>
    </head>
    <body>
    <jsp:include page="../sidebar.jsp" />
    <button class="btn btn-primary sidebar-toggle"><i class="fas fa-bars"></i></button>

    <div class="main-content">
        <div class="container-fluid p-4">
            <h2 class="page-title"><i class="fas fa-tag me-2"></i>Thêm mã giảm giá mới</h2>
            <div class="card form-card">
                <div class="card-header"><i class="fas fa-plus-circle me-2"></i>Thông tin mã giảm giá</div>
                <div class="card-body">
                    <form action="addCoupon" method="POST" id="couponForm" onsubmit="return prepareFormSubmission()">
                        <c:if test="${not empty error}">
                            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                ${error}
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                            </div>
                        </c:if>

                        <div class="mb-3">
                            <label for="couponCode" class="form-label required-field">Mã giảm giá</label>
                            <div class="input-group">
                                <input type="text" class="form-control" id="couponCode" name="code" value="${param.code}" required maxlength="20">
                                <button type="button" class="btn btn-outline-secondary" onclick="generateRandomCode()">Tạo ngẫu nhiên</button>
                            </div>
                        </div>

                        <div class="mb-3">
                            <label for="discountType" class="form-label required-field">Loại giảm giá</label>
                            <select class="form-select" id="discountType" name="discount_type" required>
                                <option value="" selected disabled>-- Chọn loại giảm giá --</option>
                                <option value="percentage" ${param.discount_type == 'percentage' ? 'selected' : ''}>Phần trăm (%)</option>
                                <option value="fixed" ${param.discount_type == 'fixed' ? 'selected' : ''}>Cố định (VNĐ)</option>
                            </select>
                        </div>

                        <div class="mb-3">
                            <label for="discountValue" class="form-label required-field">Giá trị giảm</label>
                            <div class="input-group">
                                <input type="text" class="form-control currency-input" id="discountValue" name="discount_value" 
                                       value="${param.discount_value}" required oninput="formatCurrency(this)">
                                <span class="input-group-text" id="discountSymbol">₫</span>
                            </div>
                            <span id="discountValueText" class="form-text">text thay đổi theo loại giảm giá</span>
                        </div>

                        <div class="mb-3">
                            <label for="minOrderAmount" class="form-label required-field">Giá trị đơn hàng tối thiểu</label>
                            <div class="input-group">
                                <input type="text" class="form-control currency-input" id="minOrderAmount" name="min_order_amount" 
                                       value="${param.min_order_amount}" min="0" oninput="formatCurrency(this)">
                                <span class="input-group-text">₫</span>
                            </div>
                        </div>

                        <div class="mb-3" id="maxDiscountContainer" style="display:none;">
                            <label for="maxDiscount" class="form-label required-field">Giảm tối đa</label>
                            <div class="input-group">
                                <input type="text" class="form-control currency-input" id="maxDiscount" name="max_discount" 
                                       value="${param.max_discount}" min="0" oninput="formatCurrency(this)">
                                <span class="input-group-text">₫</span>
                            </div>
                        </div>

                        <div class="mb-3">
                            <label for="usageLimit" class="form-label">Số lần sử dụng tối đa</label>
                            <input type="number" class="form-control" id="usageLimit" name="usage_limit" value="${param.usage_limit}" min="0">
                            <div class="form-text">Để trống nếu không giới hạn số lần sử dụng.</div>
                        </div>

                        <div class="mb-3">
                            <label for="expiryDate" class="form-label required-field">Ngày hết hạn</label>
                            <input type="datetime-local" class="form-control" id="expiryDate" name="expiry_date" value="${param.expiry_date}" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label required-field">Loại mã giảm giá</label>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="coupon_type" id="normalRadio" 
                                       value="normal" ${param.coupon_type == 'normal' || empty param.coupon_type ? 'checked' : ''} required>
                                <label class="form-check-label" for="normalRadio">Thường</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="coupon_type" id="vipRadio" 
                                       value="vip" ${param.coupon_type == 'vip' ? 'checked' : ''}>
                                <label class="form-check-label" for="vipRadio">VIP</label>
                            </div>
                        </div>

                        <div class="mb-3">
                            <label for="status" class="form-label">Kích hoạt</label>
                            <div class="form-check form-switch">
                                <input class="form-check-input" type="checkbox" id="statusSwitch" name="status" value="active" ${param.status == 'active' ? 'checked' : ''} onchange="toggleActivationDate()">
                            </div>
                        </div>

                        <div class="mb-3" id="activationDateContainer" style="display:none;">
                            <label for="activationDate" class="form-label">Đặt lịch kích hoạt</label>
                            <input type="datetime-local" class="form-control" id="activationDate" name="activation_date" value="${param.activation_date}">
                        </div>

                        <div class="d-flex justify-content-end mt-4">
                            <a href="couponlist" class="btn btn-cancel me-2"><i class="fas fa-times me-2"></i>Hủy</a>
                            <button type="submit" class="btn btn-submit"><i class="fas fa-save me-2"></i>Lưu mã giảm giá</button>
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

                $('.currency-input').each(function () {
                    formatCurrency(this);
                });
            });
        </script>

        <script>
        $(document).ready(function () {
            const today = new Date();
            today.setMinutes(today.getMinutes() - today.getTimezoneOffset());
            const minDate = today.toISOString().slice(0, 16);
            $('#expiryDate').attr('min', minDate);
            $('#activationDate').attr('min', minDate);

            toggleActivationDate();
            $('#statusSwitch').on('change', toggleActivationDate);

            $('#discountType').on('change', function () {
                const type = $(this).val();
                $('#discountSymbol').text(type === 'percentage' ? '%' : '₫');
                $('#maxDiscountContainer').toggle(type === 'percentage');
                $('#discountValueText').text(type === 'percentage' ? 'Nhập phần trăm giảm giá (1-50%).' : 'Nhập số tiền giảm giá cố định.');
            }).trigger('change');

            $('.currency-input').each(function () { formatCurrency(this); });
        });

        function toggleActivationDate() {
            const isActive = $('#statusSwitch').is(':checked');
            $('#activationDateContainer').toggle(!isActive);
            if (isActive) $('#activationDate').val('');
        }

        function formatCurrency(input) {
            if (!input.value) return;
            let value = input.value.replace(/\./g, '').replace(/[^\d]/g, '');
            if (value.length > 0) {
                value = parseInt(value, 10).toLocaleString('vi-VN').replace(/,/g, '.');
            }
            input.value = value;
            input.dataset.rawValue = value.replace(/\./g, '');
        }

        function prepareFormSubmission() {
            $('.currency-input').each(function () {
                this.value = this.dataset.rawValue || this.value.replace(/\./g, '');
            });
            const expiryDate = $('#expiryDate').val();
            const activationDate = $('#activationDate').val();
            if (activationDate && new Date(activationDate) > new Date(expiryDate)) {
                alert('Ngày kích hoạt phải sớm hơn ngày hết hạn.');
                return false;
            }
            return true;
        }

        function generateRandomCode() {
            const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
            let code = '';
            for (let i = 0; i < 9; i++) {
                code += chars.charAt(Math.floor(Math.random() * chars.length));
            }
            $('#couponCode').val(code);
        }
    </script>
    </body>
</html>