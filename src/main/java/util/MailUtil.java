package util;

import com.sun.mail.util.MailSSLSocketFactory;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

public class MailUtil implements Runnable {
    private String email;
    private String code;

    public MailUtil(String email, String code) {
        this.email = email;
        this.code = code;
    }

    public void run() {
        String from = "leonewang12345@gmail.com";
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
                    return new PasswordAuthentication("leonewang12345@gmail.com", "comptest12");
                }
            });

            // 2. generate Message
            Message message = new MimeMessage(session);
            // 2.1 set sender
            message.setFrom(new InternetAddress(from));
            // 2.2 set receiver
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
            // 2.3 set subject
            message.setSubject("Account activation from GoodStay");
            // 2.4 set content
            String content = "<html><head></head><body><h1>Your account has been created in GoodStay. " +
                    "Please follow the link below to activate your account. </h1><h3>" +
                    "<a href='http://localhost:8080/ActiveServlet?code="
                    + code + "'>http://localhost:8080/ActiveServlet?code=" + code
                    + "</href></h3></body></html>";
            message.setContent(content, "text/html;charset=UTF-8");
            // 3. send the email
            Transport.send(message);
            System.out.println("send email success...");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
