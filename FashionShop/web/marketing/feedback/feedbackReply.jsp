<%-- 
    Document   : feedbackReply
    Created on : Mar 17, 2025, 3:11:08 AM
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
        <title>Phản hồi phản hồi khách hàng</title>
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
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            }

            /* Main content styles */
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
                overflow: hidden;
            }

            .card-header {
                background-color: #fff;
                border-bottom: 1px solid var(--border-color);
                padding: 15px 20px;
                font-weight: 600;
                display: flex;
                align-items: center;
                color: var(--primary-color);
            }

            .card-header i {
                margin-right: 10px;
                color: var(--accent-color);
            }

            .page-title {
                color: var(--primary-color);
                margin-bottom: 20px;
                padding-bottom: 10px;
                border-bottom: 2px solid var(--accent-color);
                display: inline-block;
                font-weight: 600;
            }

            /* Badge Styles */
            .badge-status {
                font-weight: 600;
                padding: 5px 10px;
                border-radius: 50px;
            }

            .badge-active {
                background-color: var(--success-color);
                color: white;
            }

            .badge-expired {
                background-color: var(--danger-color);
                color: white;
            }

            .badge-discount-type {
                background-color: rgba(52, 152, 219, 0.2);
                color: var(--accent-color);
                font-weight: 600;
                padding: 5px 10px;
                border-radius: 50px;
                white-space: nowrap;
            }

            /* Toggle button */
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

            /* Image gallery */
            .feedback-images {
                display: flex;
                flex-wrap: wrap;
                gap: 10px;
                margin-top: 10px;
            }

            .feedback-images img {
                width: 120px;
                height: 120px;
                object-fit: cover;
                border-radius: 6px;
                border: 1px solid var(--border-color);
                box-shadow: 0 2px 5px rgba(0,0,0,0.05);
                transition: transform 0.2s;
            }

            .feedback-images img:hover {
                transform: scale(1.05);
            }

            /* Reply history section */
            .reply-item {
                border: 1px solid var(--border-color);
                border-radius: 8px;
                padding: 15px;
                margin-bottom: 15px;
                background-color: white;
                position: relative;
            }

            .reply-header {
                display: flex;
                justify-content: space-between;
                margin-bottom: 6px;
                color: var(--primary-color);
                font-weight: 600;
            }

            .reply-timestamp {
                color: #6c757d;
                font-size: 0.85rem;
                font-weight: normal;
            }

            .reply-content {
                margin-bottom: 15px;
                color: var(--secondary-color);
                line-height: 1.5;
            }

            .reply-actions {
                position: absolute;
                top: 15px;
                right: 15px;
                display: flex;
                gap: 5px;
            }

            .reply-actions .btn {
                padding: 0.25rem 0.5rem;
                font-size: 0.875rem;
            }

            /* Edit form styling */
            .edit-form {
                background-color: #f8f9fa;
                border-radius: 6px;
                padding: 15px;
                margin-top: 10px;
                border: 1px solid var(--border-color);
            }

            .edit-form textarea {
                resize: vertical;
                min-height: 80px;
            }

            .edit-form-buttons {
                display: flex;
                justify-content: flex-end;
                margin-top: 10px;
                gap: 10px;
            }

            /* New reply form */
            .new-reply-form textarea {
                resize: vertical;
                min-height: 100px;
                border-radius: 6px;
            }

            .form-buttons {
                display: flex;
                gap: 10px;
                margin-top: 10px;
            }

            /* Delete confirmation modal */
            .modal-content {
                border-radius: 8px;
                border: none;
                box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            }

            .modal-header {
                background-color: #f8f9fa;
                border-bottom: 1px solid var(--border-color);
                border-top-left-radius: 8px;
                border-top-right-radius: 8px;
            }

            .modal-title {
                color: var(--primary-color);
                font-weight: 600;
            }

            .modal-body {
                padding: 20px;
                color: var(--secondary-color);
            }

            .modal-footer {
                border-top: 1px solid var(--border-color);
                padding: 15px;
            }

            /* Nội dung phản hồi - styling */
            .feedback-content {
                background-color: #f8f9fa;
                border: 1px solid var(--border-color);
                border-radius: 8px;
                padding: 15px;
                margin-top: 5px;
                margin-bottom: 10px;
                position: relative;
                box-shadow: 0 1px 3px rgba(0,0,0,0.05);
            }

            .feedback-content p {
                margin-bottom: 0;
                line-height: 1.6;
                color: var(--secondary-color);
            }

            .feedback-timestamp {
                display: block;
                margin-top: 10px;
                font-size: 0.85rem;
                color: #6c757d;
                text-align: right;
                font-style: italic;
            }

