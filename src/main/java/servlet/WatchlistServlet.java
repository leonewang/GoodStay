package servlet;

import dao.DBDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;

@WebServlet(name = "WatchlistServlet")
public class WatchlistServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String post_id = request.getParameter("post_id");
            Integer user_id = Integer.valueOf(request.getParameter("user_id"));

            DBDao dbdao = new DBDao();
            if(dbdao.isInWatchlist(post_id, user_id)) {
                PrintWriter out = response.getWriter();
                out.print("error");
            } else {
                dbdao.addToWatchlist(post_id, user_id);
                PrintWriter out = response.getWriter();
                out.print(1); // numbers can be transformed to JSON, normal string cannot
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
