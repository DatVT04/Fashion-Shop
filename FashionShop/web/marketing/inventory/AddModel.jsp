<%-- 
    Document   : AddModel
    Created on : Feb 17, 2025, 2:18:57 AM
    Author     : nguye
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Add New Model</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
        <style>
            .main-content {
                margin-left: 250px;
                transition: all 0.3s;
                padding: 10px;
            }

            .main-content .container {
                padding: 1rem;
                background-color: #fff;
                border: 1px solid #dee2e6;
                border-radius: 0.25rem;
                box-shadow: 0 0.125rem 0.25rem rgba(0, 0, 0, 0.075);
            }

            .info-section {
                border: 1px solid #dee2e6;
                border-radius: 0.25rem;
                padding: 1.5rem;
                margin-bottom: 1.5rem;
                background-color: #f8f9fa;
            }

            .info-section h5 {
                margin-top: 0;
                border-bottom: 1px solid #dee2e6;
                padding-bottom: 0.5rem;
                margin-bottom: 1rem;
                color: #495057;
                font-weight: 600;
            }

            .model-table-container {
                max-height: 400px;
                overflow-y: auto;
                border: 1px solid #dee2e6;
                border-radius: 0.25rem;
                margin-bottom: 1.5rem;
            }

            .model-table-container table {
                margin-bottom: 0;
            }

            .model-table-container .table-bordered th,
            .model-table-container .table-bordered td {
                border-color: #dee2e6;
            }

            .form-floating .form-select {
                padding-top: 1.625rem;
                padding-bottom: 0.375rem;
            }

            .form-floating label {
                font-size: 0.875rem;
                color: #6c757d;
            }

            .row.g-3 > div {
                margin-bottom: 1rem;
            }

            .select2-container--default .select2-selection--single {
                height: calc(3.5rem + 2px);
                padding: 0.375rem 0.75rem;
                border-radius: 0.25rem;
                border: 1px solid #ced4da;
                outline: none;
            }

            .select2-container--default.select2-container--focus .select2-selection--single,
            .select2-container--default.select2-container--open .select2-selection--single {
                border-color: #80bdff;
                box-shadow: 0 0 0 0.25rem rgba(0, 123, 255, 0.25);
                outline: 0 !important;
            }

            .select2-container--default .select2-selection--single .select2-selection__rendered {
                line-height: calc(3.5rem - 12px);
                padding-top: 0.3rem;
                padding-left: 0;
                vertical-align: bottom;
            }

            .select2-container--default .select2-selection--single .select2-selection__arrow {
                height: calc(3.5rem - 6px);
            }

            .form-control:hover, .form-select:hover, .select2-selection:hover {
                border-color: #80bdff;
            }

            .form-control:focus, .form-select:focus {
                box-shadow: 0 0 0 0.25rem rgba(0, 123, 255, 0.25);
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

            .sidebar-toggle {
                position: fixed;
                left: 10px;
                top: 10px;
                z-index: 1001;
                display: none;
            }

            @media (max-width: 768px) {
                .sidebar-toggle {
                    display: block;
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
            <div class="container py-4">
                <c:if test="${not empty errorMessage}">
                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        ${errorMessage}
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </c:if>

                <div class="info-section">
                    <h5>Thêm Mẫu Mới</h5>
                    <form action="addModel" method="POST">
                        <input type="hidden" name="productId" value="${productId}">
                        <input type="hidden" name="source" value="${param.source}">

                        <div class="row g-3">
                            <div class="col-md-4">
                                <div class="form-floating">
                                    <select class="form-select" id="colorInput" name="color" required>
                                        <option value="" disabled selected>Chọn hoặc nhập màu sắc</option>
                                        <c:forEach var="color" items="${colorList}">
                                            <option value="${color.name}" ${color.name == param.color ? 'selected' : ''}>${color.name}</option>
                                        </c:forEach>
                                    </select>
                                    <label for="colorInput">Màu sắc</label>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-floating">
                                    <select class="form-select" id="sizeInput" name="size" required>
                                        <option value="" disabled selected>Chọn hoặc nhập kích thước</option>
                                        <c:forEach var="size" items="${sizeList}">
                                            <option value="${size.name}" ${size.name == param.size ? 'selected' : ''}>${size.name}</option>
                                        </c:forEach>
                                    </select>
                                    <label for="sizeInput">Kích thước</label>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-floating">
                                    <input type="number" class="form-control" id="quantity" name="quantity" required min="0">
                                    <label for="quantity">Số lượng</label>
                                </div>
                            </div>
                        </div>


                        <div class="d-flex justify-content-between mt-4">
                            <a onclick="history.back()" class="btn btn-secondary">
                                <i class="fas fa-arrow-left me-2"></i>Quay lại
                            </a>
                            <button type="submit" class="btn btn-primary">
                                <i class="fas fa-plus me-2"></i>Thêm mới
                            </button>
                        </div>
                    </form>
                </div>
                <!-- Model Table Section -->
                <div class="info-section mt-4">
                    <h5 class="mb-3">Mẫu sản phẩm có sẵn</h5>
                    <div class="model-table-container">
                        <table class="table table-bordered table-hover" id="variantTable">
                            <thead class="table-light sticky-top">
                                <tr>
                                    <th>Màu sắc</th>
                                    <th>Kích thước</th>
                                    <th>Ngày cập nhật</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${variants}" var="variant">
                                    <tr>
                                        <td>${variant.color.name}</td>
                                        <td>${variant.size.name}</td>
                                        <td><fmt:formatDate value="${variant.lastRestockDate}" pattern="dd/MM/yyyy"/></td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
        <script>
            $(document).ready(function () {
                // Khởi tạo Select2 cho màu sắc
                $('#colorInput').select2({
                    placeholder: "Chọn hoặc nhập màu sắc",
                    tags: true,
                    width: '100%',
                    dropdownParent: $('#colorInput').closest('.form-floating'),
                    templateSelection: function(data) {
                        if (data.id) {
                            return $('<span style="padding-top: 0.5rem; display: block;">' + data.text + '</span>');
                        }
                        return data.text;
                    }
                });

                // Khởi tạo Select2 cho kích thước
                $('#sizeInput').select2({
                    placeholder: "Chọn hoặc nhập kích thước",
                    tags: true,
                    width: '100%',
                    dropdownParent: $('#sizeInput').closest('.form-floating'),
                    templateSelection: function(data) {
                        if (data.id) {
                            return $('<span style="padding-top: 0.5rem; display: block;">' + data.text + '</span>');
                        }
                        return data.text;
                    }
                });

                // Loại bỏ đường viền đen sau khi nhấn Enter
                $(document).on('keydown', '.select2-search__field', function(event) {
                    if (event.keyCode === 13) {
                        setTimeout(function() {
                            $('.select2-container--focus .select2-selection').css('outline', 'none');
                        }, 10);
                    }
                });

                // Lọc bảng động khi thay đổi màu sắc hoặc kích thước
                function filterTable() {
                    var selectedColor = $('#colorInput').val() ? $('#colorInput').val().toLowerCase() : '';
                    var selectedSize = $('#sizeInput').val() ? $('#sizeInput').val().toLowerCase() : '';

                    $('#variantTable tbody tr').each(function() {
                        var rowColor = $(this).find('td:eq(0)').text().toLowerCase();
                        var rowSize = $(this).find('td:eq(1)').text().toLowerCase();

                        var colorMatch = selectedColor === '' || rowColor === selectedColor;
                        var sizeMatch = selectedSize === '' || rowSize === selectedSize;

                        if (colorMatch && sizeMatch) {
                            $(this).show();
                        } else {
                            $(this).hide();
                        }
                    });
                }

                $('#colorInput, #sizeInput').on('change', function() {
                    filterTable();
                });

                // Toggle sidebar
                $('.sidebar-toggle').on('click', function () {
                    $('.sidebar').toggleClass('active');
                    $('.main-content').toggleClass('active');
                    $(this).hide();
                });

                // Close sidebar when clicking outside on mobile
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
        </script>
    </body>
</html>