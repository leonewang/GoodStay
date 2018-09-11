package model;

import java.util.Date;

public class Post {
    private Integer id;
    private String text;
    private String url;
    private Integer image_id;
    private Integer likes;
    private Integer post_by;
    private String poster;
    private Date post_date;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Integer getImage_id() {
        return image_id;
    }

    public void setImage_id(Integer image_id) {
        this.image_id = image_id;
    }

    public Integer getLikes() {
        return likes;
    }

    public void setLikes(Integer likes) { this.likes = likes; }

    public Integer getPost_by() {
        return post_by;
    }

    public void setPost_by(Integer post_by) { this.post_by = post_by; }

    public String getPoster() {
        return poster;
    }

    public void setPoster(String poster) {
        this.poster = poster;
    }

    public Date getPost_date() {
        return post_date;
    }

    public void setPost_date(Date post_date) {
        this.post_date = post_date;
    }
}
