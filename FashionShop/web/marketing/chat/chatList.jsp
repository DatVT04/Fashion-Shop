<%-- 
    Document   : chatList
    Created on : Mar 25, 2025, 3:26:58 AM
    Author     : nguye
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Danh sách trò chuyện</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
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
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .filter-card {
            background-color: white;
            border-radius: 8px;
            margin-bottom: 20px;
        }

        .search-box {
            border-radius: 50px;
            padding-left: 15px;
            border: 1px solid var(--border-color);
        }

        .list-group-item {
            display: flex;
            align-items: center;
            padding: 15px;
            transition: all 0.3s;
            border-left: 4px solid transparent;
        }

        .list-group-item:hover {
            background-color: var(--hover-color);
            border-left-color: var(--accent-color);
        }

        .list-group-item.unread {
            background-color: rgba(52,152,219,0.05);
            border-left-color: var(--danger-color);
            font-weight: 600;
        }

        .chat-avatar {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            object-fit: cover;
            margin-right: 15px;
            border: 2px solid var(--border-color);
        }

        .chat-content {
            flex-grow: 1;
        }

        .chat-username {
            font-weight: 600;
            color: var(--primary-color);
            margin-bottom: 5px;
        }

        .chat-preview {
            color: #6c757d;
            font-size: 0.9em;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }

        .chat-time {
            color: #6c757d;
            font-size: 0.8em;
            margin-left: 10px;
        }

        .empty-state {
            text-align: center;
            padding: 40px;
            color: #6c757d;
        }

        .pagination {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 20px;
        }

        .pagination .page-item .page-link {
            color: var(--primary-color);
            border: 1px solid var(--border-color);
            min-width: 40px;
            text-align: center;
        }

        .pagination .page-item.active .page-link {
            background-color: var(--accent-color);
            border-color: var(--accent-color);
            color: white;
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
    </style>
</head>
<body>
    <!-- Include Sidebar -->
    <%@ include file="../sidebar.jsp" %>
    
    <button class="btn btn-primary sidebar-toggle">
        <i class="fas fa-bars"></i>
    </button>

    <div class="main-content">
        <div class="container-fluid p-4">
            <h2 class="page-title">
                <i class="fas fa-comments me-2"></i>Danh sách trò chuyện
            </h2>

            <div class="card filter-card">
                <div class="card-header">
                    <div>
                        <i class="fas fa-filter me-2"></i>Tìm kiếm
                    </div>
                </div>
                <div class="card-body">
                    <form action="chatlist" method="GET" class="row g-3">
                        <div class="col-md-4">
                            <div class="input-group">
                                <span class="input-group-text bg-white">
                                    <i class="fas fa-search text-muted"></i>
                                </span>
                                <input type="text" name="searchUsername" value="${searchUsername}" class="form-control search-box" placeholder="Tìm kiếm theo tên người dùng">
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="d-grid gap-2 d-md-flex">
                                <button type="submit" class="btn btn-primary me-md-2">
                                    <i class="fas fa-filter me-2"></i>Tìm
                                </button>
                                <a href="chatlist" class="btn btn-secondary">
                                    <i class="fas fa-eraser me-2"></i>Xóa
                                </a>
                            </div>
                        </div>
                    </form>
                </div>
            </div>

            <div class="card">
                <div class="card-header">
                    <div>
                        <i class="fas fa-list me-2"></i>Danh sách trò chuyện
                    </div>
                </div>
                <div class="card-body p-0">
                    <div class="list-group list-group-flush">
                        <c:forEach items="${chatList}" var="chat">
                            <a href="chatbox?userId=${chat.senderId}" 
                               class="list-group-item list-group-item-action ${chat.isRead() ? '' : 'unread'}">
                                <div class="chat-content">
                                    <div class="d-flex justify-content-between align-items-center">
                                        <h5 class="chat-username mb-1">${chat.senderUsername}</h5>
                                        <small class="chat-time">
                                            <fmt:formatDate value="${chat.createdAt}" pattern="dd/MM/yyyy HH:mm"/>
                                        </small>
                                    </div>
                                    <p class="chat-preview mb-1">
                                        <c:choose>
                                            <c:when test="${chat.lastSenderId == marketingId}">
                                                Bạn: 
                                                <c:choose>
                                                    <c:when test="${not empty chat.imageUrl}">
                                                        ảnh
                                                    </c:when>
                                                    <c:otherwise>
                                                        <c:choose>
                                                            <c:when test="${chat.content.length() > 100}">
                                                                ${fn:substring(chat.content, 0, 100)}...
                                                            </c:when>
                                                            <c:otherwise>
                                                                ${chat.content}
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:when>
                                            <c:otherwise>
                                                Khách hàng: 
                                                <c:choose>
                                                    <c:when test="${not empty chat.imageUrl}">
                                                        ảnh
                                                    </c:when>
                                                    <c:otherwise>
                                                        <c:choose>
                                                            <c:when test="${chat.content.length() > 100}">
                                                                ${fn:substring(chat.content, 0, 100)}...
                                                            </c:when>
                                                            <c:otherwise>
                                                                ${chat.content}
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:otherwise>
                                        </c:choose>
                                    </p>
                                </div>
                            </a>
                        </c:forEach>
                        <c:if test="${empty chatList}">
                            <div class="empty-state">
                                <i class="fas fa-comments fa-3x mb-3" style="opacity: 0.5;"></i>
                                <p>Không có cuộc trò chuyện nào.</p>
                            </div>
                        </c:if>
                    </div>
                </div>
            </div>

            <div class="d-flex justify-content-between align-items-center mt-3">
                <div class="text-muted small">
                    Hiển thị ${chatList.size()} / ${totalUsers} người dùng
                </div>
                <nav>
                    <ul class="pagination">
                        <c:if test="${currentPage > 1}">
                            <li class="page-item">
                                <a class="page-link" href="chatlist?page=${currentPage-1}&searchUsername=${searchUsername}">
                                    <i class="fas fa-chevron-left"></i>
                                </a>
                            </li>
                        </c:if>
                        <c:forEach begin="1" end="${totalPages}" var="i">
                            <li class="page-item ${i == currentPage ? 'active' : ''}">
                                <a class="page-link" href="chatlist?page=${i}&searchUsername=${searchUsername}">${i}</a>
                            </li>
                        </c:forEach>
                        <c:if test="${currentPage < totalPages}">
                            <li class="page-item">
                                <a class="page-link" href="chatlist?page=${currentPage+1}&searchUsername=${searchUsername}">
                                    <i class="fas fa-chevron-right"></i>
                                </a>
                            </li>
                        </c:if>
                    </ul>
                </nav>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        $(document).ready(function () {
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
    </script>
</body>
</html>