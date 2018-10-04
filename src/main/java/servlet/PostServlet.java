package servlet;

import dao.DBDao;
import model.Post;
import model.User;
import util.DetectMailUtil;
import util.FriendMailUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URISyntaxException;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@WebServlet(name = "PostServlet")
public class PostServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
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
            Integer photos = Integer.valueOf(request.getParameter("photos"));
            String description = request.getParameter("description");
            Integer price = Integer.valueOf(request.getParameter("price"));
            String alidadamatch = request.getParameter("alidadamatch");
            Timestamp start_date = Timestamp.valueOf(request.getParameter("start_date"));
            Timestamp end_date = Timestamp.valueOf(request.getParameter("end_date"));
            Integer post_by = Integer.valueOf(request.getParameter("id"));

            System.out.println("title: " + title);
            System.out.println("address: " + address);
            System.out.println("type: " + type);
            System.out.println("demands: " + demands);
            System.out.println("amenities: " + amenities);
            System.out.println("description: " + description);
            System.out.println("alidadamatch: " + alidadamatch);
            System.out.println("start_date: " + start_date);

            DBDao dbdao = new DBDao();
            Post post = new Post();
            post.setTitle(title);
            post.setAddress(address);
            post.setCity(city);
            post.setType(type);
            post.setDemands(demands);
            post.setAmenities(amenities);
            post.setPhotos(photos);
            post.setDescription(description);
            post.setPrice(price);
            post.setAlidadamatch(alidadamatch);
            post.setStart_date(start_date);
            post.setEnd_date(end_date);
            post.setPost_by(post_by);
            post.setPoster(dbdao.getUser(post_by).getUser_name());
            dbdao.addPost(post);
            dbdao.addLog(post_by, "post", " Posted a new message.");
            request.getRequestDispatcher("/wall.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
