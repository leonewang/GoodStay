package servlet;

import dao.DBDao;
import model.Post;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "AdvancedSearchServlet")
public class AdvancedSearchServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String min_price = request.getParameter("min-price");
            String max_price = request.getParameter("max-price");
            String demand[] = request.getParameterValues("demands");
            String demands = "";
            if(demand != null) {
                for(int i = 0; i < demand.length; i++) {
                    demands += "%" + demand[i] + "%";
                }
            }
            String amenity[] = request.getParameterValues("amenities");
            String amenities = "";
            if(amenity != null) {
                for (int i = 0; i < amenity.length; i++) {
                    amenities += "%" + amenity[i] + "%";
                }
            }
            String check_in = request.getParameter("check-in");
            String check_out = request.getParameter("check-out");
            String type = request.getParameter("type");
            if (type.equals("All")) {
                type = "";
            }
            String city = request.getParameter("city");

            System.out.println("min_price: " + min_price);
            System.out.println("max_price: " + max_price);
            System.out.println("demands: " + demands);
            System.out.println("amenities: " + amenities);
            System.out.println("check_in: " + check_in);
            System.out.println("check_out: " + check_out);
            System.out.println("type: " + type);
            System.out.println("city: " + city);
            DBDao dbdao = new DBDao();
            List<Post> posts = dbdao.advancedSearch(min_price, max_price, demands, amenities, check_in, check_out, type, city);
            request.setAttribute("posts", posts);
            request.getRequestDispatcher("/searchResultNoLogin.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String min_price = request.getParameter("min-price");
            String max_price = request.getParameter("max-price");
            String demand[] = request.getParameterValues("demands");
            String demands = "";
            if(demand != null) {
                for(int i = 0; i < demand.length; i++) {
                    demands += "%" + demand[i] + "%";
                }
            }
            String amenity[] = request.getParameterValues("amenities");
            String amenities = "";
            if(amenity != null) {
                for (int i = 0; i < amenity.length; i++) {
                    amenities += "%" + amenity[i] + "%";
                }
            }
            String check_in = request.getParameter("check-in");
            String check_out = request.getParameter("check-out");
            String type = request.getParameter("type");
            if (type.equals("All")) {
                type = "";
            }
            String city = request.getParameter("city");
            DBDao dbdao = new DBDao();
            List<Post> posts = dbdao.advancedSearch(min_price, max_price, demands, amenities, check_in, check_out, type, city);
            request.setAttribute("posts", posts);
            request.getRequestDispatcher("/searchResult.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
