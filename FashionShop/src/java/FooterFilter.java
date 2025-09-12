import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import DAO.FooterDAO;
import entity.Footer;

@WebFilter(urlPatterns = {"/*"})
public class FooterFilter implements Filter {

    private FooterDAO dao;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        dao = new FooterDAO();
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        ServletContext context = request.getServletContext();
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        String requestURI = httpRequest.getRequestURI();

        // Làm mới dữ liệu sau các thao tác quản lý footer
        if (requestURI.contains("/admin/footer-settings") || httpRequest.getParameter("refreshFooter") != null) {
            context.removeAttribute("companyInfo");
            context.removeAttribute("contactInfo");
            context.removeAttribute("socialLinks");
            context.removeAttribute("shopLat");
            context.removeAttribute("shopLon");
        }

        // Tải lại dữ liệu nếu chưa có
        if (context.getAttribute("companyInfo") == null) {
            context.setAttribute("companyInfo", dao.getCompanyInfo());
            context.setAttribute("contactInfo", dao.getContactInfo());
            context.setAttribute("socialLinks", dao.getSocialLinks());

            // Lấy địa chỉ và chuyển thành tọa độ
            String address = dao.getContactInfo().stream()
                .filter(f -> f.getFieldName().equals("Địa chỉ"))
                .map(Footer::getValue)
                .findFirst()
                .orElse("");
            try {
                String encodedAddress = URLEncoder.encode(address, StandardCharsets.UTF_8.toString());
                String url = "https://nominatim.openstreetmap.org/search?q=" + encodedAddress + "&format=json&limit=1";
                URL apiUrl = new URL(url);
                BufferedReader reader = new BufferedReader(new InputStreamReader(apiUrl.openStream()));
                StringBuilder jsonResponse = new StringBuilder();
                String line;
                while ((line = reader.readLine()) != null) {
                    jsonResponse.append(line);
                }
                reader.close();

                String json = jsonResponse.toString();
                if (json.length() < 10 || !json.contains("\"lat\"")) {
                    context.setAttribute("shopLat", "0");
                    context.setAttribute("shopLon", "0");
                } else {
                    String lat = json.split("\"lat\":\"")[1].split("\"")[0];
                    String lon = json.split("\"lon\":\"")[1].split("\"")[0];
                    context.setAttribute("shopLat", lat);
                    context.setAttribute("shopLon", lon);
                }
            } catch (Exception e) {
                context.setAttribute("shopLat", "0");
                context.setAttribute("shopLon", "0");
                System.out.println("Error fetching coordinates: " + e.getMessage());
            }
        }

        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
        // Cleanup if needed
    }
}