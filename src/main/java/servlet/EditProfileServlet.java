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

@WebServlet(name = "EditProfileServlet")
public class EditProfileServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Integer id = Integer.valueOf(request.getParameter("id"));
            String password = request.getParameter("password");
            String email = request.getParameter("email");
            String name = request.getParameter("name");
            String gender = request.getParameter("gender");
            String dob = request.getParameter("dob");
            String mobile = request.getParameter("mobile");

            User user = new User();
            user.setId(id);
            user.setPassword(password);
            user.setEmail(email);
            user.setName(name);
            user.setGender(gender);
            user.setDate_of_birth(dob);
            user.setMobile(mobile);

            DBDao dbdao = new DBDao();
            dbdao.updateUser(user);
            dbdao.addLog(id, "editProfile", " Updated personal profile.");
            request.setAttribute("user", dbdao.getUser(id));
            request.getSession().setAttribute("user", dbdao.getUser(id));
            request.getRequestDispatcher("/profile.jsp?user_id=" + id).forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Integer id = Integer.valueOf(request.getParameter("id"));
            DBDao dbdao = new DBDao();

            request.setAttribute("user", dbdao.getUser(id));
            request.getRequestDispatcher("/editProfile.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
