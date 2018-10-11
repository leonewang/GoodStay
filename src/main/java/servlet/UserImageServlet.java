package servlet;

import dao.DBDao;
import model.Image;
import model.UserImage;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet(name = "UserImageServlet")
public class UserImageServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Integer userid = Integer.valueOf(request.getParameter("user_id"));
            String content = request.getParameter("content");

            DBDao dbdao = new DBDao();
            UserImage image = new UserImage();
            image.setUser_id(userid);
            image.setContent(content);
            dbdao.addUserImage(image);
            PrintWriter out = response.getWriter();
            out.print("success");
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