/*            .feedback-rating {
                position: absolute;
                top: 15px;
                right: 15px;
                font-weight: 600;
            }

            .feedback-rating i {
                margin-left: 2px;
            }*/

            /* Lightbox styles */
            .lightbox-modal {
                display: none;
                position: fixed;
                z-index: 1050;
                padding-top: 50px;
                left: 0;
                top: 0;
                width: 100%;
                height: 100%;
                overflow: auto;
                background-color: rgba(0,0,0,0.9);
            }

            .lightbox-content {
                margin: auto;
                display: block;
                max-width: 90%;
                max-height: 90%;
                object-fit: contain;
            }

            .lightbox-close {
                position: absolute;
                top: 15px;
                right: 35px;
                color: #f1f1f1;
                font-size: 40px;
                font-weight: bold;
                transition: 0.3s;
                z-index: 1051;
            }

            .lightbox-close:hover,
            .lightbox-close:focus {
                color: #bbb;
                text-decoration: none;
                cursor: pointer;
            }

            /* Caption styling */
            .lightbox-caption {
                margin: auto;
                display: block;
                width: 80%;
                max-width: 700px;
                text-align: center;
                color: #ccc;
                padding: 10px 0;
                height: 150px;
            }

            /* Add animation */
            .lightbox-content, .lightbox-caption {
                animation-name: zoom;
                animation-duration: 0.6s;
            }

            @keyframes zoom {
                from {
                    transform: scale(0.1)
                }
                to {
                    transform: scale(1)
                }
            }

            /* Navigation buttons */
            .lightbox-prev,
            .lightbox-next {
                cursor: pointer;
                position: absolute;
                top: 50%;
                width: auto;
                padding: 16px;
                margin-top: -50px;
                color: white;
                font-weight: bold;
                font-size: 30px;
                transition: 0.6s ease;
                border-radius: 0 3px 3px 0;
                user-select: none;
                background-color: rgba(0,0,0,0.3);
            }

            .lightbox-next {
                right: 0;
                border-radius: 3px 0 0 3px;
            }

            .lightbox-prev:hover,
            .lightbox-next:hover {
                background-color: rgba(0,0,0,0.8);
            }

            /* Responsive */
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
                .feedback-images img {
                    width: 100px;
                    height: 100px;
                }
                .reply-actions {
                    position: static;
                    justify-content: flex-end;
                    margin-top: 10px;
                }
            }

            @media (max-width: 576px) {
                .feedback-images img {
                    width: 80px;
                    height: 80px;
                }
                .reply-header {
                    flex-direction: column;
                }
                .card-body {
                    padding: 15px 10px;
                }
            }
        </style>
    </head>
    <body>
        <jsp:include page="../sidebar.jsp" />
        <button class="btn btn-primary sidebar-toggle">
            <i class="fas fa-bars"></i>
        </button>

        <div class="main-content">
            <div class="container-fluid p-4">
                <c:if test="${param.success == 'add'}">
                    <div class="alert alert-success alert-dismissible fade show" role="alert" id="successAlert">
                        Thêm phản hồi thành công!
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </c:if>
                <c:if test="${param.error == 'add'}">
                    <div class="alert alert-danger alert-dismissible fade show" role="alert" id="errorAlert">
                        Không thể thêm phản hồi. Vui lòng thử lại!
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </c:if>

                <c:if test="${param.success == 'delete_reply'}">
                    <div class="alert alert-success alert-dismissible fade show" role="alert" id="successAlert">
                        Xóa phản hồi thành công!
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </c:if>
                <c:if test="${param.error == 'delete_reply'}">
                    <div class="alert alert-danger alert-dismissible fade show" role="alert" id="errorAlert">
                        Không thể xóa phản hồi. Vui lòng thử lại!
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </c:if>

                <c:if test="${param.success == 'update_reply'}">
                    <div class="alert alert-success alert-dismissible fade show" role="alert" id="successAlert">
                        Cập nhật phản hồi thành công!
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </c:if>
                <c:if test="${param.error == 'update_reply'}">
                    <div class="alert alert-danger alert-dismissible fade show" role="alert" id="errorAlert">
                        Không thể cập nhật phản hồi. Vui lòng thử lại!
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </c:if>

                <h2 class="page-title">
                    <i class="fas fa-reply me-2"></i>Phản hồi khách hàng
                </h2>

                <div class="card">
                    <div class="card-header">
                        <i class="fas fa-info-circle"></i>Thông tin phản hồi 
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-6">
                                <p><strong>Sản phẩm:</strong> ${feedback.productTitle}</p>
                                <p><strong>Tài khoản:</strong> ${feedback.userName}</p>
                                <p><strong>Tên người dùng:</strong> ${feedback.userFullName}</p>
                                <p><strong>Nội dung:</strong></p>
                                <div class="feedback-content">
                                    <div class="feedback-rating">
                                        <c:forEach begin="1" end="5" var="i">
                                            <c:choose>
                                                <c:when test="${i <= feedback.rating}">
                                                    <i class="fas fa-star" style="color: #f39c12;"></i>
                                                </c:when>
                                                <c:otherwise>
                                                    <i class="far fa-star" style="color: #ccc;"></i>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>
                                    </div>
                                    <br>
                                    <p>${feedback.comment}</p>
                                    <span class="feedback-timestamp">
                                        <fmt:formatDate value="${feedback.createdAt}" pattern="dd/MM/yyyy HH:mm:ss"/>
                                    </span>
                                </div>
                                <p><strong>Trạng thái:</strong>
                                    <c:choose>
                                        <c:when test="${feedback.status == 'approved'}">
                                            <span class="badge badge-status badge-active">Hiện</span>
                                        </c:when>
                                        <c:when test="${feedback.status == 'rejected'}">
                                            <span class="badge badge-status badge-expired">Ẩn</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="badge badge-status badge-discount-type">Chưa xem</span>
                                        </c:otherwise>
                                    </c:choose>
                                </p>
                            </div>
                            <div class="col-md-6">
                                <p><strong>Hình ảnh:</strong></p>
                                <div class="feedback-images">
                                    <c:choose>
                                        <c:when test="${not empty feedbackImages}">
                                            <c:forEach items="${feedbackImages}" var="image" varStatus="status">
                                                <c:set var="imageUrl" value="${image.contains('https') ? image : pageContext.request.contextPath.concat('/').concat(image)}" />
                                                <img src="${imageUrl}" alt="Feedback Image ${status.index + 1}" class="img-thumbnail feedback-image" 
                                                     onclick="openLightbox('${imageUrl}', ${status.index}, 'Feedback Image ${status.index + 1}')">
                                            </c:forEach>
                                        </c:when>
                                        <c:otherwise>
                                            <span>Không có ảnh.</span>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="card mt-3">
                    <div class="card-header">
                        <i class="fas fa-history"></i>Lịch sử phản hồi
                    </div>
                    <div class="card-body">
                        <c:choose>
                            <c:when test="${not empty replies}">
                                <c:forEach items="${replies}" var="reply">
                                    <div class="reply-item" id="reply-${reply.id}">
                                        <div class="reply-header">
                                            <div>
                                                <span>${reply.userFullName}</span>
                                                <span class="reply-timestamp">
                                                    <fmt:formatDate value="${reply.updatedAt}" pattern="dd/MM/yyyy HH:mm:ss"/>
                                                </span>
                                            </div>
                                        </div>
                                        <div class="reply-actions">
                                            <button type="button" class="btn btn-warning btn-sm" onclick="editReply(${reply.id})">
                                                <i class="fas fa-edit"></i> Sửa
                                            </button>
                                            <button type="button" class="btn btn-danger btn-sm" data-bs-toggle="modal" data-bs-target="#deleteModal${reply.id}">
                                                <i class="fas fa-trash"></i> Xóa
                                            </button>
                                        </div>
                                        <div class="reply-content" id="reply-comment-${reply.id}">
                                            ${reply.comment}
                                        </div>

                                        <form action="feedbackreply" method="POST" id="edit-form-${reply.id}" class="edit-form" style="display: none;">
                                            <input type="hidden" name="action" value="updateReply">
                                            <input type="hidden" name="feedbackId" value="${feedback.id}">
                                            <input type="hidden" name="replyId" value="${reply.id}">
                                            <input type="hidden" name="returnUrl" value="${returnUrl}"> <!-- Gửi returnUrl -->
                                            <input type="hidden" name="productId" value="${productId}"> <!-- Gửi productId nếu có -->
                                            <div class="form-group">
                                                <textarea name="comment" class="form-control" rows="3" required>${reply.comment}</textarea>
                                            </div>
                                            <div class="edit-form-buttons">
                                                <button type="button" class="btn btn-secondary" onclick="cancelEdit(${reply.id})">Hủy</button>
                                                <button type="submit" class="btn btn-success">Lưu</button>
                                            </div>
                                        </form>
                                    </div>

                                    <!-- Delete Modal -->
                                    <div class="modal fade" id="deleteModal${reply.id}" tabindex="-1" aria-labelledby="deleteModalLabel${reply.id}" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="deleteModalLabel${reply.id}">Xác nhận xóa</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body">
                                                    Bạn có chắc chắn muốn xóa phản hồi này?
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                                                    <form action="feedbackreply" method="POST">
                                                        <input type="hidden" name="action" value="deleteReply">
                                                        <input type="hidden" name="feedbackId" value="${feedback.id}">
                                                        <input type="hidden" name="replyId" value="${reply.id}">
                                                        <input type="hidden" name="returnUrl" value="${returnUrl}"> <!-- Gửi returnUrl -->
                                                        <input type="hidden" name="productId" value="${productId}"> <!-- Gửi productId nếu có -->
                                                        <button type="submit" class="btn btn-danger">Xóa</button>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <div class="text-center py-4">
                                    <i class="fas fa-comments fa-3x text-muted mb-3"></i>
                                    <p class="text-muted">Chưa có phản hồi nào.</p>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>

                <div class="card mt-3">
                <div class="card-header">
                    <i class="fas fa-reply"></i>Thêm phản hồi mới
                </div>
                <div class="card-body">
                    <form action="feedbackreply" method="POST" class="new-reply-form" id="new-reply-form">
                        <input type="hidden" name="feedbackId" value="${feedback.id}">
                        <input type="hidden" name="returnUrl" value="${returnUrl}">
                        <input type="hidden" name="productId" value="${productId}">
                        <div class="mb-3">
                            <label for="new-comment" class="form-label">Nội dung phản hồi</label>
                            <textarea class="form-control" id="new-comment" name="comment" rows="3" required maxlength="500"></textarea>
                            <div id="char-count" class="form-text">0/500</div>
                        </div>
                            <div class="form-buttons">
                                <c:choose>
                                    <c:when test="${returnUrl == 'feedbackdetail' && not empty productId}">
                                        <a href="feedbackdetail?productId=${productId}" class="btn btn-secondary">
                                            <i class="fas fa-arrow-left me-2"></i>Quay lại
                                        </a>
                                    </c:when>
                                    <c:when test="${returnUrl == 'feedbackall'}">
                                        <a href="feedbackall" class="btn btn-secondary">
                                            <i class="fas fa-arrow-left me-2"></i>Quay lại
                                        </a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="feedbackall" class="btn btn-secondary">
                                            <i class="fas fa-arrow-left me-2"></i>Quay lại
                                        </a>
                                    </c:otherwise>
                                </c:choose>
                                <button type="submit" class="btn btn-primary">
                                    <i class="fas fa-reply me-2"></i>Gửi phản hồi
                                </button>
                            </div>
                        </form>
                    </div>
                </div>

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
        <script>
                $(document).ready(function () {
                    // Đếm số ký tự cho textarea thêm mới
                    $('#new-comment').on('input', function() {
                        let length = $(this).val().length;
                        $('#char-count').text(length + '/500');
                        if (length > 500) {
                            $(this).val($(this).val().substring(0, 500));
                            $('#char-count').text('500/500');
                        }
                    });
                });

                function editReply(replyId) {
                    $('#reply-comment-' + replyId).hide();
                    $('#edit-form-' + replyId).show();
                    // Đếm ký tự cho textarea chỉnh sửa
                    $('#comment-' + replyId).on('input', function() {
                        let length = $(this).val().length;
                        if (length > 150) {
                            $(this).val($(this).val().substring(0, 500));
                        }
                    });
                }

                function cancelEdit(replyId) {
                    $('#reply-comment-' + replyId).show();
                    $('#edit-form-' + replyId).hide();
                }
            </script>
        
        <script>
            $(document).ready(function () {
                // Auto close alerts after 3 seconds
                if ($('#successAlert, #errorAlert').length) {
                    setTimeout(function () {
                        $('.alert').alert('close');
                    }, 3000);
                }
                
                // Sidebar toggle for mobile
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
            });
            
            // Edit reply functions
            function editReply(replyId) {
                document.getElementById('reply-comment-' + replyId).style.display = 'none';
                document.getElementById('edit-form-' + replyId).style.display = 'block';
            }

            function cancelEdit(replyId) {
                document.getElementById('reply-comment-' + replyId).style.display = 'block';
                document.getElementById('edit-form-' + replyId).style.display = 'none';
            }
        </script>
        
        <!-- Lightbox Modal -->
        <div id="lightboxModal" class="lightbox-modal">
            <span class="lightbox-close">&times;</span>
            <a class="lightbox-prev">&#10094;</a>
            <img class="lightbox-content" id="lightboxImg">
            <div id="lightboxCaption" class="lightbox-caption"></div>
            <a class="lightbox-next">&#10095;</a>
        </div>
        <script>
            // Lightbox functionality
            let lightboxImages = [];
            let currentImageIndex = 0;

            function openLightbox(imgSrc, index, caption) {
            // Collect all images
            lightboxImages = [];
            document.querySelectorAll('.feedback-image').forEach(img => {
            lightboxImages.push({
            src: img.src,
            alt: img.alt
           });
        });
    
            currentImageIndex = index;
    
            // Show the lightbox
            const modal = document.getElementById('lightboxModal');
            const img = document.getElementById('lightboxImg');
            const captionText = document.getElementById('lightboxCaption');
    
            modal.style.display = "block";
            img.src = imgSrc;
            captionText.innerHTML = caption;
        }

            function closeLightbox() {
            document.getElementById('lightboxModal').style.display = "none";
        }

            function changeImage(step) {
            currentImageIndex += step;
    
            // Loop around if we go past the end or beginning
            if (currentImageIndex >= lightboxImages.length) {
            currentImageIndex = 0;
        } else if (currentImageIndex < 0) {
            currentImageIndex = lightboxImages.length - 1;
        }
    
            const img = document.getElementById('lightboxImg');
            const captionText = document.getElementById('lightboxCaption');
    
            img.src = lightboxImages[currentImageIndex].src;
            captionText.innerHTML = lightboxImages[currentImageIndex].alt;
        }

            // Set up event listeners
            document.addEventListener('DOMContentLoaded', function() {
            // Close lightbox when clicking the close button
            document.querySelector('.lightbox-close').addEventListener('click', closeLightbox);
    
            // Close lightbox when clicking outside the image
            document.getElementById('lightboxModal').addEventListener('click', function(e) {
            if (e.target === this) {
            closeLightbox();
            }
        });
    
            // Next image
            document.querySelector('.lightbox-next').addEventListener('click', function() {
            changeImage(1);
        });
    
            // Previous image
            document.querySelector('.lightbox-prev').addEventListener('click', function() {
            changeImage(-1);
        });
    
            // Keyboard navigation
            document.addEventListener('keydown', function(e) {
            if (document.getElementById('lightboxModal').style.display === "block") {
            if (e.key === "ArrowRight") {
                changeImage(1);
            } else if (e.key === "ArrowLeft") {
                changeImage(-1);
            } else if (e.key === "Escape") {
                closeLightbox();
            }
        }
    });
});
        </script>
    </body>
</html>