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

@WebServlet(name = "SendMessageServlet")
public class SendMessageServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Integer send_to = Integer.valueOf(request.getParameter("send_to"));
            Integer send_from = Integer.valueOf(request.getParameter("send_from"));
            String content = request.getParameter("content");
            DBDao dbdao = new DBDao();
            dbdao.sendNotification(send_to, send_from, " sent you a message: " + content + " <a href='profile.jsp?user_id=" + send_from + "'>Click here to reply</a>");
            response.getWriter().print("success");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
