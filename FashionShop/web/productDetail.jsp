<%-- 
    Document   : productDetail
    Created on : Feb 25, 2025, 2:04:38 AM
    Author     : tphon
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <title>${product.title} - Fashion Store</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        <style>
    /* Global Typography and Color Palette (đồng bộ với productList.jsp) */
    :root {
        --primary-color: #2c3e50;
        --secondary-color: #34495e;
        --accent-color: #3498db;
        --text-color: #333;
        --light-background: #f4f6f7;
        --card-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
    }

    body {
        font-family: 'Inter', 'Segoe UI', Roboto, sans-serif;
        background-color: var(--light-background);
        color: var(--text-color);
        line-height: 1.6;
    }

    .container {
        max-width: 1400px;
        padding: 2rem;
    }

    .product-container {
        background: white;
        border-radius: 15px;
        box-shadow: var(--card-shadow);
        padding: 30px;
        margin-bottom: 30px;
        transition: all 0.3s ease;
    }

    .product-container:hover {
        box-shadow: 0 15px 35px rgba(0, 0, 0, 0.15);
    }

    /* Product Images */
    .product-image-main {
        width: calc(100% - 120px); /* Trừ đi chiều rộng của thumbnail-container + gap */
        height: 600px;
        object-fit: cover;
        border-radius: 12px;
        transition: transform 0.4s ease;
    }

    /*    .product-image-main:hover {
            transform: scale(1.05);
        }*/

    .image-section {
        display: flex;
        gap: 20px;
    }

    .thumbnail-container {
        display: flex;
        flex-direction: column;
        gap: 15px;
        width: 100px;
        min-width: 100px;
        overflow-y: auto;
        max-height: 600px;
        padding-right: 10px;
        border-radius: 8px;
    }

    .thumbnail {
        width: 100%; /* Tràn hết chiều rộng của thumbnail-container */
        height: 100px; /* Chiều cao cố định */
        object-fit: cover; /* Đảm bảo ảnh lấp đầy khung */
        border-radius: 8px;
        cursor: pointer;
        border: 2px solid transparent;
        transition: all 0.3s ease;
        display: block; /* Đảm bảo ảnh là block element */
    }

    .thumbnail:hover, .thumbnail.active {
        border-color: var(--accent-color);
        transform: scale(1.05);
    }

    .thumbnail-placeholder {
        width: 100%;
        height: 100px;
        display: flex;
        align-items: center;
        justify-content: center;
        color: #999;
        font-size: 0.9rem;
        text-align: center;
        background: #fff;
        border-radius: 8px;
        border: 1px dashed #ddd;
    }

    /* Product Details */
    .product-title {
        font-size: 1.8rem;
        font-weight: 700;
        color: var(--primary-color);
        margin-bottom: 15px;
    }

    .product-price {
        display: flex;
        align-items: baseline;
        gap: 15px;
        margin-bottom: 20px;
    }

    .sale-price {
        font-size: 1.8rem;
        font-weight: 700;
        color: var(--accent-color);
    }

    .original-price {
        font-size: 1.2rem;
        color: #999;
        text-decoration: line-through;
    }

    .product-description {
        margin-bottom: 30px;
        color: #666;
        line-height: 1.8;
    }

    /* Options and Quantity */
    .options-row {
        display: flex;
        flex-wrap: wrap;
        gap: 20px;
        margin-bottom: 25px;
    }

    .options-col {
        flex: 1;
        min-width: 150px;
    }

    .option-label {
        font-weight: 600;
        color: var(--secondary-color);
        margin-bottom: 8px;
        display: block;
    }

    .form-select, .quantity-input {
        border-radius: 8px;
        border: 1px solid #e0e0e0;
        transition: all 0.3s ease;
    }

    .form-select:focus, .quantity-input:focus {
        border-color: var(--accent-color);
        box-shadow: 0 0 0 2px rgba(52, 152, 219, 0.2);
    }

    .quantity-selector {
        display: flex;
        align-items: center;
        gap: 10px;
    }

    .quantity-input {
        width: 70px;
        text-align: center;
        background-color: #f9f9f9;
    }

    .btn-outline-secondary {
        border-radius: 8px;
        transition: all 0.3s ease;
    }

    .btn-outline-secondary:hover {
        background-color: var(--accent-color);
        color: white;
        border-color: var(--accent-color);
    }

    .stock-status {
        display: flex;
        align-items: center;
        margin-left: 15px;
        font-weight: 500;
    }

    .stock-status.in-stock {
        color: #28a745;
    }

    .stock-status.out-of-stock {
        color: #dc3545;
    }

    /* Action Buttons */
    .action-buttons {
        display: flex;
        gap: 15px;
        margin-top: 30px;
    }

    .btn-buy-now, .btn-add-cart {
        flex: 1;
        padding: 12px 20px;
        border: none;
        border-radius: 8px;
        font-size: 1rem;
        font-weight: 600;
        color: white;
        transition: all 0.3s ease;
        display: flex;
        align-items: center;
        justify-content: center;
        gap: 8px;
    }

    .btn-buy-now {
        background: var(--accent-color);
    }

    .btn-add-cart {
        background: var(--primary-color);
    }

    .btn-buy-now:hover {
        background: #2980b9;
        transform: translateY(-3px);
    }

    .btn-add-cart:hover {
        background: var(--secondary-color);
        transform: translateY(-3px);
    }

    .btn-buy-now:disabled, .btn-add-cart:disabled {
        background: #ccc;
        cursor: not-allowed;
    }

    /* Product Meta */
    .product-meta {
        margin-top: 20px;
        padding-top: 20px;
        border-top: 1px solid #eee;
        font-size: 0.9rem;
        color: #777;
    }

    .meta-item a {
        color: var(--accent-color);
        text-decoration: none;
    }

    .meta-item a:hover {
        text-decoration: underline;
    }

    /* Feedback Section */
    .feedback-section {
        margin-top: 50px;
        background: white;
        border-radius: 15px;
        padding: 30px;
        box-shadow: var(--card-shadow);
    }

    .feedback-title {
        font-size: 1.5rem;
        font-weight: 600;
        color: var(--primary-color);
        margin-bottom: 20px;
        padding-bottom: 10px;
        border-bottom: 2px solid var(--accent-color);
    }

    .feedback-item {
        padding: 20px 0;
        border-bottom: 1px solid #eee;
        display: flex;
        gap: 20px;
    }

    .feedback-avatar {
        width: 50px;
        height: 50px;
        border-radius: 50%;
        background: #eee;
        display: flex;
        align-items: center;
        justify-content: center;
        color: #777;
        font-size: 1.2rem;
        flex-shrink: 0;
    }

    .feedback-content {
        flex: 1;
    }

    .feedback-author {
        font-weight: 600;
        color: var(--primary-color);
        margin-bottom: 5px;
    }

    .feedback-rating {
        color: #f5c518;
        margin-bottom: 8px;
    }

    .feedback-text {
        color: #666;
        line-height: 1.6;
    }

    .feedback-images {
        display: flex;
        flex-wrap: wrap;
        gap: 10px;
        margin-top: 10px;
    }

    .feedback-images img {
        width: 100px;
        height: 100px;
        object-fit: cover;
        border-radius: 8px;
        cursor: pointer;
        transition: transform 0.3s ease;
    }

    .feedback-images img:hover {
        transform: scale(1.05);
    }

    .feedback-date {
        font-size: 0.8rem;
        color: #999;
        margin-top: 5px;
    }

    .reply {
        background-color: #f9f9f9;
        padding: 15px;
        border-radius: 8px;
        margin-top: 15px;
        margin-left: 40px;
    }

    .reply .feedback-author {
        color: var(--secondary-color);
    }

    /* Similar Products Section */
    .similar-products-section {
        margin-top: 50px;
        margin-bottom: 50px;
        background: white;
        border-radius: 15px;
        padding: 30px;
        box-shadow: var(--card-shadow);
    }

    .similar-products-title {
        font-size: 1.5rem;
        font-weight: 600;
        color: var(--primary-color);
        margin-bottom: 20px;
        padding-bottom: 10px;
        border-bottom: 2px solid var(--accent-color);
    }

    .product-grid {
        display: grid;
        grid-template-columns: repeat(4, 1fr); /* Đồng bộ với productList.jsp */
        gap: 25px;
    }

    .product-card {
        border: none;
        border-radius: 15px;
        overflow: hidden;
        box-shadow: var(--card-shadow);
        transition: all 0.4s ease;
        display: flex;
        flex-direction: column;
    }

    .product-card:hover {
        transform: translateY(-10px);
        box-shadow: 0 15px 35px rgba(0, 0, 0, 0.15);
    }

    .product-image {
        height: 250px;
        object-fit: cover;
        width: 100%;
        transition: transform 0.4s ease;
    }

    .product-card:hover .product-image {
        transform: scale(1.1);
    }

    .product-info {
        padding: 20px;
        background: white;
        flex-grow: 1;
    }

    .product-title {
        font-size: 1.1rem;
        font-weight: 600;
        color: var(--primary-color);
        margin-bottom: 10px;
        overflow: hidden;
        text-overflow: ellipsis;
        display: -webkit-box;
        -webkit-line-clamp: 2;
        -webkit-box-orient: vertical;
    }

    .product-price {
        color: var(--accent-color);
        font-size: 1.3rem;
        font-weight: 700;
        margin-bottom: 15px;
    }

    /* Pagination */
    .pagination {
        justify-content: center;
        margin-top: 30px;
        display: flex;
        gap: 5px;
    }

    .page-link {
        color: var(--primary-color);
        border-radius: 6px;
        transition: all 0.3s ease;
    }

    .page-link:hover {
        background-color: var(--accent-color);
        color: white;
    }

    .page-item.active .page-link {
        background-color: var(--primary-color);
        border-color: var(--primary-color);
        color: white;
    }

    /* Product Description Section */
    .product-description-section {
        background: white;
        border-radius: 15px;
        padding: 30px;
        margin-top: 30px;
        box-shadow: var(--card-shadow);
    }

    .product-description-title {
        font-size: 1.5rem;
        font-weight: 600;
        color: var(--primary-color);
        margin-bottom: 20px;
        padding-bottom: 10px;
        border-bottom: 2px solid var(--accent-color);
    }

    .product-description-content {
        color: #666;
        line-height: 1.8;
        font-size: 1rem;
    }

    .product-description-content p {
        margin-bottom: 15px;
    }

    .product-description-content img {
        max-width: 100%;
        height: auto;
        border-radius: 8px;
        margin: 15px 0;
    }

    .product-description-content ul,
    .product-description-content ol {
        padding-left: 30px;
        margin-bottom: 15px;
    }

    .product-description-content strong,
    .product-description-content b {
        color: var(--primary-color);
    }

    /* Responsive Adjustments */
    @media (max-width: 992px) {
        .product-grid {
            grid-template-columns: repeat(3, 1fr);
        }
    }

    @media (max-width: 768px) {
        .action-buttons {
            flex-direction: column;
        }
        .product-image-main {
            height: 300px;
        }
        .options-row {
            flex-direction: column;
        }
        .options-col {
            width: 100%;
        }
        .product-grid {
            grid-template-columns: repeat(2, 1fr);
            gap: 15px;
        }
    }

    @media (max-width: 576px) {
        .product-grid {
            grid-template-columns: 1fr;
        }
        .product-title {
            font-size: 1.5rem;
        }
        .sale-price {
            font-size: 1.5rem;
        }
        .product-image-main {
            height: 250px;
        }
    }

    #feedback_section {
        scroll-margin-top: 100px;
    }
