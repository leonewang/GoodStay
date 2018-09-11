package model;

public class Login {
    private String state;
    private User user;

    public String getState() { return state; }

    public void setState(String state) {
        this.state = state;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
