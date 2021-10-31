<%@ page import="java.util.*,javax.mail.*"%>

<%@ page import="javax.mail.internet.*" %>

<%
    String result;
    final String to = request.getParameter("email");
    final String password = request.getParameter("pwd");
    final String from = "youremailid";
    final String subject="Registration Completed!";
    final String messg="Dear Sir/Madam,\nThank You for registering in our application.\nCame forward as a blood donor is a great kind of you.\nFor login to your profile, your password is "+password+".\nClick here to go to Login Page: https://akzbloodforeveryone.herokuapp.com/login.html";
    final String pass = "password";
    String host = "smtp.gmail.com";
    Properties props = new Properties();
    props.put("mail.smtp.host", host);
    props.put("mail.transport.protocol", "smtp");
    props.put("mail.smtp.auth", "true");
    props.put("mail.smtp.starttls.enable", "true");
    props.put("mail.smtp.ssl.enable", true);
    props.put("mail.smtp.ssl.trust", "*");
    props.put("mail.port", "587");
    props.put("mail.user", from);
    props.put("mail.password", pass);
    Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {
        @Override
        protected PasswordAuthentication getPasswordAuthentication() {
            return new PasswordAuthentication(from, pass);
        }
    });
 

    try {
        MimeMessage message = new MimeMessage(mailSession);
        message.setFrom(new InternetAddress(from));
        message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));
        message.setSubject(subject);
        message.setText(messg);
        message.setSentDate(new Date());
        Transport.send(message);

        response.sendRedirect("uploadServlet?send=yes&email="+to);

    } catch (MessagingException mex) {

        mex.printStackTrace();

        response.sendRedirect("uploadServlet?send=no&email="+to);

    }

%>
