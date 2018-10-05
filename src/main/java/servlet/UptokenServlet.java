package servlet;

import com.qiniu.util.Auth;
import dao.DBDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet(name = "UptokenServlet")
public class UptokenServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accessKey = "X7xx6YNO5_lOydg-2n0ATq5t-3nUCp9_KSZm5l6M";
        String secretKey = "csiw8xZfcibXGqVw2ODAdaAghrJGb6BcxUPSO6G7";
        String bucket = "goodstay";
        Auth auth = Auth.create(accessKey, secretKey);
        String upToken = auth.uploadToken(bucket);
        System.out.println(upToken);
        PrintWriter out = response.getWriter();
        out.print(upToken);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
