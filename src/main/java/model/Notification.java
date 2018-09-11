package model;

import java.util.Date;

public class Notification {
    private Integer id;
    private Integer send_to;
    private Integer send_from;
    private String content;
    private Integer state;
    private Date date;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getSend_to() {
        return send_to;
    }

    public void setSend_to(Integer send_to) {
        this.send_to = send_to;
    }

    public Integer getSend_from() {
        return send_from;
    }

    public void setSend_from(Integer send_from) {
        this.send_from = send_from;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}
