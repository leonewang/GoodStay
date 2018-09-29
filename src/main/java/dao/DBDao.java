package dao;

import model.*;
import util.DBUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DBDao {
    /**
     * Register func
     *
     * @param u
     * @throws SQLException
     */
    public void userRegister(User u) throws SQLException {
        Connection conn = DBUtil.getConn();
        String sql = "insert into User" + "(user_name, password, email, name, gender, " +
                "DoB, code, state, create_date) values(?, ?, ?, ?, ?, ?, ?, 1, CURRENT_TIMESTAMP())";
        PreparedStatement ptmt = conn.prepareStatement(sql);
        ptmt.setString(1, u.getUser_name());
        ptmt.setString(2, u.getPassword());
        ptmt.setString(3, u.getEmail());
        ptmt.setString(4, u.getName());
        ptmt.setString(5, u.getGender());
        ptmt.setDate(6, Date.valueOf(u.getDate_of_birth()));
        ptmt.setString(7, u.getCode());
        ptmt.execute();
    }

    /**
     * Login func
     *
     * @param u
     * @throws SQLException
     */
    public String userLogin(User u) throws SQLException {
        Connection conn = DBUtil.getConn();
        String sql = "select * from User where user_name = ? and password = ?";
        PreparedStatement ptmt = conn.prepareStatement(sql);
        ptmt.setString(1, u.getUser_name());
        ptmt.setString(2, u.getPassword());
        ResultSet rs = ptmt.executeQuery();
        String state = "wrongpass";
        while (rs.next()) {
            if (rs.getInt("state") == 0) {
                state = "banned";
            } else if (rs.getInt("state") == 2) {
                state = "active";
            } else {
                state = "inactive";
            }
        }
        return state;
    }

    /**
     * Admin login func
     *
     * @param password
     * @throws SQLException
     */
    public User adminLogin(String password) throws SQLException {
        Connection conn = DBUtil.getConn();
        String sql = "select * from Admin where user_name = 'Admin' and password = ?";
        PreparedStatement ptmt = conn.prepareStatement(sql);
        ptmt.setString(1, password);
        ResultSet rs = ptmt.executeQuery();
        User admin = null;
        while (rs.next()) {
            admin = new User();
            admin.setUser_name("Admin");
        }
        return admin;
    }

    /**
     * Get the details of an user
     * @return u
     * @throws SQLException
     */
    public User getUser(User u) throws SQLException {
        Connection conn = DBUtil.getConn();
        String sql = "select * from User where user_name = ?";
        PreparedStatement ptmt = conn.prepareStatement(sql);
        ptmt.setString(1, u.getUser_name());
        ResultSet rs = ptmt.executeQuery();
        User user = null;
        while (rs.next()) {
            user = new User();
            user.setId(rs.getInt("id"));
            user.setUser_name(rs.getString("user_name"));
            user.setPassword(rs.getString("password"));
            user.setEmail(rs.getString("email"));
            user.setName(rs.getString("name"));
            user.setGender(rs.getString("gender"));
            user.setDate_of_birth(rs.getString("DoB"));
            user.setMobile(rs.getString("mobile"));
            user.setCreate_date(rs.getTimestamp("create_date"));
        }
        return user;
    }

    public User getUser(Integer id) throws SQLException {
        Connection conn = DBUtil.getConn();
        String sql = "select * from User where id = ?";
        PreparedStatement ptmt = conn.prepareStatement(sql);
        ptmt.setInt(1, id);
        ResultSet rs = ptmt.executeQuery();
        User user = null;
        while (rs.next()) {
            user = new User();
            user.setId(rs.getInt("id"));
            user.setUser_name(rs.getString("user_name"));
            user.setPassword(rs.getString("password"));
            user.setEmail(rs.getString("email"));
            user.setName(rs.getString("name"));
            user.setGender(rs.getString("gender"));
            user.setDate_of_birth(rs.getString("DoB"));
            user.setMobile(rs.getString("mobile"));
            user.setCreate_date(rs.getTimestamp("create_date"));
        }
        return user;
    }

    public Integer getU(String username) throws SQLException {
        Connection conn = DBUtil.getConn();
        String sql = "select * from User where user_name = ?";
        PreparedStatement ptmt = conn.prepareStatement(sql);
        ptmt.setString(1, username);
        ResultSet rs = ptmt.executeQuery();
        Integer user_id = null;
        while (rs.next()) {
            user_id = rs.getInt("id");
        }
        return user_id;
    }

    public List<User> getUser(String username) throws SQLException {
        Connection conn = DBUtil.getConn();
        String sql = "select * from User where user_name like ?";
        PreparedStatement ptmt = conn.prepareStatement(sql);
        ptmt.setString(1, "%" + username + "%");
        ResultSet rs = ptmt.executeQuery();
        List<User> users = new ArrayList<User>();
        User user;
        while (rs.next()) {
            user = new User();
            user.setId(rs.getInt("id"));
            user.setUser_name(rs.getString("user_name"));
            user.setPassword(rs.getString("password"));
            user.setEmail(rs.getString("email"));
            user.setName(rs.getString("name"));
            user.setGender(rs.getString("gender"));
            user.setDate_of_birth(rs.getString("DoB"));
            user.setMobile(rs.getString("mobile"));
            user.setCreate_date(rs.getTimestamp("create_date"));
            users.add(user);
        }
        return users;
    }

    public List<User> getUser(String username, String mobile, String gender, String dob)
            throws SQLException {
        Connection conn = DBUtil.getConn();
        String sql = "select * from User where user_name like '%" + username + "%'";
        if (mobile != "") {
            sql += " and mobile = '" + mobile + "'";
        } else if (gender != null) {
            sql += " and gender = '" + gender + "'";
        } else if (dob != "") {
            sql += " and DoB = '" + dob + "'";
        }
        PreparedStatement ptmt = conn.prepareStatement(sql);
        System.out.println(sql);
        ResultSet rs = ptmt.executeQuery();
        List<User> users = new ArrayList<User>();
        User user;
        while (rs.next()) {
            user = new User();
            user.setId(rs.getInt("id"));
            user.setUser_name(rs.getString("user_name"));
            user.setEmail(rs.getString("email"));
            user.setName(rs.getString("name"));
            user.setGender(rs.getString("gender"));
            user.setDate_of_birth(rs.getString("DoB"));
            user.setMobile(rs.getString("mobile"));
            user.setCreate_date(rs.getTimestamp("create_date"));
            users.add(user);
        }
        return users;
    }

    public List<User> getUser(String username, String gender, String dob)
            throws SQLException {
        Connection conn = DBUtil.getConn();
        String sql = "select * from User where user_name like '%" + username + "%'";
        if (gender != null) {
            sql += " and gender = '" + gender + "'";
        } else if (dob != "") {
            sql += " and DoB = '" + dob + "'";
        }
        PreparedStatement ptmt = conn.prepareStatement(sql);
        System.out.println(sql);
        ResultSet rs = ptmt.executeQuery();
        List<User> users = new ArrayList<User>();
        User user;
        while (rs.next()) {
            user = new User();
            user.setId(rs.getInt("id"));
            user.setUser_name(rs.getString("user_name"));
            user.setEmail(rs.getString("email"));
            user.setName(rs.getString("name"));
            user.setGender(rs.getString("gender"));
            user.setDate_of_birth(rs.getString("DoB"));
            user.setMobile(rs.getString("mobile"));
            user.setCreate_date(rs.getTimestamp("create_date"));
            users.add(user);
        }
        return users;
    }

    /**
     * Account activation func
     *
     * @param code
     * @throws SQLException
     */
    public void activateUser(String code) throws SQLException {
        Connection conn = DBUtil.getConn();
        String sql = "update User set state = 2 where code = '" + code + "'";
        Statement stmt = conn.createStatement();
        stmt.executeUpdate(sql);
    }

    /**
     * Update user info func
     *
     * @param user
     * @throws SQLException
     */
    public void updateUser(User user) throws SQLException {
        Connection conn = DBUtil.getConn();
        String sql = "update User set password = '" + user.getPassword() + "', email = '" + user.getEmail() +
                "', name = '" + user.getName() + "', gender = '" + user.getGender() + "', DoB = '"
                + user.getDate_of_birth() + "', mobile = '" + user.getMobile() + "' where id = " + user.getId();
        Statement stmt = conn.createStatement();
        stmt.executeUpdate(sql);
    }

    /**
     * Insert post func
     *
     * @param binImage
     * @throws SQLException
     */
    public Integer addImage(String binImage) throws SQLException {
        Connection conn = DBUtil.getConn();
        String sql = "insert into Image" + "(text, url, image_id, post_date) " +
                "values(?, ?, ?, CURRENT_TIMESTAMP())";
        PreparedStatement ptmt = conn.prepareStatement(sql);
//        ptmt.setString(1, post.getText());
//        ptmt.setString(2, post.getUrl());
//        ptmt.setInt(3, post.getImage_id());
        ptmt.execute();
        return null;
    }

    /**
     * Insert post func
     *
     * @param post
     * @throws SQLException
     */
    public void addPost(Post post) throws SQLException {
        Connection conn = DBUtil.getConn();
        String sql = "insert into Post" + "(text, url, post_by, post_date) " +
                "values(?, ?, ?, CURRENT_TIMESTAMP())";
        PreparedStatement ptmt = conn.prepareStatement(sql);
        ptmt.setString(1, post.getText());
        ptmt.setString(2, post.getUrl());
        ptmt.setInt(3, post.getPost_by());
        ptmt.execute();
    }

    /**
     * List all post func
     *
     * @throws SQLException
     */
    public List<Post> listAllPosts() throws SQLException {
        List<Post> posts = new ArrayList<Post>();
        Connection conn = DBUtil.getConn();
        String sql = "select * from Post order by post_date DESC";
        PreparedStatement ptmt = conn.prepareStatement(sql);
        ResultSet rs = ptmt.executeQuery();
        while (rs.next()) {
            Post post = new Post();
            post.setId(rs.getInt("id"));
            post.setText(rs.getString("text"));
            post.setUrl(rs.getString("url"));
            post.setLikes(rs.getInt("likes"));
            post.setPost_by(rs.getInt("post_by"));
            post.setPoster(getUser(rs.getInt("post_by")).getUser_name());
            post.setPost_date(rs.getTimestamp("post_date"));
            posts.add(post);
        }
        return posts;
    }

    /**
     * List all post func
     *
     * @throws SQLException
     */
    public List<User> listAllUsers() throws SQLException {
        Connection conn = DBUtil.getConn();
        String sql = "select * from User order by create_date DESC";
        PreparedStatement ptmt = conn.prepareStatement(sql);
        ResultSet rs = ptmt.executeQuery();
        List<User> users = new ArrayList<User>();
        User user;
        while (rs.next()) {
            user = new User();
            user.setId(rs.getInt("id"));
            user.setUser_name(rs.getString("user_name"));
            user.setEmail(rs.getString("email"));
            user.setName(rs.getString("name"));
            user.setGender(rs.getString("gender"));
            user.setDate_of_birth(rs.getString("DoB"));
            user.setMobile(rs.getString("mobile"));
            user.setCreate_date(rs.getTimestamp("create_date"));
            users.add(user);
        }
        return users;
    }

    /**
     * Update post func
     *
     * @param id
     * @throws SQLException
     */
    public void updatePost(Integer id) throws SQLException {
        Connection conn = DBUtil.getConn();
        String sql = "update Post set likes = likes + 1 where id = " + id;
        Statement stmt = conn.createStatement();
        stmt.executeUpdate(sql);
    }

    /**
     * Add friend func
     *
     * @param user_id, friend_id, username
     * @throws SQLException
     */
    public void addFriend(Integer user_id, Integer friend_id, String username,
                          String code) throws SQLException {
        Connection conn = DBUtil.getConn();
        String sql = "insert into Friend(user_id, friend_id, friend_name, code, state, date)" +
                " values(?, ?, ?, ?, 0, CURRENT_TIMESTAMP())";
        PreparedStatement ptmt = conn.prepareStatement(sql);
        ptmt.setInt(1, user_id);
        ptmt.setInt(2, friend_id);
        ptmt.setString(3, username);
        ptmt.setString(4, code);
        ptmt.execute();
    }

    /**
     * Accept friend request func
     *
     * @param code
     * @throws SQLException
     */
    public void friendRequest(String code) throws SQLException {
        Connection conn = DBUtil.getConn();
        String sql = "update Friend set state = 1 where code = '" + code + "'";
        Statement stmt = conn.createStatement();
        stmt.executeUpdate(sql);
    }

    /**
     * Get the detail of a friend func
     *
     * @param id
     * @throws SQLException
     */
    public Friend getFriend(Integer id) throws SQLException {
        Connection conn = DBUtil.getConn();
        String sql = "select * from User where id = ?";
        PreparedStatement ptmt = conn.prepareStatement(sql);
        ptmt.setInt(1, id);
        ResultSet rs = ptmt.executeQuery();
        Friend friend = null;
        while (rs.next()) {
            friend = new Friend();
            friend.setId(rs.getInt("id"));
            friend.setUser_name(rs.getString("user_name"));
            friend.setPassword(rs.getString("password"));
            friend.setEmail(rs.getString("email"));
            friend.setName(rs.getString("name"));
            friend.setGender(rs.getString("gender"));
            friend.setDate_of_birth(rs.getString("DoB"));
            friend.setMobile(rs.getString("mobile"));
            friend.setCreate_date(rs.getTimestamp("create_date"));
        }
        return friend;
    }

    /**
     * Check a friendship func
     *
     * @param user_id, friend_id
     * @throws SQLException
     */
    public Boolean checkFriendship(Integer user_id, Integer friend_id) throws SQLException {
        Boolean isFriend = false;
        Connection conn = DBUtil.getConn();
        String sql = "select * from Friend where state = 1 and (user_id = ? and friend_id = ?) " +
                "or (user_id = ? and friend_id = ?)";
        PreparedStatement ptmt = conn.prepareStatement(sql);
        ptmt.setInt(1, user_id);
        ptmt.setInt(2, friend_id);
        ptmt.setInt(3, friend_id);
        ptmt.setInt(4, user_id);
        ResultSet rs = ptmt.executeQuery();
        while (rs.next()) {
            isFriend = true;
        }
        return isFriend;
    }

    /**
     * Check if user is blocked func
     *
     * @param id
     * @throws SQLException
     */
    public Boolean checkBlocked(Integer id) throws SQLException {
        Boolean isBlocked = false;
        Connection conn = DBUtil.getConn();
        String sql = "select * from User where state = 0 and id = ?";
        PreparedStatement ptmt = conn.prepareStatement(sql);
        ptmt.setInt(1, id);
        ResultSet rs = ptmt.executeQuery();
        while (rs.next()) {
            isBlocked = true;
        }
        return isBlocked;
    }

    /**
     * Block user func
     *
     * @param id
     * @throws SQLException
     */
    public void blockUser(Integer id) throws SQLException {
        Connection conn = DBUtil.getConn();
        String sql = "update User set state = 0 where id = " + id;
        System.out.println(sql);
        Statement stmt = conn.createStatement();
        stmt.executeUpdate(sql);
    }

    /**
     * Cancel block func
     *
     * @param id
     * @throws SQLException
     */
    public void cancelBlock(Integer id) throws SQLException {
        Connection conn = DBUtil.getConn();
        String sql = "update User set state = 2 where id = " + id;
        System.out.println(sql);
        Statement stmt = conn.createStatement();
        stmt.executeUpdate(sql);
    }

    /**
     * Send Notification func
     *
     * @param send_to, send_from, content
     * @throws SQLException
     */
    public void sendNotification(Integer send_to, Integer send_from, String content) throws SQLException {
        Connection conn = DBUtil.getConn();
        String sql = "insert into Notification(send_to, send_from, content, state, date)" +
                " values(?, ?, ?, 0, CURRENT_TIMESTAMP())";
        PreparedStatement ptmt = conn.prepareStatement(sql);
        ptmt.setInt(1, send_to);
        ptmt.setInt(2, send_from);
        ptmt.setString(3, content);
        ptmt.execute();
    }

    /**
     * Get Notification func
     *
     * @param send_to
     * @throws SQLException
     */
    public List<Notification> getNotification(Integer send_to) throws SQLException {
        Connection conn = DBUtil.getConn();
        String sql = "select * from Notification where send_to = ? and state = 0";
        PreparedStatement ptmt = conn.prepareStatement(sql);
        ptmt.setInt(1, send_to);
        ResultSet rs = ptmt.executeQuery();
        List<Notification> notices = new ArrayList<Notification>();
        Notification notice;
        while (rs.next()) {
            notice = new Notification();
            notice.setId(rs.getInt("id"));
            notice.setSend_to(rs.getInt("send_to"));
            notice.setSend_from(rs.getInt("send_from"));
            notice.setContent(rs.getString("content"));
            notice.setDate(rs.getTimestamp("date"));
            notices.add(notice);
        }
        return notices;
    }

    /**
     * Mark notification as read func
     *
     * @param id
     * @throws SQLException
     */
    public void markRead(Integer id) throws SQLException {
        Connection conn = DBUtil.getConn();
        String sql = "update Notification set state = 1 where id = '" + id + "'";
        Statement stmt = conn.createStatement();
        stmt.executeUpdate(sql);
    }

    /**
     * Send Notification func
     *
     * @param user_id, log_type, content
     * @throws SQLException
     */
    public void addLog(Integer user_id, String log_type, String content) throws SQLException {
        Connection conn = DBUtil.getConn();
        String sql = "insert into Log(user_id, log_type, content, date)" +
                " values(?, ?, ?, CURRENT_TIMESTAMP())";
        PreparedStatement ptmt = conn.prepareStatement(sql);
        ptmt.setInt(1, user_id);
        ptmt.setString(2, log_type);
        ptmt.setString(3, content);
        ptmt.execute();
    }

    /**
     * Show user activities func
     *
     * @param user_id, log_type, content
     * @throws SQLException
     */
    public List<Log> userActivity(Integer user_id) throws SQLException {
        Connection conn = DBUtil.getConn();
        String sql = "select * from Log where user_id = ? order by date DESC";
        PreparedStatement ptmt = conn.prepareStatement(sql);
        ptmt.setInt(1, user_id);
        ResultSet rs = ptmt.executeQuery();
        List<Log> logs = new ArrayList<Log>();
        Log log;
        while (rs.next()) {
            log = new Log();
            log.setUser_id(rs.getInt("user_id"));
            log.setLog_type(rs.getString("log_type"));
            log.setContent(rs.getString("content"));
            log.setDate(rs.getTimestamp("date"));
            logs.add(log);
        }
        return logs;
    }

    /**
     * Get all the messages posted by the target user
     *
     * @param username
     * @throws SQLException
     */
    public List<String> getAllMsg(String username) throws SQLException {
        Connection conn = DBUtil.getConn();
        String sql = "select * from post, user where post_by = User.id and user_name = ?";
        PreparedStatement ptmt = conn.prepareStatement(sql);
        ptmt.setString(1, username);
        ResultSet rs = ptmt.executeQuery();
        List<String> messages = new ArrayList<String>();
        String message;
        while (rs.next()) {
            message = rs.getString("post.id");
            messages.add(message);
        }
        return messages;
    }

    /**
     * Get all the friends of the target user
     *
     * @param username
     * @throws SQLException
     */
    public List<String> getAllFriends(String username) throws SQLException {
        Connection conn = DBUtil.getConn();
        String sql = "select friend_name from Friend, User where user_id = User.id and user_name = ?";
        PreparedStatement ptmt = conn.prepareStatement(sql);
        ptmt.setString(1, username);
        ResultSet rs = ptmt.executeQuery();
        List<String> friends = new ArrayList<String>();
        String friend;
        while (rs.next()) {
            friend = rs.getString("friend_name");
            friends.add(friend);
        }
        return friends;
    }
}
