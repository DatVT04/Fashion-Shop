<%-- 
    Document   : sidebar
    Created on : Mar 22, 2025
    Author     : nguye
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="sidebar">
    <div class="sidebar-header p-3 border-bottom">
        <h5 class="mt-2 mb-3">Quản Lý Bán Hàng</h5>
    </div>

    <!-- User Profile Section -->
    <div class="user-profile p-3 border-bottom">
        <div class="d-flex align-items-center mb-2">
            <div class="avatar-container me-2">
                <img src="${pageContext.request.contextPath}/${sessionScope.acc.avatar}" 
                     alt="Avatar" 
                     class="avatar-img rounded-circle"
                     onerror="this.src='https://static.vecteezy.com/system/resources/previews/009/292/244/non_2x/default-avatar-icon-of-social-media-user-vector.jpg'">
            </div>
            <div class="user-info">
                <h6 class="mb-0 text-light">${sessionScope.acc.fullName}</h6>
                <c:choose>
                    <c:when test="${sessionScope.acc.role == 'admin'}">
                        <span class="text-light-50 small">Administrator</span>
                    </c:when>
                    <c:when test="${sessionScope.acc.role == 'sale'}">
                        <span class="text-light-50 small">Sale</span>
                    </c:when>
                </c:choose>
            </div>
        </div>
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
            <a href="${pageContext.request.contextPath}/sale/dashboard" 
               class="text-decoration-none text-light d-flex align-items-center">
                <i class="fas fa-chart-bar me-2"></i>
                Bảng điều khiển
            </a>
        </li>

        <li class="menu-item p-2">
            <a href="${pageContext.request.contextPath}/sale/report" 
               class="text-decoration-none text-light d-flex align-items-center">
                <i class="fas fa-file-alt me-2"></i>
                Báo cáo
            </a>
        </li>
        
        <li class="menu-item p-2">
            <a href="${pageContext.request.contextPath}/sale/orderlist" 
               class="text-decoration-none text-light d-flex align-items-center">
                <i class="fas fa-shopping-cart me-2"></i>
                Quản lý đơn hàng
            </a>
        </li>

        <li class="menu-item p-2">
            <a href="${pageContext.request.contextPath}/home" 
               class="text-decoration-none text-light d-flex align-items-center">
                <i class="fas fa-home me-2"></i>
                Trang chủ
            </a>
        </li>
        <c:if test="${sessionScope.acc.role == 'admin'}">
            <li class="menu-item p-2">
                <a href="${pageContext.request.contextPath}/admin/userlists" 
                   class="text-decoration-none text-light d-flex align-items-center">
                    <i class="fas fa-arrow-left me-2"></i>
                    Quay lại trang Quản trị
                </a>
            </li>
        </c:if>
    </ul>
</div>

<style>
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
        border-radius: 50%;
    }
    .avatar-img {
        width: 100%;
        height: 100%;
        object-fit: cover;
    }
    .text-light-50 {
        color: rgba(255,255,255,0.7);
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
</style>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        const currentPath = window.location.pathname;
        document.querySelectorAll('.menu-item').forEach(item => {
            item.classList.remove('active');
            const link = item.querySelector('a');
            if (link && currentPath.includes(link.getAttribute('href'))) {
                item.classList.add('active');
            }
        });
    });
</script>
