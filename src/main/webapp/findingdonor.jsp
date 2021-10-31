<%@ page import="java.sql.*" %> 
<%@ page import="java.util.Date" %> 
<%@ page import="bean.*"%> 

<%
DButil db=new DButil();
java.util.Date date=new java.util.Date();
java.sql.Date date1=new java.sql.Date(date.getTime());
String name=request.getParameter("name");
String email=request.getParameter("email");
String hospital_name=request.getParameter("hospital");
String phone=request.getParameter("phone");
String street=request.getParameter("street");
String city=request.getParameter("city");
String district=request.getParameter("district");
String blood=request.getParameter("group");
String msg=request.getParameter("message");
int id=-1;
try
{
	Connection con=db.getConnection();
    PreparedStatement st=con.prepareStatement("insert into needed_people(name,email,phone_number,hospital_name,street,city,district,blood_group,message,date) values(?,?,?,?,?,?,?,?,?,?)");
	st.setString(1,name);
	st.setString(2,email);
	st.setString(3,phone);
	st.setString(4,hospital_name);
	st.setString(5,street);
	st.setString(6,city);
	st.setString(7,district);
	st.setString(8,blood);
	st.setString(9,msg);
	st.setDate(10,date1);
	int res=st.executeUpdate();
	if(res>0){
		request.setAttribute("successMsg","Application added to database");
		PreparedStatement st1=con.prepareStatement("SELECT max(id) FROM needed_people;");
		ResultSet rs=st1.executeQuery();
		if(rs.next()){
		   id=rs.getInt(1);
		}
	}
	else{
		request.setAttribute("errorMsg","Failed to Add Application to database");
	}
    con.close();	
}
catch(Exception e)
{
	out.println(e);
}
%>
<html>
<body>
                    <p style="color:green;position:relative;top:10px;left:40%;">				   		
					<%
					if(request.getAttribute("successMsg")!=null)
					{
						out.println(request.getAttribute("successMsg")); 
						if(blood.contains("+")){
							char ch =blood.charAt(0);
			                response.sendRedirect("gettingdonors.jsp?district="+district+"&blood_group="+ch+"%2B"+"&id="+id);
						}
						else{
			                response.sendRedirect("gettingdonors.jsp?district="+district+"&blood_group="+blood+"&id="+id);
						}
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
					
</body>
</html>