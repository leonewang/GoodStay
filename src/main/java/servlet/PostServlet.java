package servlet;

import dao.DBDao;
import model.Post;
import model.User;
import util.DetectMailUtil;
import util.FriendMailUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URISyntaxException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@WebServlet(name = "PostServlet")
public class PostServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String text = request.getParameter("message");
            String url = request.getParameter("url");
            Integer post_by = Integer.valueOf(request.getParameter("id"));

            DBDao dbdao = new DBDao();
            Post post = new Post();
            post.setText(text);
            post.setUrl(url);
            post.setPost_by(post_by);
            post.setPoster(dbdao.getUser(post_by).getUser_name());
            dbdao.addPost(post);
            dbdao.addLog(post_by, "post", " Posted a new message" + text + ".");
            request.getRequestDispatcher("/wall.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
