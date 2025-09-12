<%-- 
    Document   : chat
    Created on : Mar 29, 2025, 7:52:38 PM
    Author     : nguye
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        .ai-chat-button {
            position: fixed;
            bottom: 20px;
            right: 20px;
            z-index: 1000;
            width: 60px;
            height: 60px;
            border-radius: 50%;
            background-color: #3498db;
            border: none;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .ai-chat-button:hover {
            transform: scale(1.1);
        }

        .ai-chat-widget {
            position: fixed;
            bottom: 80px;
            right: 20px;
            width: 350px;
            height: 450px;
            background: white;
            border-radius: 15px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
            display: none;
            flex-direction: column;
            overflow: hidden;
            z-index: 999;
        }

        .ai-chat-header {
            background: #2c3e50;
            color: white;
            padding: 15px;
            font-weight: 600;
            display: flex;
            justify-content: space-between;
            align-items: center; /* Căn giữa theo chiều dọc */
        }

        .ai-chat-close-btn {
            background: transparent;
            border: none;
            color: white;
            font-size: 18px;
            cursor: pointer;
            padding: 5px;
            transition: all 0.3s ease;
        }

        .ai-chat-close-btn:hover {
            color: #e74c3c; /* Màu đỏ nhạt khi hover */
        }

        .ai-chat-messages {
            flex-grow: 1;
            overflow-y: auto;
            padding: 15px;
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        .ai-message {
            padding: 10px;
            border-radius: 10px;
            max-width: 70%;
            word-break: break-word;
        }

        .ai-message.user {
            background: #e9ecef;
            align-self: flex-end;
        }

        .ai-message.bot {
            background: #f8f9fa;
            align-self: flex-start;
        }

        .ai-message img {
            max-width: 100%;
            max-height: 150px;
            width: auto;
            height: auto;
            border-radius: 5px;
            display: block;
            margin-top: 5px;
            cursor: pointer;
        }

        .ai-chat-input {
            display: flex;
            height: 62px;
            padding: 10px;
            border-top: 1px solid #eee;
        }

        .ai-chat-input input {
            flex-grow: 1;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 20px;
            margin-right: 10px;
        }

        .ai-chat-input button {
            background: #3498db;
            color: white;
            border: none;
            border-radius: 20px;
            padding: 10px 15px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .ai-chat-input button:hover {
            background: #2980b9;
        }

        #imagePreview {
            padding: 0 10px;
        }

        #previewImage {
            max-width: 100px;
            max-height: 100px;
            border-radius: 5px;
        }

        #emojiPicker {
            max-height: 200px;
            overflow-y: auto;
            border: 1px solid #ccc;
            padding: 10px;
            background: #fff;
            position: absolute;
            z-index: 1000;
            bottom: 70px; /* Đặt phía trên input */
            right: 10px;
        }

        /* Image modal styles */
        #imageModal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.8);
            z-index: 1001;
            justify-content: center;
            align-items: center;
        }

        #modalImage {
            max-width: 90%;
            max-height: 90vh;
            object-fit: contain;
            border-radius: 5px;
        }

        .close-modal {
            position: absolute;
            top: 20px;
            right: 30px;
            color: white;
            font-size: 30px;
            font-weight: bold;
            cursor: pointer;
            z-index: 1002;
        }

        @media (max-width: 576px) {
            .ai-chat-widget {
                width: 100%;
                height: 100%;
                bottom: 0;
                right: 0;
                border-radius: 0;
            }
        }
    </style>
