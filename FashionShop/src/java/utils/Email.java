package utils;

import entity.CartItem;
import entity.Order;
import java.util.Properties;
import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import java.time.LocalDateTime;
import java.util.UUID;
import entity.User;
import jakarta.mail.internet.MimeUtility;
import java.io.UnsupportedEncodingException;

public class Email {

    private static final String HOST = "smtp.gmail.com";
    private static final String PORT = "587";
    private static final String USERNAME = "adswp391@gmail.com";
    private static final String PASSWORD = "njaf vowl xdlz rwsk";

    private final int LIMIT_MINUS = 30;

    public String generateToken() {
        return UUID.randomUUID().toString();
    }

    public LocalDateTime expireDateTime() {
        return LocalDateTime.now().plusMinutes(LIMIT_MINUS);
    }

    public boolean isExpireTime(LocalDateTime time) {
        return LocalDateTime.now().isAfter(time);
    }

    public boolean sendEmail(User user, String verificationToken) throws UnsupportedEncodingException {
        Properties props = new Properties();
        props.put("mail.smtp.host", HOST);
        props.put("mail.smtp.port", PORT);
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.ssl.protocols", "TLSv1.2");
        props.put("mail.smtp.ssl.trust", HOST);

        try {
            Session session = Session.getInstance(props, new Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(USERNAME, PASSWORD);
                }
            });

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(USERNAME, "Fasshion Shop"));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(user.getEmail()));
            message.setSubject("Xác Minh Tài Khoản Của Bạn");

            String verificationLink = "http://localhost:9999/fashionshop/verify?token=" + verificationToken;
            String htmlContent = String.format(
                    "<html>"
                    + "<head>"
                    + "<style>"
                    + "body {font-family: Arial, sans-serif; margin: 0; padding: 0; background-color: #f2f2f2;}"
                    + ".container {padding: 20px; max-width: 600px; margin: 0 auto; background-color: #ffffff; border: 1px solid #dddddd; border-radius: 5px;}"
                    + ".header {background-color: #4CAF50; padding: 10px; text-align: center; color: #ffffff;}"
                    + ".content {padding: 20px;}"
                    + "</style>"
                    + "</head>"
                    + "<body>"
                    + "<div class='container'>"
                    + "<div class='header'><h2>Xác Minh Tài Khoản</h2></div>"
                    + "<div class='content'><p>Xin chào %s,</p>"
                    + "<p>Fashion Shop xin thông bảo tài khoản của bạn đã được đăng ký thành công, vui lòng nhấp vào liên kết bên dưới để xác thực email của bạn.</p>"
                    + "<a href='%s' style='display:block;width:max-content;margin:0 auto;padding:10px;text-align:center;color:#ffffff;background-color:#4CAF50;border-radius:5px;text-decoration:none;'>Verify Account</a>"
                    + "<p>Liên kết này sẽ hết hạn sau 30 phút.</p>"
                    + "<p>Trân trọng,<br>Từ Fashion Shop</p></div>"
                    + "</div>"
                    + "</body>"
                    + "</html>",
                    user.getFullName(),
                    verificationLink
            );

            message.setContent(htmlContent, "text/html; charset=UTF-8");
            Transport.send(message);
            return true;

        } catch (MessagingException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean sendEmailReset(User user, String resetToken) throws UnsupportedEncodingException {
        Properties props = new Properties();
        props.put("mail.smtp.host", HOST);
        props.put("mail.smtp.port", PORT);
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.ssl.protocols", "TLSv1.2");
        props.put("mail.smtp.ssl.trust", HOST);

        try {
            Session session = Session.getInstance(props, new Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(USERNAME, PASSWORD);
                }
            });

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(USERNAME, "Fasshion Shop"));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(user.getEmail()));
//            message.setSubject("Đặt Lại Mật Khẩu");
            message.setSubject(MimeUtility.encodeText("Đặt Lại Mật Khẩu", "UTF-8", "B"));

            String resetLink = "http://localhost:9999/fashionshop/resetpassword?token=" + resetToken;
            String htmlContent = String.format(
                    "<html>"
                    + "<head>"
                    + "<style>"
                    + "body {font-family: Arial, sans-serif; margin: 0; padding: 0; background-color: #f2f2f2;}"
                    + ".container {padding: 20px; max-width: 600px; margin: 0 auto; background-color: #ffffff; border: 1px solid #dddddd; border-radius: 5px;}"
                    + ".header {background-color: #007bff; padding: 10px; text-align: center; color: #ffffff; font-size: 20px; font-weight: bold;}"
                    + ".content {padding: 20px; line-height: 1.5; color: #333;}"
                    + ".button {display: block; width: max-content; margin: 20px auto; padding: 12px 20px; text-align: center; color: white; background-color: #007bff; border-radius: 5px; text-decoration: none; font-size: 16px;}"
                    + ".footer {font-size: 12px; color: #777; text-align: center; margin-top: 20px;}"
                    + "</style>"
                    + "</head>"
                    + "<body>"
                    + "<div class='container'>"
                    + "<div class='header'>Yêu Cầu Đặt Lại Mật Khẩu</div>"
                    + "<div class='content'>"
                    + "<p>Xin chào %s,</p>"
                    + "<p>Chúng tôi nhận được yêu cầu đặt lại mật khẩu cho tài khoản của bạn.</p>"
                    + "<p>Nếu bạn không yêu cầu thay đổi mật khẩu, vui lòng bỏ qua email này.</p>"
                    + "<p>Nhấp vào nút bên dưới để đặt lại mật khẩu của bạn:</p>"
                    + "<a href='%s' class='button'>Đặt lại mật khẩu</a>"
                    + "<p><strong>Lưu ý:</strong> Liên kết này sẽ hết hạn sau 30 phút.</p>"
                    + "<p>Trân trọng,<br>Đội ngũ hỗ trợ Fashion Shop</p>"
                    + "</div>"
                    + "<div class='footer'>Nếu bạn gặp vấn đề với nút trên, hãy sao chép và dán liên kết sau vào trình duyệt của bạn: <br>%s</div>"
                    + "</div>"
                    + "</body>"
                    + "</html>",
                    user.getFullName(),
                    resetLink,
                    resetLink
            );

            message.setContent(htmlContent, "text/html; charset=UTF-8");
            Transport.send(message);
            return true;

        } catch (MessagingException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean sendOrderStatusEmail(Order order, String statusText, String newStatus) throws UnsupportedEncodingException {
        Properties props = new Properties();
        props.put("mail.smtp.host", HOST);
        props.put("mail.smtp.port", PORT);
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.ssl.protocols", "TLSv1.2");
        props.put("mail.smtp.ssl.trust", HOST);

        try {
            Session session = Session.getInstance(props, new Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(USERNAME, PASSWORD);
                }
            });

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(USERNAME, "Fasshion Shop"));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(order.getRecipientEmail()));
            message.setSubject(MimeUtility.encodeText("Cập nhật trạng thái đơn hàng #" + order.getOrderCode(), "UTF-8", "B"));

            // Tạo nội dung email
            StringBuilder htmlContent = new StringBuilder();
            htmlContent.append("<html><head><style>")
                    .append("body {font-family: Arial, sans-serif; margin: 0; padding: 0; background-color: #f2f2f2;}")
                    .append(".container {padding: 20px; max-width: 600px; margin: 20px auto; background-color: #ffffff; border: 1px solid #dddddd; border-radius: 5px;}")
                    .append(".header {background-color: #4CAF50; padding: 15px; text-align: center; color: #ffffff; border-radius: 5px 5px 0 0;}")
                    .append(".content {padding: 20px; line-height: 1.6;}")
                    .append(".product-table {width: 100%; border-collapse: collapse; margin-top: 20px;}")
                    .append(".product-table th, .product-table td {border: 1px solid #dddddd; padding: 10px; text-align: left;}")
                    .append(".product-table th {background-color: #f2f2f2; font-weight: bold;}")
                    .append(".button {background-color: #4CAF50; color: white; padding: 10px 20px; text-decoration: none; border-radius: 5px; display: inline-block; margin-top: 20px;}")
                    .append(".footer {padding: 20px; text-align: center; color: #888888; font-size: 12px; border-top: 1px solid #dddddd;}")
                    .append("</style></head><body><div class='container'>")
                    .append("<div class='header'><h2>Cập nhật trạng thái đơn hàng</h2></div>")
                    .append("<div class='content'><p>Xin chào ").append(order.getRecipientName()).append(",</p>")
                    .append("<p>Chúng tôi xin thông báo rằng đơn hàng <strong>#").append(order.getOrderCode()).append("</strong> của bạn đã được cập nhật sang trạng thái: <strong>").append(statusText).append("</strong>.</p>");

            // Thêm thông tin vận chuyển nếu trạng thái từ "shipping" trở đi
            if ("shipping".equals(newStatus) || "completed".equals(newStatus) || "returned".equals(newStatus)) {
                htmlContent.append("<h3>Thông tin vận chuyển:</h3>")
                        .append("<p><strong>Đơn vị vận chuyển:</strong> ").append(order.getShippingProvider()).append("</p>")
                        .append("<p><strong>Mã vận đơn:</strong> ").append(order.getTrackingNumber()).append("</p>");
            }
            
            // Thêm chi tiết đơn hàng
            htmlContent.append("<h3>Chi tiết đơn hàng:</h3>")
                    .append("<table class='product-table'><thead><tr>")
                    .append("<th>Hình ảnh</th><th>Tên sản phẩm</th><th>Kích thước</th><th>Màu sắc</th><th>Số lượng</th><th>Đơn giá</th></tr></thead><tbody>");
            for (CartItem item : order.getItems()) {
                String imageUrl = item.getProductThumbnail();
                if (!imageUrl.startsWith("http://") && !imageUrl.startsWith("https://")) {
                    imageUrl = "http://localhost:9999/fashionshop" + imageUrl; // Thêm domain nếu là đường dẫn tương đối
                }
                htmlContent.append("<tr>")
                        .append("<td><img src='").append(imageUrl).append("' width='50' height='50' alt='").append(item.getProductTitle()).append("'></td>")
                        .append("<td>").append(item.getProductTitle()).append("</td>")
                        .append("<td>").append(item.getSize()).append("</td>")
                        .append("<td>").append(item.getColor()).append("</td>")
                        .append("<td>").append(item.getQuantity()).append("</td>")
                        .append("<td>").append(String.format("%,.0f", item.getProductPrice())).append(" ₫</td>")
                        .append("</tr>");
            }
            htmlContent.append("</tbody></table>");

            // Thêm phần footer
            htmlContent.append("</div><div class='footer'>")
                    .append("<p>Trân trọng,<br>Fasshion Shop</p>")
                    .append("<p>Liên hệ chúng tôi: support@fasshionshop.com | Hotline: 0123 456 789</p>")
                    .append("</div></div></body></html>");

            message.setContent(htmlContent.toString(), "text/html; charset=UTF-8");
            Transport.send(message);
            return true;

        } catch (MessagingException e) {
            e.printStackTrace();
            return false;
        }
    }

    public static void main(String[] args) throws UnsupportedEncodingException {
        Email email = new Email();
        boolean sent = email.sendEmail(
                new User("testUser", "huyndhe186775@fpt.edu.vn", "password", "Test User", "Male", "1234567890"),
                "Token123"
        );
        System.out.println("Email sent: " + sent);
    }
}
