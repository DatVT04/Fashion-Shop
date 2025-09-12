<%-- 
    Document   : submitFeedback
    Created on : Mar 25, 2025, 11:29:23 AM
    Author     : tphon
--%>

<%-- 
    Document   : submitFeedback
    Created on : Mar 25, 2025, 11:29:23 AM
    Author     : tphon
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Đánh Giá Đơn Hàng</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            .star-rating {
                font-size: 2rem;
                color: #ddd;
                cursor: pointer;
            }
            .star-rating .active {
                color: #ffc107;
            }
            .product-image {
                max-width: 150px;
                max-height: 150px;
                object-fit: cover;
            }
            .feedback-card {
                margin-bottom: 1.5rem;
                box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            }
            .image-preview img {
                width: 100px;
                height: 100px;
                object-fit: cover;
                margin: 0.25rem;
            }
            .feedback-container {
                max-width: 800px;
                margin: 0 auto;
            }
            .user-info {
                display: flex;
                align-items: center;
                margin-bottom: 1rem;
            }
            .user-info img {
                width: 40px;
                height: 40px;
                border-radius: 50%;
                margin-right: 1rem;
            }
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp" />

        <div class="container py-5 feedback-container">
            <h1 class="mb-4 text-center">Đánh Giá Đơn Hàng #${order.orderCode}</h1>

            <!-- Hiển thị thông tin người dùng -->
            <div class="user-info">
                <img src="${sessionScope.acc.avatar}" alt="Avatar"
                     onerror="this.src='https://static.vecteezy.com/system/resources/previews/009/292/244/non_2x/default-avatar-icon-of-social-media-user-vector.jpg'">
                <span>Hiển thị tên đánh giá: <strong>${sessionScope.acc.username}</strong></span>
            </div>

            <form action="submitfeedback" method="post" enctype="multipart/form-data" id="feedbackForm">
                <input type="hidden" name="orderId" value="${order.id}">

                <!-- Đánh giá từng sản phẩm -->
                <c:forEach var="item" items="${order.items}" varStatus="status">
                    <div class="card feedback-card">
                        <div class="card-header bg-light">
                            <div class="d-flex align-items-center">
                                <img src="${item.productThumbnail}" 
                                     alt="${item.productTitle}" 
                                     class="product-image me-3">
                                <h5 class="card-title mb-0">${item.productTitle}</h5>
                            </div>
                        </div>
                        <div class="card-body">
                            <input type="hidden" name="orderItemId" value="${item.id}">

                            <div class="mb-3">
                                <label class="form-label">Đánh Giá Sao</label>
                                <div class="star-rating" data-item-id="${item.id}">
                                    <span data-rating="1">★</span>
                                    <span data-rating="2">★</span>
                                    <span data-rating="3">★</span>
                                    <span data-rating="4">★</span>
                                    <span data-rating="5">★</span>
                                </div>
                                <input type="hidden" name="rating-${item.id}" 
                                       id="rating-${item.id}" value="0" required/>
                            </div>

                            <div class="mb-3">
                                <label for="comment-${item.id}" class="form-label">Nhận Xét</label>
                                <textarea 
                                    name="comment-${item.id}" 
                                    id="comment-${item.id}" 
                                    class="form-control" 
                                    rows="3" 
                                    placeholder="Chia sẻ trải nghiệm của bạn về sản phẩm"
                                    ></textarea>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Hình Ảnh (Tối Đa 5)</label>
                                <input 
                                    type="file" 
                                    name="feedbackImages-${item.id}" 
                                    class="form-control image-upload" 
                                    id="images-${item.id}" 
                                    multiple 
                                    accept="image/*" 
                                    data-max-files="5"
                                    />
                                <div class="image-preview mt-2" id="preview-${item.id}"></div>
                            </div>
                        </div>
                    </div>
                </c:forEach>

                <div class="text-center mt-4">
                    <button type="submit" class="btn btn-primary btn-lg">Gửi Đánh Giá</button>
                </div>
            </form>
        </div>
        <jsp:include page="footer.jsp" />

        <!-- Bootstrap JS and Dependencies -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                // Xử lý đánh giá sao
                function setupStarRating(starContainer) {
                    const itemId = starContainer.getAttribute('data-item-id');
                    const stars = starContainer.querySelectorAll('span');
                    const hiddenInput = document.getElementById('rating-' + itemId);

                    if (!hiddenInput) {
                        console.error('Không tìm thấy hiddenInput với ID: rating-' + itemId);
                        return;
                    }

                    stars.forEach(star => {
                        star.addEventListener('click', function () {
                            const rating = this.getAttribute('data-rating');
                            stars.forEach(s => s.classList.remove('active'));
                            for (let i = 0; i < rating; i++) {
                                stars[i].classList.add('active');
                            }
                            hiddenInput.value = rating;
                        });
                    });
                }

                // Xử lý tải lên hình ảnh
                function setupImageUpload(input) {
                    input.addEventListener('change', function (event) {
                        const itemId = this.id.split('-')[1];
                        const preview = document.getElementById('preview-' + itemId);
                        if (!preview) {
                            console.error('Không tìm thấy preview với ID: preview-' + itemId);
                            return;
                        }
                        const maxFiles = parseInt(this.getAttribute('data-max-files'), 10);
                        preview.innerHTML = '';
                        const files = Array.from(event.target.files).slice(0, maxFiles);
                        files.forEach(file => {
                            const reader = new FileReader();
                            reader.onload = function (e) {
                                const img = document.createElement('img');
                                img.src = e.target.result;
                                img.classList.add('img-thumbnail');
                                preview.appendChild(img);
                            }
                            reader.readAsDataURL(file);
                        });
                    });
                }

                document.querySelectorAll('.star-rating').forEach(setupStarRating);
                document.querySelectorAll('.image-upload').forEach(setupImageUpload);
            });
        </script>
    </body>
</html>