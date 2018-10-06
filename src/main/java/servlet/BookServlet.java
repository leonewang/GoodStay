package servlet;

import dao.DBDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;

@WebServlet(name = "BookServlet")
public class BookServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String post_id = request.getParameter("post_id");
            Integer user_id = Integer.valueOf(request.getParameter("user_id"));
            Date start_date = Date.valueOf(request.getParameter("start_date"));
            Date end_date = Date.valueOf(request.getParameter("end_date"));

            DBDao dbdao = new DBDao();
            dbdao.makeBooking(post_id, user_id, start_date, end_date);
            PrintWriter out = response.getWriter();
            out.print("success");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
