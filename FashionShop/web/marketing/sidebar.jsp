<%-- 
    Document   : sidebar
    Created on : Feb 9, 2025, 8:52:55 PM
    Author     : tphon
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="sidebar">
    <div class="sidebar-header p-3 border-bottom">
        <h5 class="mt-2 mb-3">Quản Lý Tiếp Thị</h5>
    </div>

    <!-- User Profile Section -->
    <div class="user-profile p-3 border-bottom">
        <div class="d-flex align-items-center mb-2">
            <div class="avatar-container me-2">
                <img src="${pageContext.request.contextPath}/${sessionScope.acc.avatar}" alt="Avatar" class="avatar-img rounded-circle"
                     onerror="this.src='https://static.vecteezy.com/system/resources/previews/009/292/244/non_2x/default-avatar-icon-of-social-media-user-vector.jpg'">
            </div>
            <div class="user-info">
                <h6 class="mb-0 text-light">${sessionScope.acc.fullName}</h6>
                <c:choose>
                    <c:when test="${sessionScope.acc.role == 'admin'}">
                        <span class="text-light-50 small">Administrator</span>
                    </c:when>
                    <c:when test="${sessionScope.acc.role == 'marketing'}">
                        <span class="text-light-50 small">Marketing</span>
                    </c:when>
                </c:choose>
            </div>
        </div>
        <!-- Profile and Logout Buttons -->
        <div class="d-flex" style="margin-top: 20px;">
            <a href="${pageContext.request.contextPath}/profile" class="btn btn-outline-light btn-sm me-2 flex-grow-1">
                <i class="fas fa-user-cog me-1"></i> Hồ sơ
            </a>
            <a href="${pageContext.request.contextPath}/logout" class="btn btn-danger btn-sm flex-grow-1">
                <i class="fas fa-sign-out-alt me-1"></i> Đăng xuất
            </a>
        </div>
    </div>

    <!-- Sidebar Menu -->
    <ul class="sidebar-menu list-unstyled p-0 mt-3">
        <li class="menu-item p-2">
            <a href="dashboard" class="text-decoration-none text-light d-flex align-items-center">
                <i class="fas fa-chart-bar me-2"></i>
                Bảng điều khiển
            </a>
        </li>
        
        <li class="menu-item p-2">
            <a href="report" class="text-decoration-none text-light d-flex align-items-center">
                <i class="fas fa-file-alt me-2"></i>
                Báo cáo
            </a>
        </li>

        <li class="menu-item p-2">
            <a href="${pageContext.request.contextPath}/marketing/customerlist" 
               class="text-decoration-none text-light d-flex align-items-center">
                <i class="fas fa-users me-2"></i>
                Quản lý khách hàng
            </a>
        </li>
        
        <li class="menu-item p-2">
            <a href="#productSubmenu" data-bs-toggle="collapse" class="text-decoration-none text-light d-flex align-items-center justify-content-between collapsed">
                <div>
                    <i class="fas fa-box me-2"></i>
                    Quản lý sản phẩm
                </div>
                <i class="fas fa-chevron-down ms-auto"></i>
            </a>
            <ul class="submenu collapse list-unstyled ms-3 mt-1" id="productSubmenu">
                <li class="submenu-item py-1">
                    <a href="${pageContext.request.contextPath}/marketing/productlist" class="text-decoration-none text-light">Danh sách sản phẩm</a>
                </li>
                <li class="submenu-item py-1">
                    <a href="${pageContext.request.contextPath}/marketing/inventorylist" class="text-decoration-none text-light">Quản lý kho hàng</a>
                </li>
            </ul>
        </li>


        <li class="menu-item p-2">
            <a href="${pageContext.request.contextPath}/marketing/couponlist" class="text-decoration-none text-light d-flex align-items-center justify-content-between">
                <div>
                    <i class="fas fa-tags me-2"></i>
                    Mã giảm giá
                </div>
                <!--                <span class="badge bg-danger rounded-pill">3</span>-->
            </a>
        </li>

        <li class="menu-item p-2">
            <a href="#contentSubmenu" data-bs-toggle="collapse" class="text-decoration-none text-light d-flex align-items-center justify-content-between collapsed">
                <div>
                    <i class="fas fa-newspaper me-2"></i>
                    Quản lý nội dung
                </div>
                <i class="fas fa-chevron-down ms-auto"></i>
            </a>
            <ul class="submenu collapse list-unstyled ms-3 mt-1" id="contentSubmenu">
                <li class="submenu-item py-1">
                    <a href="${pageContext.request.contextPath}/marketing/postList" class="text-decoration-none text-light">Bài đăng</a>
                </li>
                <li class="submenu-item py-1">
                    <a href="${pageContext.request.contextPath}/marketing/sliderList" class="text-decoration-none text-light">Thanh Trượt</a>
                </li>
            </ul>
        </li>

        <li class="menu-item p-2">
            <a href="${pageContext.request.contextPath}/marketing/feedbacklist" class="text-decoration-none text-light d-flex align-items-center">
                <i class="fas fa-comments me-2"></i>
                Đánh giá sản phẩm
            </a>
        </li>
        
        <c:if test="${sessionScope.acc.role == 'marketing'}">
        <li class="menu-item p-2">
            <a href="${pageContext.request.contextPath}/marketing/chatlist" class="text-decoration-none text-light d-flex align-items-center">
                <i class="fas fa-user-cog me-2"></i>
                Chăm sóc khách hàng  
