package servlet;

import dao.DBDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "LikeServlet")
public class LikeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Integer id = Integer.valueOf(request.getParameter("id"));
            Integer send_to = Integer.valueOf(request.getParameter("send_to"));
            Integer send_from = Integer.valueOf(request.getParameter("send_from"));
            DBDao dbdao = new DBDao();
            dbdao.updatePost(id);
            dbdao.sendNotification(send_to, send_from, " liked your post.");
            dbdao.addLog(send_from, "likePost", " Liked the post of </b>" +
                    dbdao.getUser(send_to).getUser_name() + "</b>.");
            response.getWriter().print(id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
