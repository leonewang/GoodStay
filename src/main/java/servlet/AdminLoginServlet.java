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
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String password = request.getParameter("password");
            DBDao dbdao = new DBDao();
            List<User> users = new ArrayList<User>();
            User admin;
            admin = dbdao.adminLogin(password);
            users = dbdao.listAllUsers();

            if (admin != null) {
                request.getSession().setAttribute("admin", admin);
                request.setAttribute("users", users);
                request.getRequestDispatcher("/adminController.jsp").forward(request, response);
            } else {
                System.out.println("Admin login failed...");
                request.setAttribute("warning", "Wrong password");
                request.getRequestDispatcher("/failed.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
