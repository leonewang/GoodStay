package servlet;

import action.UserAction;
import dao.DBDao;
import model.User;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;

public class RegisterServlet extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request,
                          javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(javax.servlet.http.HttpServletRequest request,
                         javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        try {
            String user_name = request.getParameter("username");
            String password = request.getParameter("password");
            String email = request.getParameter("email");
            String name = request.getParameter("name");
            String gender = request.getParameter("gender");
            String date_of_birth = request.getParameter("dob");

            User user = new User();
            user.setUser_name(user_name);
            user.setPassword(password);
            user.setEmail(email);
            user.setName(name);
            user.setGender(gender);
            user.setDate_of_birth(date_of_birth);

            UserAction useract = new UserAction();
            useract.register(user);
            System.out.println("Register success...");
            request.getRequestDispatcher("/inactive.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
