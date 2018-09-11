package servlet;

import dao.DBDao;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "AdminSearchServlet")
public class AdminSearchServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String username = request.getParameter("username");
            DBDao dbdao = new DBDao();
            List<User> users = dbdao.getUser(username);
            request.setAttribute("users", users);
            request.getRequestDispatcher("/adminController.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String username = request.getParameter("username");
            String mobile = request.getParameter("mobile");
            String gender = request.getParameter("gender");
            String dob = request.getParameter("dob");

            DBDao dbdao = new DBDao();
            List<User> users = dbdao.getUser(username, mobile, gender, dob);
            request.setAttribute("users", users);
            request.getRequestDispatcher("/adminController.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
