package servlet;

import dao.DBDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "BlockUserServlet")
public class BlockUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Integer user_id = Integer.valueOf(request.getParameter("user_id"));
            DBDao dbdao = new DBDao();
            dbdao.cancelBlock(user_id);
            response.getWriter().print("Unblock success...");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Integer user_id = Integer.valueOf(request.getParameter("user_id"));
            DBDao dbdao = new DBDao();
            dbdao.blockUser(user_id);
            response.getWriter().print("Block success...");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