</head>
<body>
    <c:if test="${sessionScope.acc.role == 'customer' || sessionScope.acc.role == null}">
        <!-- Chat Button -->
        <div class="ai-chat-button" onclick="toggleChatWidget()">
            <img src="https://cdn-icons-png.flaticon.com/512/5962/5962463.png" alt="Chat AI" width="35" height="35">
        </div>

        <!-- Chat Widget -->
        <div class="ai-chat-widget" id="aiChatWidget">
            <div class="ai-chat-header">
                <span><i class="fas fa-comment"></i> Hỗ trợ trực tuyến</span>
                <button class="ai-chat-close-btn" onclick="toggleChatWidget()">
                    <i class="fas fa-times"></i>
                </button>
            </div>
            <div class="ai-chat-messages d-flex flex-column" id="aiChatMessages">
                <c:choose>
                    <c:when test="${not empty chatError}">
                        <div class="ai-message bot">${chatError} <c:if test="${empty userID}"><a href="${pageContext.request.contextPath}/login.jsp" class="btn btn-primary btn-sm">Đăng nhập</a></c:if></div>
                    </c:when>
                    <c:otherwise>
                        <c:forEach items="${chatMessages}" var="msg">
                            <div class="ai-message ${msg.senderId == userID ? 'user' : 'bot'}">
                                <small><fmt:formatDate value="${msg.createdAt}" pattern="dd/MM/yyyy HH:mm"/></small>
                                <p>${msg.content}</p>
                                <c:if test="${not empty msg.imageUrl}">
                                    <img src="${msg.imageUrl}" alt="Attached image" onclick="openImageModal('${msg.imageUrl}')">
                                </c:if>
                            </div>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </div>
            <div class="ai-chat-input" <c:if test="${empty userID}">style="display:none;"</c:if>>
                <input type="file" id="imageInput" accept="image/*" style="display:none;" onchange="handleImageSelection()">
                <button type="button" class="btn btn-secondary me-2" onclick="document.getElementById('imageInput').click()">
                    <i class="fas fa-image"></i>
                </button>
                <button type="button" class="btn btn-secondary me-2" onclick="toggleEmojiPicker()">
                    <i class="fas fa-smile"></i>
                </button>
                <input type="text" id="messageInput" class="form-control me-2" placeholder="Nhập tin nhắn" maxlength="500">
                <button type="button" class="btn btn-primary" onclick="sendMessage()">
                    <i class="fas fa-paper-plane"></i>
                </button>
            </div>
            <div id="imagePreview" class="mt-2" style="display: none;">
                <img id="previewImage" src="" alt="Ảnh đã chọn">
                <button type="button" class="btn btn-danger btn-sm ms-2" onclick="clearImage()">Xóa</button>
            </div>
            <div id="emojiPicker" class="mt-2" style="display: none;">
                <!-- list emoji sẽ được thêm bằng script -->
            </div>
        </div>

        <!-- Image Modal -->
        <div id="imageModal">
            <span class="close-modal" onclick="closeImageModal()">&times;</span>
            <img id="modalImage" src="" alt="Enlarged image">
        </div>
    </c:if>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        var userId = "${userID}";
        var marketingId = "${marketingId}";
        var ws = null;
        var selectedImageUrl = null;

        document.addEventListener('DOMContentLoaded', function () {
            var chatMessages = document.getElementById("aiChatMessages");
            if (chatMessages) {
                chatMessages.scrollTop = chatMessages.scrollHeight;
            }
            if (userId && marketingId !== "-1") {
                initWebSocket();
            }
            
            // Add click event to all chat images
            document.querySelectorAll('.ai-message img').forEach(img => {
                img.addEventListener('click', function() {
                    openImageModal(this.src);
                });
            });
        });

        function toggleChatWidget() {
            var widget = document.getElementById("aiChatWidget");
            if (widget.style.display === "none" || widget.style.display === "") {
                widget.style.display = "flex";
                var chatMessages = document.getElementById("aiChatMessages");
                chatMessages.scrollTop = chatMessages.scrollHeight;
            } else {
                widget.style.display = "none";
            }
        }

        function initWebSocket() {
            if (!userId || marketingId === "-1") return;
            var wsUrl = (window.location.protocol === 'https:' ? 'wss://' : 'ws://') + "localhost:9999/fashionshop/chat/" + userId + "/" + marketingId;
            console.log("Attempting to connect to: " + wsUrl);
            ws = new WebSocket(wsUrl);

            ws.onopen = function() {
                console.log("WebSocket connected to " + wsUrl);
            };

            ws.onmessage = function(event) {
                console.log("Received: " + event.data);
                var data = JSON.parse(event.data);
                var chatMessages = document.getElementById("aiChatMessages");
                var messageClass = (data.senderId == userId) ? "user" : "bot";
                var messageHtml = '<div class="ai-message ' + messageClass + '"><small>' + data.createdAt + '</small><p>' + data.content + '</p>';
                if (data.imageUrl) {
                    messageHtml += '<img src="' + data.imageUrl + '" alt="Attached image" onclick="openImageModal(\'' + data.imageUrl + '\')">';
                }
                messageHtml += '</div>';
                chatMessages.innerHTML += messageHtml;
                chatMessages.scrollTop = chatMessages.scrollHeight;
            };

            ws.onerror = function(event) {
                console.log("WebSocket error: ", event);
            };

            ws.onclose = function() {
                console.log("WebSocket closed, retrying in 2 seconds...");
                setTimeout(initWebSocket, 2000);
            };
        }

        function handleImageSelection() {
            var fileInput = document.getElementById("imageInput");
            var file = fileInput.files[0];
            if (file) {
                var formData = new FormData();
                formData.append("file", file);
                formData.append("marketingId", marketingId);

                fetch('/fashionshop/uploadImage', {
                    method: 'POST',
                    body: formData
                })
                .then(response => response.json())
                .then(data => {
                    console.log("Image uploaded: " + data.imageUrl);
                    selectedImageUrl = data.imageUrl;
                    document.getElementById("imagePreview").style.display = "block";
                    document.getElementById("previewImage").src = selectedImageUrl;
                })
                .catch(error => console.error("Error uploading image: ", error));
            }
        }

        function clearImage() {
            selectedImageUrl = null;
            document.getElementById("imageInput").value = "";
            document.getElementById("imagePreview").style.display = "none";
            document.getElementById("previewImage").src = "";
        }

        function toggleEmojiPicker() {
            var emojiPicker = document.getElementById("emojiPicker");
            if (emojiPicker.style.display === "none" || emojiPicker.style.display === "") {
                loadEmojis();
                emojiPicker.style.display = "block";
            } else {
                emojiPicker.style.display = "none";
            }
        }

        function loadEmojis() {
    fetch('/fashionshop/proxy/emoji')
        .then(response => {
            if (!response.ok) throw new Error(`HTTP error! Status: ${response.status}`);
            return response.json();
        })
        .then(data => {
            var emojiPicker = document.getElementById("emojiPicker");
            emojiPicker.innerHTML = "";
            data.slice(0, 301).forEach(emoji => {
                var span = document.createElement("span");
                span.textContent = emoji.char; // Sử dụng trường "char" thay vì "character"
                span.style.cursor = "pointer";
                span.style.fontSize = "24px";
                span.style.margin = "5px";
                span.onclick = function() {
                    var input = document.getElementById("messageInput");
                    input.value += emoji.char; // Thêm emoji vào input
                };
                emojiPicker.appendChild(span);
            });
        })
        .catch(error => {
            console.error("Error loading emojis: ", error);
            document.getElementById("emojiPicker").innerHTML = "<span>Lỗi tải emoji: " + error.message + "</span>";
        });
}

        function sendMessage() {
            var input = document.getElementById("messageInput");
            var message = input.value.trim();
            var hasContent = message.length > 0;
            var hasImage = selectedImageUrl !== null;

            if ((hasContent || hasImage) && ws && ws.readyState === WebSocket.OPEN) {
                var jsonMessage = JSON.stringify({
                    senderId: parseInt(userId),
                    content: hasContent ? message : "",
                    imageUrl: hasImage ? selectedImageUrl : null
                });
                console.log("Sending: " + jsonMessage);
                ws.send(jsonMessage);
                input.value = "";
                clearImage();
                document.getElementById("emojiPicker").style.display = "none";
            }
        }

        // Zoom ảnh
        function openImageModal(imageSrc) {
            console.log("Opening image modal with src:", imageSrc);
            var modal = document.getElementById("imageModal");
            var modalImg = document.getElementById("modalImage");
            modalImg.src = imageSrc;
            modal.style.display = "flex";
            
            // Add keyboard listener for Escape key
            document.addEventListener('keydown', closeModalOnEscape);
        }
        
        function closeImageModal() {
            var modal = document.getElementById("imageModal");
            modal.style.display = "none";
            
            // Remove keyboard listener
            document.removeEventListener('keydown', closeModalOnEscape);
        }
        
        function closeModalOnEscape(event) {
            if (event.key === "Escape") {
                closeImageModal();
            }
        }

        // Đóng cửa sổ khi nhấp ra ngoài hình ảnh
        document.getElementById("imageModal").addEventListener('click', function(event) {
            if (event.target === this) {
                closeImageModal();
            }
        });

        // tắt emoji picker khi click ra ngoài chat box
        document.addEventListener('click', function(event) {
            var emojiPicker = document.getElementById("emojiPicker");
            var emojiButton = document.querySelector('.ai-chat-input .btn-secondary i.fas.fa-smile')?.parentElement;
            var chatWidget = document.getElementById("aiChatWidget");

            // Kiểm tra nếu click ra ngoài chat widget và không phải nút emoji
            if (!chatWidget.contains(event.target) && emojiPicker.style.display === "block" && !emojiButton?.contains(event.target)) {
                emojiPicker.style.display = "none";
            }
        });

        document.getElementById("messageInput")?.addEventListener("keypress", function(event) {
            if (event.key === "Enter") {
                sendMessage();
            }
        });
    </script>
</body>
</html>