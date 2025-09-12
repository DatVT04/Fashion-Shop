package entity;

import java.sql.Date;

public class Slider {

    private int id;
    private String title;
    private String image_url;
    private String link;
    private String status;
    private int display_order;
    private String notes;
    private int postId;
    private int productId;

    public Slider() {
    }

    public Slider(int id, String title, String image_url, String link, String status,
            int display_order, String notes, int postId, int productId) {
        this.id = id;
        this.title = title;
        this.image_url = image_url;
        this.link = link;
        this.status = status;
        this.display_order = display_order;
        this.notes = notes;
        this.postId = postId;
        this.productId = productId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getImage_url() {
        return image_url;
    }

    public void setImage_url(String image_url) {
        this.image_url = image_url;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getDisplay_order() {
        return display_order;
    }

    public void setDisplay_order(int display_order) {
        this.display_order = display_order;
    }

    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }

    public int getPostId() {
        return postId;
    }

    public void setPostId(int postId) {
        this.postId = postId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

}