<!--                <span class="badge bg-danger rounded-pill">3</span>-->
            </a>
        </li>
        </c:if>

        

        <li class="menu-item p-2">
            <a href="${pageContext.request.contextPath}/home" class="text-decoration-none text-light d-flex align-items-center">
                <i class="fas fa-home me-2 "></i>
                Trang chủ
            </a>
        </li>

        <c:if test="${sessionScope.acc.role == 'admin'}">
            <li class="menu-item p-2">
                <a href="${pageContext.request.contextPath}/admin/userlists" class="text-decoration-none text-light d-flex align-items-center">
                    <i class="fas fa-arrow-left me-2"></i>
                    Quay lại trang Quản trị
                </a>
            </li>
        </c:if>
    </ul>

    <!-- No separate logout section as it's been moved to the User Profile section -->
</div>

<style>
    /* Giữ nguyên style hiện tại */
    .sidebar {
        position: fixed;
        left: 0;
        top: 0;
        bottom: 0;
        width: 250px;
        background: #2c3e50;
        color: #ecf0f1;
        transition: all 0.3s;
        z-index: 1000;
        overflow-y: auto;
        display: flex;
        flex-direction: column;
        box-shadow: 2px 0 8px rgba(0,0,0,0.15);
    }

    .sidebar-header {
        background-color: #1a2530;
        border-bottom: 1px solid rgba(255,255,255,0.1);
    }

    .user-profile {
        background-color: rgba(0,0,0,0.1);
    }

    .avatar-container {
        width: 40px;
        height: 40px;
        overflow: hidden;
        border: 2px solid rgba(255,255,255,0.3);
        border-radius: 50%
    }

    .avatar-img {
        width: 100%;
        height: 100%;
        object-fit: cover;
    }

    .text-light-50 {
        color: rgba(255,255,255,0.7);
    }

    .user-info {
        overflow: hidden;
    }

    .user-info h6 {
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
        max-width: 170px;
    }

    .sidebar .menu-item {
        position: relative;
        transition: all 0.3s;
        border-radius: 5px;
        margin: 0 5px;
    }

    .sidebar .menu-item:hover {
        background: #34495e;
    }

    .sidebar .menu-item.active {
        background: #34495e;
        border-left: 3px solid #3498db;
    }

    .sidebar .submenu-item {
        padding-left: 10px;
        border-radius: 3px;
    }

    .sidebar .submenu-item:hover {
        background: #34495e;
    }

    .submenu-item.active {
        background-color: #34495e;
        border-left: 3px solid #3498db;
    }

    .submenu-item.active a {
        padding-left: 7px;
        font-weight: 500;
    }

    .notification-badge {
        background-color: #e74c3c;
        color: white;
        padding: 2px 6px;
        border-radius: 50%;
        font-size: 0.7rem;
    }

    @media (max-width: 768px) {
        .sidebar {
            margin-left: -250px;
        }
        .sidebar.active {
            margin-left: 0;
        }
    }
