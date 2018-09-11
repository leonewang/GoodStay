package util;

import com.sun.mail.util.MailSSLSocketFactory;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

public class FriendMailUtil implements Runnable {
    private String email;
    private String code;
    private String username;
    private Integer user_id;
    private Integer friend_id;

    public FriendMailUtil(String email, String code, String username, Integer user_id, Integer friend_id) {
        this.email = email;
        this.code = code;
        this.username = username;
        this.user_id = user_id;
        this.friend_id = friend_id;
    }

    public void run() {
        String from = "wangleone.me@gmail.com";
        String host = "smtp.gmail.com";

        Properties properties = System.getProperties();

        properties.setProperty("mail.smtp.host", host);
        properties.setProperty("mail.smtp.auth", "true");

        try {
            MailSSLSocketFactory sf = new MailSSLSocketFactory();
            sf.setTrustAllHosts(true);
            properties.put("mail.smtp.ssl.enable", "true");
            properties.put("mail.smtp.ssl.socketFactory", sf);


            // 1. get default Session object
            Session session = Session.getDefaultInstance(properties, new Authenticator() {
                public PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication("wangleone.me@gmail.com", "A13879888409");
                }
            });

            // 2. generate Message
            Message message = new MimeMessage(session);
            // 2.1 set sender
            message.setFrom(new InternetAddress(from));
            // 2.2 set receiver
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
            // 2.3 set subject
            message.setSubject("Friend Request from GoodStay by " + username);
            // 2.4 set content
            String content = "<html><head></head><body><h1>Your account has been created in GoodStay. " +
                    "Please follow the link below to accept the friend request. </h1><h3>" +
                    "<a href='http://localhost:8080/FriendRequestServlet?code="
                    + code + "&send_to=" + user_id + "&send_from=" + friend_id + "'>http://localhost:8080/FriendRequestServlet?code=" + code
                    + "&send_to=" + user_id + "&send_from=" + friend_id + "</href></h3></body></html>";
            message.setContent(content, "text/html;charset=UTF-8");
            // 3. send the email
            Transport.send(message);
            System.out.println("send email success...");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
