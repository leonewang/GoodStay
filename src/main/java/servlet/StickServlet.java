package servlet;

import dao.DBDao;
import util.FriendMailUtil;

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
import java.util.UUID;

@WebServlet(name = "StickServlet")
public class StickServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String post_id = request.getParameter("post_id");

            DBDao dbdao = new DBDao();
            Timestamp oldStickDate = dbdao.getStickTime(post_id);

            if (((int)((new Date().getTime() - oldStickDate.getTime()) / 1000)) >= 86400) {
                dbdao.updateStickTime(post_id);
                PrintWriter out = response.getWriter();
                out.print(1); // numbers can be transformed to JSON, normal string cannot
            } else {
                PrintWriter out = response.getWriter();
                out.print("error");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
