/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import DAO.CategoryDAO;
import DAO.ProductDAO;
import DAO.CartDAO;
import DAO.FeedbackDAO;
import DAO.FeedbackReplyDAO;
import DAO.InventoryDAO;
import entity.Cart;
import entity.CartItem;
import entity.Category;
import entity.Color;
import entity.Feedback;
import entity.FeedbackReply;
import entity.Product;
import entity.Size;
import entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author tphon
 */
@WebServlet(urlPatterns = {"/productdetail"})
public class ProductDetailList extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ProductDetailList</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProductDetailList at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int productId = Integer.parseInt(request.getParameter("id"));
            ProductDAO productDAO = new ProductDAO();
            CategoryDAO categoryDAO = new CategoryDAO();
            FeedbackDAO feedbackDAO = new FeedbackDAO();
            FeedbackReplyDAO replyDAO = new FeedbackReplyDAO();

            Product product = productDAO.getProductById(productId);
            if (product == null) {
                response.sendRedirect("listproduct?ErrNullID");
                return;
            }

            String cateStatus = categoryDAO.getCategoryById(product.getCategoryId()).getStatus();
            if (cateStatus.equals("inactive")) {
                request.getRequestDispatcher("error/error.jsp").forward(request, response);
                return;
            }

            // Xử lý lấy ảnh
            List<String> subImages = productDAO.getProductImages(productId);
            List<String> allImages = new ArrayList<>();
            allImages.add(product.getThumbnail());
            allImages.addAll(subImages);
            product.setSubImages(allImages);

            // Lấy tên danh mục
            Category category = categoryDAO.getCategoryById(product.getCategoryId());
            String categoryName = (category != null) ? category.getName() : "";

            // Lấy sản phẩm tương tự theo danh mục
            List<Product> relatedProducts = productDAO.getRelatedProducts(productId, product.getCategoryId());

            // Lấy size
            List<Size> sizes = productDAO.getSizesByProductId(productId);

            // Lấy màu
            List<Color> colors = productDAO.getColorsByProductId(productId);

            // Lấy số lượng
            int stock = 0;
            String sizeId = request.getParameter("sizeId");
            String colorId = request.getParameter("colorId");

            if (sizeId != null && !sizeId.isEmpty() && colorId != null && !colorId.isEmpty()) {
                stock = productDAO.getTotalStockByProductId(productId, Integer.parseInt(sizeId), Integer.parseInt(colorId));
                request.setAttribute("sizeId", Integer.valueOf(sizeId));
                request.setAttribute("colorId", Integer.valueOf(colorId));
            } else if (sizeId != null && !sizeId.isEmpty()) {
                stock = productDAO.getTotalStockByProductSize(productId, Integer.parseInt(sizeId));
                request.setAttribute("sizeId", Integer.parseInt(sizeId));
            } else if (colorId != null && !colorId.isEmpty()) {
                stock = productDAO.getTotalStockByProductColor(productId, Integer.parseInt(colorId));
                request.setAttribute("colorId", Integer.parseInt(colorId));
            } else {
                stock = productDAO.getTotalStockByProductId(productId);
            }

            int page = 1; // Trang mặc định
            int recordsPerPage = 2; // Số đánh giá mỗi trang
            if (request.getParameter("page") != null) {
                page = Integer.parseInt(request.getParameter("page"));
            }

            String filterStar = request.getParameter("filterStar");

            // Lấy danh sách đánh giá ko bị ẩn cho sản phẩm
//            List<Feedback> feedbacks = feedbackDAO.getFeedbacksByProduct(
//                null, filterStar, "approved", "created_at", "desc", productId, page, recordsPerPage
//            );
            List<Feedback> feedbacks = feedbackDAO.getFeedbacksByProduct(null, filterStar, "approved", null, "desc", productId, page, recordsPerPage);

