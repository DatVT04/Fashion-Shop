<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Header</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assests/css/Header.css" rel="stylesheet" type="text/css"/>
    <style>
        /* CSS cho menu phân cấp - giữ nguyên từ code gốc */
        .navbar-nav .dropdown-menu {
            display: none;
            position: absolute;
            background: white;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            z-index: 1000;
            min-width: 200px;
            border-radius: 4px;
            padding: 10px 0;
        }
        .navbar-nav .dropdown:hover > .dropdown-menu {
            display: block;
        }
        .navbar-nav .dropdown-submenu {
            position: relative;
        }
        .navbar-nav .dropdown-submenu > .dropdown-menu {
            top: 0;
            left: 100%;
            margin-top: -6px;
        }
        .navbar-nav .dropdown-submenu:hover > .dropdown-menu {
            display: block;
        }
        .navbar-nav .dropdown-item {
            padding: 8px 20px;
            color: #333;
            text-decoration: none;
            display: block;
        }
        .navbar-nav .dropdown-item:hover {
            background-color: #f8f9fa;
        }
        .navbar-nav .dropdown-toggle::after {
            display: none !important;
            margin-left: 5px;
            vertical-align: middle;
            content: "";
            border-top: 5px solid;
            border-right: 5px solid transparent;
            border-bottom: 0;
            border-left: 5px solid transparent;
        }
        .navbar-nav .dropdown-submenu > a::after {
            content: "";
            float: right;
            margin-top: 8px;
            border-left: 5px solid;
            border-top: 5px solid transparent;
            border-bottom: 5px solid transparent;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg fixed-top">
        <div class="container-header">
            <!-- Logo -->
            <a class="navbar-brand" href="home">
                <img src="${pageContext.request.contextPath}\assests\css\logohuy.png" alt="Logo"/>
            </a>

            <!-- Navbar Toggle Button -->
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>

            <!-- Main Navigation -->
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav mx-auto">
                    <!-- Mục "Danh mục" với dropdown phân cấp - giữ nguyên -->
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="categoriesDropdown" role="button">
                            Danh mục
                        </a>
                        <ul class="dropdown-menu">
                            <c:forEach items="${level1Categories}" var="level1">
                                <c:if test="${level1.status == 'active'}">
                                    <li class="dropdown-submenu">
                                        <a class="dropdown-item" href="listproduct?category=${level1.id}">
                                            ${level1.name}
                                        </a>
                                        <c:if test="${not empty level2ByParent[level1.id]}">
                                            <ul class="dropdown-menu">
                                                <c:forEach items="${level2ByParent[level1.id]}" var="level2">
                                                    <c:if test="${level2.status == 'active'}">
                                                        <li class="dropdown-submenu">
                                                            <a class="dropdown-item" href="listproduct?category=${level2.id}">
                                                                ${level2.name}
                                                            </a>
                                                            <c:if test="${not empty level3ByParent[level2.id]}">
                                                                <ul class="dropdown-menu">
                                                                    <c:forEach items="${level3ByParent[level2.id]}" var="level3">
                                                                        <c:if test="${level3.status == 'active'}">
                                                                            <li>
                                                                                <a class="dropdown-item" href="listproduct?category=${level3.id}">
                                                                                    ${level3.name}
                                                                                </a>
                                                                            </li>
                                                                        </c:if>
                                                                    </c:forEach>
                                                                </ul>
                                                            </c:if>
                                                        </li>
                                                    </c:if>
                                                </c:forEach>
                                            </ul>
                                        </c:if>
                                    </li>
                                </c:if>
                            </c:forEach>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="listproduct">Danh sách sản phẩm</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="posts">Danh sách bài đăng</a>
                    </li>
                </ul>

                <!-- Right Side Items -->
                <div class="d-flex align-items-center justify-content-end">
                    <!-- Search Form -->
                    <form class="search-form" action="listproduct" method="GET">
                        <input type="text" name="keyword" placeholder="Nhập tên sản phẩm...">
                        <button type="submit">
                            <i class="fas fa-search"></i>
                        </button>
                    </form>

                    <!-- User Actions -->
                    <div class="user-actions">
                        <!-- User Profile/Login -->
                        <div class="user-menu">
                            <c:choose>
                                <c:when test="${not empty sessionScope.acc}">
                                    <div class="dropdown">
                                        <button class="dropbtn">
                                            <img src="${sessionScope.acc.avatar}" alt="avatar" class="avatar-img" 
                                                 onerror="this.src='https://static.vecteezy.com/system/resources/previews/009/292/244/non_2x/default-avatar-icon-of-social-media-user-vector.jpg'">
                                            <div class="user-info-header">
                                                <span class="full-name">${sessionScope.acc.fullName}</span>
                                                <span class="username">${sessionScope.acc.username}</span>
                                            </div>
                                        </button>
                                        <div class="dropdown-content">
                                            <!-- Hiển thị tùy theo vai trò -->
                                            <c:choose>
                                                <c:when test="${sessionScope.acc.role == 'admin'}">
                                                    <a href="${pageContext.request.contextPath}/admin/dashboard">Trang quản trị</a>
                                                    <a href="${pageContext.request.contextPath}/marketing/dashboard">Trang tiếp thị</a>
                                                    <a href="${pageContext.request.contextPath}/sale/dashboard">Trang bán hàng</a>
                                                </c:when>
                                                <c:when test="${sessionScope.acc.role == 'marketing'}">
                                                    <a href="${pageContext.request.contextPath}/marketing/dashboard">Trang tiếp thị</a>
                                                </c:when>
                                                <c:when test="${sessionScope.acc.role == 'sale'}">
                                                    <a href="${pageContext.request.contextPath}/sale/dashboard">Trang bán hàng</a>
                                                </c:when>
                                                <c:otherwise> <!-- customer -->
                                                    <a href="${pageContext.request.contextPath}/myorder">Lịch sử đơn hàng</a>
                                                </c:otherwise>
                                            </c:choose>
                                            <c:choose>
                                                <c:when test="${sessionScope.acc.role == 'customer'}">
                                                    <a href="${pageContext.request.contextPath}/profile">Trang cá nhân</a>
                                                </c:when>
                                                <c:otherwise> 
                                                    <a href="${pageContext.request.contextPath}/profile">Hồ sơ</a>
                                                </c:otherwise>
                                            </c:choose>
<!--                                            <a href="${pageContext.request.contextPath}/profile">Trang cá nhân</a>-->
                                            <a href="${pageContext.request.contextPath}/logout">Đăng xuất</a>
                                        </div>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <div class="dropdown">
                                        <button class="dropbtn-guest">
                                            <i class="fas fa-user"></i>
                                        </button>
                                        <div class="dropdown-content">
                                            <a href="${pageContext.request.contextPath}/login">Đăng nhập</a>
                                            <a href="${pageContext.request.contextPath}/register">Đăng ký</a>
                                        </div>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <!-- Cart -->
                        <!-- Cart -->
                        <c:if test="${sessionScope.acc.role == 'customer' || sessionScope.acc.role == null}">
                            <a href="${pageContext.request.contextPath}/cartdetail" class="cart-icon">
                                <i class="fas fa-shopping-cart"></i>
                                <span class="cart-count">${cartCount}</span>
                            </a>
                        </c:if>
                    </div>
                </div>
            </div>
        </nav>

        <!-- Font Awesome for icons -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/js/all.min.js"></script>
        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

        <!-- Custom JavaScript for navbar toggle - giữ nguyên -->
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                var navbarToggler = document.querySelector('.navbar-toggler');
                var navbarCollapse = document.querySelector('.navbar-collapse');

                navbarToggler.addEventListener('click', function () {
                    var isExpanded = navbarToggler.getAttribute('aria-expanded') === 'true';
                    navbarToggler.setAttribute('aria-expanded', !isExpanded);
                });

                document.addEventListener('click', function (event) {
                    var isClickInside = navbarCollapse.contains(event.target) || navbarToggler.contains(event.target);
                    if (!isClickInside && navbarCollapse.classList.contains('show')) {
                        navbarCollapse.classList.remove('show');
                        navbarToggler.classList.add('collapsed');
                        navbarToggler.setAttribute('aria-expanded', 'false');
                    }
                });

                var navLinks = document.querySelectorAll('.nav-link:not(.dropdown-toggle)');
                navLinks.forEach(function (navLink) {
                    navLink.addEventListener('click', function () {
                        if (window.innerWidth < 992) {
                            navbarCollapse.classList.remove('show');
                            navbarToggler.classList.add('collapsed');
                            navbarToggler.setAttribute('aria-expanded', 'false');
                        }
                    });
                });

                if (window.innerWidth < 992) {
                    document.querySelectorAll('.dropdown-submenu > a').forEach(function (element) {
                        element.addEventListener('click', function (e) {
                            let nextEl = this.nextElementSibling;
                            if (nextEl && nextEl.classList.contains('dropdown-menu')) {
                                e.preventDefault();
                                if (nextEl.style.display == 'block') {
                                    nextEl.style.display = 'none';
                                } else {
                                    nextEl.style.display = 'block';
                                }
                            }
                        });
                    });
                }
            });
        </script>
    </body>
</html>