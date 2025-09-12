<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>${slider.title} - Chi Tiết Thanh Trượt</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
        <style>
            :root {
                --primary-color: #2c3e50;
                --secondary-color: #34495e;
                --accent-color: #3498db;
                --light-color: #ecf0f1;
                --border-color: #dee2e6;
            }

            body {
                background-color: #f8f9fa;
                font-family: 'Segoe UI', system-ui, -apple-system, sans-serif;
            }

            .main-content {
                margin-left: 250px;
                transition: all 0.3s;
                padding: 20px;
                min-height: 100vh;
            }

            .card {
                border-radius: 10px;
                box-shadow: 0 2px 15px rgba(0, 0, 0, 0.1);
                margin-bottom: 20px;
            }

            .card-header {
                background-color: #fff;
                border-bottom: 1px solid var(--border-color);
                padding: 15px 20px;
                font-weight: 600;
            }

            .slider-image {
                width: 100%;
                height: 300px;
                object-fit: cover;
                border-radius: 10px;
                margin-bottom: 1.5rem;
            }

            .form-control, .form-select {
                border-radius: 8px;
                padding: 0.75rem;
            }

            .btn {
                padding: 0.75rem 1.5rem;
                border-radius: 8px;
                font-weight: 500;
                transition: all 0.3s;
            }

            .btn:hover {
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
                    display: block;
                }
            }

            .page-title {
                color: var(--primary-color);
                margin-bottom: 20px;
                padding-bottom: 10px;
                border-bottom: 2px solid var(--accent-color);
                display: inline-block;
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
            <div class="container-fluid">
                <h2 class="page-title">
                    <i class="fas fa-images me-2"></i>Chi tiết thanh trượt
                </h2>


                <c:if test="${error != null}">
                    <div class="alert alert-danger" role="alert">
                        <i class="fas fa-exclamation-circle me-2"></i>${error}
                    </div>
                </c:if>

                <c:if test="${success != null}">
                    <div class="alert alert-success" role="alert">
                        <i class="fas fa-check-circle me-2"></i>${success}
                    </div>
                </c:if>

                <div class="row">
                    <div class="col-lg-6">
                        <div class="card h-100">
                            <div class="card-header">
                                <i class="fas fa-eye me-2"></i>Xem trước thanh trượt
                            </div>
                            <div class="card-body">
                                <img src="${slider.image_url.startsWith('https')? slider.image_url : pageContext.request.contextPath.concat('/').concat(slider.image_url)}" alt="${slider.title}" class="slider-image">

                                <h3 class="mb-3">${slider.getTitle()}</h3>
                                <div class="mb-3">
                                    <p><strong>Liên kết:</strong> <a href="${slider.getLink()}" target="_blank">${slider.getLink()}</a></p>
                                    <p><strong>Thứ tự hiển thị:</strong> ${slider.getDisplay_order()}</p>
                                    <p><strong>Trạng thái:</strong> 
                                        <span class="badge ${slider.getStatus() == 'active' ? 'bg-success' : 'bg-secondary'}">
                                            ${slider.getStatus() == 'active' ? 'Hiển thị' : 'Ẩn'}
                                        </span>
                                    </p>
                                </div>
                                <div>
                                    <h5>Ghi chú:</h5>
                                    <p class="text-muted">${slider.getNotes()}</p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-6">
                        <div class="card h-100">
                            <div class="card-header">
                                <i class="fas fa-pencil-alt me-2"></i>Chỉnh sửa thanh trượt
                            </div>
                            <div class="card-body">
                                <form id="sliderForm" method="POST" action="${pageContext.request.contextPath}/marketing/detailSlider" 
                                      enctype="multipart/form-data">
                                    <input type="hidden" name="id" value="${slider.getId()}">

                                    <div class="mb-3">
                                        <label for="title" class="form-label fw-bold">Tiêu đề</label>
                                        <input type="text" class="form-control" id="title" name="title" 
                                               value="${slider.getTitle()}" required maxlength="50">
                                        <small class="text-muted"><span id="title-char-count">0</span>/50 ký tự</small>
                                    </div>

                                    <div class="mb-3">
                                        <label for="image" class="form-label fw-bold">Hình ảnh</label>
                                        <input type="file" class="form-control" id="image" name="image" 
                                               accept="image/*">
                                        <input type="hidden" name="old_image" value="${slider.getImage_url()}">
                                    </div>

                                    <div class="mb-3">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label for="postSelect" class="form-label fw-bold">Chọn bài đăng đã xuất bản:</label>
                                                <select id="postSelect" name="selectedPost" class="form-select" onchange="toggleSelection('post')">
                                                    <option value="">-- Chọn bài đăng --</option>
                                                    <c:forEach var="post" items="${publishedPosts}">
                                                        <option value="${post.id}" ${slider.postId == post.id ? 'selected' : ''}>${post.title}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <div class="col-md-6">
                                                <label for="productSelect" class="form-label fw-bold">Chọn sản phẩm đang bán:</label>
                                                <select id="productSelect" name="selectedProduct" class="form-select" onchange="toggleSelection('product')">
                                                    <option value="">-- Chọn sản phẩm --</option>
                                                    <c:forEach var="product" items="${activeProducts}">
                                                        <option value="${product.id}" ${slider.productId == product.id ? 'selected' : ''}>${product.title}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>

                                    </div>

                                    <div class="mb-3">
                                        <label for="display_order" class="form-label fw-bold">Thứ tự hiển thị</label>
                                        <input type="number" class="form-control" id="display_order" name="display_order" 
                                               value="${slider.getDisplay_order()}" required min="1">
                                        <small class="text-muted">
                                            Thứ tự hiển thị đã tồn tại: 
                                            <c:forEach items="${existingOrders}" var="order" varStatus="status">
                                                ${order}<c:if test="${!status.last}">, </c:if>
                                            </c:forEach>
                                        </small>
                                    </div>

                                    <div class="mb-3">
                                        <label for="notes" class="form-label fw-bold">Ghi chú</label>
                                        <textarea class="form-control" id="notes" name="notes" 
                                                  rows="4" required>${slider.getNotes()}</textarea>
                                    </div>

                                    <div class="mb-4">
                                        <label for="status" class="form-label fw-bold">Trạng thái</label>
                                        <select class="form-select" id="status" name="status" required>
                                            <option value="active" ${slider.getStatus() == 'active' ? 'selected' : ''}>
                                                Hiển thị
                                            </option>
                                            <option value="inactive" ${slider.getStatus() == 'inactive' ? 'selected' : ''}>
                                                Ẩn
                                            </option>
                                        </select>
                                    </div>

                                    <div class="d-flex gap-2">
                                        <button type="submit" class="btn btn-primary">
                                            <i class="fas fa-save me-2"></i>Lưu thay đổi
                                        </button>
                                        <a href="${pageContext.request.contextPath}/marketing/sliderList" class="btn btn-outline-secondary">
                                            <i class="fas fa-arrow-left me-2"></i>Quay lại
                                        </a>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
        <script>
            // Replace the complex form validation script in sliderdetail.jsp with this one
            document.addEventListener("DOMContentLoaded", function() {
    // Initialize CKEditor
    var editor = CKEDITOR.replace('notes', {
        filebrowserUploadUrl: '${pageContext.request.contextPath}/upload',
        filebrowserUploadMethod: 'form',
        height: 400
    });
    
    // Store original values when page loads
    const originalValues = {
        title: document.getElementById("title").value,
        display_order: document.getElementById("display_order").value,
        status: document.getElementById("status").value,
        postId: document.getElementById("postSelect").value,
        productId: document.getElementById("productSelect").value
    };
    
    // Need to wait for CKEditor to be ready before getting its content
    editor.on('instanceReady', function() {
        // Store the original notes content
        originalValues.notes = editor.getData();
        
        // Add submit event listener to the form
        document.getElementById("sliderForm").addEventListener("submit", function(event) {
            // Get current values
            const currentValues = {
                title: document.getElementById("title").value,
                display_order: document.getElementById("display_order").value,
                status: document.getElementById("status").value,
                postId: document.getElementById("postSelect").value,
                productId: document.getElementById("productSelect").value,
                notes: editor.getData()
            };
            
            // Check if image was changed
            const imageInput = document.getElementById("image");
            const imageChanged = imageInput.files && imageInput.files.length > 0;
            
            // Check if any value has changed
            const hasChanges = 
                originalValues.title !== currentValues.title ||
                originalValues.display_order !== currentValues.display_order ||
                originalValues.status !== currentValues.status ||
                originalValues.postId !== currentValues.postId ||
                originalValues.productId !== currentValues.productId ||
                originalValues.notes !== currentValues.notes ||
                imageChanged;
            
            // If nothing changed, prevent form submission and redirect
            if (!hasChanges) {
                event.preventDefault();
                window.location.href = "${pageContext.request.contextPath}/marketing/sliderList";
            }
        });
    });
    
    // Character counter for title field
    const titleInput = document.getElementById("title");
    const titleCharCount = document.getElementById("title-char-count");

    // Display initial character count
    titleCharCount.textContent = titleInput.value.length;

    // Update character count when typing
    titleInput.addEventListener("input", function() {
        titleCharCount.textContent = titleInput.value.length;
    });
    
    // Display order warning
    const displayOrderInput = document.getElementById("display_order");
    const existingOrders = [
            <c:forEach items="${existingOrders}" var="order" varStatus="status">
                ${order}<c:if test="${!status.last}">,</c:if>
            </c:forEach>
    ];

    displayOrderInput.addEventListener("input", function() {
        const value = parseInt(this.value);
        const warningElement = document.getElementById("display-order-warning") || 
                            document.createElement("small");
        
        if (!warningElement.id) {
            warningElement.id = "display-order-warning";
            warningElement.classList.add("text-danger", "d-block", "mt-1");
            this.parentNode.appendChild(warningElement);
        }
        
        if (existingOrders.includes(value)) {
            warningElement.textContent = "Cảnh báo: Thứ tự này đã tồn tại!";
            warningElement.style.display = "block";
        } else {
            warningElement.style.display = "none";
        }
    });
});

// Initialize CKEditor
            var editor = CKEDITOR.replace('notes', {
                filebrowserUploadUrl: '${pageContext.request.contextPath}/upload',
                filebrowserUploadMethod: 'form',
                height: 400
            });

            $(document).ready(function () {
                // Initialize CKEditor
                var editor = CKEDITOR.replace('notes', {
                    filebrowserUploadUrl: '${pageContext.request.contextPath}/upload',
                    filebrowserUploadMethod: 'form',
                    height: 400
                });

                // Set up form validation
                $('#sliderForm').on('submit', function (event) {
                    var notesContent = CKEDITOR.instances.notes.getData().trim();

                    // If notes is empty, show custom alert and prevent form submission
                    if (notesContent === '') {
                        alert('Vui lòng nhập ghi chú.'); // Custom message: "Please enter notes"
                        event.preventDefault(); // Prevent form submission
                        return false;
                    }

                    // Update the textarea with CKEditor content
                    document.getElementById('notes').value = notesContent;
                });

                // Character counter for title field
                const titleInput = document.getElementById("title");
                const titleCharCount = document.getElementById("title-char-count");

                // Display initial character count
                titleCharCount.textContent = titleInput.value.length;

                // Update character count when typing
                titleInput.addEventListener("input", function () {
                    titleCharCount.textContent = titleInput.value.length;
                });
            });
            
            // Add this inside the document.addEventListener("DOMContentLoaded", function () {...}) block
const displayOrderInput = document.getElementById("display_order");
const existingOrders = [
                    <c:forEach items="${existingOrders}" var="order" varStatus="status">
                        ${order}<c:if test="${!status.last}">,</c:if>
                    </c:forEach>
];

displayOrderInput.addEventListener("input", function() {
    const value = parseInt(this.value);
    const warningElement = document.getElementById("display-order-warning") || 
                           document.createElement("small");
    
    if (!warningElement.id) {
        warningElement.id = "display-order-warning";
        warningElement.classList.add("text-danger", "d-block", "mt-1");
        this.parentNode.appendChild(warningElement);
    }
    
    if (existingOrders.includes(value)) {
        warningElement.textContent = "Cảnh báo: Thứ tự này đã tồn tại!";
        warningElement.style.display = "block";
    } else {
        warningElement.style.display = "none";
    }
});
            
        </script>
        <script>
        function toggleSelection(selected) {
            if (selected === 'post') {
                // If post is selected with a valid value, clear product
                if (document.getElementById('postSelect').value !== '') {
                    document.getElementById('productSelect').value = '';
                }
            } else if (selected === 'product') {
                // If product is selected with a valid value, clear post
                if (document.getElementById('productSelect').value !== '') {
                    document.getElementById('postSelect').value = '';
                }
            }
        }

        function resetSelections() {
            // Reset both dropdown selections
            document.getElementById('postSelect').value = '';
            document.getElementById('productSelect').value = '';
        }

        // Initialize the form to handle the existing state
        document.addEventListener("DOMContentLoaded", function() {
            // If either dropdown has a value on page load, make sure the other is empty
            if (document.getElementById('postSelect').value !== '') {
                document.getElementById('productSelect').value = '';
            } else if (document.getElementById('productSelect').value !== '') {
                document.getElementById('postSelect').value = '';
            }
        });
        </script>
    </body>
</html>