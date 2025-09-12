<%-- 
    Document   : access-denied
    Created on : Mar 11, 2025, 11:12:27 PM
    Author     : nguye
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Truy cập bị từ chối</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body {
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
        }

        .access-denied-container {
            text-align: center;
            background: #ffffff;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            max-width: 500px;
            width: 90%;
            animation: fadeIn 0.5s ease-in-out;
        }

        .error-code {
            font-size: 6rem;
            font-weight: bold;
            color: #dc3545;
            margin-bottom: 20px;
        }

        .error-message {
            font-size: 1.5rem;
            color: #333;
            margin-bottom: 15px;
        }

        .error-description {
            font-size: 1rem;
            color: #666;
            margin-bottom: 30px;
        }

        .home-btn {
            display: inline-block;
            padding: 12px 30px;
            font-size: 1.1rem;
            color: #fff;
            background-color: #007bff;
            border: none;
            border-radius: 25px;
            text-decoration: none;
            transition: background-color 0.3s, transform 0.2s;
        }

        .home-btn:hover {
            background-color: #0056b3;
            transform: translateY(-2px);
        }

        .home-btn i {
            margin-right: 8px;
        }

        /* Hiệu ứng fadeIn */
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* Responsive */
        @media (max-width: 576px) {
            .access-denied-container {
                padding: 20px;
            }
            .error-code {
                font-size: 4rem;
            }
            .error-message {
                font-size: 1.2rem;
            }
            .home-btn {
                padding: 10px 20px;
                font-size: 1rem;
            }
        }
    </style>
</head>
<body>
    <div class="access-denied-container">
        <div class="error-code">403</div>
        <h1 class="error-message">Truy cập bị từ chối</h1>
        <p class="error-description">Rất tiếc, bạn không có quyền truy cập vào trang này. Vui lòng kiểm tra lại quyền của bạn hoặc liên hệ quản trị viên.</p>
<!--        <a href="${pageContext.request.contextPath}/home" class="home-btn">
            <i class="fas fa-home"></i>Quay lại trang chủ
        </a>-->
        <c:choose>
            <c:when test="${sessionScope.acc.role == 'sale'}">
                <a href="${pageContext.request.contextPath}/sale/dashboard" class="home-btn">
                    <i class="fas fa-home"></i>Quay lại trang chủ
                </a>
            </c:when>
            <c:when test="${sessionScope.acc.role == 'marketing'}">
                <a href="${pageContext.request.contextPath}/marketing/dashboard" class="home-btn">
                    <i class="fas fa-home"></i>Quay lại trang chủ
                </a>
            </c:when>
            <c:when test="${sessionScope.acc.role != 'marketing' 
                            || sessionScope.acc.role != 'sale' 
                            || sessionScope.acc.role != 'admin'}">
                <a href="${pageContext.request.contextPath}/home" class="home-btn">
                    <i class="fas fa-home"></i>Quay lại trang chủ
                </a>
            </c:when>
        </c:choose>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>