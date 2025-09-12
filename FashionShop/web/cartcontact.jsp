<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Thông tin giao hàng</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
        <style>
            /* Container spacing */
            .container {
                padding-top: 2rem;
                padding-bottom: 2rem;
                max-width: 1140px;
            }

            /* Breadcrumb styling */
            .breadcrumb {
                padding: 0.75rem 0;
                margin-bottom: 2rem;
                background: transparent;
            }

            .breadcrumb-item a {
                color: #0d6efd;
                text-decoration: none;
            }

            .breadcrumb-item.active {
                color: #6c757d;
            }

            /* Card styling */
            .card {
                border: none;
                box-shadow: 0 0.125rem 0.25rem rgba(0, 0, 0, 0.075);
                margin-bottom: 1.5rem;
                height: 100%;
            }

            .card-body {
                padding: 1.5rem;
            }

            .card-title {
                font-size: 1.25rem;
                font-weight: 600;
                color: #212529;
                margin-bottom: 1.25rem;
            }

            /* Product item styling */
            .product-item {
                display: flex;
                align-items: center;
                padding: 1rem;
                border-bottom: 1px solid #e9ecef;
                margin-bottom: 0.5rem;
            }

            .product-item:last-child {
                border-bottom: none;
                margin-bottom: 0;
            }

            .product-image {
                width: 100px;
                height: 100px;
                object-fit: cover;
                border-radius: 0.5rem;
                margin-right: 1.25rem;
            }

            .product-details {
                flex-grow: 1;
            }

            .product-title {
                font-weight: 600;
                color: #212529;
                margin-bottom: 0.5rem;
                font-size: 1rem;
            }

            .product-variant {
                font-size: 0.875rem;
                color: #6c757d;
                margin-bottom: 0.5rem;
            }

            .product-price {
                font-weight: 600;
                color: #0d6efd;
                font-size: 1rem;
            }

            /* Address section styling */
            .address-item {
                padding: 1rem;
                border: 1px solid #e9ecef;
                border-radius: 0.5rem;
                margin-bottom: 1rem;
            }

            .address-item:hover {
                background-color: #f8f9fa;
            }

            .form-check-input {
                margin-top: 0.3rem;
            }

            .badge {
                padding: 0.4em 0.6em;
                font-size: 0.75rem;
            }

            /* Shipping and payment methods styling */
            .shipping-method, .payment-method {
                padding: 1rem;
                border: 1px solid #e9ecef;
                border-radius: 0.5rem;
                margin-bottom: 1rem;
            }

            .shipping-method:hover, .payment-method:hover {
                background-color: #f8f9fa;
            }

            /* Summary section styling */
            .order-summary .card {
                position: sticky;
                top: 2rem;
            }

            .card .d-flex {
                margin-bottom: 0.75rem;
            }

            .text-primary {
                color: #0d6efd !important;
            }

            /* Button styling */
            .btn {
                padding: 0.625rem 1.25rem;
                font-weight: 500;
                border-radius: 0.5rem;
            }

            .btn-primary {
                background-color: #0d6efd;
                border-color: #0d6efd;
            }

            .btn-outline-primary {
                color: #0d6efd;
                border-color: #0d6efd;
            }

            .btn-outline-secondary {
                color: #6c757d;
                border-color: #6c757d;
            }

            /* Modal styling */
            .modal-content {
                border: none;
                border-radius: 0.5rem;
            }

            .modal-header {
                border-bottom: 1px solid #e9ecef;
                padding: 1.25rem 1.5rem;
            }

            .modal-body {
                padding: 1.5rem;
            }

            .modal-footer {
                border-top: 1px solid #e9ecef;
                padding: 1.25rem 1.5rem;
            }

            /* Form controls */
            .form-control, .form-select {
                padding: 0.625rem 0.75rem;
                border-radius: 0.375rem;
                border-color: #dee2e6;
            }

            .form-control:focus, .form-select:focus {
                border-color: #86b7fe;
                box-shadow: 0 0 0 0.25rem rgba(13, 110, 253, 0.25);
            }

            /* Responsive adjustments */
            @media (max-width: 991px) {
                .order-summary {
                    margin-top: 2rem;
                }

                .order-summary .card {
                    position: static;
                }
            }

            @media (max-width: 768px) {
                .container {
                    padding-top: 1rem;
                    padding-bottom: 1rem;
                }

                .product-image {
                    width: 80px;
                    height: 80px;
                    margin-right: 1rem;
                }

                .card-body {
                    padding: 1rem;
                }

                .btn {
                    width: 100%;
                    margin-bottom: 0.5rem;
                }

                .d-flex.justify-content-between {
                    flex-direction: column;
                }
            }
        </style>
    </head>
    <body>
        <div><jsp:include page="/header.jsp" /></div><br><br>
        <div class="container">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="cartdetail">Giỏ hàng</a></li>
                    <li class="breadcrumb-item active">Thông tin giao hàng</li>
                </ol>
            </nav>

            <form action="cartcontact" method="post">
                <div class="row">
                    <div class="col-lg-8">
                        <!-- Selected Products Summary -->
                        <div class="card mb-4">
                            <div class="card-body">
                                <h5 class="card-title mb-3"><i class="fas fa-house me-2"></i>Sản phẩm đã chọn</h5>
                                <c:forEach items="${selectedItems}" var="item">
                                    <div class="product-item">
                                        <img src="${item.productThumbnail}" alt="${item.productTitle}" class="product-image">
                                        <div class="product-details">
                                            <div class="product-title">${item.productTitle}</div>
                                            <div class="product-variant">Size: ${item.size} | Màu: ${item.color}</div>
                                            <div class="d-flex justify-content-between align-items-center mt-2">
                                                <div>Số lượng: ${item.quantity}</div>
                                                <div class="product-price">
                                                    <fmt:formatNumber value="${item.productPrice * item.quantity}" 
                                                                      type="currency" currencySymbol="₫" maxFractionDigits="0"/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>

                        <!-- Shipping Address Section -->
                        <div class="card mb-4">
                            <div class="card-body">
                                <h5 class="card-title">
                                    <i class="fas fa-map-marker-alt me-2"></i>Địa chỉ giao hàng
                                </h5>
                                <div class="address-list mb-3">
                                    <c:choose>
                                        <c:when test="${empty addresses}">
                                            <div class="alert alert-info">
                                                <p>Bạn chưa có địa chỉ giao hàng nào. Vui lòng thêm địa chỉ mới.</p>
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <c:forEach items="${addresses}" var="address">
                                                <div class="address-item">
                                                    <div class="form-check">
                                                        <input type="radio" class="form-check-input" 
                                                               name="shipping_address" 
                                                               value="${address.id}"
                                                               ${address.isDefault ? 'checked' : ''}>
                                                        <label class="form-check-label">
                                                            <strong>${address.recipientName}</strong>
                                                            <c:if test="${address.isDefault}">
                                                                <span class="badge bg-primary ms-2">Mặc định</span>
                                                            </c:if>
                                                            <br>
                                                            <span class="text-muted">
                                                                <i class="fas fa-phone me-1"></i>${address.phone}
                                                            </span>
                                                            <br>
                                                            <span><i class="fas fa-home me-1"></i>${address.address}</span>
                                                        </label>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                                <button type="button" class="btn btn-outline-primary" 
                                        data-bs-toggle="modal" data-bs-target="#addAddressModal">
                                    <i class="fas fa-plus me-2"></i>Thêm địa chỉ mới
                                </button>
                            </div>
                        </div>
                        <!-- Thêm trường email cho khách vãng lai -->
                        <c:if test="${isGuest}">
                            <div class="card mb-4">
                                <div class="card-body">
                                    <h5 class="card-title">
                                        <i class="fas fa-envelope me-2"></i>Thông tin liên hệ
                                    </h5>
                                    <div class="mb-3">
                                        <input type="email" class="form-control" name="guest_email" value="${guestEmail}" required 
                                               placeholder="Nhập email ở đây" 
                                               pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$">
                                        <small class="text-muted">Lưu ý: Vui lòng nhập email chính xác. Chúng tôi sẽ gửi thông tin đơn hàng qua email này.</small>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                        <!-- Shipping Method Section -->
                        <div class="card mb-4">
                            <div class="card-body">
                                <h5 class="card-title">
                                    <i class="fas fa-truck me-2"></i>Phương thức vận chuyển
                                </h5>
                                <div class="shipping-methods">
                                    <div class="shipping-method">
                                        <div class="form-check">
                                            <input type="radio" class="form-check-input" 
                                                   name="shipping_method" value="standard" checked
                                                   onchange="updateShippingFee(${subtotal > 500000 ? 0 : 30000})">
                                            <label class="form-check-label">
                                                <strong>Giao hàng tiêu chuẩn</strong><br>
                                                <small class="text-muted">
                                                    3-5 ngày - 
                                                    <c:choose>
                                                        <c:when test="${subtotal > 500000}">Miễn phí</c:when>
                                                        <c:otherwise>30.000₫</c:otherwise>
                                                    </c:choose>
                                                </small>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="shipping-method">
                                        <div class="form-check">
                                            <input type="radio" class="form-check-input" 
                                                   name="shipping_method" value="express"
                                                   onchange="updateShippingFee(${subtotal > 500000 ? 0 : 45000})">
                                            <label class="form-check-label">
                                                <strong>Giao hàng nhanh</strong><br>
                                                <small class="text-muted">
                                                    1-2 ngày - 
                                                    <c:choose>
                                                        <c:when test="${subtotal > 500000}">Miễn phí</c:when>
                                                        <c:otherwise>45.000₫</c:otherwise>
                                                    </c:choose>
                                                </small>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Payment Method Section -->
                        <div class="card mb-4">
                            <div class="card-body">
                                <h5 class="card-title">
                                    <i class="fas fa-credit-card me-2"></i>Phương thức thanh toán
                                </h5>
                                <div class="payment-methods">
                                    <div class="payment-method">
                                        <div class="form-check">
                                            <input type="radio" class="form-check-input" 
                                                   name="payment_method" value="cod" checked>
                                            <label class="form-check-label">
                                                <strong>Thanh toán khi nhận hàng (COD)</strong><br>
                                                <small class="text-muted">Thanh toán bằng tiền mặt khi nhận hàng</small>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="payment-method">
                                        <div class="form-check">
                                            <input type="radio" class="form-check-input" 
                                                   name="payment_method" value="bank">
                                            <label class="form-check-label">
                                                <strong>Thanh toán trực tuyến</strong><br>
                                                <small class="text-muted">Chuyển khoản qua tài khoản ngân hàng</small>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="d-block d-lg-none">
                            <div class="d-flex justify-content-between">
                                <a href="cartdetail?from=contact" class="btn btn-outline-secondary">
                                    <i class="fas fa-arrow-left me-2"></i>Quay lại giỏ hàng
                                </a>
                                <button type="submit" class="btn btn-primary">
                                    Tiếp tục<i class="fas fa-arrow-right ms-2"></i>
                                </button>
                            </div>
                        </div>
                    </div>

                    <!-- Right Column - Order Summary -->
                    <div class="col-lg-4 order-summary">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">Tóm tắt đơn hàng</h5>
                                <div class="d-flex justify-content-between mb-2">
                                    <span>Tạm tính:</span>
                                    <span id="subtotal">
                                        <fmt:formatNumber value="${subtotal}" 
                                                          type="currency" currencySymbol="₫" maxFractionDigits="0"/>
                                    </span>
                                </div>
                                <c:if test="${discount != null && discount > 0}">
                                    <div class="d-flex justify-content-between mb-2 text-success">
                                        <span>Giảm giá:</span>
                                        <span id="discount">
                                            -<fmt:formatNumber value="${discount}" 
                                                              type="currency" currencySymbol="₫" maxFractionDigits="0"/>
                                        </span>
                                    </div>
                                    <c:if test="${not empty appliedCoupon}">
                                        <div class="mb-2 text-success">
                                            <small>Mã giảm giá: ${appliedCoupon}</small>
                                        </div>
                                    </c:if>
                                </c:if>
                                <div class="d-flex justify-content-between mb-2">
                                    <span>Phí vận chuyển:</span>
                                    <span id="shippingFee">
                                        <c:choose>
                                            <c:when test="${subtotal > 500000}">Miễn phí</c:when>
                                            <c:otherwise>
                                                <fmt:formatNumber value="${shippingFee}" 
                                                                  type="currency" currencySymbol="₫" maxFractionDigits="0"/>
                                            </c:otherwise>
                                        </c:choose>
                                    </span>
                                </div>
                                <hr>
                                <div class="d-flex justify-content-between">
                                    <strong>Tổng cộng:</strong>
                                    <strong class="text-primary" id="totalAmount">
                                        <fmt:formatNumber value="${subtotal - (discount != null ? discount : 0) + shippingFee}" 
                                                          type="currency" currencySymbol="₫" maxFractionDigits="0"/>
                                    </strong>
                                </div>
                                <div class="d-none d-lg-block mt-4">
                                    <div class="d-grid gap-2">
                                        <button type="submit" class="btn btn-primary">
                                            Tiếp tục<i class="fas fa-arrow-right ms-2"></i>
                                        </button>
                                        <a href="cartdetail" class="btn btn-outline-secondary">
                                            <i class="fas fa-arrow-left me-2"></i>Quay lại giỏ hàng
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>

        <!-- Add Address Modal -->
        <!-- Add Address Modal -->
        <div class="modal fade" id="addAddressModal">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Thêm địa chỉ mới</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>
                    <form action="cartcontact" method="post">
                        <input type="hidden" name="action" value="add_address">
                        <div class="modal-body">
                            <div class="mb-3">
                                <label class="form-label">Họ tên người nhận</label>
                                <input type="text" class="form-control" name="recipient_name" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Số điện thoại</label>
                                <input type="tel" class="form-control" name="phone" 
                                       pattern="[0-9]{10}" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Tỉnh/Thành phố</label>
                                <select class="form-select" id="province" required>
                                    <option value="">Chọn tỉnh/thành phố</option>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Quận/Huyện</label>
                                <select class="form-select" id="district" required disabled>
                                    <option value="">Chọn quận/huyện</option>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Phường/Xã</label>
                                <select class="form-select" id="ward" required disabled>
                                    <option value="">Chọn phường/xã</option>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Địa chỉ cụ thể</label>
                                <textarea class="form-control" id="specific_address" 
                                          rows="2" placeholder="Số nhà, tên đường" required></textarea>
                            </div>
                            <input type="hidden" name="address" id="full_address">
                            <div class="form-check mb-3">
                                <input type="checkbox" class="form-check-input" 
                                       name="is_default" id="defaultAddress">
                                <label class="form-check-label" for="defaultAddress">
                                    Đặt làm địa chỉ mặc định
                                </label>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                            <button type="submit" class="btn btn-primary">Thêm địa chỉ</button>
                        </div>
                    </form>
                </div>
            </div>
        </div><br><br><br><br>
        <jsp:include page="chat.jsp" />
        <div><jsp:include page="/footer.jsp" /></div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <script>
                                                       const API_PROVINCE = 'https://provinces.open-api.vn/api/?depth=1';
                                                       const API_DISTRICT = 'https://provinces.open-api.vn/api/p/';
                                                       const API_WARD = 'https://provinces.open-api.vn/api/d/';

                                                       function updateShippingFee(fee) {
                                                           const subtotal = ${subtotal};
                                                           const discount = ${discount != null ? discount : 0};
                                                           const freeShippingThreshold = 500000;

                                                           // Nếu subtotal > 500k, phí vận chuyển luôn là 0
                                                           const shippingFee = (subtotal > freeShippingThreshold) ? 0 : fee;

                                                           const formattedFee = (shippingFee === 0) ? 'Miễn phí' : new Intl.NumberFormat('vi-VN', {
                                                               style: 'currency',
                                                               currency: 'VND',
                                                               maximumFractionDigits: 0
                                                           }).format(shippingFee);

                                                           const total = subtotal - discount + shippingFee;
                                                           const formattedTotal = new Intl.NumberFormat('vi-VN', {
                                                               style: 'currency',
                                                               currency: 'VND',
                                                               maximumFractionDigits: 0
                                                           }).format(total);

                                                           document.getElementById('shippingFee').textContent = formattedFee;
                                                           document.getElementById('totalAmount').textContent = formattedTotal;
                                                       }

                                                       const provinceSelect = document.getElementById('province');
                                                       const districtSelect = document.getElementById('district');
                                                       const wardSelect = document.getElementById('ward');
                                                       const specificAddress = document.getElementById('specific_address');
                                                       const fullAddressInput = document.getElementById('full_address');

                                                       async function loadProvinces() {
                                                           try {
                                                               const response = await fetch(API_PROVINCE);
                                                               const data = await response.json();
                                                               data.forEach(province => {
                                                                   const option = document.createElement('option');
                                                                   option.value = province.code;
                                                                   option.textContent = province.name;
                                                                   provinceSelect.appendChild(option);
                                                               });
                                                           } catch (error) {
                                                               console.error('Error loading provinces:', error);
                                                           }
                                                       }

                                                       async function loadDistricts(provinceCode) {
                                                           try {
                                                               const response = await fetch(API_DISTRICT + provinceCode + '?depth=2');
                                                               const data = await response.json();
                                                               districtSelect.innerHTML = '<option value="">Chọn quận/huyện</option>';
                                                               districtSelect.disabled = false;
                                                               wardSelect.innerHTML = '<option value="">Chọn phường/xã</option>';
                                                               wardSelect.disabled = true;
                                                               data.districts.forEach(district => {
                                                                   const option = document.createElement('option');
                                                                   option.value = district.code;
                                                                   option.textContent = district.name;
                                                                   districtSelect.appendChild(option);
                                                               });
                                                           } catch (error) {
                                                               console.error('Error loading districts:', error);
                                                           }
                                                       }

                                                       async function loadWards(districtCode) {
                                                           try {
                                                               const response = await fetch(API_WARD + districtCode + '?depth=2');
                                                               const data = await response.json();
                                                               wardSelect.innerHTML = '<option value="">Chọn phường/xã</option>';
                                                               wardSelect.disabled = false;
                                                               data.wards.forEach(ward => {
                                                                   const option = document.createElement('option');
                                                                   option.value = ward.code;
                                                                   option.textContent = ward.name;
                                                                   wardSelect.appendChild(option);
                                                               });
                                                           } catch (error) {
                                                               console.error('Error loading wards:', error);
                                                           }
                                                       }

                                                       function updateFullAddress() {
                                                           const province = provinceSelect.options[provinceSelect.selectedIndex]?.text || '';
                                                           const district = districtSelect.options[districtSelect.selectedIndex]?.text || '';
                                                           const ward = wardSelect.options[wardSelect.selectedIndex]?.text || '';
                                                           const specific = specificAddress.value.trim();
                                                           const addressParts = [];
                                                           if (specific)
                                                               addressParts.push(specific);
                                                           if (ward)
                                                               addressParts.push(ward);
                                                           if (district)
                                                               addressParts.push(district);
                                                           if (province)
                                                               addressParts.push(province);
                                                           fullAddressInput.value = addressParts.join(', ');
                                                       }

                                                       provinceSelect.addEventListener('change', (e) => {
                                                           if (e.target.value) {
                                                               loadDistricts(e.target.value);
                                                           } else {
                                                               districtSelect.innerHTML = '<option value="">Chọn quận/huyện</option>';
                                                               districtSelect.disabled = true;
                                                               wardSelect.innerHTML = '<option value="">Chọn phường/xã</option>';
                                                               wardSelect.disabled = true;
                                                           }
                                                           updateFullAddress();
                                                       });

                                                       districtSelect.addEventListener('change', (e) => {
                                                           if (e.target.value) {
                                                               loadWards(e.target.value);
                                                           } else {
                                                               wardSelect.innerHTML = '<option value="">Chọn phường/xã</option>';
                                                               wardSelect.disabled = true;
                                                           }
                                                           updateFullAddress();
                                                       });

                                                       wardSelect.addEventListener('change', updateFullAddress);
                                                       specificAddress.addEventListener('input', updateFullAddress);

                                                       loadProvinces();
        </script>
    </body>
</html>