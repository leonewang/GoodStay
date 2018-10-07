package model;
import java.sql.Date;
import java.sql.Timestamp;

public class Review {
    private String id;
    private Integer post_user;
    private String post_id;
    private Integer user_id;
    private String content;
    private Timestamp date;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Integer getPost_user() {
        return post_user;
    }

    public void setPost_user(Integer post_user) {
        this.post_user = post_user;
    }

    public String getPost_id() {
        return post_id;
    }

    public void setPost_id(String post_id) {
        this.post_id = post_id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Integer getUser_id() {
        return user_id;
    }

    public void setUser_id(Integer user_id) {
        this.user_id = user_id;
    }

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }
}