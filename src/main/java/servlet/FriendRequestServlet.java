package servlet;

import dao.DBDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "FriendRequestServlet")
public class FriendRequestServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String code = request.getParameter("code");
            Integer send_to = Integer.valueOf(request.getParameter("send_to"));
            Integer send_from = Integer.valueOf(request.getParameter("send_from"));
            DBDao dbdao = new DBDao();
            dbdao.friendRequest(code);
            dbdao.sendNotification(send_to, send_from, " have already accepted your friend request.");
            dbdao.addLog(send_to, "beFriend", " Became a friend with <b>" +
                    dbdao.getUser(send_from).getUser_name() + "</b>.");
            System.out.println("Accept friend request success...");
            request.getRequestDispatcher("/acceptFriend.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
