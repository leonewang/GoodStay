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

@WebServlet(name = "SearchPostServlet")
public class SearchPostServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String id = request.getParameter("postID");
            String title = request.getParameter("title");
            String address = request.getParameter("address");
            String city = request.getParameter("city");
            String type = request.getParameter("type");
            String demand[] = request.getParameterValues("demands");
            String demands = "";
            for(int i = 0; i < demand.length; i++) {
                demands += demand[i] + ",";
            }
            String amenity[] = request.getParameterValues("amenities");
            String amenities = "";
            for(int i = 0; i < amenity.length; i++) {
                amenities += amenity[i] + ",";
            }
            String description = request.getParameter("description");
            Integer price = Integer.valueOf(request.getParameter("price"));
            String alidadamatch = request.getParameter("alidadamatch");
            Date start_date = Date.valueOf(request.getParameter("start_date"));
            Date end_date = Date.valueOf(request.getParameter("end_date"));
            Integer post_by = Integer.valueOf(request.getParameter("id"));
            String placeid = request.getParameter("placeid");
            String coordinate = request.getParameter("coordinate");

            System.out.println("ID: " + id);
            System.out.println("title: " + title);
            System.out.println("address: " + address);
            System.out.println("type: " + type);
            System.out.println("demands: " + demands);
            System.out.println("amenities: " + amenities);
            System.out.println("description: " + description);
            System.out.println("alidadamatch: " + alidadamatch);
            System.out.println("start_date: " + start_date);
            System.out.println("placeid: " + placeid);
            System.out.println("coordinate: " + coordinate);

            DBDao dbdao = new DBDao();
            Post post = new Post();
            post.setId(id);
            post.setTitle(title);
            post.setAddress(address);
            post.setCity(city);
            post.setType(type);
            post.setDemands(demands);
            post.setAmenities(amenities);
            post.setDescription(description);
            post.setPrice(price);
            post.setAlidadamatch(alidadamatch);
            post.setStart_date(start_date);
            post.setEnd_date(end_date);
            post.setPost_by(post_by);
            post.setPoster(dbdao.getUser(post_by).getUser_name());
            post.setPlaceid(placeid);
            post.setCoordinate(coordinate);
            dbdao.addPost(post);
            dbdao.addLog(post_by, "post", " Posted a new message.");
            request.getRequestDispatcher("/searchResult.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
