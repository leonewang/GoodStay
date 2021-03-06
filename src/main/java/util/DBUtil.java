package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtil {
    private static final String URL = "jdbc:mysql://127.0.0.1:3306/GoodStay?characterEncoding=utf8&useSSL=false";
    private static final String USER = "root";
    private static final String PASSWORD = "";

    private static Connection conn = null;

    static {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    public static Connection getConn() {
        return conn;
    }
}