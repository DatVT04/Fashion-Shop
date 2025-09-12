<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>${post.title} - Chi Tiết Bài Đăng</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
        <style>
            body {
                background-color: #f8f9fa;
            }
            .article-container {
                background-color: #fff;
                border-radius: 8px;
                box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            }
            .post-title {
                font-size: 2rem;
                font-weight: 700;
                color: #333;
                border-bottom: 2px solid #f0f0f0;
                padding-bottom: 15px;
            }
            .post-meta {
                padding: 10px 0;
                color: #6c757d;
                border-bottom: 1px solid #f0f0f0;
                margin-bottom: 20px;
            }
            .post-thumbnail {
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0,0,0,0.1);
                max-height: 500px;
                object-fit: cover;
            }
            .post-content {
                line-height: 1.8;
                font-size: 1.1rem;
                color: #333;
                overflow-wrap: break-word;
                word-wrap: break-word;
                word-break: break-word;
                max-width: 100%;
            }

            /* Make sure images and other media don't overflow */
            .post-content img,
            .post-content video,
            .post-content iframe {
                max-width: 100%;
                height: auto;
            }

            /* Handle overflow for pre and code blocks */
            .post-content pre,
            .post-content code {
                white-space: pre-wrap;
                overflow-x: auto;
                max-width: 100%;
            }

            /* Handle tables */
            .post-content table {
                width: 100%;
                max-width: 100%;
                overflow-x: auto;
                display: block;
            }
            .featured-badge {
                background-color: #ffc107;
                color: #212529;
            }
            .author-info i {
                color: #0d6efd;
            }

            .post-card {
                height: 100%;
                transition: transform 0.3s, box-shadow 0.3s;
                border: none;
                box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            }

            .post-card:hover {
                transform: translateY(-5px);
                box-shadow: 0 5px 15px rgba(0,0,0,0.15);
            }

            .card-img-wrapper {
                overflow: hidden;
            }

            .post-image {
                height: 200px;
                object-fit: cover;
                transition: transform 0.5s;
            }

            .post-card:hover .post-image {
                transform: scale(1.05);
            }

            .post-summary {
                font-size: 0.95rem;
                color: #495057;
                display: -webkit-box;
                -webkit-line-clamp: 3;
                -webkit-box-orient: vertical;
                overflow: hidden;
            }

            .post-meta {
                font-size: 0.9rem;
                color: #6c757d;
            }

            /* Continuous slider */
            .continuous-slider-container {
                width: 100%;
                overflow: hidden;
                position: relative;
                padding: 15px 0;
            }

            .continuous-slider {
                display: flex;
                animation: slideMove 60s linear infinite; /* Di chuyển rất chậm trong 60 giây */
            }

            .continuous-slider:hover {
                animation-play-state: paused; /* Tạm dừng khi hover */
            }

            .slider-item {
                flex: 0 0 300px; /* Chiều rộng cố định cho mỗi item */
                margin-right: 20px;
                opacity: 0.85;
                transition: opacity 0.3s;
            }

            .slider-item:hover {
                opacity: 1;
            }

            @keyframes slideMove {
                0% {
                    transform: translateX(0);
                }
                100% {
                    transform: translateX(calc(-320px * (var(--total-items) / 2))); /* Di chuyển một nửa tổng số items */
                }
            }

            /* Responsive */
            @media (max-width: 768px) {
                .slider-item {
                    flex: 0 0 260px;
                }
            }

            @media (max-width: 576px) {
                .slider-item {
                    flex: 0 0 220px;
                }
            }
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp" />
        <div class="container py-4">
            <div class="col-lg-12">
                <c:choose>
                    <c:when test="${not empty error}">
                        <div class="alert alert-danger">${error}</div>
                    </c:when>
                    <c:when test="${not empty post}">
                        <article class="article-container p-4 p-md-5">
                            <h1 class="post-title mb-3">
                                ${post.title}
                                <c:if test="${post.isIsFeatured()}">
                                    <span class="badge featured-badge ms-2"><i class="fas fa-star me-1"></i>Nổi bật</span>
                                </c:if>
                            </h1>
                            <div class="post-meta">
                                <div class="author-info d-flex align-items-center justify-content-between">
                                    <div>
                                        <i class="fas fa-user me-2"></i><strong>Tác giả:</strong> ${post.user.fullName}
                                    </div>
                                    <div>
                                        <c:choose>
                                            <c:when test="${post.updatedAt != null}">
                                                <i class="fas fa-edit me-2"></i><strong>Cập nhật:</strong> ${post.updatedAt}
                                                </c:when>
                                                <c:otherwise>
                                                <i class="fas fa-calendar me-2"></i><strong>Ngày đăng:</strong> ${post.createdAt}
                                                </c:otherwise>
                                            </c:choose>
                                    </div>
                                </div>
                            </div>                     
                            <div class="text-center mb-4">
                                <img src="${post.getThumbnail()}" alt="${post.title}" class="img-fluid post-thumbnail">
                            </div>
                            <div class="post-content">
                                <div class="content-wrapper">
                                    ${post.content}
                                </div>
                            </div>
                        </article>

                        <c:if test="${not empty relatedPosts && relatedPosts.size() > 0}">
                            <div class="related-posts-section mt-5">
                                <h3 class="section-title mb-4">${relatedTitle}</h3>

                                <div class="continuous-slider-container">
                                    <div class="continuous-slider">

                                        <c:forEach var="relatedPost" items="${relatedPosts}">
                                            <div class="slider-item">
                                                <div class="card post-card h-100">
                                                    <a href="${pageContext.request.contextPath}/post?id=${relatedPost.getId()}" 
                                                       class="text-decoration-none">
                                                        <div class="card-img-wrapper">
                                                            <img src="${relatedPost.getThumbnail()}" 
                                                                 class="card-img-top post-image" alt="${relatedPost.getTitle()}">
                                                        </div>
                                                        <div class="card-body">
                                                            <h5 class="card-title text-dark">
                                                                ${relatedPost.getTitle()}
                                                                <c:if test="${relatedPost.isIsFeatured()}">
                                                                    <span class="badge bg-warning ms-2"><i class="fas fa-star me-1"></i>Nổi bật</span>
                                                                </c:if>
                                                            </h5>
                                                            <p class="post-summary">${relatedPost.getSummary()}</p>
                                                            <div class="post-meta mt-3">
                                                                <i class="fas fa-user-edit me-2"></i>${relatedPost.getUser().getFullName()}
                                                                <br>
                                                                <i class="far fa-clock me-2"></i>
                                                                <c:choose>
                                                                    <c:when test="${relatedPost.getUpdatedAt() != null}">
                                                                        Cập nhật: ${relatedPost.getUpdatedAt()}
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        Ngày đăng: ${relatedPost.getCreatedAt()}
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </div>
                                                        </div>
                                                    </a>
                                                </div>
                                            </div>
                                        </c:forEach>

                                        <c:forEach var="relatedPost" items="${relatedPosts}" begin="0" end="2">
                                            <div class="slider-item">
                                                <div class="card post-card h-100">
                                                    <a href="${pageContext.request.contextPath}/post?id=${relatedPost.getId()}" 
                                                       class="text-decoration-none">
                                                        <div class="card-img-wrapper">
                                                            <img src="${relatedPost.getThumbnail()}" 
                                                                 class="card-img-top post-image" alt="${relatedPost.getTitle()}">
                                                        </div>
                                                        <div class="card-body">
                                                            <h5 class="card-title text-dark">
                                                                ${relatedPost.getTitle()}
                                                                <c:if test="${relatedPost.isIsFeatured()}">
                                                                    <span class="badge bg-warning ms-2"><i class="fas fa-star me-1"></i>Nổi bật</span>
                                                                </c:if>
                                                            </h5>
                                                            <p class="post-summary">${relatedPost.getSummary()}</p>
                                                            <div class="post-meta mt-3">
                                                                <i class="fas fa-user-edit me-2"></i>${relatedPost.getUser().getFullName()}
                                                                <br>
                                                                <i class="far fa-clock me-2"></i>
                                                                <c:choose>
                                                                    <c:when test="${relatedPost.getUpdatedAt() != null}">
                                                                        Cập nhật: ${relatedPost.getUpdatedAt()}
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        Ngày đăng: ${relatedPost.getCreatedAt()}
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </div>
                                                        </div>
                                                    </a>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </c:when>
                    <c:otherwise>
                        <div class="alert alert-warning">Không có dữ liệu để hiển thị.</div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
        <jsp:include page="chat.jsp" />
        
        <jsp:include page="footer.jsp" />
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                const slider = document.querySelector('.continuous-slider');
                if (slider) {
                    // Count the number of actual posts (not including clones)
                    const items = document.querySelectorAll('.related-posts-section .slider-item');
                    const postCount = items.length / 2; // Divide by 2 because half are clones

                    // Set CSS variable for use in animation
                    slider.style.setProperty('--total-items', postCount);

                    // Adjust speed based on number of posts
                    const duration = Math.max(30, postCount * 5); // Minimum 30s, then add 5s per post
                    slider.style.animationDuration = duration + 's';

                    // Add interaction events
                    slider.addEventListener('mouseenter', function () {
                        this.style.animationPlayState = 'paused';
                    });

                    slider.addEventListener('mouseleave', function () {
                        this.style.animationPlayState = 'running';
                    });
                }
            });
        </script>
    </body>
</html>