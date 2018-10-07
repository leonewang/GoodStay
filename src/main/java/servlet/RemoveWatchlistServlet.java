package servlet;

import dao.DBDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;

@WebServlet(name = "RemoveWatchlistServlet")
public class RemoveWatchlistServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Integer id = Integer.valueOf(request.getParameter("id"));
            String post_id = request.getParameter("post_id");

            DBDao dbdao = new DBDao();
            dbdao.removeWatchlist(id, post_id);
            PrintWriter out = response.getWriter();
            out.print("success");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
