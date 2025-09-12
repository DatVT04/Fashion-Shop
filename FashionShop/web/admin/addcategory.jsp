<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Thêm danh mục</title>
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
            
            .page-title {
                color: var(--primary-color);
                margin-bottom: 20px;
                padding-bottom: 10px;
                border-bottom: 2px solid var(--accent-color);
                display: inline-block;
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
            
            .form-label {
                font-weight: 500;
                color: var(--primary-color);
                margin-bottom: 8px;
            }
            
            .required-field::after {
                content: " *";
                color: red;
            }
            
            .form-control, .form-select {
                border-radius: 6px;
                border: 1px solid var(--border-color);
                padding: 10px 15px;
            }
            
            .form-text {
                color: #6c757d;
                font-size: 0.875rem;
            }
            
            @media (max-width: 768px) {
                .main-content {
                    margin-left: 0;
                }
            }
            
            .parent-inactive-alert {
                font-size: 13px;
                color: #dc3545;
                display: none;
                align-items: center;
                margin-top: 8px;
                padding: 8px 12px;
                background-color: rgba(220, 53, 69, 0.1);
                border-radius: 4px;
            }
        </style>
    </head>
    <body>
        <!-- Include the sidebar -->
        <jsp:include page="/admin/adminsidebar.jsp" />
        
        <div class="main-content">
            <div class="container-fluid p-4">
                <h2 class="page-title">
                    <i class="fas fa-folder-plus me-2"></i>Thêm danh mục
                </h2>

                <!-- Alerts -->
                <c:if test="${not empty error}">
                    <div class="alert alert-danger alert-dismissible fade show">
                        <i class="fas fa-exclamation-circle me-2"></i>${error}
                        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                    </div>
                </c:if>
                <c:if test="${not empty param.error}">
                    <div class="alert alert-danger alert-dismissible fade show">
                        <i class="fas fa-exclamation-circle me-2"></i>${param.error}
                        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                    </div>
                </c:if>
                <c:if test="${not empty param.message}">
                    <div class="alert alert-success alert-dismissible fade show">
                        <i class="fas fa-check-circle me-2"></i>${param.message}
                        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                    </div>
                </c:if>

                <!-- Add Category Form -->
                <div class="card">
                    <div class="card-header">
                        <i class="fas fa-plus-circle me-2"></i>Thông tin danh mục
                    </div>
                    <div class="card-body">
                        <form action="categoryadd" method="post" class="needs-validation" novalidate>
                            <div class="row">
                                <div class="col-md-6">
                                    <!-- Category Name -->
                                    <div class="mb-3">
                                        <label class="form-label required-field">Tên danh mục</label>
                                        <input type="text" name="name" class="form-control" required 
                                               placeholder="Nhập tên danh mục" value="${categoryName}">
                                        <div class="invalid-feedback">
                                            Vui lòng nhập tên danh mục
                                        </div>
                                    </div>

                                    <!-- Parent Category -->
                                    <div class="mb-3">
                                        <label class="form-label">Danh mục cha</label>
                                        <select name="parentId" class="form-select" id="parentCategory" onchange="checkParentStatus()">
                                            <option value="">Không có (Danh mục cấp 1)</option>
                                            <c:forEach items="${potentialParents}" var="parent">
                                                <option value="${parent.id}" 
                                                        data-level="${parent.level}" 
                                                        data-status="${parent.status}"
                                                        ${parent.id == categoryParentId ? 'selected' : ''}>
                                                    ${parent.name}
                                                    <c:if test="${parent.level == 1}">
                                                        (Cấp 1)
                                                    </c:if>
                                                    <c:if test="${parent.level == 2}">
                                                        (Cấp 2)
                                                    </c:if>
                                                    ${parent.status == 'inactive' ? '- Không hoạt động' : ''}
                                                </option>
                                            </c:forEach>
                                        </select>
                                        <div id="parentStatusAlert" class="parent-inactive-alert">
                                            <i class="fas fa-exclamation-triangle me-2"></i>
                                            Danh mục cha đang không hoạt động. Danh mục này sẽ tự động được đặt thành không hoạt động.
                                        </div>
                                        <div class="form-text">
                                            <i class="fas fa-info-circle me-1"></i>
                                            Cấp độ danh mục:<br>
                                            - Không chọn: tạo danh mục cấp 1<br>
                                            - Chọn danh mục cấp 1: tạo danh mục cấp 2<br>
                                            - Chọn danh mục cấp 2: tạo danh mục cấp 3
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <!-- Description -->
                                    <div class="mb-3">
                                        <label class="form-label">Mô tả</label>
                                        <textarea name="description" class="form-control" rows="3" 
                                                  placeholder="Nhập mô tả cho danh mục">${categoryDescription}</textarea>
                                    </div>

                                    <!-- Status -->
                                    <div class="mb-3">
                                        <label class="form-label">Trạng thái</label>
                                        <select name="status" class="form-select" id="categoryStatus">
                                            <option value="active" ${categoryStatus == 'active' || empty categoryStatus ? 'selected' : ''}>Hoạt động</option>
                                            <option value="inactive" ${categoryStatus == 'inactive' ? 'selected' : ''}>Không hoạt động</option>
                                        </select>
                                        <div class="form-text">
                                            <i class="fas fa-info-circle me-1"></i>
                                            Lưu ý: Khi đặt trạng thái không hoạt động, tất cả danh mục con sẽ tự động chuyển sang không hoạt động.
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Hidden level field -->
                            <input type="hidden" name="level" id="categoryLevel" value="1">

                            <!-- Form Actions -->
                            <div class="d-flex gap-2 mt-4">
                                <a href="categorylists" class="btn btn-secondary">
                                    <i class="fas fa-arrow-left me-2"></i>Quay lại
                                </a>
                                <button type="submit" class="btn btn-primary">
                                    <i class="fas fa-save me-2"></i>Thêm danh mục
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
        
        <script>
            // Form validation
            (function () {
                'use strict'
                var forms = document.querySelectorAll('.needs-validation')
                Array.prototype.slice.call(forms).forEach(function (form) {
                    form.addEventListener('submit', function (event) {
                        if (!form.checkValidity()) {
                            event.preventDefault()
                            event.stopPropagation()
                        }
                        form.classList.add('was-validated')
                    }, false)
                })
            })()

            // Auto update level
            document.getElementById('parentCategory').addEventListener('change', function() {
                const selectedOption = this.options[this.selectedIndex];
                const levelInput = document.getElementById('categoryLevel');
                
                if (this.value === '') {
                    levelInput.value = 1;
                } else {
                    const parentLevel = parseInt(selectedOption.dataset.level);
                    levelInput.value = parentLevel + 1;
                }
                
                // Kiểm tra trạng thái danh mục cha
                checkParentStatus();
            });
            
            // Kiểm tra trạng thái danh mục cha
            function checkParentStatus() {
                var parentSelect = document.getElementById('parentCategory');
                var statusSelect = document.getElementById('categoryStatus');
                var parentAlert = document.getElementById('parentStatusAlert');
                
                if (parentSelect.selectedIndex > 0) { // Nếu đã chọn danh mục cha
                    var option = parentSelect.options[parentSelect.selectedIndex];
                    var parentStatus = option.getAttribute('data-status');
                    
                    if (parentStatus === 'inactive') {
                        // Parent is inactive, force this category to be inactive
                        parentAlert.style.display = 'flex';
                        statusSelect.value = 'inactive';
                        statusSelect.disabled = true;
                    } else {
                        // Parent is active, allow any status
                        parentAlert.style.display = 'none';
                        statusSelect.disabled = false;
                    }
                } else {
                    // No parent selected
                    parentAlert.style.display = 'none';
                    statusSelect.disabled = false;
                }
            }
        </script>
    </body>
</html>