/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.util.Date;

/**
 *
 * @author nguye
 */
public class Message {
    private int id;
    private int senderId;
    private int receiverId;
    private String content;
    private String imageUrl;
    private boolean isRead;
    private Date createdAt;
    private String senderUsername; // thông tin người gửi
    private String receiverUsername; // tin người nhận
    private int lastSenderId; // người rep cuối cùng

    public Message() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getSenderId() {
        return senderId;
    }

    public void setSenderId(int senderId) {
        this.senderId = senderId;
    }

    public int getReceiverId() {
        return receiverId;
    }

    public void setReceiverId(int receiverId) {
        this.receiverId = receiverId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public boolean isRead() {
        return isRead;
    }

    public void setRead(boolean isRead) {
        this.isRead = isRead;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public String getSenderUsername() {
        return senderUsername;
    }

    public void setSenderUsername(String senderUsername) {
        this.senderUsername = senderUsername;
    }

    public String getReceiverUsername() {
        return receiverUsername;
    }

    public void setReceiverUsername(String receiverUsername) {
        this.receiverUsername = receiverUsername;
    }
    
    public int getLastSenderId() {
        return lastSenderId;
    }

    public void setLastSenderId(int lastSenderId) {
        this.lastSenderId = lastSenderId;
    }

    @Override
    public String toString() {
        return "Message{id=" + id + ", senderId=" + senderId + ", receiverId=" + receiverId + ", content=" + content + ", isRead=" + isRead + "}";
    }
}
