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

@WebServlet(name = "SearchServlet")
public class SearchServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            User user = (User) request.getSession().getAttribute("user");
            String username = request.getParameter("username");
            DBDao dbdao = new DBDao();
            List<User> users = dbdao.getUser(username);
            dbdao.addLog(user.getId(), "basicSearch", " Search for keywords: <b>" + username + "</b>");
            request.setAttribute("users", users);
            request.getRequestDispatcher("/result.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            User user = (User) request.getSession().getAttribute("user");
            String username = request.getParameter("username");
            String mobile = request.getParameter("mobile");
            String gender = request.getParameter("gender");
            String dob = request.getParameter("dob");
            String content = " Advance search for keywords: ";

            if (username != "") {
                content += " [<b>" + username + "</b>]";
            } else if (mobile != "") {
                content += " [<b>" + mobile + "</b>]";
            } else if (gender != null) {
                content += " [<b>" + gender + "</b>]";
            } else if (dob != "") {
                content += " [<b>" + dob + "</b>]";
            }

            System.out.println(content);
            DBDao dbdao = new DBDao();
            List<User> users = dbdao.getUser(username, mobile, gender, dob);
            dbdao.addLog(user.getId(), "advanceSearch", content);
            request.setAttribute("users", users);
            request.getRequestDispatcher("/result.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
