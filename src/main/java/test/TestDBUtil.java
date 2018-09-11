package test;

import java.sql.Connection;
        import java.sql.DriverManager;
        import java.sql.PreparedStatement;
        import java.sql.ResultSet;

public class TestDBUtil {
    private static final String URL = "jdbc:mysql://127.0.0.1:3306/UNSWBook?characterEncoding=utf8&useSSL=false";
    private static final String USER = "root";
    private static final String PASSWORD = "liangge";
    private static Connection conn = null;

    public static void main(String[] args) throws Exception {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection(URL, USER, PASSWORD);

        PreparedStatement ptmt = conn.prepareStatement("select user_name, DoB from User");
        ResultSet rs = ptmt.executeQuery();

        while (rs.next()) {
            System.out.println(rs.getString("user_name") + "," + rs.getString("DoB"));
        }

    }

}