<%-- 
    Document   : index
    Created on : Jan 27, 2025, 4:12:56 PM
    Author     : nguye
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Fashion Shop - Đang tải...</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body {
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                margin: 0;
                background: linear-gradient(135deg, #f6d365 0%, #fda085 100%);
                font-family: 'Arial', sans-serif;
            }
            .loading-container {
                text-align: center;
                background: white;
                padding: 40px;
                border-radius: 20px;
                box-shadow: 0 10px 25px rgba(0,0,0,0.1);
                max-width: 500px;
                width: 100%;
                animation: fadeIn 1s ease-in-out;
            }
            .logo {
                max-width: 200px;
                margin-bottom: 20px;
            }
            .spinner {
                width: 50px;
                height: 50px;
                border: 5px solid #f3f3f3;
                border-top: 5px solid #3498db;
                border-radius: 50%;
                animation: spin 1s linear infinite;
                margin: 20px auto;
            }
            @keyframes spin {
                0% {
                    transform: rotate(0deg);
                }
                100% {
                    transform: rotate(360deg);
                }
            }
            @keyframes fadeIn {
                from {
                    opacity: 0;
                }
                to {
                    opacity: 1;
                }
            }
            .redirect-text {
                color: #333;
                font-size: 18px;
                margin-top: 20px;
            }
        </style>
    </head>
    <body>
        <div class="loading-container">
            <img src="https://cdn-icons-png.flaticon.com/512/2503/2503508.png" alt="Fashion Shop Logo" class="logo">
            <div class="spinner"></div>
            <h2>Fashion Shop</h2>
            <p class="redirect-text">Đang chuyển hướng đến trang chủ...</p>
        </div>

        <script>
            // Redirect to homepage after 2 seconds
            setTimeout(function () {
                window.location.href = 'home'; // Adjust this URL if needed
            }, 2000);
        </script>
    </body>
</html>

