<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bảng Báo Cáo Tiếp Thị</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        body {
            background: linear-gradient(135deg, #f0f4f8 0%, #d9e2ec 100%);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            min-height: 100vh;
        }

        .container-fluid {
            padding: 20px;
        }

        .main-content {
            margin-left: 250px; 
            padding: 30px;
            transition: margin-left 0.3s ease;
            width: calc(100% - 250px); 
        }

        @media (max-width: 768px) {
            .main-content {
                margin-left: 0; 
                width: 100%; 
                padding: 15px;
            }
        }

        .report-section {
            background: linear-gradient(145deg, #ffffff 0%, #f8f9fa 100%);
            border-radius: 12px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.05);
            padding: 25px;
            margin-bottom: 40px;
            transition: transform 0.2s ease;
        }

        .report-section:hover {
            transform: translateY(-5px);
        }

        .report-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 2px solid #e9ecef;
            padding-bottom: 15px;
            margin-bottom: 20px;
        }

        .report-header h2 {
            color: #2c3e50;
            font-weight: 600;
            font-size: 1.75rem;
        }

        .report-header p {
            color: #7f8c8d;
            margin: 0;
        }

        .btn-export {
            background-color: #3498db;
            color: white;
            border: none;
            padding: 8px 20px;
            border-radius: 6px;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        .btn-export:hover {
            background-color: #2980b9;
            transform: scale(1.05);
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-control {
            border-radius: 6px;
            border: 1px solid #ced4da;
            padding: 10px;
        }

        .btn-primary {
            background-color: #2ecc71;
            border: none;
            padding: 8px 20px;
            border-radius: 6px;
            transition: background-color 0.3s ease;
        }

        .btn-primary:hover {
            background-color: #27ae60;
        }

        .table {
            background-color: #fff;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
        }

        .table th {
            background-color: #3498db;
            color: white;
            font-weight: 500;
        }

        .table td {
            vertical-align: middle;
            color: #34495e;
        }

        .table-responsive {
            margin-top: 20px;
        }

        .table-container {
            display: none;
        }

        .table-container.active {
            display: block;
            animation: fadeIn 0.5s ease;
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        @media (max-width: 768px) {
            .main-content {
                margin-left: 0;
                padding: 15px;
            }

            .report-header {
                flex-direction: column;
                text-align: center;
            }

            .btn-export {
                margin-top: 10px;
            }
        }
    </style>
</head>
<body class="bg-light">
    <div class="container-fluid">
        <div class="row">
            <jsp:include page="sidebar.jsp" />

            <div class="main-content" style="margin-left: 250px; padding: 20px;">
                <h1 class="mb-4">Báo cáo tiếp thị</h1>


                <!-- 1. COUPON REPORT -->
                <c:if test="${reportType == 'overview' || reportType == 'coupon'}">
                    <div class="report-section bg-white" id="couponReportSection" style="border: 5px solid #006666;">
                        <div class="report-header">
                            <div>
                                <h2>Báo cáo phiếu giảm giả</h2>

                            </div>
                            <button class="btn btn-export" id="exportCouponBtn"><i class="fas fa-file-export me-1"></i> Xuất Excel</button>
                        </div>

                        <form method="get" action="">
                            <div class="form-group">
                                <label for="couponTableSelector">Chọn bảng hiển thị:</label>
                                <select id="couponTableSelector" name="selectedTable" class="form-control">
                                    <option value="kpi" <c:if test="${selectedTable == 'kpi' || empty selectedTable}">selected</c:if>>KPI Tổng quan</option>
                                    <option value="mostUsed" <c:if test="${selectedTable == 'mostUsed'}">selected</c:if>>Coupon sử dụng nhiều nhất</option>
                                    <option value="recommendations" <c:if test="${selectedTable == 'recommendations'}">selected</c:if>>Đề xuất</option>
                                    <option value="byType" <c:if test="${selectedTable == 'byType'}">selected</c:if>>Phân bố theo loại</option>
                                    <option value="byDiscountType" <c:if test="${selectedTable == 'byDiscountType'}">selected</c:if>>Phân bố theo loại giảm giá</option>
                                    <option value="expiryAnalysis" <c:if test="${selectedTable == 'expiryAnalysis'}">selected</c:if>>Phân tích thời gian hết hạn</option>
                                    </select>
                                </div>
                                <button type="submit" class="btn btn-primary">Hiển thị</button>
                            </form>

                            <div class="table-container <c:if test="${selectedTable == 'kpi' || empty selectedTable}">active</c:if>" id="couponKpiTableContainer">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="couponKpiTable">
                                        <thead>
                                            <tr><th>Tiêu chí</th><th>Giá trị</th></tr>
                                        </thead>
                                        <tbody>
                                            <tr><td>Tổng số Coupon</td><td><c:set var="totalCoupons" value="0" /><c:forEach items="${couponsByStatus}" var="entry"><c:set var="totalCoupons" value="${totalCoupons + entry.value}" /></c:forEach>${totalCoupons}</td></tr>
                                        <tr><td>Coupon đang hoạt động</td><td><c:out value="${couponsByStatus['active']}" default="0" /></td></tr>
                                        <tr><td>Giá trị giảm giá trung bình</td><td><fmt:formatNumber value="${averageDiscountAmount}" pattern="#,##0 VNĐ" /></td></tr>
                                        <tr><td>Coupon hết hạn chưa dùng</td><td>${unusedExpiredCouponsCount}</td></tr>
                                        <tr><td>Tỷ lệ sử dụng trung bình</td><td><fmt:formatNumber value="${couponUsageMetrics.averageUsageRate}" pattern="#,##0.00" />%</td></tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <!-- Coupon sử dụng nhiều nhất -->
                        <div class="table-container <c:if test="${selectedTable == 'mostUsed'}">active</c:if>" id="couponMostUsedTableContainer">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="couponMostUsedTable">
                                        <thead>
                                            <tr><th>Mã Coupon</th><th>Loại</th><th>Giá trị giảm giá</th><th>Số lần sử dụng</th><th>Tỷ lệ sử dụng</th></tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${mostUsedCoupons}" var="coupon">
                                            <tr>
                                                <td>${coupon.code}</td>
                                                <td>${coupon.discount_type}</td>
                                                <td><c:choose><c:when test="${coupon.discount_type == 'percentage'}">${coupon.discount_value}%</c:when><c:otherwise>$<fmt:formatNumber value="${coupon.discount_value}" pattern="#,##0.00" /></c:otherwise></c:choose></td>
                                                <td>${coupon.usage_count}</td>
                                                <td><c:choose><c:when test="${coupon.usage_limit > 0}"><fmt:formatNumber value="${coupon.usage_rate}" pattern="#,##0.00" />%</c:when><c:otherwise>Không giới hạn</c:otherwise></c:choose></td>
                                                    </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <!-- Đề xuất -->
                        <div class="table-container <c:if test="${selectedTable == 'recommendations'}">active</c:if>" id="couponRecommendationsTableContainer">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="couponRecommendationsTable">
                                        <thead>
                                            <tr><th>Hạng mục</th><th>Thông tin chi tiết & Đề xuất</th></tr>
                                        </thead>
                                        <tbody>
                                            <tr><td>Coupon hiệu quả</td><td><c:choose><c:when test="${not empty mostUsedCoupons && mostUsedCoupons.size() > 0}">Coupon <strong>${mostUsedCoupons[0].code}</strong> hiệu quả nhất với ${mostUsedCoupons[0].usage_count} lần dùng.</c:when><c:otherwise>Chưa có dữ liệu về hiệu quả coupon.</c:otherwise></c:choose></td></tr>
                                        <tr><td>Coupon hết hạn chưa dùng</td><td>Hiện có <strong>${unusedExpiredCouponsCount}</strong> coupon hết hạn chưa sử dụng.<c:if test="${unusedExpiredCouponsCount > 10}"> Xem xét cải thiện chiến lược quảng bá coupon.</c:if></td></tr>
                                        <tr><td>Tối ưu khuyến mãi</td><td><c:choose><c:when test="${averageDiscountAmount < 10}">Giảm giá trung bình thấp (<fmt:formatNumber value="${averageDiscountAmount}" pattern="#,##0.00" />). Tăng giá trị giảm giá để cải thiện tỷ lệ chuyển đổi.</c:when><c:when test="${averageDiscountAmount > 30}">Giảm giá trung bình cao (<fmt:formatNumber value="${averageDiscountAmount}" pattern="#,##0.00" />). Tối ưu hóa để đảm bảo lợi nhuận.</c:when><c:otherwise>Giảm giá trung bình (<fmt:formatNumber value="${averageDiscountAmount}" pattern="#,##0.00" />) ở mức tối ưu.</c:otherwise></c:choose></td></tr>
                                        <tr><td>Hiệu quả Coupon</td><td><c:choose><c:when test="${couponUsageMetrics.averageUsageRate < 20}">Tỷ lệ sử dụng trung bình thấp (<fmt:formatNumber value="${couponUsageMetrics.averageUsageRate}" pattern="#,##0.00" />%). Tăng cường quảng bá coupon.</c:when><c:otherwise>Tỷ lệ sử dụng trung bình tốt (<fmt:formatNumber value="${couponUsageMetrics.averageUsageRate}" pattern="#,##0.00" />%). Duy trì chiến lược hiện tại.</c:otherwise></c:choose></td></tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>

                                <!-- Phân bố theo loại -->
                                    <div class="table-container <c:if test="${selectedTable == 'byType'}">active</c:if>" id="couponByTypeTableContainer">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="couponByTypeTable">
                                        <thead>
                                            <tr><th>Loại Coupon</th><th>Số lượng</th></tr>
                                        </thead>
                                        <tbody>
                                        <c:choose><c:when test="${not empty couponsByType}"><c:forEach items="${couponsByType}" var="entry"><tr><td>${entry.key}</td><td>${entry.value}</td></tr></c:forEach></c:when><c:otherwise><tr><td colspan="2" class="text-center">No data available</td></tr></c:otherwise></c:choose>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>

                                    <!-- Phân bố theo loại giảm giá -->
                                        <div class="table-container <c:if test="${selectedTable == 'byDiscountType'}">active</c:if>" id="couponByDiscountTypeTableContainer">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="couponByDiscountTypeTable">
                                        <thead>
                                            <tr><th>Loại Giảm Giá</th><th>Số lượng</th></tr>
                                        </thead>
                                        <tbody>
                                        <c:choose><c:when test="${not empty couponsByDiscountType}"><c:forEach items="${couponsByDiscountType}" var="entry"><tr><td>${entry.key}</td><td>${entry.value}</td></tr></c:forEach></c:when><c:otherwise><tr><td colspan="2" class="text-center">No data available</td></tr></c:otherwise></c:choose>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>

                                    <!-- Phân tích thời gian hết hạn -->
                                        <div class="table-container <c:if test="${selectedTable == 'expiryAnalysis'}">active</c:if>" id="couponExpiryAnalysisTableContainer">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="couponExpiryAnalysisTable">
                                        <thead>
                                            <tr><th>Mã Coupon</th><th>Ngày Hết Hạn</th><th>Số Ngày Còn Lại</th></tr>
                                        </thead>
                                        <tbody>
                                        <c:choose><c:when test="${not empty couponExpiryAnalysis}"><c:forEach items="${couponExpiryAnalysis}" var="coupon"><tr><td>${coupon.code}</td><td><fmt:formatDate value="${coupon.expiry_date}" pattern="dd-MM-yyyy" /></td><td><c:choose><c:when test="${coupon.days_remaining < 0}"><span class="badge bg-danger">Hết hạn</span></c:when><c:otherwise>${coupon.days_remaining} ngày</c:otherwise></c:choose></td></tr></c:forEach></c:when><c:otherwise><tr><td colspan="3" class="text-center">No data available</td></tr></c:otherwise></c:choose>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                </c:if>


                <!-- 2. FEEDBACK REPORT -->
                <c:if test="${reportType == 'overview' || reportType == 'feedback'}">
                    <div class="report-section bg-white" id="feedbackReportSection" style="border: 5px solid #006666;">
                        <div class="report-header">
                            <div>
                                <h2>Báo cáo đánh giá</h2>
                            </div>
                            <button class="btn btn-export" id="exportFeedbackBtn"><i class="fas fa-file-export me-1"></i> Xuất Excel</button>
                        </div>

                        <form method="get" action="">
                            <div class="form-group">
                                <label for="feedbackTableSelector">Chọn bảng hiển thị:</label>
                                <select id="feedbackTableSelector" name="selectedTable" class="form-control">
                                    <option value="kpi" <c:if test="${selectedTable == 'kpi' || empty selectedTable}">selected</c:if>>KPI Tổng quan</option>
                                    <option value="ratingDistribution" <c:if test="${selectedTable == 'ratingDistribution'}">selected</c:if>>Phân bố Đánh giá theo Số Sao</option>
                                    <option value="mostActiveReviewers" <c:if test="${selectedTable == 'mostActiveReviewers'}">selected</c:if>>Người Đánh giá Tích cực Nhất</option>
                                    <option value="highestRatedProducts" <c:if test="${selectedTable == 'highestRatedProducts'}">selected</c:if>>Sản phẩm Đánh giá Cao Nhất</option>
                                    <option value="lowestRatedProducts" <c:if test="${selectedTable == 'lowestRatedProducts'}">selected</c:if>>Sản phẩm Đánh giá Thấp Nhất</option>
                                    <option value="recommendations" <c:if test="${selectedTable == 'recommendations'}">selected</c:if>>Đề xuất</option>
                                    </select>
                                </div>
                                <button type="submit" class="btn btn-primary">Hiển thị</button>
                            </form>

                            <!-- Bảng KPI Tổng quan -->
                            <div class="table-container <c:if test="${selectedTable == 'kpi' || empty selectedTable}">active</c:if>" id="feedbackKpiTableContainer">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="feedbackKpiTable">
                                        <thead>
                                            <tr>
                                                <th>Tiêu chí</th>
                                                <th>Giá trị</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr><td>Điểm đánh giá trung bình</td><td><fmt:formatNumber value="${averageRating}" pattern="#.0" /></td></tr>
                                        <tr><td>Tổng số đánh giá</td><td><c:set var="totalFeedback" value="0" /><c:forEach items="${feedbackByStatus}" var="entry"><c:set var="totalFeedback" value="${totalFeedback + entry.value}" /></c:forEach>${totalFeedback}</td></tr>
                                        <tr><td>Tỷ lệ phản hồi</td><td><fmt:formatNumber value="${customerFeedbackRate.feedback_rate}" pattern="#,##0.0" />%</td></tr>
                                        <tr><td>Đánh giá có hình ảnh</td><td>${feedbackWithImagesCount}</td></tr>
                                        <tr><td>Tỷ lệ sản phẩm có đánh giá</td><td><fmt:formatNumber value="${productRatingCoverage.coverage_rate}" pattern="#,##0.0" />%</td></tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <!-- Bảng Phân bố Đánh giá theo Số Sao -->
                        <div class="table-container <c:if test="${selectedTable == 'ratingDistribution'}">active</c:if>" id="ratingDistributionTableContainer">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="ratingDistributionTable">
                                        <thead>
                                            <tr>
                                                <th>Số Sao</th>
                                                <th>Số lượng Đánh giá</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:choose>
                                            <c:when test="${not empty ratingDistribution}">
                                                <c:forEach items="${ratingDistribution}" var="entry">
                                                    <tr>
                                                        <td>${entry.key} sao</td>
                                                        <td>${entry.value}</td>
                                                    </tr>
                                                </c:forEach>
                                            </c:when>
                                            <c:otherwise>
                                                <tr>
                                                    <td colspan="2" class="text-center">No data available</td>
                                                </tr>
                                            </c:otherwise>
                                        </c:choose>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <!-- Bảng Người Đánh giá Tích cực Nhất -->
                        <div class="table-container <c:if test="${selectedTable == 'mostActiveReviewers'}">active</c:if>" id="mostActiveReviewersTableContainer">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="mostActiveReviewersTable">
                                        <thead>
                                            <tr>
                                                <th>Tên Người Dùng</th>
                                                <th>Số Đánh giá</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:choose>
                                            <c:when test="${not empty mostActiveReviewers}">
                                                <c:forEach items="${mostActiveReviewers}" var="reviewer">
                                                    <tr>
                                                        <td>${reviewer.full_name}</td>
                                                        <td>${reviewer.feedback_count}</td>
                                                    </tr>
                                                </c:forEach>
                                            </c:when>
                                            <c:otherwise>
                                                <tr>
                                                    <td colspan="2" class="text-center">No data available</td>
                                                </tr>
                                            </c:otherwise>
                                        </c:choose>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <!-- Bảng Sản phẩm Đánh giá Cao Nhất -->
                        <div class="table-container <c:if test="${selectedTable == 'highestRatedProducts'}">active</c:if>" id="highestRatedProductsTableContainer">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="highestRatedProductsTable">
                                        <thead>
                                            <tr>
                                                <th>Tên sản phẩm</th>
                                                <th>Điểm trung bình</th>
                                                <th>Số đánh giá</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${highestRatedProducts}" var="product">
                                            <tr>
                                                <td>${product.title}</td>
                                                <td><fmt:formatNumber value="${product.avg_rating}" pattern="#.0" /></td>
                                                <td>${product.review_count}</td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <!-- Bảng Sản phẩm Đánh giá Thấp Nhất -->
                        <div class="table-container <c:if test="${selectedTable == 'lowestRatedProducts'}">active</c:if>" id="lowestRatedProductsTableContainer">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="lowestRatedProductsTable">
                                        <thead>
                                            <tr>
                                                <th>Tên sản phẩm</th>
                                                <th>Điểm trung bình</th>
                                                <th>Số đánh giá</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${lowestRatedProducts}" var="product">
                                            <tr>
                                                <td>${product.title}</td>
                                                <td><fmt:formatNumber value="${product.avg_rating}" pattern="#.0" /></td>
                                                <td>${product.review_count}</td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <!-- Bảng Đề xuất -->
                        <div class="table-container <c:if test="${selectedTable == 'recommendations'}">active</c:if>" id="feedbackRecommendationsTableContainer">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="feedbackRecommendationsTable">
                                        <thead>
                                            <tr>
                                                <th>Hạng mục</th>
                                                <th>Thông tin chi tiết & Đề xuất</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>Sản phẩm tốt nhất</td>
                                                <td>
                                                <c:choose>
                                                    <c:when test="${not empty highestRatedProducts && highestRatedProducts.size() > 0}">
                                                        <strong>${highestRatedProducts[0].title}</strong> đạt ${highestRatedProducts[0].avg_rating} sao. Xem xét quảng bá sản phẩm này.
                                                    </c:when>
                                                    <c:otherwise>
                                                        Chưa có dữ liệu về sản phẩm được đánh giá cao.
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Cải thiện sản phẩm</td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${not empty lowestRatedProducts && lowestRatedProducts.size() > 0}">
                                                        <strong>${lowestRatedProducts[0].title}</strong> chỉ đạt ${lowestRatedProducts[0].avg_rating} sao. Xem xét cải thiện chất lượng.
                                                    </c:when>
                                                    <c:otherwise>
                                                        Chưa có dữ liệu về sản phẩm được đánh giá thấp.
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Dịch vụ khách hàng</td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${feedbackWithRepliesCount / totalFeedback < 0.5}">
                                                        Chỉ <fmt:formatNumber value="${feedbackWithRepliesCount / totalFeedback * 100}" pattern="#,##0.0" />% đánh giá được phản hồi. Cải thiện tỷ lệ phản hồi.
                                                    </c:when>
                                                    <c:otherwise>
                                                        Dịch vụ tốt với <fmt:formatNumber value="${feedbackWithRepliesCount / totalFeedback * 100}" pattern="#,##0.0" />% đánh giá được phản hồi.
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </c:if>

                <!-- 3. PRODUCT REPORT -->
                <c:if test="${reportType == 'overview' || reportType == 'product'}">
                    <div class="report-section bg-white" id="productReportSection" style="border: 5px solid #006666;">
                        <div class="report-header">
                            <div>
                                <h2>Báo cáo sản phẩm</h2>

                            </div>
                            <button class="btn btn-export" id="exportProductBtn"><i class="fas fa-file-export me-1"></i> Xuất Excel</button>
                        </div>

                        <form method="get" action="">
                            <div class="form-group">
                                <label for="productTableSelector">Chọn bảng hiển thị:</label>
                                <select id="productTableSelector" name="selectedTable" class="form-control">
                                    <option value="kpi" <c:if test="${selectedTable == 'kpi' || empty selectedTable}">selected</c:if>>KPI Tổng quan</option>
                                    <option value="bestSellingProducts" <c:if test="${selectedTable == 'bestSellingProducts'}">selected</c:if>>Sản phẩm Bán chạy Nhất</option>
                                    <option value="priceIncrease" <c:if test="${selectedTable == 'priceIncrease'}">selected</c:if>>Sản phẩm Tăng giá Cao Nhất</option>
                                    <option value="recommendations" <c:if test="${selectedTable == 'recommendations'}">selected</c:if>>Đề xuất</option>
                                    </select>
                                </div>
                                <button type="submit" class="btn btn-primary">Hiển thị</button>
                            </form>

                            <!-- Bảng KPI Tổng quan -->
                            <div class="table-container <c:if test="${selectedTable == 'kpi' || empty selectedTable}">active</c:if>" id="productKpiTableContainer">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="productKpiTable">
                                        <thead>
                                            <tr>
                                                <th>Tiêu chí</th>
                                                <th>Giá trị</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr><td>Tổng số sản phẩm</td><td><c:set var="totalProducts" value="0" /><c:forEach items="${productsByStatus}" var="entry"><c:set var="totalProducts" value="${totalProducts + entry.value}" /></c:forEach>${totalProducts}</td></tr>
                                        <tr><td>Sản phẩm đang hoạt động</td><td><c:out value="${productsByStatus['active']}" default="0" /></td></tr>
                                        <tr><td>Sản phẩm combo</td><td>${comboProductsCount}</td></tr>
                                        <tr><td>Sản phẩm hết hàng</td><td><c:out value="${productsByStatus['EOStock']}" default="0" /></td></tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <!-- Bảng Sản phẩm Bán chạy Nhất -->
                        <div class="table-container <c:if test="${selectedTable == 'bestSellingProducts'}">active</c:if>" id="bestSellingProductsTableContainer">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="bestSellingProductsTable">
                                        <thead>
                                            <tr>
                                                <th>Tên sản phẩm</th>
                                                <th>Số lượng bán</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${bestSellingProducts}" var="product">
                                            <tr>
                                                <td>${product.title}</td>
                                                <td>${product.total_sold}</td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <!-- Bảng Sản phẩm Tăng giá Cao Nhất -->
                        <div class="table-container <c:if test="${selectedTable == 'priceIncrease'}">active</c:if>" id="priceIncreaseTableContainer">
                                <div class="table-responsive">
                                <c:if test="${empty productsWithHighestPriceIncrease}">
                                    <p class="text-center text-danger">Không có sản phẩm nào tăng giá!</p>
                                </c:if>
                                <table class="table table-bordered" id="priceIncreaseTable" <c:if test="${not empty productsWithHighestPriceIncrease}">style="display:block;"</c:if>>
                                        <thead>
                                            <tr>
                                                <th>Tên sản phẩm</th>
                                                <th>Giá gốc</th>
                                                <th>Giá mới</th>
                                                <th>Tỷ lệ tăng giá</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${productsWithHighestPriceIncrease}" var="product">
                                            <tr>
                                                <td>${product.title}</td>
                                                <td><fmt:formatNumber value="${product.original_price}" pattern="#,###" /> VNĐ</td>
                                                <td><fmt:formatNumber value="${product.sale_price}" pattern="#,###" /> VNĐ</td>
                                                <td><span class="text-danger"><fmt:formatNumber value="${product.increase_percentage}" pattern="#,##0.0" />%</span></td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>


                        <!-- Bảng Đề xuất -->
                        <div class="table-container <c:if test="${selectedTable == 'recommendations'}">active</c:if>" id="productRecommendationsTableContainer">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="productRecommendationsTable">
                                        <thead>
                                            <tr>
                                                <th>Hạng mục</th>
                                                <th>Thông tin chi tiết & Đề xuất</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>Danh mục tốt nhất</td>
                                                <td>
                                                <c:choose>
                                                    <c:when test="${not empty revenueByCategory && revenueByCategory.size() > 0}">
                                                        <c:set var="topCategory" value="" />
                                                        <c:set var="topRevenue" value="0" />
                                                        <c:forEach items="${revenueByCategory}" var="entry">
                                                            <c:if test="${entry.revenue > topRevenue}">
                                                                <c:set var="topCategory" value="${entry.name}" />
                                                                <c:set var="topRevenue" value="${entry.revenue}" />
                                                            </c:if>
                                                        </c:forEach>
                                                        Danh mục <strong>${topCategory}</strong> dẫn đầu với doanh thu <fmt:formatNumber value="${topRevenue}" pattern="#,###" /> VNĐ. Mở rộng dòng sản phẩm này.
                                                    </c:when>
                                                    <c:otherwise>
                                                        Chưa có dữ liệu doanh thu theo danh mục.
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Bổ sung hàng tồn kho</td>
                                            <td>
                                                <c:out value="${productsByStatus['EOStock']}" default="0" /> sản phẩm hết hàng.
                                                <c:if test="${productsByStatus['EOStock'] > 10}">
                                                    Ưu tiên bổ sung hàng cho các sản phẩm bán chạy.
                                                </c:if>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Tối ưu danh mục sản phẩm</td>
                                            <td>
                                                Combo chiếm <fmt:formatNumber value="${comboProductsCount / totalProducts * 100}" pattern="#,##0.0" />% trong ${totalProducts} sản phẩm.
                                                <c:if test="${comboProductsCount / totalProducts < 0.1}">
                                                    Tăng thêm sản phẩm combo để nâng giá trị đơn hàng.
                                                </c:if>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </c:if>

                <c:if test="${reportType == 'overview' || reportType == 'inventory'}">
                    <div class="report-section bg-white" id="inventoryReportSection" style="border: 5px solid #006666;">
                        <div class="report-header">
                            <div>
                                <h2>Báo cáo kho</h2>

                            </div>
                            <button class="btn btn-export" id="exportInventoryBtn"><i class="fas fa-file-export me-1"></i> Xuất Excel</button>
                        </div>

                        <form method="get" action="">
                            <div class="form-group">
                                <label for="inventoryTableSelector">Chọn bảng hiển thị:</label>
                                <select id="inventoryTableSelector" name="selectedTable" class="form-control">
                                    <option value="kpi" <c:if test="${selectedTable == 'kpi' || empty selectedTable}">selected</c:if>>KPI Tổng quan</option>
                                    <option value="lowStockProducts" <c:if test="${selectedTable == 'lowStockProducts'}">selected</c:if>>Sản phẩm Tồn kho Thấp</option>
                                    <option value="inventoryByProduct" <c:if test="${selectedTable == 'inventoryByProduct'}">selected</c:if>>Tổng Tồn kho theo Sản phẩm</option>
                                    <option value="inventoryByCategory" <c:if test="${selectedTable == 'inventoryByCategory'}">selected</c:if>>Tổng Tồn kho theo Danh mục</option>
                                    <option value="recommendations" <c:if test="${selectedTable == 'recommendations'}">selected</c:if>>Đề xuất</option>
                                    </select>
                                </div>
                                <button type="submit" class="btn btn-primary">Hiển thị</button>
                            </form>

                            <!-- Bảng KPI Tổng quan -->
                            <div class="table-container <c:if test="${selectedTable == 'kpi' || empty selectedTable}">active</c:if>" id="inventoryKpiTableContainer">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="inventoryKpiTable">
                                        <thead>
                                            <tr>
                                                <th>Tiêu chí</th>
                                                <th>Giá trị</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr><td>Tổng giá trị tồn kho</td><td><fmt:formatNumber value="${totalInventoryValue}" pattern="#,##0 VNĐ" /></td></tr>
                                        <tr><td>Sản phẩm tồn kho thấp (dưới 10)</td><td>${lowStockProducts.size()}</td></tr>
                                        <tr><td>Tỷ lệ hết hàng</td><td><fmt:formatNumber value="${outOfStockRate.out_of_stock_rate}" pattern="#,##0.0" />%</td></tr>
                                        <tr><td>Sản phẩm chưa nhập lại</td><td>${productsWithoutRecentRestocking.size()}</td></tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <!-- Bảng Sản phẩm tồn kho thấp -->
                        <div class="table-container <c:if test="${selectedTable == 'lowStockProducts'}">active</c:if>" id="lowStockProductsTableContainer">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="lowStockProductsTable">
                                        <thead>
                                            <tr>
                                                <th>Product ID</th>
                                                <th>Product Name</th>
                                                <th>Size</th>
                                                <th>Color</th>
                                                <th>Stock</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:choose>
                                            <c:when test="${not empty lowStockProducts}">
                                                <c:forEach items="${lowStockProducts}" var="product">
                                                    <tr>
                                                        <td>${product.id}</td>
                                                        <td>${product.title}</td>
                                                        <td>${product.size}</td>
                                                        <td>${product.color}</td>
                                                        <td><span class="badge bg-danger">${product.stock_quantity}</span></td>
                                                    </tr>
                                                </c:forEach>
                                            </c:when>
                                            <c:otherwise>
                                                <tr><td colspan="5" class="text-center">No low stock products</td></tr>
                                            </c:otherwise>
                                        </c:choose>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <!-- Bảng Tổng Tồn kho theo Sản phẩm -->
                        <div class="table-container <c:if test="${selectedTable == 'inventoryByProduct'}">active</c:if>" id="inventoryByProductTableContainer">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="inventoryByProductTable">
                                        <thead>
                                            <tr>
                                                <th>Tên Sản phẩm</th>
                                                <th>Tổng Tồn kho</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:choose>
                                            <c:when test="${not empty totalInventoryByProduct}">
                                                <c:forEach items="${totalInventoryByProduct}" var="product">
                                                    <tr>
                                                        <td>${product.title}</td>
                                                        <td>${product.total_stock}</td>
                                                    </tr>
                                                </c:forEach>
                                            </c:when>
                                            <c:otherwise>
                                                <tr><td colspan="2" class="text-center">No data available</td></tr>
                                            </c:otherwise>
                                        </c:choose>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <!-- Bảng Tổng Tồn kho theo Danh mục -->
                        <div class="table-container <c:if test="${selectedTable == 'inventoryByCategory'}">active</c:if>" id="inventoryByCategoryTableContainer">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="inventoryByCategoryTable">
                                        <thead>
                                            <tr>
                                                <th>Danh mục</th>
                                                <th>Tổng Tồn kho</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:choose>
                                            <c:when test="${not empty inventoryByCategory}">
                                                <c:forEach items="${inventoryByCategory}" var="category">
                                                    <tr>
                                                        <td>${category.name}</td>
                                                        <td>${category.total_stock}</td>
                                                    </tr>
                                                </c:forEach>
                                            </c:when>
                                            <c:otherwise>
                                                <tr><td colspan="2" class="text-center">No data available</td></tr>
                                            </c:otherwise>
                                        </c:choose>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <!-- Bảng Đề xuất -->
                        <div class="table-container <c:if test="${selectedTable == 'recommendations'}">active</c:if>" id="inventoryRecommendationsTableContainer">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="inventoryRecommendationsTable">
                                        <thead>
                                            <tr>
                                                <th>Hạng mục</th>
                                                <th>Thông tin chi tiết & Đề xuất</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>Ưu tiên bổ sung</td>
                                                <td>
                                                <c:choose>
                                                    <c:when test="${not empty lowStockProducts && lowStockProducts.size() > 0}">
                                                        <strong>${lowStockProducts[0].title}</strong> cần bổ sung ngay với ${lowStockProducts[0].total_stock} đơn vị.
                                                    </c:when>
                                                    <c:otherwise>
                                                        Không có yêu cầu bổ sung khẩn cấp.
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Tồn kho dư thừa</td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${not empty productsWithoutRecentRestocking && productsWithoutRecentRestocking.size() > 0}">
                                                        ${productsWithoutRecentRestocking.size()} sản phẩm chưa bán trong 29+ ngày. Xem xét khuyến mãi để giảm tồn kho.
                                                    </c:when>
                                                    <c:otherwise>
                                                        Tồn kho đang luân chuyển tốt, không có dư thừa đáng kể.
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Biến thể phổ biến</td>
                                            <td>
                                                <c:if test="${not empty productVariationsBySize && not empty productVariationsByColor}">
                                                    <c:set var="topSize" value="" /><c:set var="topSizeCount" value="0" />
                                                    <c:forEach items="${productVariationsBySize}" var="entry">
                                                        <c:if test="${entry.value > topSizeCount}">
                                                            <c:set var="topSize" value="${entry.key}" />
                                                            <c:set var="topSizeCount" value="${entry.value}" />
                                                        </c:if>
                                                    </c:forEach>
                                                    <c:set var="topColor" value="" /><c:set var="topColorCount" value="0" />
                                                    <c:forEach items="${productVariationsByColor}" var="entry">
                                                        <c:if test="${entry.value > topColorCount}">
                                                            <c:set var="topColor" value="${entry.key}" />
                                                            <c:set var="topColorCount" value="${entry.value}" />
                                                        </c:if>
                                                    </c:forEach>
                                                    Size <strong>${topSize}</strong> và màu <strong>${topColor}</strong> phổ biến nhất. Đảm bảo đủ hàng cho các biến thể này.
                                                </c:if>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </c:if>

                <c:if test="${reportType == 'overview' || reportType == 'slider'}">
                    <div class="report-section bg-white" id="sliderReportSection" style="border: 5px solid #006666;">
                        <div class="report-header">
                            <div>
                                <h2>Báo cáo thanh trượt</h2>

                            </div>
                            <button class="btn btn-export" id="exportSliderBtn"><i class="fas fa-file-export me-1"></i> Xuất Excel</button>
                        </div>

                        <form method="get" action="">
                            <div class="form-group">
                                <label for="sliderTableSelector">Chọn bảng hiển thị:</label>
                                <select id="sliderTableSelector" name="selectedTable" class="form-control">
                                    <option value="kpi" <c:if test="${selectedTable == 'kpi' || empty selectedTable}">selected</c:if>>KPI Tổng quan</option>
                                    <option value="allSliders" <c:if test="${selectedTable == 'allSliders'}">selected</c:if>>Tất cả Slider</option>
                                    <option value="recommendations" <c:if test="${selectedTable == 'recommendations'}">selected</c:if>>Đề xuất</option>
                                    </select>
                                </div>
                                <button type="submit" class="btn btn-primary">Hiển thị</button>
                            </form>

                            <!-- Bảng KPI Tổng quan -->
                            <div class="table-container <c:if test="${selectedTable == 'kpi' || empty selectedTable}">active</c:if>" id="sliderKpiTableContainer">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="sliderKpiTable">
                                        <thead>
                                            <tr>
                                                <th>Tiêu chí</th>
                                                <th>Giá trị</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr><td>Tổng số Slider</td><td><c:set var="totalSliders" value="0" /><c:forEach items="${slidersByStatus}" var="entry"><c:set var="totalSliders" value="${totalSliders + entry.value}" /></c:forEach>${totalSliders}</td></tr>
                                        <tr><td>Slider đang hoạt động</td><td><c:out value="${slidersByStatus['active']}" default="0" /></td></tr>
                                        <tr><td>Slider không hoạt động</td><td><c:out value="${slidersByStatus['inactive']}" default="0" /></td></tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <!-- Bảng Tất cả Slider -->
                        <div class="table-container <c:if test="${selectedTable == 'allSliders'}">active</c:if>" id="allSlidersTableContainer">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="allSlidersTable">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Tiêu đề</th>
                                                <th>Trạng thái</th>
                                                <th>Thứ tự hiển thị</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${allSliders}" var="slider">
                                            <tr>
                                                <td>${slider.id}</td>
                                                <td>${slider.title}</td>
                                                <td>${slider.status}</td>
                                                <td>${slider.display_order}</td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <!-- Bảng Đề xuất -->
                        <div class="table-container <c:if test="${selectedTable == 'recommendations'}">active</c:if>" id="sliderRecommendationsTableContainer">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="sliderRecommendationsTable">
                                        <thead>
                                            <tr>
                                                <th>Hạng mục</th>
                                                <th>Thông tin chi tiết & Đề xuất</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>Banner đang hoạt động</td>
                                                <td>
                                                    Hiện có ${slidersByStatus['active']} slider đang hoạt động trong ${totalSliders} slider.
                                                <c:choose>
                                                    <c:when test="${slidersByStatus['active'] > 5}">
                                                        Giảm số lượng slider để tăng hiệu quả và tốc độ tải.
                                                    </c:when>
                                                    <c:when test="${slidersByStatus['active'] < 2}">
                                                        Tăng số lượng slider để hiển thị thêm nội dung khuyến mãi.
                                                    </c:when>
                                                </c:choose>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Đánh giá thứ tự hiển thị</td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${slidersByStatus['active'] > 0}">
                                                        <c:set var="maxDisplayOrder" value="0" />
                                                        <c:forEach items="${allSliders}" var="slider">
                                                            <c:if test="${slider.display_order > maxDisplayOrder}">
                                                                <c:set var="maxDisplayOrder" value="${slider.display_order}" />
                                                            </c:if>
                                                        </c:forEach>
                                                        <c:choose>
                                                            <c:when test="${maxDisplayOrder > 10}">
                                                                Thứ tự hiển thị tối đa (${maxDisplayOrder}) quá lớn. Tối ưu hóa để dưới 10 nhằm tăng trải nghiệm người dùng.
                                                            </c:when>
                                                            <c:otherwise>
                                                                Thứ tự hiển thị tối đa (${maxDisplayOrder}) phù hợp cho giao diện.
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:when>
                                                    <c:otherwise>
                                                        Chưa có slider hoạt động để đánh giá thứ tự hiển thị.
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </c:if>

                <c:if test="${reportType == 'overview' || reportType == 'post'}">
                    <div class="report-section bg-white" id="postReportSection" style="border: 5px solid #006666;">
                        <div class="report-header">
                            <div>
                                <h2>Báo cáo bài đăng</h2>

                            </div>
                            <button class="btn btn-export" id="exportPostBtn"><i class="fas fa-file-export me-1"></i> Xuất Excel</button>
                        </div>

                        <form method="get" action="">
                            <div class="form-group">
                                <label for="postTableSelector">Chọn bảng hiển thị:</label>
                                <select id="postTableSelector" name="selectedTable" class="form-control">
                                    <option value="kpi" <c:if test="${selectedTable == 'kpi' || empty selectedTable}">selected</c:if>>KPI Tổng quan</option>
                                    <option value="longTimeDraftPosts" <c:if test="${selectedTable == 'longTimeDraftPosts'}">selected</c:if>>Bài viết Nháp Lâu dài</option>
                                    <option value="postsByAuthor" <c:if test="${selectedTable == 'postsByAuthor'}">selected</c:if>>Số lượng Bài viết theo Tác giả</option>
                                    <option value="recommendations" <c:if test="${selectedTable == 'recommendations'}">selected</c:if>>Đề xuất</option>
                                    </select>
                                </div>
                                <button type="submit" class="btn btn-primary">Hiển thị</button>
                            </form>

                            <!-- Bảng KPI Tổng quan -->
                            <div class="table-container <c:if test="${selectedTable == 'kpi' || empty selectedTable}">active</c:if>" id="postKpiTableContainer">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="postKpiTable">
                                        <thead>
                                            <tr>
                                                <th>Tiêu chí</th>
                                                <th>Giá trị</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr><td>Tổng số bài viết</td><td><c:set var="totalPosts" value="0" /><c:forEach items="${postsByStatus}" var="entry"><c:set var="totalPosts" value="${totalPosts + entry.value}" /></c:forEach>${totalPosts}</td></tr>
                                        <tr><td>Bài viết đã đăng</td><td><c:out value="${postsByStatus['published']}" default="0" /></td></tr>
                                        <tr><td>Bài viết nổi bật</td><td>${featuredPostsCount}</td></tr>
                                        <tr><td>Bài viết nháp</td><td><c:out value="${postsByStatus['draft']}" default="0" /></td></tr>
                                        <tr><td>Thời gian trung bình từ nháp đến đăng</td><td><fmt:formatNumber value="${averageTimeDraftToPublished}" pattern="#,##0.0" /> ngày</td></tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <!-- Bảng Bài viết nháp lâu dài -->
                        <div class="table-container <c:if test="${selectedTable == 'longTimeDraftPosts'}">active</c:if>" id="longTimeDraftPostsTableContainer">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="longTimeDraftPostsTable">
                                        <thead>
                                            <tr>
                                                <th>Tiêu đề</th>
                                                <th>Ngày tạo</th>
                                                <th>Số ngày trong nháp</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${longTimeDraftPosts}" var="post">
                                            <tr>
                                                <td>${post.title}</td>
                                                <td><fmt:formatDate value="${post.created_at}" pattern="dd-MM-yyyy" /></td>
                                                <td>${post.days_in_draft} ngày</td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <!-- Bảng Số lượng Bài viết theo Tác giả -->
                        <div class="table-container <c:if test="${selectedTable == 'postsByAuthor'}">active</c:if>" id="postsByAuthorTableContainer">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="postsByAuthorTable">
                                        <thead>
                                            <tr>
                                                <th>Tác giả</th>
                                                <th>Số lượng Bài viết</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:choose>
                                            <c:when test="${not empty postsByAuthor}">
                                                <c:forEach items="${postsByAuthor}" var="author">
                                                    <tr>
                                                        <td>${author.full_name}</td>
                                                        <td>${author.post_count}</td>
                                                    </tr>
                                                </c:forEach>
                                            </c:when>
                                            <c:otherwise>
                                                <tr><td colspan="2" class="text-center">No data available</td></tr>
                                            </c:otherwise>
                                        </c:choose>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <!-- Bảng Đề xuất -->
                        <div class="table-container <c:if test="${selectedTable == 'recommendations'}">active</c:if>" id="postRecommendationsTableContainer">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="postRecommendationsTable">
                                        <thead>
                                            <tr>
                                                <th>Hạng mục</th>
                                                <th>Thông tin chi tiết & Đề xuất</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>Tần suất đăng bài</td>
                                                <td>
                                                <c:set var="currentMonth" value="<%= new java.text.SimpleDateFormat(\"yyyy-MM\").format(new java.util.Date()) %>" />
                                                <c:set var="postsThisMonth" value="${postDistributionByMonth[currentMonth]}" />
                                                <c:choose>
                                                    <c:when test="${postsThisMonth == null || postsThisMonth < 4}">
                                                        Chỉ <c:out value="${postsThisMonth}" default="0" /> bài tháng này. Tăng lên ít nhất 4 bài/tháng để cải thiện SEO.
                                                    </c:when>
                                                    <c:otherwise>
                                                        ${postsThisMonth} bài tháng này. Duy trì tần suất tốt cho SEO và tương tác.
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Quản lý nháp</td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${not empty longTimeDraftPosts}">
                                                        ${longTimeDraftPosts.size()} bài nháp > 7 ngày. Hoàn thành hoặc lưu trữ để tối ưu quy trình.
                                                    </c:when>
                                                    <c:otherwise>
                                                        Không có bài nháp tồn đọng lâu. Quy trình nội dung hiệu quả!
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Độ tươi mới nội dung</td>
                                            <td>
                                                <c:if test="${not empty latestUpdatedPostDate}">
                                                    <c:set var="currentDate" value="<%= new java.util.Date() %>" />
                                                    <c:set var="daysSinceUpdate" value="${(currentDate.time - latestUpdatedPostDate.time) / (1000 * 60 * 60 * 24)}" />
                                                    <fmt:formatNumber value="${daysSinceUpdate}" pattern="#,##0" /> ngày kể từ cập nhật cuối.
                                                    <c:if test="${daysSinceUpdate > 30}">
                                                        Làm mới nội dung để cải thiện SEO và độ liên quan.
                                                    </c:if>
                                                </c:if>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </c:if>
            </div> 
        </div> 
    </div> 
    <script>
    document.addEventListener("DOMContentLoaded", function () {
        if (sessionStorage.getItem("scrollPosition")) {
            window.scrollTo(0, sessionStorage.getItem("scrollPosition"));
        }
    });

    window.addEventListener("beforeunload", function () {
        sessionStorage.setItem("scrollPosition", window.scrollY);
    });
</script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.18.5/xlsx.full.min.js"></script>
    <script>
        $(document).ready(function() {
            // Function to export all tables in a section to a single Excel file with multiple sheets
            function exportSectionToExcel(sectionId, fileName) {
                const wb = XLSX.utils.book_new();
                const section = document.getElementById(sectionId);
                const tables = section.getElementsByTagName('table');
                
                for (let i = 0; i < tables.length; i++) {
                    const ws = XLSX.utils.table_to_sheet(tables[i]);
                    const tableId = tables[i].id || `Sheet${i + 1}`;
                    XLSX.utils.book_append_sheet(wb, ws, tableId.substring(0, 31)); // Sheet names limited to 31 chars
                }
                
                XLSX.writeFile(wb, fileName + '.xlsx');
            }

            // Export button handlers
            $('#exportCouponBtn').click(function() {
                exportSectionToExcel('couponReportSection', 'coupon_report');
            });

            // Add similar handlers for other sections
            $('#exportFeedbackBtn').click(function() {
                exportSectionToExcel('feedbackReportSection', 'feedback_report');
            });
            $('#exportProductBtn').click(function() {
                exportSectionToExcel('productReportSection', 'product_report');
            });
            $('#exportInventoryBtn').click(function() {
                exportSectionToExcel('inventoryReportSection', 'inventory_report');
            });
            $('#exportSliderBtn').click(function() {
                exportSectionToExcel('sliderReportSection', 'slider_report');
            });
            $('#exportPostBtn').click(function() {
                exportSectionToExcel('postReportSection', 'post_report');
            });
        });
    </script>

</body>
</html>