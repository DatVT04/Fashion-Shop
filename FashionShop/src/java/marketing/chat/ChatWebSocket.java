package marketing.chat;

import jakarta.websocket.*;
import jakarta.websocket.server.PathParam;
import jakarta.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import DAO.MessageDAO;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 *
 * @author nguye
 */
@ServerEndpoint("/chat/{marketingId}/{userId}")
public class ChatWebSocket {

    private static final Map<String, Session> sessions = Collections.synchronizedMap(new HashMap<>());
    private MessageDAO messageDAO = new MessageDAO();
    private static final DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm");

    @OnOpen
    public void onOpen(Session session, @PathParam("marketingId") String marketingId, @PathParam("userId") String userId) {
        String sessionKey = marketingId + "-" + userId; // Key dựa trên hướng kết nối
        sessions.put(sessionKey, session);
        System.out.println("WebSocket opened for marketing " + marketingId + " with user " + userId + ", session key: " + sessionKey);
    }

    @OnClose
    public void onClose(Session session, @PathParam("marketingId") String marketingId, @PathParam("userId") String userId) {
        String sessionKey = marketingId + "-" + userId;
        sessions.remove(sessionKey);
        System.out.println("WebSocket closed for marketing " + marketingId + " with user " + userId);
    }

    @OnMessage
    public void onMessage(String message, Session session, @PathParam("marketingId") String marketingId, @PathParam("userId") String userId) throws IOException {
        try {
            JsonObject jsonMessage = JsonParser.parseString(message).getAsJsonObject();
            int senderId = jsonMessage.get("senderId").getAsInt();
            String content = jsonMessage.has("content") ? jsonMessage.get("content").getAsString() : "";
            String imageUrl = null;
            if (jsonMessage.has("imageUrl") && !jsonMessage.get("imageUrl").isJsonNull()) {
                imageUrl = jsonMessage.get("imageUrl").getAsString();
            }

            // Xác định receiverId dựa trên senderId
            int receiverId = (senderId == Integer.parseInt(marketingId)) ? Integer.parseInt(userId) : Integer.parseInt(marketingId);

            boolean saved = messageDAO.sendMessage(senderId, receiverId, content, imageUrl);
            if (saved) {
                String formattedTime = LocalDateTime.now().format(formatter);
                String responseMessage = "{\"senderId\": \"" + senderId + "\", \"content\": \"" + content + "\", \"createdAt\": \"" + formattedTime + "\"";
                if (imageUrl != null) {
                    responseMessage += ", \"imageUrl\": \"" + imageUrl + "\"";
                }
                responseMessage += "}";

                // Tạo session key động dựa trên senderId và receiverId
                String senderToReceiverKey = senderId + "-" + receiverId;
                String receiverToSenderKey = receiverId + "-" + senderId;

                Session senderSession = sessions.get(senderToReceiverKey);
                Session receiverSession = sessions.get(receiverToSenderKey);

                System.out.println("Sender session key: " + senderToReceiverKey + ", exists: " + (senderSession != null && senderSession.isOpen()));
                System.out.println("Receiver session key: " + receiverToSenderKey + ", exists: " + (receiverSession != null && receiverSession.isOpen()));

                if (senderSession != null && senderSession.isOpen()) {
                    synchronized (senderSession) {
                        senderSession.getAsyncRemote().sendText(responseMessage);
                    }
                } else {
                    System.out.println("Sender session not available for message: " + responseMessage);
                }
                if (receiverSession != null && receiverSession.isOpen()) {
                    synchronized (receiverSession) {
                        receiverSession.getAsyncRemote().sendText(responseMessage);
                    }
                } else {
                    System.out.println("Receiver session not available for message: " + responseMessage);
                }
            }
        } catch (Exception e) {
            System.out.println("Error processing message: " + message + " - " + e.getMessage());
            e.printStackTrace();
        }
    }

    @OnError
    public void onError(Session session, Throwable throwable) {
        System.out.println("WebSocket error: " + throwable.getMessage());
    }

    public static Map<String, Session> getSessions() {
        return sessions;
    }
}
