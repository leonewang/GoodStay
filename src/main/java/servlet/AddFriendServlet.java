package servlet;

import dao.DBDao;
import model.Friend;
import model.User;
import util.FriendMailUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.UUID;

@WebServlet(name = "AddFriendServlet")
public class AddFriendServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Integer user_id = Integer.valueOf(request.getParameter("user_id"));
            Integer friend_id = Integer.valueOf(request.getParameter("friend_id"));
            String user_name = request.getParameter("user_name");
            String friend_name = request.getParameter("friend_name");
            String email = request.getParameter("email");
            String code = String.valueOf(UUID.randomUUID());
            DBDao dbdao = new DBDao();
            dbdao.addFriend(user_id, friend_id, friend_name, code);
            dbdao.addLog(user_id, "addFriend", " Sent friend request to <b>" + friend_name + "</b>.");
            // create a new thread for sending request email
            new Thread(new FriendMailUtil(email, code, user_name, user_id, friend_id)).start();
            PrintWriter out = response.getWriter();
            out.print("success");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