</style>
    </head>
    <body>
        <jsp:include page="header.jsp" />

        <div class="container">
            <div class="product-container">
                <c:if test="${alert != null && !alert.trim().isEmpty()}">
                    <c:choose>
                        <c:when test="${alert.equals('EOS')}">
                            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                Sản phẩm đã hết hàng hoặc ngừng kinh doanh.
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                            </div>
                        </c:when>
                        <c:when test="${alert.equals('SS')}">
                            <div class="alert alert-success alert-dismissible fade show" role="alert">
                                Thêm vào giỏ hàng thành công.
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                            </div>
                        </c:when>
                        <c:when test="${alert.equals('ERR')}">
                            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                Lỗi không xác định.
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                            </div>
                        </c:when>
                    </c:choose>
                </c:if>
                <div class="row">
                    <!-- Product Images Column -->
                    <div class="col-md-6">
                        <div class="image-section">
                            <div class="thumbnail-container">
                                <c:choose>
                                    <c:when test="${not empty product.subImages}">
                                        <c:forEach items="${product.subImages}" var="image" varStatus="status">
                                            <img src="${image}" class="thumbnail ${status.index == 0 ? 'active' : ''}" 
                                                 alt="${product.title} - Image ${status.index + 1}"
                                                 onclick="changeMainImage(this.src)">
                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                        <!-- Placeholder khi không có ảnh phụ -->
                                        <div class="thumbnail-placeholder">
                                            <span>Không có ảnh phụ</span>
                                        </div>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <img src="${product.thumbnail}" class="product-image-main" id="main-product-image" alt="${product.title}">
                        </div>
                    </div>

                    <!-- Product Details Column -->
                    <div class="col-md-6">
                        <h1 class="product-title">${product.title}</h1>

                        <div class="product-price">
                            <div class="sale-price">
                                <fmt:formatNumber value="${product.salePrice}" type="currency" currencySymbol="₫" maxFractionDigits="0"/>
                            </div>
                            <%--<c:if test="${product.originalPrice > product.salePrice}">--%>
                            <!--<div class="original-price">-->
                            <%--<fmt:formatNumber value="${product.originalPrice}" type="currency" currencySymbol="₫" maxFractionDigits="0"/>--%>
                            <!--</div>-->
                            <%--</c:if>--%>
                        </div>

                        <form action="productdetail" method="POST">
                            <input type="hidden" name="id" value="${product.id}">

                            <!-- Size và Color Selector trên cùng một hàng -->
                            <div class="options-row">
                                <div class="options-col">
                                    <label for="sizeId" class="option-label">Chọn Size</label>
                                    <select id="sizeId" name="sizeId" class="form-select" required="" onchange="changeSize(this.value)">
                                        <option value="">Chọn Size</option>
                                        <c:forEach items="${sizes}" var="size">
                                            <option value="${size.id}" ${sizeId == size.id ? 'selected' : ''}>${size.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>

                                <div class="options-col">
                                    <label for="colorId" class="option-label">Chọn Màu</label>
                                    <select id="colorId" name="colorId" class="form-select" required="" onchange="changeColor(this.value)">
                                        <option value="">Chọn Màu</option>
                                        <c:forEach items="${colors}" var="color">
                                            <option value="${color.id}" ${colorId == color.id ? 'selected' : ''}>${color.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>

                            <!-- Quantity Selector và tình trạng hàng trên cùng một hàng -->
                            <div class="options-row align-items-end">
                                <div class="options-col">
                                    <label for="quantity" class="option-label">Số Lượng</label>
                                    <div class="quantity-selector">
                                        <button type="button" class="btn btn-outline-secondary" onclick="decrementQuantity()">
                                            <i class="fas fa-minus"></i>
                                        </button>
                                        <input type="number" id="quantity" name="quantity" class="form-control quantity-input" value="1" min="1" max="${product.stock}">
                                        <button type="button" class="btn btn-outline-secondary" onclick="incrementQuantity()">
                                            <i class="fas fa-plus"></i>
                                        </button>
                                    </div>
                                </div>

                                <div class="options-col">
                                    <div class="stock-status ${product.stock>0 && product.status.equals('active') ? 'in-stock' : 'out-of-stock'}">
                                        <i class="fas ${product.stock > 0 ? 'fa-check-circle' : 'fa-times-circle'}"></i>
                                        <span class="ms-2">
                                            <!--${product.stock > 0 ? 'Còn Hàng (' : 'Hết Hàng'}--> 
                                            <!--${product.stock > 0 ? product.stock : ''}-->
                                            <!--${product.stock > 0 ? ')' : ''}-->
                                            ${product.stock>0 && product.status.equals('active') ? 'Còn Hàng' : product.status.equals('inactive') ? 'Ngưng Bán' : 'Hết Hàng'} 
                                        </span>
                                    </div>
                                </div>
                            </div>

                            <!-- Action Buttons -->
                            <c:if test="${sessionScope.acc.role == 'customer' || sessionScope.acc.role == null}">
                                <div class="action-buttons">
                                    <button type="submit" name="action" value="buyNow" 
                                            class="btn-buy-now" 
                                            ${product.stock <= 0 || !product.status.equals('active') ? 'disabled' : ''}>
                                        <i class="fas fa-bolt"></i> Mua Ngay
                                    </button>
                                    <button type="submit" name="action" value="addToCart" 
                                            class="btn-add-cart" 
                                            ${product.stock <= 0 || !product.status.equals('active') ? 'disabled' : ''}>
                                        <i class="fas fa-shopping-cart"></i> Thêm Vào Giỏ
                                    </button>
                                </div>
                            </c:if>
                        </form>

                        <!-- Product Metadata -->
                        <div class="product-meta">
                            <div class="meta-item">
                                <strong>Danh Mục:</strong> <a href="listproduct?category=${product.categoryId}">${categoryName}</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Product Description Section -->
            <div class="product-description-section">
                <h2 class="product-description-title">Mô Tả Sản Phẩm</h2>
                <div class="product-description-content">
                    ${product.description}
                </div>
            </div>

            <!-- Feedback Section -->
            <div id="feedback_section" class="feedback-section">
                <h2 class="feedback-title">Đánh Giá (${allFeedbacks>0 ? allFeedbacks : 0})</h2>
                <c:choose>
                    <c:when test="${not empty feedbacks}">
                        <!-- Trung Bình Sao và Nút Lọc -->
                        <div class="row mb-3">
                            <div class="col-md-3">
                                <div class="average-rating">
                                    <h3> <fmt:formatNumber value="${averageRating}" type="number" maxFractionDigits="1"/> trên 5</h3>
                                    <div class="star-rating">
                                        <c:forEach begin="1" end="5" var="i">
                                            <i class="fas fa-star ${i <= averageRating ? 'text-warning' : 'text-muted'}"></i>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-9">
                                <div class="filter-buttons">
                                    <a class="btn btn-outline-secondary me-2" href="productdetail?id=${product.id}#feedback_section">Tất Cả</a>
                                    <a class="btn btn-outline-secondary me-2" href="productdetail?id=${product.id}&filterStar=5#feedback_section" onclick="${fiveStarCount > 0 ? 'return true;' : 'return false;'}">5 Sao (${fiveStarCount})</a>
                                    <a class="btn btn-outline-secondary me-2" href="productdetail?id=${product.id}&filterStar=4#feedback_section" onclick="${fourStarCount > 0 ? 'return true;' : 'return false;'}">4 Sao (${fourStarCount})</a>
                                    <a class="btn btn-outline-secondary me-2" href="productdetail?id=${product.id}&filterStar=3#feedback_section" onclick="${threeStarCount > 0 ? 'return true;' : 'return false;'}">3 Sao (${threeStarCount})</a>
                                    <a class="btn btn-outline-secondary me-2" href="productdetail?id=${product.id}&filterStar=2#feedback_section" onclick="${twoStarCount > 0 ? 'return true;' : 'return false;'}">2 Sao (${twoStarCount})</a>
                                    <a class="btn btn-outline-secondary me-2" href="productdetail?id=${product.id}&filterStar=1#feedback_section" onclick="${oneStarCount > 0 ? 'return true;' : 'return false;'}">1 Sao (${oneStarCount})</a>
                                </div>
                            </div>
                        </div>
                        <c:forEach items="${feedbacks}" var="feedback">
                            <div class="feedback-item">
                                <div class="feedback-avatar">
                                    <i class="fas fa-user"></i>
                                </div>
                                <div class="feedback-content">
                                    <div class="feedback-author">${feedback.userName}</div>
                                    <div class="feedback-rating">
                                        <c:forEach begin="1" end="5" var="i">
                                            <i class="fas fa-star ${i <= feedback.rating ? '' : 'text-muted'}"></i>
                                        </c:forEach>
                                    </div>
                                    <div class="feedback-text">${feedback.comment}</div>
                                    <!-- Show ảnh -->
                                    <div class="feedback-images">
                                        <c:forEach items="${feedback.feedbackImages}" var="imageUrl">
                                            <img src="${imageUrl}" alt="Feedback Image" style="width: 100px; height: 100px; object-fit: cover; margin-right: 10px;" onclick="showImageModal(this.src)">
                                        </c:forEach>
                                    </div>
                                    <!-- Modal cho ảnh -->
                                    <div class="modal fade" id="imageModal" tabindex="-1" aria-labelledby="imageModalLabel" aria-hidden="true">
                                        <div class="modal-dialog modal-lg">
                                            <div class="modal-content">
                                                <div class="modal-body">
                                                    <img id="modalImage" src="" alt="Large Image" style="width: 100%;">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="feedback-date">
                                        <fmt:formatDate value="${feedback.createdAt}" pattern="dd/MM/yyyy HH:mm" />
                                    </div>
                                    <!-- Hiển thị phản hồi của cửa hàng -->
                                    <c:if test="${not empty feedback.replies}">
                                        <c:forEach items="${feedback.replies}" var="reply">
                                            <div class="reply" style="margin-left: 40px; margin-top: 10px;">
                                                <div class="feedback-author">Fashion Shop</div>
                                                <div class="feedback-text">${reply.comment}</div>
                                                <div class="feedback-date">
                                                    <fmt:formatDate value="${reply.createdAt}" pattern="dd/MM/yyyy HH:mm" />
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </c:if>
                                </div>
                            </div>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <div class="text-center py-5">
                            <i class="fas fa-comment-alt text-muted" style="font-size: 48px;"></i>
                            <p class="mt-3 text-muted">Chưa có đánh giá nào cho sản phẩm này</p>
                        </div>
                    </c:otherwise>
                </c:choose>

                <!-- Phân trang -->
                <nav aria-label="Page navigation">
                    <ul class="pagination">
                        <!-- Nút Previous -->
                        <c:if test="${currentPage > 1}">
                            <li class="page-item">
                                <a class="page-link" href="productdetail?id=${product.id}&filterStar=${filterStar}&page=${currentPage - 1}#feedback_section" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                        </c:if>
                        <!-- Các trang -->
                        <c:forEach begin="1" end="${totalPages}" var="i">
                            <li class="page-item ${i == currentPage ? 'active' : ''}">
                                <a class="page-link" href="productdetail?id=${product.id}&filterStar=${filterStar}&page=${i}#feedback_section">${i}</a>
                            </li>
                        </c:forEach>
                        <!-- Nút Next -->
                        <c:if test="${currentPage < totalPages}">
                            <li class="page-item">
                                <a class="page-link" href="productdetail?id=${product.id}&filterStar=${filterStar}&page=${currentPage + 1}#feedback_section" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </c:if>
                    </ul>
                </nav>
            </div>

            <!-- Similar Products Section - Displays up to 4 similar products from the same category -->
            <div class="similar-products-section">
                <h2 class="similar-products-title">Sản Phẩm Tương Tự</h2>

                <div class="product-grid">
                    <c:forEach items="${similarProducts}" var="similarProduct" varStatus="status">
                        <c:if test="${status.index < 4}">
                            <div class="card product-card">
                                <a href="productdetail?id=${similarProduct.id}" style="text-decoration:none;">
                                    <div class="position-relative">
                                        <img src="${similarProduct.thumbnail}" class="product-image" alt="${similarProduct.title}">
                                    </div>
                                    <div class="product-info">
                                        <h5 class="product-title">${similarProduct.title}</h5>
                                        <div class="product-price">
                                            <span><fmt:formatNumber value="${similarProduct.salePrice}" type="currency" currencySymbol="đ" maxFractionDigits="0"/></span>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
            </div>
        </div>
                
        <jsp:include page="chat.jsp" />    

        <jsp:include page="footer.jsp" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script>
                                            function changeMainImage(src) {
                                                document.getElementById('main-product-image').src = src;
                                                // Update active thumbnail
                                                const thumbnails = document.querySelectorAll('.thumbnail');
                                                thumbnails.forEach(thumb => {
                                                    if (thumb.src === src) {
                                                        thumb.classList.add('active');
                                                    } else {
                                                        thumb.classList.remove('active');
                                                    }
                                                });
                                            }

                                            function changeSize(sizeID) {
                                                setTimeout(() => { // Đợi một chút để đảm bảo giá trị mới được cập nhật
                                                    const colorID = document.getElementById('colorId').value;
                                                    window.location.href = 'productdetail?id=${product.id}&sizeId=' + sizeID + '&colorId=' + colorID;
                                                }, 10);
                                            }

                                            function changeColor(colorID) {
                                                setTimeout(() => {
                                                    const sizeID = document.getElementById('sizeId').value;
                                                    window.location.href = 'productdetail?id=${product.id}&sizeId=' + sizeID + '&colorId=' + colorID;
                                                }, 10);
                                            }

                                            function incrementQuantity() {
                                                const quantityInput = document.getElementById('quantity');
                                                const maxQuantity = ${product.stock};
                                                if (parseInt(quantityInput.value) < maxQuantity) {
                                                    quantityInput.value = parseInt(quantityInput.value) + 1;
                                                }
                                            }

                                            function decrementQuantity() {
                                                const quantityInput = document.getElementById('quantity');
                                                if (parseInt(quantityInput.value) > 1) {
                                                    quantityInput.value = parseInt(quantityInput.value) - 1;
                                                }
                                            }

                                            // Kiểm tra số lượng
                                            document.getElementById('quantity').addEventListener('change', function () {
                                                const value = parseInt(this.value);
                                                const maxQuantity = ${product.stock};
                                                if (value < 1) {
                                                    this.value = 1;
                                                } else if (value > maxQuantity) {
                                                    this.value = maxQuantity;
                                                    alert('Số lượng tối đa có sẵn là ' + maxQuantity);
                                                }
                                            });
                                            // Phóng to ảnh
                                            function showImageModal(src) {
                                                document.getElementById('modalImage').src = src;
                                                var modal = new bootstrap.Modal(document.getElementById('imageModal'));
                                                modal.show();
                                            }


        </script>
</body>
</html>