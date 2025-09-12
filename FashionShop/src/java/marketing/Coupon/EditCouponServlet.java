package marketing.Coupon;

import DAO.CouponDAO;
import entity.Coupon;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.sql.Timestamp;

/**
 *
 * @author nguye
 */
@WebServlet(name = "EditCouponServlet", urlPatterns = {"/marketing/editCoupon"})
public class EditCouponServlet extends HttpServlet {

    private static final BigDecimal MIN_AMOUNT = new BigDecimal("1000"); // 1.000 VNĐ
    private static final BigDecimal MAX_AMOUNT = new BigDecimal("10000000"); // 10 triệu VNĐ
    private static final BigDecimal MAX_AMOUNTORDER = new BigDecimal("100000000"); // 100 triệu VNĐ
    private static final int MAX_USAGE_LIMIT = 1_000_000; // 1 triệu lần
    private static final BigDecimal MAX_PERCENTAGE = new BigDecimal("50"); // 50%

    private static final DateTimeFormatter DATE_TIME_FORMATTER = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            CouponDAO couponDAO = new CouponDAO();
            Coupon coupon = couponDAO.getCouponById(id);
            if (coupon != null) {
                request.setAttribute("coupon", coupon);
            } else {
                request.setAttribute("error", "Không tìm thấy mã giảm giá.");
            }
        } catch (NumberFormatException e) {
            request.setAttribute("error", "ID không hợp lệ.");
        }
        request.getRequestDispatcher("/marketing/coupon/editCoupon.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CouponDAO couponDAO = new CouponDAO();
        StringBuilder errorMessages = new StringBuilder();

        String idStr = request.getParameter("id");
        String code = request.getParameter("code");
        String discountType = request.getParameter("discount_type");
        String discountValueStr = request.getParameter("discount_value");
        String minOrderAmountStr = request.getParameter("min_order_amount");
        String maxDiscountStr = request.getParameter("max_discount");
        String usageLimitStr = request.getParameter("usage_limit");
        String expiryDateStr = request.getParameter("expiry_date");
        String activationDateStr = request.getParameter("activation_date");
        String couponType = request.getParameter("coupon_type");
        String status = request.getParameter("status") != null ? "active" : "inactive";

        int id = Integer.parseInt(idStr);
        Coupon originalCoupon = couponDAO.getCouponById(id);
        if (originalCoupon == null) {
            request.setAttribute("error", "Không tìm thấy mã giảm giá.");
            request.getRequestDispatcher("/marketing/coupon/editCoupon.jsp").forward(request, response);
            return;
        }

        if (!validateCouponData(couponDAO, code, discountType, discountValueStr, minOrderAmountStr,
                maxDiscountStr, usageLimitStr, expiryDateStr, activationDateStr, status, originalCoupon.getCode(), errorMessages)) {
            setFormAttributes(request, id, code, discountType, discountValueStr, minOrderAmountStr,
                    maxDiscountStr, usageLimitStr, expiryDateStr, activationDateStr, couponType, status);
            request.setAttribute("error", errorMessages.toString());
            request.setAttribute("coupon", originalCoupon);
            request.getRequestDispatcher("/marketing/coupon/editCoupon.jsp").forward(request, response);
            return;
        }

        try {
            BigDecimal discountValue = new BigDecimal(discountValueStr);
            BigDecimal minOrderAmount = new BigDecimal(minOrderAmountStr);
            Integer usageLimit = (usageLimitStr == null || usageLimitStr.trim().isEmpty()) ? null : Integer.parseInt(usageLimitStr);
            BigDecimal maxDiscount = "percentage".equals(discountType) ? new BigDecimal(maxDiscountStr) : BigDecimal.ZERO;

            LocalDateTime expiryDateTime = LocalDateTime.parse(expiryDateStr, DATE_TIME_FORMATTER);
            LocalDateTime activationDateTime = (activationDateStr != null && !activationDateStr.isEmpty())
                    ? LocalDateTime.parse(activationDateStr, DATE_TIME_FORMATTER)
                    : ("active".equals(status) ? LocalDateTime.now() : null); // Gán thời điểm hiện tại nếu active và không có activation_date

            Coupon coupon = new Coupon(id, code, discountType, discountValue.doubleValue(), minOrderAmount.doubleValue(),
                    maxDiscount.doubleValue(), usageLimit == null ? 0 : usageLimit, originalCoupon.getUsed_count(),
                    Timestamp.valueOf(expiryDateTime),
                    activationDateTime != null ? Timestamp.valueOf(activationDateTime) : null,
                    originalCoupon.getCreated_at(), couponType, status);

            if (couponDAO.updateCoupon(coupon)) {
                response.sendRedirect("couponlist?success=edit");
            } else {
                setFormAttributes(request, id, code, discountType, discountValueStr, minOrderAmountStr,
                        maxDiscountStr, usageLimitStr, expiryDateStr, activationDateStr, couponType, status);
                request.setAttribute("error", "Không thể cập nhật mã giảm giá.");
                request.setAttribute("coupon", originalCoupon);
                request.getRequestDispatcher("/marketing/coupon/editCoupon.jsp").forward(request, response);
            }
        } catch (Exception e) {
            setFormAttributes(request, id, code, discountType, discountValueStr, minOrderAmountStr,
                    maxDiscountStr, usageLimitStr, expiryDateStr, activationDateStr, couponType, status);
            request.setAttribute("error", "Lỗi: " + e.getMessage());
            request.setAttribute("coupon", originalCoupon);
            request.getRequestDispatcher("/marketing/coupon/editCoupon.jsp").forward(request, response);
        }
    }

    private boolean validateCouponData(CouponDAO couponDAO, String code, String discountType,
            String discountValueStr, String minOrderAmountStr, String maxDiscountStr,
            String usageLimitStr, String expiryDateStr, String activationDateStr, String status,
            String originalCode, StringBuilder errorMessages) {
        boolean isValid = true;
        LocalDateTime now = LocalDateTime.now();

        // Validate coupon code
        if (code == null || code.trim().isEmpty() || !code.matches("^[A-Za-z0-9_]+$") || code.length() < 3 || code.length() > 20) {
            errorMessages.append("Mã giảm giá chỉ chứa chữ cái, số, dấu gạch dưới và có độ dài từ 3-20 ký tự.<br>");
            isValid = false;
        } else if (couponDAO.isCouponCodeExists(code) && !code.equals(originalCode)) {
            errorMessages.append("Mã giảm giá đã tồn tại.<br>");
            isValid = false;
        }

        // Validate discount type
        if (!"percentage".equals(discountType) && !"fixed".equals(discountType)) {
            errorMessages.append("Loại giảm giá không hợp lệ.<br>");
            isValid = false;
        }

        try {
            BigDecimal discountValue = new BigDecimal(discountValueStr);
            BigDecimal minOrderAmount = new BigDecimal(minOrderAmountStr);
            BigDecimal maxDiscount = "percentage".equals(discountType) ? new BigDecimal(maxDiscountStr) : BigDecimal.ZERO;

            // Validate discount value and max discount
            if ("percentage".equals(discountType)) {
                if (discountValue.compareTo(BigDecimal.ZERO) <= 0 || discountValue.compareTo(MAX_PERCENTAGE) > 0) {
                    errorMessages.append("Giá trị giảm giá theo phần trăm phải từ 1-50%.<br>");
                    isValid = false;
                }
                if (maxDiscount.compareTo(MIN_AMOUNT) < 0 || maxDiscount.compareTo(MAX_AMOUNT) > 0) {
                    errorMessages.append("Giảm tối đa phải từ 1.000 VNĐ đến 10 triệu VNĐ.<br>");
                    isValid = false;
                }
            } else if (discountValue.compareTo(MIN_AMOUNT) < 0 || discountValue.compareTo(MAX_AMOUNT) > 0) {
                errorMessages.append("Giá trị giảm giá cố định phải từ 1.000 VNĐ đến 10 triệu VNĐ.<br>");
                isValid = false;
            }

            // Validate minimum order amount
            if (minOrderAmount.compareTo(MIN_AMOUNT) < 0 || minOrderAmount.compareTo(MAX_AMOUNTORDER) > 0) {
                errorMessages.append("Giá trị đơn hàng tối thiểu phải từ 1.000 VNĐ đến 99.999.999 VNĐ.<br>");
                isValid = false;
            }

            // Validate usage limit
            if (usageLimitStr != null && !usageLimitStr.trim().isEmpty()) {
                int usageLimit = Integer.parseInt(usageLimitStr);
                if (usageLimit < 0 || usageLimit > MAX_USAGE_LIMIT) {
                    errorMessages.append("Số lần sử dụng tối đa phải từ 1 đến 1.000.000 lần.<br>");
                    isValid = false;
                }
            }

            // Parse and validate dates
            LocalDateTime expiryDateTime = LocalDateTime.parse(expiryDateStr, DATE_TIME_FORMATTER);
            LocalDateTime activationDateTime = (activationDateStr != null && !activationDateStr.isEmpty())
                    ? LocalDateTime.parse(activationDateStr, DATE_TIME_FORMATTER) : null;

            // Expiry date must be after current time
            if (expiryDateTime.isBefore(now)) {
                errorMessages.append("Ngày hết hạn phải lớn hơn thời điểm hiện tại.<br>");
                isValid = false;
            }

            // If activation date is provided, it must be before expiry date and after current time (if inactive)
            if (activationDateTime != null) {
                if (activationDateTime.isAfter(expiryDateTime)) {
                    errorMessages.append("Ngày kích hoạt phải sớm hơn ngày hết hạn.<br>");
                    isValid = false;
                }
                if ("inactive".equals(status) && activationDateTime.isBefore(now)) {
                    errorMessages.append("Ngày kích hoạt phải lớn hơn thời điểm hiện tại khi trạng thái là inactive.<br>");
                    isValid = false;
                }
            }

        } catch (Exception e) {
            errorMessages.append("Dữ liệu không hợp lệ: " + e.getMessage() + "<br>");
            isValid = false;
        }
        return isValid;
    }

    private void setFormAttributes(HttpServletRequest request, int id, String code, String discountType,
            String discountValueStr, String minOrderAmountStr, String maxDiscountStr,
            String usageLimitStr, String expiryDateStr, String activationDateStr, String couponType, String status) {
        request.setAttribute("id", id);
        request.setAttribute("code", code);
        request.setAttribute("discount_type", discountType);
        request.setAttribute("discount_value", discountValueStr);
        request.setAttribute("min_order_amount", minOrderAmountStr);
        request.setAttribute("max_discount", maxDiscountStr);
        request.setAttribute("usage_limit", usageLimitStr);
        request.setAttribute("expiry_date", expiryDateStr);
        request.setAttribute("activation_date", activationDateStr);
        request.setAttribute("coupon_type", couponType);
        request.setAttribute("status", status);
    }
}