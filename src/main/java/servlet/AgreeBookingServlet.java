package servlet;

import dao.DBDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "AgreeBookingServlet")
public class AgreeBookingServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Integer notice_id = Integer.valueOf(request.getParameter("noticeid"));
            Integer booking_id = Integer.valueOf(request.getParameter("bookingid"));
            DBDao dbdao = new DBDao();
            dbdao.markRead(notice_id);
            dbdao.agreeBooking(booking_id);
            int send_to = dbdao.getSendFrom(notice_id);
            int send_from = dbdao.getSendTo(notice_id);
            dbdao.sendNotification(send_to, send_from, " approved your booking.");
            System.out.println("notice_id: " + notice_id);
            System.out.println("booking_id: " + booking_id);
            response.getWriter().print("success");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
