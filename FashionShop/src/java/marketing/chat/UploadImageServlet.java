package marketing.chat;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

/**
 *
 * @author nguye
 */
@WebServlet("/uploadImage")
@MultipartConfig
public class UploadImageServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Part filePart = request.getPart("file");
        String originalFileName = filePart.getSubmittedFileName();
        Integer userId = (Integer) request.getSession().getAttribute("userID");
        String marketingIdStr = request.getParameter("marketingId");

        if (userId == null || marketingIdStr == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing userId or marketingId");
            return;
        }

        // Tạo tên file random với UUID
        String fileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
        String randomFileName = UUID.randomUUID().toString() + fileExtension;

        // Đường dẫn thư mục uploads/message
        String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads" + File.separator + "message";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs(); // Tự động tạo thư mục nếu chưa tồn tại
        }

        // Lưu file với tên random
        String filePath = uploadPath + File.separator + randomFileName;
        filePart.write(filePath);

        // Tạo URL cho ảnh
        String imageUrl = request.getContextPath() + "/uploads/message/" + randomFileName;

        // Trả về JSON cho client
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write("{\"imageUrl\": \"" + imageUrl + "\"}");
    }
}