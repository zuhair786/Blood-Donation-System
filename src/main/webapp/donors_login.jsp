<%@ page import="java.sql.*" %>  
<%@page import="bean.*"%> 


<%
String email=request.getParameter("email");
String phone=request.getParameter("phone");
String password=request.getParameter("password");
ED ed=new ED();
DButil db=new DButil();
if(email.equals("admin123@gmail.com") && password.equals("admin001") && phone.equals("7000200120")){
	session.setAttribute("admin","77560");
    response.sendRedirect("admin_page.jsp?sessionID=77560");
}   
try
{
	Connection con=db.getConnection();
    PreparedStatement st=con.prepareStatement("select * from donors_login where email=?");
	st.setString(1,email);
	ResultSet rs=st.executeQuery();
	if(rs.next()){
	   String pwd1=rs.getString(3);
	   String pwd=ed.decrypt(pwd1);
	   String phn1=rs.getString(2);
	   String phn=ed.decrypt(phn1);
	   if(pwd.equals(password) && phn.equals(phone)){
		 session.setAttribute(email,phone);
		 con.close();
	     response.sendRedirect("donor_page.jsp?sessionID="+phone+"&email="+email);
		 }
	   else{
	     request.setAttribute("errorMsg","Phone Number and Password are wrong");
		 }
	}
	else{
	     request.setAttribute("errorMsg1","No Profile Found.Please Register First!!");
	}
    con.close();
}
catch(Exception e){
    e.printStackTrace();
	}
%>
<html>
<body>
					<p style="color:green;position:relative;top:10px;left:40%;">				   		
					<%
					if(request.getAttribute("errorMsg")!=null)
					{
						out.println(request.getAttribute("errorMsg")); 
					}
					%>
					</p>
					<p style="color:green;position:relative;top:10px;left:40%;">				   		
					<%
					if(request.getAttribute("errorMsg1")!=null)
					{
						out.println(request.getAttribute("errorMsg1")); 
					}
					%>
					</p>
					<a href="login.html">Back to Login</a>
</body>
</html>
	