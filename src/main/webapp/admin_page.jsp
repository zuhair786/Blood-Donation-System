<%@ page import="java.sql.*" %>  
<%@ page import="java.io.*" %> 
<%@ page import="java.util.*" %>  
<%@page import="bean.*"%>
<%
if(session.getAttribute("admin")==null) 
{
	response.sendRedirect("login.html");
}
%>
<%
ED ed=new ED();
DButil db=new DButil();
ArrayList<String> names=new ArrayList<String>();
ArrayList<String> emails=new ArrayList<String>();
ArrayList<String> districts=new ArrayList<String>();
ArrayList<String> bld_grps=new ArrayList<String>();
try
{
	Connection con=db.getConnection();
    PreparedStatement st=con.prepareStatement("select name,email,district,blood_group from donors");
	ResultSet rs=st.executeQuery();
	while(rs.next()){
		names.add(ed.decrypt(rs.getString(1)));
		emails.add(rs.getString(2));
		districts.add(ed.decrypt(rs.getString(3)));
		bld_grps.add(rs.getString(4));
	}
	con.close();
}catch(Exception e){}
%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Blood Donation System</title>
  <meta content="" name="description">
  <meta content="" name="keywords">
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/css/style.css" rel="stylesheet">
</head>

<body>

<section id="faq" class="faq section-bg">
      <div class="container">

        <div class="section-title">
          <h2>Donors Profile List</h2>
        </div>

        <div class="faq-list">
          <ul>
		    <%for(int i=0;i<names.size();i++){%>
            <li>
			   <a data-bs-toggle="collapse" class="collapse" data-bs-target="#faq-list-1"><i class='bx bxs-user-rectangle bx-lg'></i>  <%=names.get(i)%><i class="bx bx-chevron-down icon-show"></i><i class="bx bx-chevron-up icon-close"></i></a>
              <div id="faq-list-1" class="collapse show" data-bs-parent=".faq-list">
                <p>
                  Name:<%=names.get(i)%>
                </p>
				<p>
                  Email:<%=emails.get(i)%>
                </p>
				<p>
                  District:<%=districts.get(i)%>
                </p>
				<p>
                  Blood Group:<%=bld_grps.get(i)%>
                </p>
				<p>
				<a href="donor_page.jsp?sessionID=77560&email=<%=emails.get(i)%>"><button class="btn btn-primary">View Profile</button></a>
				</p>
              </div>
            </li>
			<% } %>
		 </ul>
        </div>

      </div>
</section>  

</body>
</html>   