//                    feedbackDAO.getFeedbacksByProduct(
//                    filterStar, "rejected", productId, page, recordsPerPage
//            );
            // Lấy phản hồi của cửa hàng cho từng đánh giá
            for (Feedback feedback : feedbacks) {
                List<FeedbackReply> replies = replyDAO.getRepliesByFeedbackId(feedback.getId());
                feedback.setReplies(replies); // Giả sử bạn thêm thuộc tính replies vào entity Feedback
            }
            // Gắn ảnh cho từng feedback
            for (Feedback feedback : feedbacks) {
                List<String> images = feedbackDAO.getImagesByFeedbackId(feedback.getId());
                feedback.setFeedbackImages(images); // Đảm bảo có setter này trong class Feedback
            }

            // Tính tổng số trang
            int totalFeedbacks = feedbackDAO.getTotalFeedbacksByProduct(null, filterStar, "approved", productId);
            int totalPages = (int) Math.ceil(totalFeedbacks * 1.0 / recordsPerPage);

            product.setStock(stock);
            request.setAttribute("product", product);
            request.setAttribute("categoryName", categoryName);
            request.setAttribute("images", allImages);
            request.setAttribute("colors", colors);
            request.setAttribute("sizes", sizes);
            request.setAttribute("similarProducts", relatedProducts);
            request.setAttribute("alert", request.getParameter("alert"));

            request.setAttribute("totalPages", totalPages);
            request.setAttribute("currentPage", page);
            request.setAttribute("feedbacks", feedbacks);

            request.setAttribute("filterStar", filterStar);

            // Tính sao trung bình
            int[] ratingCounts = feedbackDAO.getRatingCountsByProduct(null, productId);
            int allFeedbacks = feedbackDAO.getTotalFeedbacksByProduct(null, null, "approved", productId);
            double totalStar = 0;
            int i = 1;
            for (int star : ratingCounts) {
                totalStar = (double) star * i + totalStar;
                i++;
            }
            double averageRating = (double) totalStar / allFeedbacks;
            request.setAttribute("allFeedbacks", allFeedbacks);
            request.setAttribute("averageRating", averageRating);
            request.setAttribute("fiveStarCount", ratingCounts[4]);
            request.setAttribute("fourStarCount", ratingCounts[3]);
            request.setAttribute("threeStarCount", ratingCounts[2]);
            request.setAttribute("twoStarCount", ratingCounts[1]);
            request.setAttribute("oneStarCount", ratingCounts[0]);

            // Forward to the JSP
            request.getRequestDispatcher("productDetail.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            response.sendRedirect("listproduct?ErrNumberF");
        } catch (Exception e) {
            getServletContext().log("Error in ProductDetailServlet", e);
            request.setAttribute("errorMessage", "There was an error processing your request. Please try again later.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        ProductDAO productDAO = new ProductDAO();
        InventoryDAO inventoryDAO = new InventoryDAO();
        CartDAO cartDAO = new CartDAO();
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("acc");

        if ("addToCart".equals(action)) {
            try {
                int productId = Integer.parseInt(request.getParameter("id"));
                int sizeId = Integer.parseInt(request.getParameter("sizeId"));
                int colorId = Integer.parseInt(request.getParameter("colorId"));
                int quantity = Integer.parseInt(request.getParameter("quantity"));

                // Lấy thông tin sản phẩm
                Product product = productDAO.getProductById(productId);
                if (product.getStatus().equals("inactive") || product.getStatus().equals("EOStock")) {
                    response.sendRedirect("productdetail?id=" + product.getId() + "&alert=EOS");
                    return;
                }

                // Kiểm tra tồn kho
                int stock = productDAO.getTotalStockByProductId(productId, sizeId, colorId);
                if (quantity > stock) {
                    response.sendRedirect("productdetail?id=" + product.getId() + "&alert=OutOfStock");
                    return;
                }

                // Lấy variant ID
                int variantId = inventoryDAO.getVariantId(productId, colorId, sizeId);

                // Lấy thông tin size và màu
                String sizeName = getSizeName(productDAO, productId, sizeId);
                String colorName = getColorName(productDAO, productId, colorId);

                if (user != null) {
                    // Người dùng đã đăng nhập, lưu vào database
                    Cart cart = getOrCreateCart(user.getId());
                    CartItem item = new CartItem(cart.getId(), productId, variantId, quantity);
                    item.setProductTitle(product.getTitle());
                    item.setProductThumbnail(product.getThumbnail());
                    item.setProductPrice(product.getSalePrice().doubleValue());
                    item.setSize(sizeName);
                    item.setColor(colorName);

                    if (cartDAO.addCartItem(item)) {
                        response.sendRedirect("productdetail?id=" + product.getId() + "&alert=SS");
                    } else {
                        response.sendRedirect("productdetail?id=" + product.getId() + "&alert=ERR");
                    }
                } else {
                    // Người dùng chưa đăng nhập, lưu vào cookie
                    CartItem item = new CartItem();
                    item.setProductId(productId);
                    item.setVariantId(variantId);
                    item.setQuantity(quantity);
                    item.setProductTitle(product.getTitle());
                    item.setProductThumbnail(product.getThumbnail());
                    item.setProductPrice(product.getSalePrice().doubleValue());
                    item.setSize(sizeName);
                    item.setColor(colorName);

                    cartDAO.addItemToCookieCart(request, response, item);
                    response.sendRedirect("productdetail?id=" + product.getId() + "&alert=SS");
                }
            } catch (NumberFormatException e) {
                e.printStackTrace();
                response.sendRedirect("listproduct?ErrNumber");
            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect("listproduct?ErrGeneral");
            }
        } else if ("buyNow".equals(action)) {
            try {
                int productId = Integer.parseInt(request.getParameter("id"));
                int sizeId = Integer.parseInt(request.getParameter("sizeId"));
                int colorId = Integer.parseInt(request.getParameter("colorId"));
                int quantity = Integer.parseInt(request.getParameter("quantity"));

                // Lấy thông tin sản phẩm
                Product product = productDAO.getProductById(productId);
                if (product.getStatus().equals("inactive") || product.getStatus().equals("EOStock")) {
                    response.sendRedirect("productdetail?id=" + product.getId() + "&alert=EOS");
                    return;
                }

                // Kiểm tra tồn kho
                int stock = productDAO.getTotalStockByProductId(productId, sizeId, colorId);
                if (quantity > stock) {
                    response.sendRedirect("productdetail?id=" + product.getId() + "&alert=OutOfStock");
                    return;
                }

                // Lấy variant ID
                int variantId = inventoryDAO.getVariantId(productId, colorId, sizeId);

                // Lấy thông tin size và màu
                String sizeName = getSizeName(productDAO, productId, sizeId);
                String colorName = getColorName(productDAO, productId, colorId);

                CartItem item;
                if (user != null) {
                    // Người dùng đã đăng nhập, lưu vào database
                    Cart cart = getOrCreateCart(user.getId());
                    item = new CartItem(cart.getId(), productId, variantId, quantity);
                    item.setProductTitle(product.getTitle());
                    item.setProductThumbnail(product.getThumbnail());
                    item.setProductPrice(product.getSalePrice().doubleValue());
                    item.setSize(sizeName);
                    item.setColor(colorName);

                    if (cartDAO.addCartItem(item)) {
                        // Lưu selectedItemIds và selectedQuantities vào session
                        List<String> selectedItemIds = new ArrayList<>();
                        List<String> selectedQuantities = new ArrayList<>();
                        selectedItemIds.add(String.valueOf(item.getId())); // ID sẽ được sinh tự động trong DB
                        selectedQuantities.add(String.valueOf(quantity));
                        session.setAttribute("selectedItemIds", selectedItemIds);
                        session.setAttribute("selectedQuantities", selectedQuantities);

                        response.sendRedirect("cartcontact");
                    } else {
                        response.sendRedirect("productdetail?id=" + product.getId() + "&alert=ERR");
                    }
                } else {
                    // Người dùng chưa đăng nhập, lưu vào cookie
                    item = new CartItem();
                    item.setProductId(productId);
                    item.setVariantId(variantId);
                    item.setQuantity(quantity);
                    item.setProductTitle(product.getTitle());
                    item.setProductThumbnail(product.getThumbnail());
                    item.setProductPrice(product.getSalePrice().doubleValue());
                    item.setSize(sizeName);
                    item.setColor(colorName);
                    item.setId((int) System.currentTimeMillis()); // ID tạm cho cookie

                    cartDAO.addItemToCookieCart(request, response, item);

                    // Lưu selectedItemIds và selectedQuantities vào session
                    List<String> selectedItemIds = new ArrayList<>();
                    List<String> selectedQuantities = new ArrayList<>();
                    selectedItemIds.add(String.valueOf(item.getId()));
                    selectedQuantities.add(String.valueOf(quantity));
                    session.setAttribute("selectedItemIds", selectedItemIds);
                    session.setAttribute("selectedQuantities", selectedQuantities);

                    response.sendRedirect("cartcontact");
                }
            } catch (NumberFormatException e) {
                e.printStackTrace();
                response.sendRedirect("listproduct?ErrNumber");
            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect("listproduct?ErrGeneral");
            }
        }
    }

    private Cart getOrCreateCart(int userId) {
        CartDAO cartDAO = new CartDAO();
        Cart cart = cartDAO.getCartByUserId(userId);
        if (cart == null) {
            cart = cartDAO.createCart(userId);
        }
        return cart;
    }

    private String getSizeName(ProductDAO productDAO, int productId, int sizeId) {
        List<Size> sizes = productDAO.getSizesByProductId(productId);
        for (Size s : sizes) {
            if (s.getId() == sizeId) {
                return s.getName();
            }
        }
        return "";
    }

    private String getColorName(ProductDAO productDAO, int productId, int colorId) {
        List<Color> colors = productDAO.getColorsByProductId(productId);
        for (Color c : colors) {
            if (c.getId() == colorId) {
                return c.getName();
            }
        }
        return "";
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
