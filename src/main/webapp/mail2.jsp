<%@page import="java.sql.*"%>
<%@page import="bean.*"%>
<%@ page import="java.util.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*" %>

<%
DButil db=new DButil();
String id=request.getParameter("id");
String[] emails = request.getParameterValues("email");
String body="";
String district="";
String bld_grp="";
try{
   Connection con=db.getConnection();
   PreparedStatement st=con.prepareStatement("select * from needed_people where id=?");
   st.setString(1,id);
   ResultSet rs=st.executeQuery();
   while(rs.next()){
        body="Immediate blood donation needed.\nDetails of Needed People is send below:\nName: "+rs.getString("name")+"\nEmail ID: "+rs.getString("email")+"\nPhone Number: "+rs.getString("phone_number")+"\nHospital Name: "+rs.getString("hospital_name")+"\nStreet: "+rs.getString("street")+"\nCity: "+rs.getString("city")+"\nDistrict: "+rs.getString("district")+"\nBlood Group: "+rs.getString("blood_group")+"\nMessage: "+rs.getString("message");
        district=rs.getString("district");
        bld_grp=rs.getString("blood_group");
       }
   con.close();
   }catch(Exception e){
       response.sendRedirect("gettingdonors.jsp?district="+district+"&blood_group="+bld_grp+"&sendtodonors=no");
   }
 %> 
 <%
    final String to = "";
    final String from = "akzbloodforeveryone@gmail.com";
    final String subject="Blood Donation Alert!!!";
    final String pass = "FourMajPro1";
    String host = "smtp.gmail.com";
    Properties props = new Properties();
    props.put("mail.smtp.host", host);
    props.put("mail.transport.protocol", "smtp");
    props.put("mail.smtp.auth", "true");
    props.put("mail.smtp.starttls.enable", "true");
    props.put("mail.smtp.ssl.enable", "true");
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
        message.setSubject(subject);
        message.setText(body);
		InternetAddress[] recipientAddress = new InternetAddress[emails.length];
		int counter = 0;
		for (String email : emails) {
    		recipientAddress[counter] = new InternetAddress(email.trim());
    		counter++;
		}
		message.setRecipients(Message.RecipientType.TO, recipientAddress);
        Transport.send(message);
        if(bld_grp.contains("+")){
					char ch =bld_grp.charAt(0);
			        response.sendRedirect("gettingdonors.jsp?district="+district+"&blood_group="+ch+"%2B"+"&sendtodonors=yes");
		}
		else{
        response.sendRedirect("gettingdonors.jsp?district="+district+"&blood_group="+bld_grp+"&sendtodonors=yes");
        }

    } catch (MessagingException mex) {
		mex.printStackTrace();
        if(bld_grp.contains("+")){
					char ch =bld_grp.charAt(0);
			        response.sendRedirect("gettingdonors.jsp?district="+district+"&blood_group="+ch+"%2B"+"&sendtodonors=yes");
		}
		else{
        response.sendRedirect("gettingdonors.jsp?district="+district+"&blood_group="+bld_grp+"&sendtodonors=yes");
        }
    }

%>