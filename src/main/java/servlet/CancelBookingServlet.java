package servlet;

import dao.DBDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "CancelBookingServlet")
public class CancelBookingServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int booking_id = Integer.valueOf(request.getParameter("bookingid"));
            int send_from = Integer.valueOf(request.getParameter("sendfrom"));
            int send_to = Integer.valueOf(request.getParameter("sendto"));
            System.out.println("booking_id: " + booking_id);
            DBDao dbdao = new DBDao();
            dbdao.declineBooking(booking_id);
            dbdao.sendNotification(send_to, send_from, " canceled your booking.");
            response.getWriter().print("success");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
