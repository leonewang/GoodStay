package servlet;

import action.UserAction;
import dao.DBDao;
import model.Login;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String user_name = request.getParameter("username");
            String password = request.getParameter("password");

            User user = new User();
            user.setUser_name(user_name);
            user.setPassword(password);

            UserAction useract = new UserAction();
            Login log = useract.login(user);
            if (log.getState().equals("active")) {
                System.out.println("Login success...");
                new DBDao().addLog(log.getUser().getId(), "login", " Logined successfully.");
                request.getSession().setAttribute("user", log.getUser());
                request.getRequestDispatcher("/wall.jsp").forward(request, response);
            }
            else if (log.getState().equals("banned")) {
                request.setAttribute("warning", "Sorry, your account have been banned. Please contact the administrators.");
                request.getRequestDispatcher("/failed.jsp").forward(request, response);
                System.out.println("Account be banned...");
            } else if (log.getState().equals("wrongpass")) {
                request.setAttribute("warning", "Wrong password. Please reenter you password.");
                request.getRequestDispatcher("/failed.jsp").forward(request, response);
                System.out.println("Login failed...");
            } else {
                request.setAttribute("warning", "Sorry, your account have not been active. Please check your activation email from UNSWBook.");
                request.getRequestDispatcher("/failed.jsp").forward(request, response);
                System.out.println("Account not active...");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action.equals("logout")) {
            request.getSession().invalidate();
            response.sendRedirect("index.jsp");
            return;
        }
    }
}
