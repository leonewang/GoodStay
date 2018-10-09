package servlet;

import dao.DBDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "PostReviewServlet")
public class PostReviewServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String post_id = String.valueOf(request.getParameter("post_id"));
            int post_by = Integer.valueOf(request.getParameter("post_by"));
            int user_id = Integer.valueOf(request.getParameter("user_id"));
            String user_name = String.valueOf(request.getParameter("user_name"));
            String content = String.valueOf(request.getParameter("content"));
            int booking_id = Integer.valueOf(request.getParameter("booking_id"));
            DBDao dbdao = new DBDao();
            dbdao.postReview(post_id, post_by, user_id, user_name, content);
            dbdao.completeBooking(booking_id);
            response.getWriter().print("success");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
