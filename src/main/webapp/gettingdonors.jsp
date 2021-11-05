<%@ page import="java.sql.*" %> 
<%@ page import="java.util.*" %> 
<%@ page import="bean.*"%> 
<% 
			 String district=request.getParameter("district");
			 district=district.toLowerCase();
			 String bld_grp=request.getParameter("blood_group");
			 ED ed=new ED();
			 DButil db=new DButil();
			 OPT opt=new OPT();
			 OPT2 b=new OPT2();
             ArrayList<Donors> res=new ArrayList<Donors>();
			 try{
				Connection con=db.getConnection();
				PreparedStatement st=con.prepareStatement("select * from donors");
				ResultSet rs=st.executeQuery();
				while(rs.next()){
					String last_donate_date=rs.getString(15);
					if(b.isValidDonor(last_donate_date)==true){
						String donor_district=ed.decrypt(rs.getString(8)).toLowerCase();
						String donor_bld_grp=rs.getString(5);
						if(donor_district.equals(district) && donor_bld_grp.equals(bld_grp)){
							String age1=rs.getString(9);
							long age=opt.getAge(age1);
							String avail=rs.getString(10);
							if(avail.equals("yes")){
								Donors d=new Donors(ed.decrypt(rs.getString(1)),rs.getString(2),ed.decrypt(rs.getString(3)),ed.decrypt(rs.getString(4)),rs.getString(5),ed.decrypt(rs.getString(6)),ed.decrypt(rs.getString(7)),donor_district,age);
								res.add(d);
							}
							else{
								String time=rs.getString(11);
								String arr[]=time.split("-");
								String start=arr[0];
								String end=arr[1];
								if(b.isValid(start,end)==true){
									Donors d=new Donors(ed.decrypt(rs.getString(1)),rs.getString(2),ed.decrypt(rs.getString(3)),ed.decrypt(rs.getString(4)),rs.getString(5),ed.decrypt(rs.getString(6)),ed.decrypt(rs.getString(7)),donor_district,age);
									res.add(d);
								}
								}
							}
					}
				}
		        }catch(Exception e){
				    e.printStackTrace();
				}
%>
<%
              String sendToDonorRes=request.getParameter("sendtodonors");
			  if(sendToDonorRes==null){
				String id=request.getParameter("id");
				String que="";
				for(int i=0;i<res.size();i++){
					Donors d1=res.get(i);
					String email=d1.getEmail();
					que+="&email="+email;
				}
				response.sendRedirect("mail2.jsp?id="+id+que);
			  }
			  else if(sendToDonorRes.equals("no")){
			      request.setAttribute("sendNot","true");
			      }
%>

<!DOCTYPE html>
<html>
<head>
<title>Donor Details</title>
<link href="assets/img/favicon.png" rel="icon">
 <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">
<link href="assets/css/register/bootstrap.min.css" rel="stylesheet"></link>
<link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
<link href="assets/css/style.css" rel="stylesheet">
<link href="assets/css/output.css" rel="stylesheet">
</head>
<body>
<div id="topbar" class="d-flex align-items-center">
    <div class="container d-flex justify-content-between">
      <div class="contact-info d-flex align-items-center">
        <i class="bi bi-envelope"></i> <a href="mailto:contact@example.com">mohamedzuhair@student.tce.edu</a>
      </div>
      <div class="d-none d-lg-flex social-links align-items-center">
        <a href="https://facebook.com" class="twitter"><i class='bx bxl-facebook-circle'></i></a>
        <a href="https://twitter.com" class="facebook"><i class='bx bxl-twitter' ></i></a>
        <a href="https://instagram.com" class="instagram"><i class='bx bxl-instagram-alt' ></i></a>
        <a href="https://linkedin.com" class="linkedin"><i class="bx bxl-linkedin"></i></a>
      </div>
    </div>
</div>

<header id="header" >
    <div class="container d-flex align-items-center">

      <h1 class="logo me-auto"><a href="index.html">Blood Donation System</a></h1>

      <nav id="navbar" class="navbar order-last order-lg-0">
        <ul>
          <li><a class="nav-link  pull-right" href="index.jsp">Home</a></li>
		  <li><a class="nav-link " href="register.html">Register(Donor)</a></li>
		  <li><a class="nav-link  pull-right" href="login.html">Login</a></li>
        </ul>
      </nav>
    </div>
</header>
   <div class="container">
   <% if(request.getAttribute("sendNot")!=null){%>
      <div style="text-align:center;color:red;font-size:20px;"><p>Message not able to sent to donors.Please contact them by yourself immediately</p></div>
   <%}%>
   <%for(int i=0;i<res.size();i++){ 
           Donors d1=res.get(i);
           if(i%2==0){
   %>
           <div class="row">
   <%		}  %>
   		   <div class="col-lg-4 col-md-6">
  		   <div class="block">
  
 			 <div class="top">
      			<p><i class='bx bxs-user-pin'></i>
	  				&nbsp;&nbsp;<%=d1.getName()%>
      				&nbsp;&nbsp;<i class='bx bxs-user-pin'></i></p>
  			</div>
  
  <div class="bottom">
    <div class="style">Phone Number:<%=d1.getPhone1()%></div>
    <div class="style">Second Phone Number:<%=d1.getPhone2()%></div>
    <div class="style">Email ID:<%=d1.getEmail()%></div>
	<div class="style">Age:<%=d1.getAge()%></div>
    <div class="style">Street:<%=d1.getStreet()%></div>
    <div class="style">City:<%=d1.getCity()%></div>
    <div class="style">District:<%=d1.getDistrict()%></div>
  </div>
  
  </div>
  </div>  

   <%}%>
</div>
</div>

</body>
</html>
