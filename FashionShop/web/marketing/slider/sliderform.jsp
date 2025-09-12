<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Thêm Thanh Trượt</title>
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
                border-radius: 6px;
                border: 1px solid var(--border-color);
                padding: 8px 12px;
            }
            
            .form-control:focus, .form-select:focus {
                border-color: var(--accent-color);
                box-shadow: 0 0 0 0.2rem rgba(52, 152, 219, 0.25);
            }
            
            .preview-image {
                max-width: 200px;
                max-height: 200px;
                object-fit: cover;
                border-radius: 8px;
                box-shadow: 0 2px 5px rgba(0,0,0,0.1);
                margin-top: 10px;
            }
            
            .btn-submit {
                background-color: var(--accent-color);
                border: none;
                padding: 10px 20px;
                font-weight: 500;
                transition: all 0.3s;
            }
            
            .btn-submit:hover {
                background-color: #2980b9;
                transform: translateY(-2px);
                box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            }
            
            .btn-cancel {
                background-color: #95a5a6;
                border: none;
                padding: 10px 20px;
                font-weight: 500;
                transition: all 0.3s;
            }
            
            .btn-cancel:hover {
                background-color: #7f8c8d;
                transform: translateY(-2px);
                box-shadow: 0 2px 5px rgba(0,0,0,0.1);
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
            
            @media (max-width: 768px) {
                .main-content {
                    margin-left: 0;
                }
                .main-content.active {
                    margin-left: 250px;
                }
                .sidebar-toggle {
                    display: flex;
                    align-items: center;
                    justify-content: center;
                }
            }
        </style>
        <script src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
    </head>
    <body>
        <jsp:include page="../sidebar.jsp" />
        
        <button class="btn btn-primary sidebar-toggle">
            <i class="fas fa-bars"></i>
        </button>

        <div class="main-content">
            <div class="container-fluid p-4">
                <h2 class="page-title">
                    <i class="fas fa-images me-2"></i>Thêm thanh trượt mới
                </h2>
                
                <c:if test="${success != null}">
                    <div class="alert alert-success" role="alert">
                        <i class="fas fa-check-circle me-2"></i>${success}
                    </div>
                </c:if>
                
                <div class="card">
                    <div class="card-header">
                        <i class="fas fa-pen me-2"></i>Thông tin thanh trượt
                    </div>
                    <div class="card-body">
                        <c:if test="${error != null}">
                            <div class="alert alert-danger" role="alert">
                                <i class="fas fa-exclamation-circle me-2"></i>${error}
                            </div>
                        </c:if>

                        <form method="post" action="${pageContext.request.contextPath}/marketing/addSlider" 
                              enctype="multipart/form-data" class="row g-3">
                            <input type="hidden" name="action" value="create">

                            <div class="col-md-12">
                                <label for="title" class="form-label">Tiêu đề</label>
                                <input type="text" class="form-control" id="title" name="title" required maxlength="50">
                                <small class="text-muted"><span id="title-char-count">0</span>/50 ký tự</small>
                            </div>

                            <div class="col-md-12">
                                <label for="image_url" class="form-label">Hình ảnh</label>
                                <input type="file" class="form-control" id="image_url" name="image_url" 
                                       accept="image/*" required onchange="previewImage(this)">
                                <img id="image-preview" class="preview-image mt-2" style="display: none;">
                            </div>

                            <div class="col-md-12">
                                <div class="row">
                                    <div class="col-md-6">
                                        <label for="postSelect" class="form-label">Chọn bài đăng đã xuất bản:</label>
                                        <select id="postSelect" name="selectedPost" class="form-select" onchange="toggleSelection('post')">
                                            <option value="">-- Chọn bài đăng --</option>
                                            <c:forEach var="post" items="${publishedPosts}">
                                                <option value="${post.id}">${post.title}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="productSelect" class="form-label">Chọn sản phẩm đang bán:</label>
                                        <select id="productSelect" name="selectedProduct" class="form-select" onchange="toggleSelection('product')">
                                            <option value="">-- Chọn sản phẩm --</option>
                                            <c:forEach var="product" items="${activeProducts}">
                                                <option value="${product.id}">${product.title}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                
                            </div>

                            

                            <div class="col-md-6">
                                <label for="display_order" class="form-label">Thứ tự hiển thị</label>
                                <input type="number" class="form-control" id="display_order" 
                                       name="display_order" min="1" required>
                                <small class="text-muted">
                                    Thứ tự hiển thị đã tồn tại: 
                                    <c:forEach items="${existingOrders}" var="order" varStatus="status">
                                        ${order}<c:if test="${!status.last}">, </c:if>
                                    </c:forEach>
                                </small>
                            </div>

                            <div class="col-md-6">
                                <label for="status" class="form-label">Trạng thái</label>
                                <select class="form-select" id="status" name="status" required>
                                    <option value="active">Hiển thị</option>
                                    <option value="inactive">Ẩn</option>
                                </select>
                            </div>

                            <div class="col-md-12">
                                <label for="notes" class="form-label">Ghi chú</label>
                                <textarea class="form-control" id="notes" name="notes" rows="3"></textarea>
                            </div>
                            

                            <div class="col-12 mt-4">
                                <div class="d-flex justify-content-end gap-2">                                   
                                    <a href="${pageContext.request.contextPath}/marketing/sliderList" class="btn btn-secondary btn-cancel">
                                        <i class="fas fa-times me-2"></i>Quay lại
                                    </a>
                                    <button type="submit" class="btn btn-primary btn-submit">
                                        <i class="fas fa-save me-2"></i>Lưu thanh trượt
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
        <script>
    document.addEventListener("DOMContentLoaded", function () {
        const titleInput = document.getElementById("title");
        const titleCharCount = document.getElementById("title-char-count");

        // Hiển thị số ký tự ban đầu
        titleCharCount.textContent = titleInput.value.length;

        // Cập nhật khi nhập dữ liệu
        titleInput.addEventListener("input", function () {
            titleCharCount.textContent = titleInput.value.length;
        });
    });
        </script>
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
                        if (!$(e.target).closest('.sidebar').length && 
                            !$(e.target).closest('.sidebar-toggle').length) {
                            $('.sidebar').removeClass('active');
                            $('.main-content').removeClass('active');
                            $('.sidebar-toggle').show();
                        }
                    }
                });
            });
            
            // Image preview functionality
            function previewImage(input) {
                const preview = document.getElementById('image-preview');
                if (input.files && input.files[0]) {
                    const reader = new FileReader();
                    reader.onload = function(e) {
                        preview.src = e.target.result;
                        preview.style.display = 'block';
                    }
                    reader.readAsDataURL(input.files[0]);
                } else {
                    preview.style.display = 'none';
                }
            }
            // Initialize CKEditor
            CKEDITOR.replace('notes', {
                filebrowserUploadUrl: '${pageContext.request.contextPath}/upload',
                filebrowserUploadMethod: 'form',
                height: 400
            });
            
            // Function to toggle selection between post and product
            function toggleSelection(selected) {
                if (selected === 'post') {
                    if (document.getElementById('postSelect').value !== '') {
                        document.getElementById('productSelect').value = '';
                    }
                } else if (selected === 'product') {
                    if (document.getElementById('productSelect').value !== '') {
                        document.getElementById('postSelect').value = '';
                    }
                }
            }
            
            // Function to reset both selections
            function resetSelections() {
                document.getElementById('postSelect').value = '';
                document.getElementById('productSelect').value = '';
            }
        </script>
        <script>
    $(document).ready(function() {
    // Kiểm tra CKEditor khi submit
    $('form').on('submit', function(event) {
        var notes = CKEDITOR.instances['notes'].getData().trim(); // Lấy dữ liệu từ CKEditor

        if (notes === '') {
            alert('Vui lòng nhập ghi chú.'); // Hiển thị cảnh báo giống HTML mặc định
            event.preventDefault(); // Ngăn form gửi đi
            return;
        }
        
        // Kiểm tra xem đã chọn post hoặc product chưa
        var postSelected = $('#postSelect').val();
        var productSelected = $('#productSelect').val();
        
        if (postSelected === '' && productSelected === '') {
            alert('Vui lòng chọn một trong hai: Bài đăng hoặc Sản phẩm.');
            event.preventDefault();
            return;
        }
    });
});
        </script>
    </body>
</html>