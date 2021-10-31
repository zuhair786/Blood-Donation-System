<%@ page import="java.util.*,javax.mail.*"%>

<%@ page import="javax.mail.internet.*" %>

<%
    final String to = request.getParameter("forget-email");
    final String from = "youremailid";
    final String subject="AKZ- Password reset Request";
    final String messg="Dear "+to+",\nThe request has been received to reset your password.\nIf you did not make the request,just ignore this mail.\nOtherwise click on the link below to reset your password: https://akzbloodforeveryone.herokuapp.com/reset_password.jsp";
    final String pass = "password";
    String host = "smtp.gmail.com";
    Properties props = new Properties();
    props.put("mail.smtp.host", host);
    props.put("mail.transport.protocol", "smtp");
    props.put("mail.smtp.auth", "true");
    props.put("mail.smtp.starttls.enable", "true");
    props.put("mail.smtp.ssl.enable", "true");
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
        Message message = new MimeMessage(mailSession);
        message.setFrom(new InternetAddress(from));
        message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));
        message.setSubject(subject);
        message.setSentDate(new Date());
        message.setText(messg);
        Transport.send(message);

        response.sendRedirect("login.html?response=yes");

    } catch (MessagingException mex) {
		mex.printStackTrace();
        response.sendRedirect("login.html?response=no");

    }

%>
