package servlet;

import dao.DBDao;
import model.User;
import util.GetPassUtil;
import util.MailUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "FindPassServlet")
public class FindPassServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String username = request.getParameter("username");
            DBDao dbdao = new DBDao();
            User u = new User();
            u.setUser_name(username);
            User user = dbdao.getUser(u);
            dbdao.addLog(user.getId(), "findPass", " Found password via email.");
            new Thread(new GetPassUtil(user.getEmail(), user.getPassword())).start();
            request.getRequestDispatcher("/signin.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