</style>

<!-- JavaScript để đánh dấu menu item active -->
<script>
    document.addEventListener('DOMContentLoaded', function () {
        // Get the current page URL path
        const currentPath = window.location.pathname;

        // Reset all active states first
        document.querySelectorAll('.menu-item').forEach(item => {
            item.classList.remove('active');
        });

        document.querySelectorAll('.submenu').forEach(submenu => {
            submenu.classList.remove('show');
        });

        // Handle product management section
        if (currentPath.includes('/marketing/productlist') ||
                currentPath.includes('/marketing/inventorylist') ||
                currentPath.includes('/marketing/addproduct') ||
                currentPath.includes('/marketing/editproduct') ||
                currentPath.includes('/marketing/deleteproduct') ||
                currentPath.includes('/marketing/inventoryDetail')) {

            // Show product submenu
            const productSubmenu = document.getElementById('productSubmenu');
            if (productSubmenu) {
                productSubmenu.classList.add('show');
            }

            // Highlight parent menu item
            const productMenuItem = document.querySelector('a[href="#productSubmenu"]').closest('.menu-item');
            if (productMenuItem) {
                productMenuItem.classList.add('active');
            }

            // Highlight specific submenu item based on current page
            if (currentPath.includes('/marketing/productlist')) {
                const productListItem = document.querySelector('a[href$="/marketing/productlist"]').closest('.submenu-item');
                if (productListItem) {
                    productListItem.classList.add('active');
                }
            } else if (currentPath.includes('/marketing/inventorylist')) {
                const inventoryListItem = document.querySelector('a[href$="/marketing/inventorylist"]').closest('.submenu-item');
                if (inventoryListItem) {
                    inventoryListItem.classList.add('active');
                }
            }
        }
        // Handle content management section
        else if (currentPath.includes('/marketing/postList') ||
                currentPath.includes('/marketing/sliderList')) {

            // Show content submenu
            const contentSubmenu = document.getElementById('contentSubmenu');
            if (contentSubmenu) {
                contentSubmenu.classList.add('show');
            }

            // Highlight parent menu item
            const contentMenuItem = document.querySelector('a[href="#contentSubmenu"]').closest('.menu-item');
            if (contentMenuItem) {
                contentMenuItem.classList.add('active');
            }

            // Highlight specific submenu item based on current page
            if (currentPath.includes('/marketing/postList')) {
                const postListItem = document.querySelector('a[href$="/marketing/postList"]').closest('.submenu-item');
                if (postListItem) {
                    postListItem.classList.add('active');
                }
            } else if (currentPath.includes('/marketing/sliderList')) {
                const sliderListItem = document.querySelector('a[href$="/marketing/sliderList"]').closest('.submenu-item');
                if (sliderListItem) {
                    sliderListItem.classList.add('active');
                }
            }
        }
        // Handle coupon page
        else if (currentPath.includes('/marketing/couponlist')) {
            const couponMenuItem = document.querySelector('a[href$="/marketing/couponlist"]').closest('.menu-item');
            if (couponMenuItem) {
                couponMenuItem.classList.add('active');
            }
        }
        // Handle dashboard page
        else if (currentPath.includes('/marketing/dashboard')) {
            const dashboardMenuItem = document.querySelector('a[href="dashboard"]').closest('.menu-item');
            if (dashboardMenuItem) {
                dashboardMenuItem.classList.add('active');
            }
        }
        // Handle home page
        else if (currentPath.includes('/home')) {
            const homeMenuItem = document.querySelector('a[href$="/home"]').closest('.menu-item');
            if (homeMenuItem) {
                homeMenuItem.classList.add('active');
            }
        }
        // Handle other pages with direct links
        else {
            // Check for other direct menu items that don't have submenu
            const otherMenuItems = document.querySelectorAll('.menu-item a:not([data-bs-toggle])');
            otherMenuItems.forEach(item => {
                const href = item.getAttribute('href');
                if (href && currentPath.includes(href) && href !== '#' && !href.includes('/home')) {
                    item.closest('.menu-item').classList.add('active');
                }
            });
        }
    });
</script>