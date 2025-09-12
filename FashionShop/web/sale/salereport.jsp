<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Bảng Báo Cáo Bán Hàng</title>

        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">

        <!-- SheetJS for exporting to Excel -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.18.5/xlsx.full.min.js"></script>

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
                text-transform: uppercase;
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
            .table-container {
                display: block;
            }
            .table-container.active {
                animation: fadeIn 0.5s ease;
            }
            @keyframes fadeIn {
                from {
                    opacity: 0;
                }
                to {
                    opacity: 1;
                }
            }
            .section-title {
                color: #2c3e50;
                font-weight: 600;
                font-size: 1.75rem;
                border-bottom: 2px solid #e9ecef;
                padding-bottom: 15px;
                margin-bottom: 20px;
            }
            .table .highlight-number {
                font-weight: 900; /* Extra bold for more emphasis */
                color: #000000 !important;

            </style>
        </head>
        <body>
            <div class="main-content">
                <!-- Include Sidebar -->
                <jsp:include page="sidebar.jsp" />

                <div class="container-fluid">
                    <div class="report-header">
                        <h1 class="report-title">Bảng Báo Cáo Bán Hàng</h1>
                        <p><strong>Khoảng thời gian:</strong> Từ <fmt:formatDate value="${salesReport.startDate}" pattern="dd/MM/yyyy"/> 
                            đến <fmt:formatDate value="${salesReport.endDate}" pattern="dd/MM/yyyy"/></p>
                    </div>

                    <form action="${pageContext.request.contextPath}/sale/report" method="GET" class="mb-4">
                        <div class="row">
                            <div class="col-md-3">
                                <label class="form-label">Từ Ngày</label>
                                <input type="date" name="startDate" class="form-control" value="${startDate}" required>
                            </div>
                            <div class="col-md-3">
                                <label class="form-label">Đến Ngày</label>
                                <input type="date" name="endDate" class="form-control" value="${endDate}" required>
                            </div>
                            <div class="col-md-2 align-self-end">
                                <button type="submit" class="btn btn-primary">Tạo Báo Cáo</button>
                            </div>
                        </div>
                    </form>

                    <!-- Section 1: Tổng Quan Doanh Thu -->
                    <div class="report-section">
                        <div class="section-title">1. Tổng Quan Doanh Thu</div>
                        <button class="btn btn-primary btn-export mb-3" id="exportSection1Btn">
                            <i class="fas fa-file-export me-1"></i>Xuất báo cáo
                        </button>
                        <table class="table table-bordered table-report" id="overviewTable">
                            <h6>1.1 Tổng quan</h6>
                            <thead>
                                <tr>
                                    <th>Tổng Số Đơn Hàng</th>
                                    <th>Tổng Doanh Thu</th>
                                    <th>Giá Trị Đơn Hàng Trung Bình</th>
                                    <th>Tổng Số Khách Hàng</th>
                                    <th>Tổng Số Sản Phẩm Bán Được</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>${salesReport.totalOrders}</td>
                                    <td><fmt:formatNumber value="${salesReport.totalRevenue}" type="currency" currencySymbol="VNĐ"/></td>
                                    <td><fmt:formatNumber value="${salesReport.averageOrderValue}" type="currency" currencySymbol="VNĐ"/></td>
                                    <td>${salesReport.totalCustomers}</td>
                                    <td>${salesReport.totalProducts}</td>
                                </tr>
                            </tbody>
                        </table>
                        <div class="table-container" id="overviewRecommendationsTableContainer">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="overviewRecommendationsTable">
                                    <h6>1.2 Nhận xét tổng quan doanh thu</h6>
                                    <thead>
                                        <tr><th>Hạng mục</th><th>Thông tin chi tiết & Đề xuất</th></tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>Hiệu quả doanh thu</td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${salesReport.totalRevenue > 5000000}">
                                                        Doanh thu: <span class="highlight-number"><fmt:formatNumber value="${salesReport.totalRevenue}" type="currency" currencySymbol="VNĐ"/></span> thì 
                                                        tiếp tục phát huy chiến lược bán hàng hiện tại và xem xét mở rộng quy mô!
                                                    </c:when>
                                                    <c:otherwise>
                                                        Doanh thu: <span class="highlight-number"><fmt:formatNumber value="${salesReport.totalRevenue}" type="currency" currencySymbol="VNĐ"/></span> thì 
                                                        xem xét tối ưu hóa chi phí hoặc đẩy mạnh các chương trình khuyến mãi.
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Giá trị đơn hàng trung bình</td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${salesReport.averageOrderValue < 1000000}">
                                                        Giá trị trung bình thấp <span class="highlight-number"><fmt:formatNumber value="${salesReport.averageOrderValue}" type="currency" currencySymbol="VNĐ"/></span>. Đề xuất thêm sản phẩm combo hoặc ưu đãi để tăng giá trị đơn hàng.
                                                    </c:when>
                                                    <c:otherwise>
                                                        Giá trị trung bình tốt <span class="highlight-number"><fmt:formatNumber value="${salesReport.averageOrderValue}" type="currency" currencySymbol="VNĐ"/></span>. Tập trung quảng bá các sản phẩm giá trị cao.
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- 2. Doanh Thu Theo Thời Gian -->
                <div class="container-fluid">
                    <div class="report-section">
                        <div class="section-title">2. Doanh Thu Theo Thời Gian</div>
                        <button class="btn btn-primary btn-export mb-3" id="exportSection2Btn">
                            <i class="fas fa-file-export me-1"></i>Xuất báo cáo
                        </button>
                        <h6>2.1 Doanh Thu Hàng Ngày</h6>
                        <table class="table table-bordered table-report" id="dailyRevenueTable">
                            <thead>
                                <tr>
                                    <th>Ngày</th>
                                    <th>Doanh Thu</th>
                                    <th>Số Đơn Hàng</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${salesReport.dailyRevenue}" var="entry">
                                    <tr>
                                        <td>${entry.key}</td>
                                        <td><fmt:formatNumber value="${entry.value}" type="currency" currencySymbol="VNĐ"/></td>
                                        <td>${salesReport.ordersPerDay[entry.key]}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>

                        <h6>2.2 Doanh Thu Hàng Tháng</h6>
                        <table class="table table-bordered table-report" id="monthlyRevenueTable">
                            <thead>
                                <tr>
                                    <th>Tháng</th>
                                    <th>Doanh Thu</th>
                                    <th>Số Đơn Hàng</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${salesReport.monthlyRevenue}" var="entry">
                                    <tr>
                                        <td>${entry.key}</td>
                                        <td><fmt:formatNumber value="${entry.value}" type="currency" currencySymbol="VNĐ"/></td>
                                        <td>${salesReport.ordersPerMonth[entry.key]}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>

                        <div class="recommendations-box">
                            <h6>2.3 Nhận Xét Doanh Thu Theo Thời Gian</h6>
                            <div class="table-container">
                                <table class="table table-bordered" id="timeRevenueRecommendationsTable">
                                    <thead>
                                        <tr><th>Hạng mục</th><th>Thông tin chi tiết & Đề xuất</th></tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>Doanh Thu Hàng Ngày</td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${not empty salesReport.dailyRevenue}">
                                                        <c:set var="maxDailyRevenue" value="${0}" />
                                                        <c:set var="maxDailyRevenueDate" value="" />
                                                        <c:forEach items="${salesReport.dailyRevenue}" var="entry">
                                                            <c:if test="${entry.value > maxDailyRevenue}">
                                                                <c:set var="maxDailyRevenue" value="${entry.value}" />
                                                                <c:set var="maxDailyRevenueDate" value="${entry.key}" />
                                                            </c:if>
                                                        </c:forEach>
                                                        Ngày có doanh thu cao nhất là ${maxDailyRevenueDate} với 
                                                        <span class="highlight-number"><fmt:formatNumber value="${maxDailyRevenue}" type="currency" currencySymbol="VNĐ"/></span>. 
                                                        Đề xuất: Phân tích các yếu tố làm tăng doanh thu như chương trình khuyến mãi, 
                                                        sự kiện đặc biệt hoặc xu hướng tiêu dùng.
                                                    </c:when>
                                                    <c:otherwise>
                                                        Không có dữ liệu doanh thu để phân tích.
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Doanh Thu Hàng Tháng</td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${not empty salesReport.monthlyRevenue}">
                                                        <c:set var="maxMonthlyRevenue" value="${0}" />
                                                        <c:set var="maxMonthlyRevenueMonth" value="" />
                                                        <c:forEach items="${salesReport.monthlyRevenue}" var="entry">
                                                            <c:if test="${entry.value > maxMonthlyRevenue}">
                                                                <c:set var="maxMonthlyRevenue" value="${entry.value}" />
                                                                <c:set var="maxMonthlyRevenueMonth" value="${entry.key}" />
                                                            </c:if>
                                                        </c:forEach>
                                                        Tháng có doanh thu cao nhất là ${maxMonthlyRevenueMonth} với 
                                                        <span class="highlight-number"><fmt:formatNumber value="${maxMonthlyRevenue}" type="currency" currencySymbol="VNĐ"/></span>. 
                                                        Khuyến nghị: Tìm hiểu các yếu tố thúc đẩy doanh thu và nhân rộng chiến lược 
                                                        thành công sang các tháng khác.
                                                    </c:when>
                                                    <c:otherwise>
                                                        Không có dữ liệu doanh thu để phân tích.
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- 3. Hiệu Suất Sản Phẩm -->
                <div class="container-fluid">
                    <div class="report-section">
                        <div class="section-title">3. Hiệu Suất Sản Phẩm</div>
                        <button class="btn btn-primary btn-export mb-3" id="exportSection3Btn">
                            <i class="fas fa-file-export me-1"></i>Xuất báo cáo
                        </button>
                        <h6>3.1 Top Sản Phẩm Theo Doanh Thu</h6>
                        <table class="table table-bordered table-report" id="topProductsTable">
                            <thead>
                                <tr>
                                    <th>Mã SP</th>
                                    <th>Tên Sản Phẩm</th>
                                    <th>Danh Mục</th>
                                    <th>Số Lượng Bán</th>
                                    <th>Doanh Thu</th>
                                    <th>Phân Phối Variant</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:choose>
                                    <c:when test="${empty salesReport.topProducts}">
                                        <tr>
                                            <td colspan="6">Không có dữ liệu sản phẩm</td>
                                        </tr>
                                    </c:when>
                                    <c:otherwise>
                                        <c:forEach items="${salesReport.topProducts}" var="product">
                                            <tr>
                                                <td>${product.productId}</td>
                                                <td>${product.productName}</td>
                                                <td>${product.category}</td>
                                                <td>${product.totalQuantitySold}</td>
                                                <td><fmt:formatNumber value="${product.totalRevenue}" type="currency" currencySymbol="VNĐ"/></td>
                                                <td>
                                                    <c:forEach items="${product.variantDistribution}" var="variantEntry">
                                                        ${variantEntry.key}: ${variantEntry.value}<br>
                                                    </c:forEach>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </c:otherwise>
                                </c:choose>
                            </tbody>
                        </table>

                        <h6>3.2 Doanh Thu Theo Danh Mục</h6>
                        <table class="table table-bordered table-report" id="revenueByCategoryTable">
                            <thead>
                                <tr>
                                    <th>Danh Mục</th>
                                    <th>Doanh Thu</th>
                                    <th>Số Đơn Hàng</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:choose>
                                    <c:when test="${empty salesReport.revenueByCategoryMap}">
                                        <tr>
                                            <td colspan="3">Không có dữ liệu danh mục</td>
                                        </tr>
                                    </c:when>
                                    <c:otherwise>
                                        <c:forEach items="${salesReport.revenueByCategoryMap}" var="entry">
                                            <tr>
                                                <td>${entry.key}</td>
                                                <td><fmt:formatNumber value="${entry.value}" type="currency" currencySymbol="VNĐ"/></td>
                                                <td>${salesReport.ordersByCategoryMap[entry.key]}</td>
                                            </tr>
                                        </c:forEach>
                                    </c:otherwise>
                                </c:choose>
                            </tbody>
                        </table>

                        <div class="recommendations-box">
                            <h6>3.3 Nhận Xét Hiệu Suất Sản Phẩm</h6>
                            <div class="table-container">
                                <table class="table table-bordered" id="productPerformanceRecommendationsTable">
                                    <thead>
                                        <tr><th>Hạng mục</th><th>Thông tin chi tiết & Đề xuất</th></tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>Top Sản Phẩm</td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${not empty salesReport.topProducts}">
                                                        Sản phẩm hàng đầu là "${salesReport.topProducts[0].productName}" 
                                                        với doanh thu <span class="highlight-number"><fmt:formatNumber value="${salesReport.topProducts[0].totalRevenue}" type="currency" currencySymbol="VNĐ"/></span> 
                                                        và số lượng bán <span class="highlight-number">${salesReport.topProducts[0].totalQuantitySold}</span> sản phẩm. 
                                                        Đề xuất: Đầu tư phát triển và mở rộng dòng sản phẩm thành công này.
                                                    </c:when>
                                                    <c:otherwise>
                                                        Không có dữ liệu sản phẩm để phân tích.
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Doanh Thu Theo Danh Mục</td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${not empty salesReport.revenueByCategoryMap}">
                                                        <c:set var="maxCategoryRevenue" value="${0}" />
                                                        <c:set var="maxCategoryName" value="" />
                                                        <c:forEach items="${salesReport.revenueByCategoryMap}" var="entry">
                                                            <c:if test="${entry.value > maxCategoryRevenue}">
                                                                <c:set var="maxCategoryRevenue" value="${entry.value}" />
                                                                <c:set var="maxCategoryName" value="${entry.key}" />
                                                            </c:if>
                                                        </c:forEach>
                                                        Danh mục có doanh thu cao nhất là "${maxCategoryName}" 
                                                        với <span class="highlight-number"><fmt:formatNumber value="${maxCategoryRevenue}" type="currency" currencySymbol="VNĐ"/></span>. 
                                                        Khuyến nghị: Tập trung nguồn lực và chiến lược marketing vào danh mục này.
                                                    </c:when>
                                                    <c:otherwise>
                                                        Không có dữ liệu danh mục để phân tích.
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- 4. Xử Lý Đơn Hàng -->
                <div class="container-fluid">
                    <div class="report-section">
                        <div class="section-title">4. Xử Lý Đơn Hàng</div>
                        <button class="btn btn-primary btn-export mb-3" id="exportSection4Btn">
                            <i class="fas fa-file-export me-1"></i>Xuất báo cáo
                        </button>
                        <h6>4.1 Phân Bố Trạng Thái Đơn Hàng</h6>
                        <table class="table table-bordered table-report" id="orderStatusTable">
                            <thead>
                                <tr>
                                    <th>Trạng Thái</th>
                                    <th>Số Lượng</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${salesReport.ordersByStatus}" var="entry">
                                    <tr>
                                        <td>${entry.key}</td>
                                        <td>${entry.value}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>

                        <h6>4.2 Thời Gian Xử Lý Trung Bình</h6>
                        <table class="table table-bordered table-report" id="avgFulfillmentTable">
                            <thead>
                                <tr>
                                    <th>Thời Gian Hoàn Thành Trung Bình (giờ)</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><fmt:formatNumber value="${salesReport.averageFulfillmentTime}" type="number" maxFractionDigits="2"/></td>
                                </tr>
                            </tbody>
                        </table>

                        <div class="recommendations-box">
                            <h6>4.3 Nhận Xét Xử Lý Đơn Hàng</h6>
                            <div class="table-container">
                                <table class="table table-bordered" id="orderProcessingRecommendationsTable">
                                    <thead>
                                        <tr><th>Hạng mục</th><th>Thông tin chi tiết & Đề xuất</th></tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>Trạng Thái Đơn Hàng</td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${not empty salesReport.ordersByStatus}">
                                                        <c:set var="completedOrders" value="${salesReport.ordersByStatus['completed'] != null ? salesReport.ordersByStatus['completed'] : 0}" />
                                                        <c:set var="totalOrders" value="${0}" />
                                                        <c:forEach items="${salesReport.ordersByStatus}" var="entry">
                                                            <c:set var="totalOrders" value="${totalOrders + entry.value}" />
                                                        </c:forEach>
                                                        <c:set var="completionRate" value="${(completedOrders / totalOrders) * 100}" />
                                                        Tỷ lệ hoàn thành đơn hàng là 
                                                        <span class="highlight-number"><fmt:formatNumber value="${completionRate}" type="number" maxFractionDigits="2"/></span>%. 
                                                        <c:choose>
                                                            <c:when test="${completionRate > 70}">
                                                                Đề xuất: Duy trì hiệu suất tốt và tối ưu hóa thêm để tăng trải nghiệm khách hàng.
                                                            </c:when>
                                                            <c:otherwise>
                                                                Đề xuất: Phân tích các rào cản làm chậm quá trình hoàn thành đơn hàng và cải thiện quy trình.
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:when>
                                                    <c:otherwise>
                                                        Không có dữ liệu trạng thái đơn hàng để phân tích.
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Thời Gian Xử Lý Trung Bình</td>
                                            <td>
                                                Thời gian xử lý trung bình là 
                                                <span class="highlight-number"><fmt:formatNumber value="${salesReport.averageFulfillmentTime}" type="number" maxFractionDigits="2"/></span> giờ. 
                                                <c:choose>
                                                    <c:when test="${salesReport.averageFulfillmentTime > 2}">
                                                        Khuyến nghị: Đặt mục tiêu giảm thời gian xử lý và tối ưu hóa quy trình logistics.
                                                    </c:when>
                                                    <c:otherwise>
                                                        Khuyến nghị: Duy trì thời gian xử lý tốt và tiếp tục cải thiện trải nghiệm khách hàng.
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        
        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

        <script>
    $(document).ready(function () {
        // Hàm xuất nhiều bảng sang một file Excel với nhiều sheet
        function exportTablesToExcel(tableIds, sheetNames, fileName) {
            const wb = XLSX.utils.book_new();
            tableIds.forEach((tableId, index) => {
                const table = document.getElementById(tableId);
                const ws = XLSX.utils.table_to_sheet(table);
                XLSX.utils.book_append_sheet(wb, ws, sheetNames[index]);
            });
            XLSX.writeFile(wb, fileName + '.xlsx');
        }

        // Hàm tạo chuỗi ngày tháng cho tên file
        function getDateRange() {
            const startDate = '<fmt:formatDate value="${salesReport.startDate}" pattern="dd-MM-yyyy"/>';
            const endDate = '<fmt:formatDate value="${salesReport.endDate}" pattern="dd-MM-yyyy"/>';
            return startDate + '_to_' + endDate;
        }

        // Gắn sự kiện click cho các nút xuất
        $('#exportSection1Btn').click(function () {
            exportTablesToExcel(
                ['overviewTable', 'overviewRecommendationsTable'], // Thêm bảng đề xuất
                ['TongQuanDoanhThu', 'DeXuatTongQuan'],           // Tên sheet tương ứng
                'sales_section1_' + getDateRange()
            );
        });

        $('#exportSection2Btn').click(function () {
            exportTablesToExcel(
                ['dailyRevenueTable', 'monthlyRevenueTable', 'timeRevenueRecommendationsTable'], // Thêm bảng đề xuất
                ['DoanhThuHangNgay', 'DoanhThuHangThang', 'DeXuatTheoThoiGian'],                // Tên sheet tương ứng
                'sales_section2_' + getDateRange()
            );
        });

        $('#exportSection3Btn').click(function () {
            exportTablesToExcel(
                ['topProductsTable', 'revenueByCategoryTable', 'productPerformanceRecommendationsTable'], // Thêm bảng đề xuất
                ['TopSanPham', 'DoanhThuTheoDanhMuc', 'DeXuatHieuSuatSanPham'],                   // Tên sheet tương ứng
                'sales_section3_' + getDateRange()
            );
        });

        $('#exportSection4Btn').click(function () {
            exportTablesToExcel(
                ['orderStatusTable', 'avgFulfillmentTable', 'orderProcessingRecommendationsTable'], // Thêm bảng đề xuất
                ['PhanBoTrangThai', 'ThoiGianXuLyTrungBinh', 'DeXuatXuLyDonHang'],                 // Tên sheet tương ứng
                'sales_section4_' + getDateRange()
            );
        });
    });
</script>
    </body>
</html>