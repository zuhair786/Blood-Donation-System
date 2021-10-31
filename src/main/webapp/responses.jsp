<%@ page import="java.sql.*" %> 
<%@ page import="bean.*"%>

<%
DButil db=new DButil();
String name=request.getParameter("name");
String email=request.getParameter("email");
String subject=request.getParameter("subject");
String message=request.getParameter("message");
try
{
	Connection con=db.getConnection();
    PreparedStatement st=con.prepareStatement("insert into responses(name,email,subject,message) values(?,?,?,?)");
	st.setString(1,name);
	st.setString(2,email);
	st.setString(3,subject);
	st.setString(4,message);
	int res=st.executeUpdate();
	if(res>0){
		request.setAttribute("successMsg","Response Taken Successfully!!!");
	}
	else{
		request.setAttribute("errorMsg","Failed to Take Response");
	}
	con.close();
}
catch(Exception e){
	    request.setAttribute("errorMsg","Failed to Load Page.Please try again later."); 
}
%>
<html>
<body>
                    <p style="color:green;position:relative;top:10px;left:40%;">				   		
					<%
					if(request.getAttribute("successMsg")!=null)
					{
						out.println(request.getAttribute("successMsg")); 
					}
					%>
					</p>
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
					if(request.getAttribute("exceptionMsg")!=null)
					{
						out.println(request.getAttribute("exceptionMsg")); 
					}
					%>
					</p>
					<%
					    response.sendRedirect("index.jsp");
						%>
</body>
</html>