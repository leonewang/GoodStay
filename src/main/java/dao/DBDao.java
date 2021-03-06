package dao;

import model.*;
import util.DBUtil;

import java.awt.print.Book;
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
        String sql1 = "insert into User" + "(user_name, password, email, name, gender, " +
                "DoB, code, state, create_date) values(?, ?, ?, ?, ?, ?, ?, 1, CURRENT_TIMESTAMP())";
        String sql2 = "insert into UserImage" + "(user_id, content, date) " +
                "values(?, ?, CURRENT_TIMESTAMP())";
        PreparedStatement ptmt = conn.prepareStatement(sql1, Statement.RETURN_GENERATED_KEYS);
        ptmt.setString(1, u.getUser_name());
        ptmt.setString(2, u.getPassword());
        ptmt.setString(3, u.getEmail());
        ptmt.setString(4, u.getName());
        ptmt.setString(5, u.getGender());
        ptmt.setDate(6, Date.valueOf(u.getDate_of_birth()));
        ptmt.setString(7, u.getCode());
        ptmt.execute();
        ResultSet idrs = ptmt.getGeneratedKeys();
        int id = 0;
        if (idrs.next()) {
            id = idrs.getInt(1);
        }
        ptmt = conn.prepareStatement(sql2);
        ptmt.setInt(1, id);
        ptmt.setString(2, "http://pg36wkomn.bkt.clouddn.com/icon-512.png");
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
     * Insert image func
     *
     * @param image
     * @throws SQLException
     */
    public void addUserImage(UserImage image) throws SQLException {
        Connection conn = DBUtil.getConn();
        String sql = "insert into UserImage" + "(user_id, content, date) " +
                "values(?, ?, CURRENT_TIMESTAMP())";
        PreparedStatement ptmt = conn.prepareStatement(sql);
        ptmt.setInt(1, image.getUser_id());
        ptmt.setString(2, image.getContent());
        ptmt.execute();
        System.out.println("user image inserted.");
    }

    /**
     * Find the user avatar image by user id
     *
     * @param id
     * @throws SQLException
     */
    public UserImage findUserImage(Integer id) throws SQLException {
        UserImage image = new UserImage();
        Connection conn = DBUtil.getConn();
        String sql = "select * from UserImage where user_id="+ id + " order by date DESC limit 1 ";
        PreparedStatement ptmt = conn.prepareStatement(sql);
        ResultSet rs = ptmt.executeQuery();
        while (rs.next()) {
            image.setId(rs.getInt("id"));
            image.setUser_id(rs.getInt("user_id"));
            image.setContent(rs.getString("content"));
            image.setDate(rs.getTimestamp("date"));
        }
        return image;
    }

    /**
     * Insert image func
     *
     * @param image
     * @throws SQLException
     */
    public void addImage(Image image) throws SQLException {
        Connection conn = DBUtil.getConn();
        String sql = "insert into Image" + "(post_id, content, date) " +
                "values(?, ?, CURRENT_TIMESTAMP())";
        PreparedStatement ptmt = conn.prepareStatement(sql);
        ptmt.setString(1, image.getPostid());
        ptmt.setString(2, image.getContent());
        ptmt.execute();
        System.out.println("image inserted.");
    }

    /**
     * Find all uploaded image by post id
     *
     * @param id
     * @throws SQLException
     */
    public List<Image> findImages(String id) throws SQLException {
        List<Image> images = new ArrayList<Image>();
        Connection conn = DBUtil.getConn();
        String sql = "select * from Image where post_id='"+ id + "'";
        PreparedStatement ptmt = conn.prepareStatement(sql);
        ResultSet rs = ptmt.executeQuery();
        while (rs.next()) {
            Image image = new Image();
            image.setId(rs.getInt("id"));
            image.setPostid(rs.getString("post_id"));
            image.setContent(rs.getString("content"));
            image.setDate(rs.getTimestamp("date"));
            images.add(image);
        }
        return images;
    }

    /**
     * Find the first uploaded image by post id
     *
     * @param id
     * @throws SQLException
     */
    public Image findImage(String id) throws SQLException {
        Image image = new Image();
        Connection conn = DBUtil.getConn();
        String sql = "select * from Image where post_id='"+ id + "' limit 1";
        PreparedStatement ptmt = conn.prepareStatement(sql);
        ResultSet rs = ptmt.executeQuery();
        while (rs.next()) {
            image.setId(rs.getInt("id"));
            image.setPostid(rs.getString("post_id"));
            image.setContent(rs.getString("content"));
            image.setDate(rs.getTimestamp("date"));
        }
        return image;
    }

    /**
     * Insert post func
     *
     * @param post
     * @throws SQLException
     */
    public void addPost(Post post) throws SQLException {
        Connection conn = DBUtil.getConn();
        String sql = "insert into Post" + "(id, title, city, address, placeid, coordinate, type, demands, amenities, description, price," +
                " alidadamatch, start_date, end_date, post_date, post_by, stick_date) " +
                "values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? ,?, ?, ?, CURRENT_TIMESTAMP(), ?, CURRENT_TIMESTAMP())";
        PreparedStatement ptmt = conn.prepareStatement(sql);
        ptmt.setString(1, post.getId());
        ptmt.setString(2, post.getTitle());
        ptmt.setString(3, post.getCity());
        ptmt.setString(4, post.getAddress());
        ptmt.setString(5, post.getPlaceid());
        ptmt.setString(6, post.getCoordinate());
        ptmt.setString(7, post.getType());
        ptmt.setString(8, post.getDemands());
        ptmt.setString(9, post.getAmenities());
        ptmt.setString(10, post.getDescription());
        ptmt.setInt(11, post.getPrice());
        ptmt.setString(12, post.getAlidadamatch());
        ptmt.setDate(13, post.getStart_date());
        ptmt.setDate(14, post.getEnd_date());
        ptmt.setInt(15, post.getPost_by());
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
        String sql = "select * from Post order by stick_date DESC";
        PreparedStatement ptmt = conn.prepareStatement(sql);
        ResultSet rs = ptmt.executeQuery();
        while (rs.next()) {
            Post post = new Post();
            post.setId(rs.getString("id"));
            post.setTitle(rs.getString("title"));
            post.setCity(rs.getString("city"));
            post.setAddress(rs.getString("address"));
            post.setPlaceid(rs.getString("placeid"));
            post.setCoordinate(rs.getString("coordinate"));
            post.setType(rs.getString("type"));
            post.setDemands(rs.getString("demands"));
            post.setAmenities(rs.getString("amenities"));
            post.setPhotos(rs.getInt("photos"));
            post.setDescription(rs.getString("description"));
            post.setPrice(rs.getInt("price"));
            post.setAlidadamatch(rs.getString("alidadamatch"));
            post.setStart_date(rs.getDate("start_date"));
            post.setEnd_date(rs.getDate("end_date"));
            post.setPost_date(rs.getTimestamp("post_date"));
            post.setLikes(rs.getInt("likes"));
            post.setPost_by(rs.getInt("post_by"));
            post.setReviews(rs.getInt("reviews"));
            post.setStick_date(rs.getTimestamp("stick_date"));
            post.setPoster(getUser(rs.getInt("post_by")).getUser_name());
            post.setStatus(rs.getInt("status"));
            posts.add(post);
        }
        return posts;
    }

    /**
     * Get one post detail
     *
     * @throws SQLException
     */
    public Post getPostDetail(String id) throws SQLException {
        Post post = new Post();
        Connection conn = DBUtil.getConn();
        String sql = "select * from Post where id = '" + id + "'";
        PreparedStatement ptmt = conn.prepareStatement(sql);
        ResultSet rs = ptmt.executeQuery();
        while (rs.next()) {
            post.setId(rs.getString("id"));
            post.setTitle(rs.getString("title"));
            post.setCity(rs.getString("city"));
            post.setAddress(rs.getString("address"));
            post.setPlaceid(rs.getString("placeid"));
            post.setCoordinate(rs.getString("coordinate"));
            post.setType(rs.getString("type"));
            post.setDemands(rs.getString("demands"));
            post.setAmenities(rs.getString("amenities"));
            post.setPhotos(rs.getInt("photos"));
            post.setDescription(rs.getString("description"));
            post.setPrice(rs.getInt("price"));
            post.setAlidadamatch(rs.getString("alidadamatch"));
            post.setStart_date(rs.getDate("start_date"));
            post.setEnd_date(rs.getDate("end_date"));
            post.setPost_date(rs.getTimestamp("post_date"));
            post.setLikes(rs.getInt("likes"));
            post.setPost_by(rs.getInt("post_by"));
            post.setReviews(rs.getInt("reviews"));
            post.setStick_date(rs.getTimestamp("stick_date"));
            post.setPoster(getUser(rs.getInt("post_by")).getUser_name());
            post.setStatus(rs.getInt("status"));
        }
        return post;
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
     * Post a review func
     *
     * @param post_id, user_id
     * @throws SQLException
     */
    public void postReview(String post_id, int post_by, int user_id, String user_name, String content) throws SQLException {
        Connection conn = DBUtil.getConn();
        String sql = "insert into review(post_id, post_by, user_id, user_name, content, date)" +
                " values(?, ?, ?, ?, ?, CURRENT_TIMESTAMP())";
        PreparedStatement ptmt = conn.prepareStatement(sql);
        ptmt.setString(1, post_id);
        ptmt.setInt(2, post_by);
        ptmt.setInt(3, user_id);
        ptmt.setString(4, user_name);
        ptmt.setString(5, content);
        ptmt.execute();
        System.out.println("Review posted.");
    }

    /**
     * Get user's reviews func
     *
     * @throws SQLException
     */
    public List<Review> getUserReviews(int post_by) throws SQLException {
        List<Review> reviews = new ArrayList<Review>();
        Connection conn = DBUtil.getConn();
        String sql = "select * from review where post_by = " + post_by;
        PreparedStatement ptmt = conn.prepareStatement(sql);
        ResultSet rs = ptmt.executeQuery();
        while (rs.next()) {
            Review review = new Review();
            review.setId(rs.getInt("id"));
            review.setPost_id(rs.getString("post_id"));
            review.setPost_by(rs.getInt("post_by"));
            review.setUser_id(rs.getInt("user_id"));
            review.setUser_name(rs.getString("user_name"));
            review.setContent(rs.getString("content"));
            review.setDate(rs.getTimestamp("date"));
            reviews.add(review);
        }
        return reviews;
    }

    /**
     * Get post reviews func
     *
     * @throws SQLException
     */
    public List<Review> getPostReviews(String post_id) throws SQLException {
        List<Review> reviews = new ArrayList<Review>();
        Connection conn = DBUtil.getConn();
        String sql = "select * from review where post_id = '" + post_id + "'";
        PreparedStatement ptmt = conn.prepareStatement(sql);
        ResultSet rs = ptmt.executeQuery();
        while (rs.next()) {
            Review review = new Review();
            review.setId(rs.getInt("id"));
            review.setPost_id(rs.getString("post_id"));
            review.setPost_by(rs.getInt("post_by"));
            review.setUser_id(rs.getInt("user_id"));
            review.setUser_name(rs.getString("user_name"));
            review.setContent(rs.getString("content"));
            review.setDate(rs.getTimestamp("date"));
            reviews.add(review);
        }
        return reviews;
    }

    /**
     * Add to watch list func
     *
     * @param post_id, user_id
     * @throws SQLException
     */
    public void addToWatchlist(String post_id, Integer user_id) throws SQLException {
        Connection conn = DBUtil.getConn();
        String sql1 = "update Post set likes = likes + 1 where id = '" + post_id + "'";
        Statement stmt = conn.createStatement();
        stmt.executeUpdate(sql1);
        String sql2 = "insert into Watchlist(post_id, user_id)" +
                " values(?, ?)";
        PreparedStatement ptmt = conn.prepareStatement(sql2);
        ptmt.setString(1, post_id);
        ptmt.setInt(2, user_id);
        ptmt.execute();
    }

    /**
     * Advanced search results func
     *
     * @throws SQLException
     */
    public List<Post> advancedSearch(String min_price, String max_price, String demands, String amenities, String check_in,
                                     String check_out, String type, String city) throws SQLException {
        List<Post> posts = new ArrayList<Post>();
        Connection conn = DBUtil.getConn();
        int mi_price = 0;
        int ma_price = 0;
        if(min_price.equals("")) {
            mi_price = 0;
        } else {
            mi_price = Integer.valueOf(min_price);
        }
        if(max_price.equals("")) {
            ma_price = 99999;
        } else {
            ma_price = Integer.valueOf(max_price);
        }
        if(check_in.equals("")) {
            check_in = "2999-12-31";
        }
        if(check_out.equals("")) {
            check_out = "1990-01-01";
        }
        String sql = "select * from post where price >= " + mi_price + " and price <= " + ma_price +
                " and demands like '%" + demands + "%' and type like '%" + type + "%' " +
                "and amenities like '%" + amenities + "%' and city like '%" + city + "%' " +
                "and start_date <= '" + check_in + "' and end_date >= '" + check_out + "' order by stick_date DESC";
        PreparedStatement ptmt = conn.prepareStatement(sql);
        ResultSet rs = ptmt.executeQuery();
        while (rs.next()) {
            Post post = new Post();
            post.setId(rs.getString("id"));
            post.setTitle(rs.getString("title"));
            post.setCity(rs.getString("city"));
            post.setAddress(rs.getString("address"));
            post.setPlaceid(rs.getString("placeid"));
            post.setCoordinate(rs.getString("coordinate"));
            post.setType(rs.getString("type"));
            post.setDemands(rs.getString("demands"));
            post.setAmenities(rs.getString("amenities"));
            post.setPhotos(rs.getInt("photos"));
            post.setDescription(rs.getString("description"));
            post.setPrice(rs.getInt("price"));
            post.setAlidadamatch(rs.getString("alidadamatch"));
            post.setStart_date(rs.getDate("start_date"));
            post.setEnd_date(rs.getDate("end_date"));
            post.setPost_date(rs.getTimestamp("post_date"));
            post.setLikes(rs.getInt("likes"));
            post.setPost_by(rs.getInt("post_by"));
            post.setReviews(rs.getInt("reviews"));
            post.setStick_date(rs.getTimestamp("stick_date"));
            post.setPoster(getUser(rs.getInt("post_by")).getUser_name());
            post.setStatus(rs.getInt("status"));
            posts.add(post);
        }
        return posts;
    }

    /**
     * Check if post is in the watch list func
     *
     * @param post_id, user_id
     * @throws SQLException
     */
    public Boolean isInWatchlist(String post_id, Integer user_id) throws SQLException {
        Connection conn = DBUtil.getConn();
        String sql = "select id from Watchlist where post_id = '" + post_id + "' and user_id = " + user_id;
        PreparedStatement ptmt = conn.prepareStatement(sql);
        ResultSet rs = ptmt.executeQuery();
        int result = 0;
        while (rs.next()) {
            result = rs.getInt("id");
        }
        if(result != 0) {
            return true;
        } else {
            return false;
        }
    }

    /**
     * Update Stick Date func
     *
     * @param id
     * @throws SQLException
     */
    public void updateStickTime(String id) throws SQLException {
        Connection conn = DBUtil.getConn();
        String sql = "update Post set stick_date = CURRENT_TIMESTAMP() where id = '" + id + "'";
        Statement stmt = conn.createStatement();
        stmt.executeUpdate(sql);
    }


    /**
     * Get user's watchlist func
     *
     * @throws SQLException
     */
    public List<Post> getWatchlist(int user_id) throws SQLException {
        List<Post> posts = new ArrayList<Post>();
        Connection conn = DBUtil.getConn();
        String sql = "select * from watchlist w inner join post p on w.post_id = p.id where user_id = " + user_id;
        PreparedStatement ptmt = conn.prepareStatement(sql);
        ResultSet rs = ptmt.executeQuery();
        while (rs.next()) {
            Post post = new Post();
            post.setId(rs.getString(4));
            post.setTitle(rs.getString("title"));
            post.setCity(rs.getString("city"));
            post.setAddress(rs.getString("address"));
            post.setPlaceid(rs.getString("placeid"));
            post.setCoordinate(rs.getString("coordinate"));
            post.setType(rs.getString("type"));
            post.setDemands(rs.getString("demands"));
            post.setAmenities(rs.getString("amenities"));
            post.setPhotos(rs.getInt("photos"));
            post.setDescription(rs.getString("description"));
            post.setPrice(rs.getInt("price"));
            post.setAlidadamatch(rs.getString("alidadamatch"));
            post.setStart_date(rs.getDate("start_date"));
            post.setEnd_date(rs.getDate("end_date"));
            post.setPost_date(rs.getTimestamp("post_date"));
            post.setLikes(rs.getInt("likes"));
            post.setPost_by(rs.getInt("post_by"));
            post.setReviews(rs.getInt("reviews"));
            post.setStick_date(rs.getTimestamp("stick_date"));
            post.setPoster(getUser(rs.getInt("post_by")).getUser_name());
            post.setStatus(rs.getInt("status"));
            posts.add(post);
        }
        return posts;
    }

    /**
     * Get user's watchlist id func
     *
     * @throws SQLException
     */
    public List<Integer> getWatchlistID(int user_id) throws SQLException {
        List<Integer> ids = new ArrayList<Integer>();
        Connection conn = DBUtil.getConn();
        String sql = "select id from watchlist where user_id = " + user_id;
        PreparedStatement ptmt = conn.prepareStatement(sql);
        ResultSet rs = ptmt.executeQuery();
        while (rs.next()) {
            ids.add(rs.getInt("id"));
        }
        return ids;
    }

    /**
     * Remove from watchlist func
     *
     * @param id
     * @throws SQLException
     */
    public void removeWatchlist(int id, String post_id) throws SQLException {
        Connection conn = DBUtil.getConn();
        String sql1 = "delete from watchlist where id = " + id;
        String sql2 = "update Post set likes = likes - 1 where id = '" + post_id + "'";
        Statement stmt = conn.createStatement();
        stmt.executeUpdate(sql1);
        stmt.executeUpdate(sql2);
    }

    /**
     * Get user's active bookings func
     *
     * @throws SQLException
     */
    public List<Post> getMyActiveBookings(Integer user_id) throws SQLException {
        List<Post> posts = new ArrayList<Post>();
        Connection conn = DBUtil.getConn();
        String sql = "select post.id, post.title, post.city, post.address, post.placeid, " +
                "post.coordinate, post.type, post.demands, post.amenities, post.photos, post.description, " +
                "post.price, post.alidadamatch, post.start_date, post.end_date, post.post_date, " +
                "post.likes, post.post_by, post.reviews, post.stick_date, post.status " +
                "from booking inner join post on post.id = booking.post_id where booking.status = 1 and user_id = " + user_id;
        PreparedStatement ptmt = conn.prepareStatement(sql);
        ResultSet rs = ptmt.executeQuery();
        while (rs.next()) {
            Post post = new Post();
            post.setId(rs.getString("id"));
            post.setTitle(rs.getString("title"));
            post.setCity(rs.getString("city"));
            post.setAddress(rs.getString("address"));
            post.setPlaceid(rs.getString("placeid"));
            post.setCoordinate(rs.getString("coordinate"));
            post.setType(rs.getString("type"));
            post.setDemands(rs.getString("demands"));
            post.setAmenities(rs.getString("amenities"));
            post.setPhotos(rs.getInt("photos"));
            post.setDescription(rs.getString("description"));
            post.setPrice(rs.getInt("price"));
            post.setAlidadamatch(rs.getString("alidadamatch"));
            post.setStart_date(rs.getDate("start_date"));
            post.setEnd_date(rs.getDate("end_date"));
            post.setPost_date(rs.getTimestamp("post_date"));
            post.setLikes(rs.getInt("likes"));
            post.setPost_by(rs.getInt("post_by"));
            post.setReviews(rs.getInt("reviews"));
            post.setStick_date(rs.getTimestamp("stick_date"));
            post.setPoster(getUser(rs.getInt("post_by")).getUser_name());
            post.setStatus(rs.getInt("status"));
            posts.add(post);
        }
        return posts;
    }

    /**
     * Get user's active bookings' id func
     *
     * @throws SQLException
     */
    public List<Booking> getMyActiveBookingsInfo(Integer user_id) throws SQLException {
        List<Booking> bookings = new ArrayList<Booking>();
        Connection conn = DBUtil.getConn();
        String sql = "select * from booking where status = 1 and user_id = " + user_id;
        PreparedStatement ptmt = conn.prepareStatement(sql);
        ResultSet rs = ptmt.executeQuery();
        while (rs.next()) {
            Booking booking = new Booking();
            booking.setId(rs.getString("id"));
            booking.setPost_id(rs.getString("post_id"));
            booking.setUser_id(rs.getInt("user_id"));
            booking.setStart_date(rs.getDate("start_date"));
            booking.setEnd_date(rs.getDate("end_date"));
            booking.setDate(rs.getTimestamp("date"));
            booking.setStatus(rs.getInt("status"));
            bookings.add(booking);
        }
        return bookings;
    }

    /**
     * Get user's waiting bookings func
     *
     * @throws SQLException
     */
    public List<Post> getMyWaitingBookings(Integer user_id) throws SQLException {
        List<Post> posts = new ArrayList<Post>();
        Connection conn = DBUtil.getConn();
        String sql = "select post.id, post.title, post.city, post.address, post.placeid, " +
                "post.coordinate, post.type, post.demands, post.amenities, post.photos, post.description, " +
                "post.price, post.alidadamatch, post.start_date, post.end_date, post.post_date, " +
                "post.likes, post.post_by, post.reviews, post.stick_date, post.status " +
                "from booking inner join post on post.id = booking.post_id where booking.status = 0 and user_id = " + user_id;
        PreparedStatement ptmt = conn.prepareStatement(sql);
        ResultSet rs = ptmt.executeQuery();
        while (rs.next()) {
            Post post = new Post();
            post.setId(rs.getString("id"));
            post.setTitle(rs.getString("title"));
            post.setCity(rs.getString("city"));
            post.setAddress(rs.getString("address"));
            post.setPlaceid(rs.getString("placeid"));
            post.setCoordinate(rs.getString("coordinate"));
            post.setType(rs.getString("type"));
            post.setDemands(rs.getString("demands"));
            post.setAmenities(rs.getString("amenities"));
            post.setPhotos(rs.getInt("photos"));
            post.setDescription(rs.getString("description"));
            post.setPrice(rs.getInt("price"));
            post.setAlidadamatch(rs.getString("alidadamatch"));
            post.setStart_date(rs.getDate("start_date"));
            post.setEnd_date(rs.getDate("end_date"));
            post.setPost_date(rs.getTimestamp("post_date"));
            post.setLikes(rs.getInt("likes"));
            post.setPost_by(rs.getInt("post_by"));
            post.setReviews(rs.getInt("reviews"));
            post.setStick_date(rs.getTimestamp("stick_date"));
            post.setPoster(getUser(rs.getInt("post_by")).getUser_name());
            post.setStatus(rs.getInt("status"));
            posts.add(post);
        }
        return posts;
    }

    /**
     * Get user's waiting bookings' id func
     *
     * @throws SQLException
     */
    public List<Booking> getMyWaitingBookingsInfo(Integer user_id) throws SQLException {
        List<Booking> bookings = new ArrayList<Booking>();
        Connection conn = DBUtil.getConn();
        String sql = "select * from booking where status = 0 and user_id = " + user_id;
        PreparedStatement ptmt = conn.prepareStatement(sql);
        ResultSet rs = ptmt.executeQuery();
        while (rs.next()) {
            Booking booking = new Booking();
            booking.setId(rs.getString("id"));
            booking.setPost_id(rs.getString("post_id"));
            booking.setUser_id(rs.getInt("user_id"));
            booking.setStart_date(rs.getDate("start_date"));
            booking.setEnd_date(rs.getDate("end_date"));
            booking.setDate(rs.getTimestamp("date"));
            booking.setStatus(rs.getInt("status"));
            bookings.add(booking);
        }
        return bookings;
    }

    /**
     * Get user's completed bookings func
     *
     * @throws SQLException
     */
    public List<Post> getMyCompletedBookings(Integer user_id) throws SQLException {
        List<Post> posts = new ArrayList<Post>();
        Connection conn = DBUtil.getConn();
        String sql = "select post.id, post.title, post.city, post.address, post.placeid, " +
                "post.coordinate, post.type, post.demands, post.amenities, post.photos, post.description, " +
                "post.price, post.alidadamatch, post.start_date, post.end_date, post.post_date, " +
                "post.likes, post.post_by, post.reviews, post.stick_date, post.status " +
                "from booking inner join post on post.id = booking.post_id where booking.status = 2 and user_id = " + user_id;
        PreparedStatement ptmt = conn.prepareStatement(sql);
        ResultSet rs = ptmt.executeQuery();
        while (rs.next()) {
            Post post = new Post();
            post.setId(rs.getString("id"));
            post.setTitle(rs.getString("title"));
            post.setCity(rs.getString("city"));
            post.setAddress(rs.getString("address"));
            post.setPlaceid(rs.getString("placeid"));
            post.setCoordinate(rs.getString("coordinate"));
            post.setType(rs.getString("type"));
            post.setDemands(rs.getString("demands"));
            post.setAmenities(rs.getString("amenities"));
            post.setPhotos(rs.getInt("photos"));
            post.setDescription(rs.getString("description"));
            post.setPrice(rs.getInt("price"));
            post.setAlidadamatch(rs.getString("alidadamatch"));
            post.setStart_date(rs.getDate("start_date"));
            post.setEnd_date(rs.getDate("end_date"));
            post.setPost_date(rs.getTimestamp("post_date"));
            post.setLikes(rs.getInt("likes"));
            post.setPost_by(rs.getInt("post_by"));
            post.setReviews(rs.getInt("reviews"));
            post.setStick_date(rs.getTimestamp("stick_date"));
            post.setPoster(getUser(rs.getInt("post_by")).getUser_name());
            post.setStatus(rs.getInt("status"));
            posts.add(post);
        }
        return posts;
    }

    /**
     * Get user's completed bookings' id func
     *
     * @throws SQLException
     */
    public List<Booking> getMyCompletedBookingsInfo(Integer user_id) throws SQLException {
        List<Booking> bookings = new ArrayList<Booking>();
        Connection conn = DBUtil.getConn();
        String sql = "select * from booking where status = 2 and user_id = " + user_id;
        PreparedStatement ptmt = conn.prepareStatement(sql);
        ResultSet rs = ptmt.executeQuery();
        while (rs.next()) {
            Booking booking = new Booking();
            booking.setId(rs.getString("id"));
            booking.setPost_id(rs.getString("post_id"));
            booking.setUser_id(rs.getInt("user_id"));
            booking.setStart_date(rs.getDate("start_date"));
            booking.setEnd_date(rs.getDate("end_date"));
            booking.setDate(rs.getTimestamp("date"));
            booking.setStatus(rs.getInt("status"));
            bookings.add(booking);
        }
        return bookings;
    }

    /**
     * Make booking func
     *
     * @param user_id, friend_id, username
     * @throws SQLException
     */
    public int makeBooking(String post_id, Integer user_id, Date start_date,
                            Date end_id) throws SQLException {
        Connection conn = DBUtil.getConn();
        String sql = "insert into Booking(post_id, user_id, start_date, end_date, date)" +
                " values(?, ?, ?, ?, CURRENT_TIMESTAMP())";
        PreparedStatement ptmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
        ptmt.setString(1, post_id);
        ptmt.setInt(2, user_id);
        ptmt.setDate(3, start_date);
        ptmt.setDate(4, end_id);
        ptmt.execute();
        ResultSet idrs = ptmt.getGeneratedKeys();
        int id = 0;
        if (idrs.next()) {
            id = idrs.getInt(1);
        }
        return id;
    }

    /**
     * Agree booking func
     *
     * @param id
     * @throws SQLException
     */
    public void agreeBooking(Integer id) throws SQLException {
        Connection conn = DBUtil.getConn();
        String sql = "update booking set status = 1 where id = " + id;
        Statement stmt = conn.createStatement();
        stmt.executeUpdate(sql);
    }

    /**
     * Decline booking func
     *
     * @param id
     * @throws SQLException
     */
    public void declineBooking(Integer id) throws SQLException {
        Connection conn = DBUtil.getConn();
        String sql = "delete from booking where id = " + id;
        Statement stmt = conn.createStatement();
        stmt.executeUpdate(sql);
        System.out.println("booking deleted!");
    }

    /**
     * Complete a booking func
     *
     * @param id
     * @throws SQLException
     */
    public void completeBooking(Integer id) throws SQLException {
        Connection conn = DBUtil.getConn();
        String sql = "update booking set status = 2 where id = " + id;
        Statement stmt = conn.createStatement();
        stmt.executeUpdate(sql);
    }

    /**
     * List all booking by post_id func
     *
     * @throws SQLException
     */
    public List<Booking> listAllBooking(String post_id) throws SQLException {
        List<Booking> bookings = new ArrayList<Booking>();
        Connection conn = DBUtil.getConn();
        String sql = "select * from Booking where post_id = '" + post_id + "'";
        PreparedStatement ptmt = conn.prepareStatement(sql);
        ResultSet rs = ptmt.executeQuery();
        while (rs.next()) {
            Booking booking = new Booking();
            booking.setId(rs.getString("id"));
            booking.setPost_id(rs.getString("post_id"));
            booking.setUser_id(rs.getInt("user_id"));
            booking.setStart_date(rs.getDate("start_date"));
            booking.setEnd_date(rs.getDate("end_date"));
            booking.setDate(rs.getTimestamp("date"));
            bookings.add(booking);
        }
        return bookings;
    }

    /**
     * Delete post func
     *
     * @param post_id
     * @throws SQLException
     */
    public void deletePost(String post_id) throws SQLException {
        Connection conn = DBUtil.getConn();
        String sql1 = "delete from post where id = '" + post_id + "'";
        String sql2 = "delete from watchlist where post_id = '" + post_id + "'";
        String sql3 = "delete from booking where post_id = '" + post_id + "'";
        String sql4 = "delete from image where post_id = '" + post_id + "'";
        Statement stmt = conn.createStatement();
        stmt.executeUpdate(sql1);
        stmt.executeUpdate(sql2);
        stmt.executeUpdate(sql3);
        stmt.executeUpdate(sql4);
        System.out.println("post deleted.");
    }

    /**
     * Get user's active posts func
     *
     * @throws SQLException
     */
    public List<Post> getMyActivePosts(Integer user_id) throws SQLException {
        List<Post> posts = new ArrayList<Post>();
        Connection conn = DBUtil.getConn();
        String sql = "select * from Post where status = 1 and post_by = " + user_id;
        PreparedStatement ptmt = conn.prepareStatement(sql);
        ResultSet rs = ptmt.executeQuery();
        while (rs.next()) {
            Post post = new Post();
            post.setId(rs.getString("id"));
            post.setTitle(rs.getString("title"));
            post.setCity(rs.getString("city"));
            post.setAddress(rs.getString("address"));
            post.setPlaceid(rs.getString("placeid"));
            post.setCoordinate(rs.getString("coordinate"));
            post.setType(rs.getString("type"));
            post.setDemands(rs.getString("demands"));
            post.setAmenities(rs.getString("amenities"));
            post.setPhotos(rs.getInt("photos"));
            post.setDescription(rs.getString("description"));
            post.setPrice(rs.getInt("price"));
            post.setAlidadamatch(rs.getString("alidadamatch"));
            post.setStart_date(rs.getDate("start_date"));
            post.setEnd_date(rs.getDate("end_date"));
            post.setPost_date(rs.getTimestamp("post_date"));
            post.setLikes(rs.getInt("likes"));
            post.setPost_by(rs.getInt("post_by"));
            post.setReviews(rs.getInt("reviews"));
            post.setStick_date(rs.getTimestamp("stick_date"));
            post.setPoster(getUser(rs.getInt("post_by")).getUser_name());
            post.setStatus(rs.getInt("status"));
            posts.add(post);
        }
        return posts;
    }

    /**
     * Update post func
     *
     * @param post
     * @throws SQLException
     */
    public void updatePost(Post post) throws SQLException {
        Connection conn = DBUtil.getConn();
        String sql = "update post set title='" + post.getTitle() + "', city='" + post.getCity() + "', address='" + post.getAddress() +
                "', placeid='" + post.getPlaceid() + "', coordinate='" + post.getCoordinate() + "', type='" + post.getType() +
                "', demands='" + post.getDemands() + "', amenities='" + post.getAmenities() + "', description='" + post.getDescription() +
                "', price=" + post.getPrice() + ", alidadamatch='" + post.getAlidadamatch() + "', start_date='" + post.getStart_date() +
                "', end_date='" + post.getEnd_date() + "', stick_date=CURRENT_TIMESTAMP where id='" + post.getId() + "'";
        Statement stmt = conn.createStatement();
        stmt.executeUpdate(sql);
    }

    /**
     * Get all the friends of the target user
     *
     * @param post_id
     * @throws SQLException
     */
    public Timestamp getStickTime(String post_id) throws SQLException {
        Connection conn = DBUtil.getConn();
        String sql = "select stick_date from Post where id = '" + post_id + "'";
        PreparedStatement ptmt = conn.prepareStatement(sql);
        ResultSet rs = ptmt.executeQuery();
        Timestamp stickDate = null;
        while (rs.next()) {
            stickDate = rs.getTimestamp("stick_date");
        }
        return stickDate;
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
     * Get where the notification send from func
     *
     * @throws SQLException
     */
    public int getSendFrom(int notice_id) throws SQLException {
        Connection conn = DBUtil.getConn();
        String sql = "select send_from from notification where id = " + notice_id;
        PreparedStatement ptmt = conn.prepareStatement(sql);
        ResultSet rs = ptmt.executeQuery();
        int send_from = 0;
        while (rs.next()) {
            send_from = rs.getInt("send_from");
        }
        return send_from;
    }

    /**
     * Get where the notification send to func
     *
     * @throws SQLException
     */
    public int getSendTo(int notice_id) throws SQLException {
        Connection conn = DBUtil.getConn();
        String sql = "select send_to from notification where id = " + notice_id;
        PreparedStatement ptmt = conn.prepareStatement(sql);
        ResultSet rs = ptmt.executeQuery();
        int send_from = 0;
        while (rs.next()) {
            send_from = rs.getInt("send_to");
        }
        return send_from;
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
