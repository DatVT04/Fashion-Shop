<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Chi tiết danh mục</title>
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

            .info-label {
                font-weight: 600;
                color: var(--primary-color);
                margin-bottom: 5px;
            }

            .table {
                margin-bottom: 0;
            }

            .table th {
                font-weight: 600;
                border-top: none;
                background-color: rgba(52, 152, 219, 0.05);
                vertical-align: middle;
            }

            .table td {
                vertical-align: middle;
            }

            .table tbody tr:hover {
                background-color: var(--hover-color);
            }

            .breadcrumb {
                background-color: transparent;
                padding: 0;
                margin-bottom: 1rem;
            }

            .breadcrumb-item a {
                color: var(--accent-color);
                text-decoration: none;
            }

            .breadcrumb-item.active {
                color: var(--primary-color);
            }

            .status-badge {
                padding: 6px 12px;
                border-radius: 20px;
                font-size: 14px;
            }

            .info-message {
                font-size: 13px;
                color: #dc3545;
                display: flex;
                align-items: center;
                margin-top: 8px;
                padding: 8px 12px;
                background-color: rgba(220, 53, 69, 0.1);
                border-radius: 4px;
            }

            .parent-inactive-alert {
                font-size: 13px;
                color: #dc3545;
                display: flex;
                align-items: center;
                margin-top: 8px;
                padding: 8px 12px;
                background-color: rgba(220, 53, 69, 0.1);
                border-radius: 4px;
            }

            .back-btn {
                color: #fff;
                background-color: #6c757d;
                border-color: #6c757d;
                padding: 0.375rem 0.75rem;
                font-size: 1rem;
                border-radius: 0.25rem;
                text-decoration: none;
                display: inline-block;
                transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out, border-color 0.15s ease-in-out;
            }

            .back-btn:hover {
                color: #fff;
                background-color: #5a6268;
                border-color: #545b62;
            }

            .status-info {
                font-size: 12px;
                color: #dc3545;
                margin-top: 5px;
            }

            .form-group {
                margin-bottom: 1rem;
            }

            .card-body {
                padding: 1.5rem;
            }

            .btn-group {
                margin-top: 1.5rem;
            }

            @media (max-width: 768px) {
                .main-content {
                    margin-left: 0;
                }
            }
        </style>
    </head>
    <body>
        <!-- Include the sidebar -->
        <jsp:include page="/admin/adminsidebar.jsp" />

        <div class="main-content">
            <div class="container-fluid p-4">
                <!-- Breadcrumb -->
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="categorylists">Danh sách danh mục</a></li>
                        <li class="breadcrumb-item active">Chi tiết danh mục</li>
                    </ol>
                </nav>

                <!-- Alerts -->
                <c:if test="${not empty param.message}">
                    <div class="alert alert-success alert-dismissible fade show">
                        <i class="fas fa-check-circle me-2"></i>${param.message}
                        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                    </div>
                </c:if>
                <c:if test="${not empty param.error}">
                    <div class="alert alert-danger alert-dismissible fade show">
                        <i class="fas fa-exclamation-circle me-2"></i>${param.error}
                        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                    </div>
                </c:if>

                <h2 class="page-title">
                    <i class="fas fa-folder-open me-2"></i>Chi tiết danh mục
                </h2>

                <!-- Category Details Card -->
                <div class="card" id="categoryForm">
                    <div class="card-header">
                        <i class="fas fa-info-circle me-2"></i>Thông tin danh mục
                    </div>
                    <div class="card-body">
                        <form action="categorydetail" method="post">
                            <input type="hidden" name="id" value="${category.id}">
                            
                            <div class="row">
                                <div class="col-md-6">
                                    <!-- Category Name -->
                                    <div class="form-group">
                                        <label class="info-label" for="categoryName">Tên danh mục</label>
                                        <input type="text" id="categoryName" name="name" class="form-control" 
                                               value="${category.name}" required>
                                    </div>

                                    <!-- Level (Parent Category Selection) -->
                                    <div class="form-group">
                                        <label class="info-label" for="parentCategory">Cấp độ</label>
                                        <select name="parentId" class="form-select" id="parentCategory" onchange="checkParentStatus()">
                                            <option value="" data-status="active">Không có (Danh mục cấp 1)</option>
                                            <c:forEach items="${potentialParents}" var="parent">
                                                <c:if test="${parent.id != category.id}">
                                                    <option value="${parent.id}" 
                                                            ${parent.id == category.parentId ? 'selected' : ''}
                                                            data-level="${parent.level}"
                                                            data-status="${parent.status}">
                                                        ${parent.name}
                                                        (Cấp ${parent.level}) 
                                                        ${parent.status == 'inactive' ? '- Không hoạt động' : ''}
                                                    </option>
                                                </c:if>
                                            </c:forEach>
                                        </select>
                                        <div id="parentStatusAlert" class="parent-inactive-alert" style="display: none;">
                                            <i class="fas fa-exclamation-triangle me-2"></i>
                                            Danh mục cha đang không hoạt động. Danh mục này sẽ tự động được đặt thành không hoạt động.
                                        </div>
                                    </div>

                                    <!-- Status -->
                                    <div class="form-group">
                                        <label class="info-label" for="categoryStatus">Trạng thái</label>
                                        <select name="status" class="form-select" id="categoryStatus">
                                            <option value="active" ${category.status == 'active' ? 'selected' : ''}>
                                                Hoạt động
                                            </option>
                                            <option value="inactive" ${category.status == 'inactive' ? 'selected' : ''}>
                                                Không hoạt động
                                            </option>
                                        </select>
                                        <div class="info-message" id="statusInfo">
                                            <i class="fas fa-info-circle me-2"></i>
                                            Lưu ý: Khi thay đổi trạng thái, tất cả danh mục con sẽ tự động kế thừa trạng thái này.
                                        </div>
                                        
                                        <c:if test="${parentCategory != null && parentCategory.status == 'inactive'}">
                                            <div class="parent-inactive-alert mt-2">
                                                <i class="fas fa-exclamation-triangle me-2"></i>
                                                Danh mục cha đang không hoạt động.
                                            </div>
                                        </c:if>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <!-- Parent Category Info -->
                                    <div class="form-group">
                                        <div class="info-label">Danh mục cha</div>
                                        <div>
                                            <c:choose>
                                                <c:when test="${parentCategory != null}">
                                                    <a href="categorydetail?id=${parentCategory.id}" class="text-primary">
                                                        ${parentCategory.name}
                                                    </a>
                                                    <c:if test="${parentCategory.status == 'inactive'}">
                                                        <span class="badge bg-danger ms-2">Không hoạt động</span>
                                                    </c:if>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="text-muted">Danh mục gốc</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                    </div>

                                    <!-- Description -->
                                    <div class="form-group">
                                        <label class="info-label" for="description">Mô tả</label>
                                        <textarea id="description" name="description" class="form-control" rows="5">${category.description}</textarea>
                                    </div>
                                </div>
                            </div>

                            <!-- Action Buttons -->
                            <div class="btn-group">
                                <button type="submit" class="btn btn-success">
                                    <i class="fas fa-save me-2"></i>Lưu thay đổi
                                </button>
                                <a href="categorylists" class="btn btn-secondary ms-2">
                                    <i class="fas fa-times me-2"></i>Hủy
                                </a>
                            </div>
                        </form>
                    </div>
                </div>

                <!-- Child Categories Card -->
                <div class="card">
                    <div class="card-header">
                        <i class="fas fa-sitemap me-2"></i>Danh mục con
                    </div>
                    <div class="card-body p-0">
                        <c:choose>
                            <c:when test="${!empty childCategories}">
                                <div class="table-responsive">
                                    <table class="table table-hover table-bordered mb-0">
                                        <thead>
                                            <tr class="bg-light">
                                                <th class="text-center" style="width: 60px;">STT</th>
                                                <th>Tên danh mục</th>
                                                <th>Mô tả</th>
                                                <th>Trạng thái</th>
                                                <th class="text-center">Thao tác</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${childCategories}" var="child" varStatus="status">
                                                <tr>
                                                    <td class="text-center">${status.index + 1}</td>
                                                    <td>${child.name}</td>
                                                    <td>${child.description}</td>
                                                    <td>
                                                        <span class="badge ${child.status == 'active' ? 'bg-success' : 'bg-danger'}">
                                                            ${child.status == 'active' ? 'Hoạt động' : 'Không hoạt động'}
                                                        </span>
                                                    </td>
                                                    <td class="text-center">
                                                        <a href="categorydetail?id=${child.id}" class="btn btn-info btn-sm">
                                                            <i class="fas fa-eye"></i>
                                                        </a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="p-4 text-center text-muted">
                                    <i class="fas fa-info-circle me-2"></i>Không có danh mục con
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>

                <!-- Bottom Action Buttons -->
                <div class="mt-4">
                    <a href="categorylists" class="btn btn-secondary">
                        <i class="fas fa-arrow-left me-2"></i>Quay lại
                    </a>
                    <c:if test="${empty childCategories}">
                        <button onclick="deleteCategory(${category.id})" class="btn btn-danger">
                            <i class="fas fa-trash me-2"></i>Xóa
                        </button>
                    </c:if>
                    <c:if test="${not empty childCategories}">
                        <button class="btn btn-danger" disabled 
                                data-bs-toggle="tooltip" 
                                title="Không thể xóa danh mục có danh mục con">
                            <i class="fas fa-trash me-2"></i>Xóa
                        </button>
                    </c:if>
                </div>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>

        <script>
            function deleteCategory(categoryId) {
                if (confirm('Bạn có chắc chắn muốn xóa danh mục này?')) {
                    window.location.href = 'categorydelete?id=' + categoryId;
                }
            }

            function checkParentStatus() {
                var parentSelect = document.getElementById('parentCategory');
                var statusSelect = document.getElementById('categoryStatus');
                var parentAlert = document.getElementById('parentStatusAlert');
                
                if (parentSelect.selectedIndex !== -1) {
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
                }
            }

            // Initialize page
            $(document).ready(function () {
                
                // Initialize tooltips
                var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
                var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
                    return new bootstrap.Tooltip(tooltipTriggerEl)
                });
                
                // Check parent status on page load
                checkParentStatus();
            });
        </script>
    </body>
</html>