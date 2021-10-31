<%@ page import="java.sql.*" %>  
<%@ page import="java.io.*" %> 
<%@ page import="java.util.*" %>  
<%@page import="bean.*"%>
<%
String url1="updateServlet?email="+request.getParameter("email");
String url2="approveServlet?email="+request.getParameter("email");
String updateRes=request.getParameter("update");
int admin=0;
int donor=0;
String email=request.getParameter("email");
String sessionID=request.getParameter("sessionID");
if(session.getAttribute(email)==null) 
{
	if(!sessionID.equals("77560")){
       response.sendRedirect("login.html");
	}
}
else if(session.getAttribute(email)!=null){
	if(email==null || sessionID==null){
		response.sendRedirect("login.html");
	}
}
%>
<%
  if(updateRes!=null && updateRes.equals("no")){
       request.setAttribute("update-error","Not able to Update,Please fill correctly.");
  }
%>
<%
ED ed=new ED();
DButil db=new DButil();
OPT opt=new OPT();
String name="",phone="",phone1="",street="",city="",district="",bld_grp="",dob="",avai="",reason="",donor_desc="";
byte[ ] imgData = null,cover_imgData=null ;
FileOutputStream fos=null;
Blob image=null,cover_image=null;
String encode="",encode1="";
String imgSrc="",coverImgSrc="";
try
{
	Connection con=db.getConnection();
    PreparedStatement st=con.prepareStatement("select * from donors where email=?");
	st.setString(1,email);
	ResultSet rs=st.executeQuery();
	while(rs.next()){
		name=ed.decrypt(rs.getString(1));
	    phone=ed.decrypt(rs.getString(3));
	    phone1=ed.decrypt(rs.getString(4));
	    bld_grp=rs.getString(5);
	    street=ed.decrypt(rs.getString(6));
		city=ed.decrypt(rs.getString(7));
		district=ed.decrypt(rs.getString(8));
		dob=rs.getString(9);
		avai=rs.getString(10);
		reason=rs.getString(11);
		image=rs.getBlob(12);
		imgData = image.getBytes(1,(int)image.length());
        encode = Base64.getEncoder().encodeToString(imgData);
        imgSrc="data:image/jpeg;base64,"+encode;
		donor_desc=ed.decrypt(rs.getString(13));
		cover_image=rs.getBlob(14);
		cover_imgData = cover_image.getBytes(1,(int)cover_image.length());
	}
	con.close();
}
catch(Exception e){
	e.printStackTrace();
}
%>
<%
   long age=opt.getAge(dob);
   String freelance=avai;
   if(avai.equals("no")){
	   freelance+="("+reason+")";
   }
%>
<% 
  if(cover_imgData!=null){
	  encode1 = Base64.getEncoder().encodeToString(cover_imgData);
      coverImgSrc="data:image/jpeg;base64,"+encode1;
  }
%>
<%
ArrayList<DonorProgress> donorProgress=new ArrayList<DonorProgress>();
String encode2="",photosSrc="";
short j=1;
try
{
	Connection con=db.getConnection();
    PreparedStatement st=con.prepareStatement("select * from donor_donate_details where email=?");
	st.setString(1,email);
	ResultSet rs=st.executeQuery();
	while(rs.next()){
		image=rs.getBlob(10);
		if(image!=null){
		  imgData = image.getBytes(1,(int)image.length());
		  encode2 = Base64.getEncoder().encodeToString(imgData);
		  photosSrc="data:image/jpeg;base64,"+encode2;
		}
		DonorProgress d=new DonorProgress(rs.getString(3),ed.decrypt(rs.getString(4)),ed.decrypt(rs.getString(5)),ed.decrypt(rs.getString(6)),ed.decrypt(rs.getString(7)),rs.getString(8),ed.decrypt(rs.getString(9)),photosSrc);
		donorProgress.add(d);
		j++;
	}
	con.close();
}
catch(Exception e){
	e.printStackTrace();
}
%>
<%
  Collections.sort(donorProgress,new Comparator<DonorProgress>(){
	  @Override
	  public int compare(DonorProgress a,DonorProgress b){
		  String day1=a.getDay();
		  String day2=b.getDay();
		  return day1.compareTo(day2);
	  }
  });
%>
<%
  if(donorProgress.size()>=1){
	DonorProgress donorprogobj=donorProgress.get(donorProgress.size()-1);
	String last_donate_date=donorprogobj.getDay();
	try{
		Connection con=db.getConnection();
		PreparedStatement st=con.prepareStatement("update donors set last_donate_date=? where email=?"); 
		st.setString(1,last_donate_date);
		st.setString(2,email);
		st.executeUpdate();
		con.close();
	}catch(Exception e){}
  }
%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title><%=name%></title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/css/donors.css" rel="stylesheet">
  <link href="assets/css/modal.css" rel="stylesheet">
  <script>
  window.onload = function(){
	var modal1 = document.getElementById("myModal");
    var modal2 = document.getElementById("addBloodDonateEvent");
    var span1 = document.getElementsByClassName("close1")[0];
    var span2 = document.getElementsByClassName("close2")[0]; 	
    document.getElementById("edit").onclick=function(){
		modal1.style.display = "block";    }
	span1.onclick = function() {
        modal1.style.display = "none";
    }
    window.onclick = function(event) {
        if (event.target == modal1) {
         modal1.style.display = "none";
        }
	    if (event.target == modal2) {
         modal2.style.display = "none";
        }}
	document.getElementById("blooddonateedit").onclick=function(){
		modal2.style.display = "block";    }
	span2.onclick = function() {
        modal2.style.display = "none";
    }}
  </script>
</head>

<body>
  <header id="header">
    <div class="d-flex flex-column">

      <div class="profile">
        <img src=<%=imgSrc%> alt="Profile Image" class="img-fluid rounded-circle">
        <h1 class="text-light"><a href="index.html"><%=name%></a></h1>
      </div>

      <nav id="navbar" class="nav-menu navbar">
        <ul>
          <li><a href="#details" class="nav-link scrollto"><i class="bx bx-user"></i> <span>Details</span></a></li>
          <li><a href="#progress" class="nav-link scrollto"><i class="bx bx-file-blank"></i> <span>Progress</span></a></li>
          <li><a href="#photos" class="nav-link scrollto"><i class="bx bx-book-content"></i> <span>Photos</span></a></li>
		  <li><a href="donor_logout.jsp?sessionID=<%=sessionID%>&email=<%=email%>" class="nav-link scrollto"><i class="bx bx-book-content"></i> <span>LogOut</span></a></li>
        </ul>
      </nav>
    </div>
  </header>

  

  <main id="main">

    <section id="details" class="about">
      <div class="container">

        <div class="section-title row">
          <h2 class="col-md-9 col-sm-4">Details</h2>
          <a href="donor_logout.jsp?sessionID=<%=sessionID%>&email=<%=email%>" role="button" class="btn btn-primary btn-sm d-block d-md-block d-lg-none col-md-3 col-sm-2" style="font-size:2em;">LogOut</a>
        </div>
        <% if(request.getAttribute("update-error")!=null){%>
        <div class="row">
           <p style="color:red;"><%=request.getAttribute("update-error")%></p>
        </div>
        <% } %>
        <div class="row">
          <div class="col-lg-4" data-aos="fade-right">
            <img src=<%=coverImgSrc%> class="img-fluid" alt="Cover Image(Add through Edit)"/>
          </div>
          <div class="col-lg-8 pt-4 pt-lg-0 content" data-aos="fade-left">
            <h3><%=name%></h3>
            <div class="row">
              <div class="col-lg-6">
                <ul>
                  <li><i class="bi bi-chevron-right"></i> <strong>Birthday:</strong> <span><%=dob%></span></li>
                  <li><i class="bi bi-chevron-right"></i> <strong>Phone:</strong> <span><%=phone%></span></li>
                  <li><i class="bi bi-chevron-right"></i> <strong>Street:</strong> <span><%=street%></span></li>
				  <li><i class="bi bi-chevron-right"></i> <strong>City:</strong> <span><%=city%></span></li>
                </ul>
              </div>
              <div class="col-lg-6">
                <ul>
                  <li><i class="bi bi-chevron-right"></i> <strong>Age:</strong> <span><%=age%></span></li>
                  <li><i class="bi bi-chevron-right"></i> <strong>Blood Group:</strong> <span><%=bld_grp%></span></li>
				  <li><i class="bi bi-chevron-right"></i> <strong>District:</strong> <span><%=district%></span></li>
                  <li><i class="bi bi-chevron-right"></i> <strong>Freelance:</strong> <span><%=freelance%></span></li>
                </ul>
              </div>
            </div>
            <p>
              <%=donor_desc%>
            </p>
			<%
			  if(!sessionID.equals("77560")){
			%>
			  <button type="button" class="btn btn-sm btn-primary" id="edit">+Edit</button>
			<%
			  }
			%> 			
          </div>
        </div>
		</div>
	<div id="myModal" class="modal">
	<div class="modal-content">
	<div class="modal-header">
		<span class="close1">&times;</span>
		<h2>Edit Details:</h2>
	</div>
	<div class="modal-body">
	<form action=<%=url1%> method="POST" autocomplete="off" enctype="multipart/form-data">
						<div class="form-group row">
                             <div class="form-group col-sm-4">
                                     <label class="sr-only" for="phone">Phone Number</label>
                                     <input type="text" class="form-control form-control-sm mr-1" name="phone" id="phone"
									 required pattern="[789]{1}[0-9]{9}">
                             </div>
                             <div class="form-group col-sm-4">
                                 <label class="sr-only" for="street">Street</label>
                                 <input type="text" class="form-control form-control-sm mr-1" name="street" id="street">
                             </div>
                             <div class="form-group col-sm-4">
                                 <label class="sr-only" for="city">City</label>
                                 <input type="text" class="form-control form-control-sm mr-1" name="city" id="city" >
                             </div>
                        </div>
						<div class="form-group row">
						     <div class="form-group col-sm-4">
                                     <label class="sr-only" for="district">District</label>
                                     <input type="text" class="form-control form-control-sm mr-1" name="district" id="district" >
                             </div>
							 <div class="form-group col-sm-4">
                                 <label class="sr-only" for="exampleInputPassword3">Freelance</label><br>
                                 <input type="radio" name="avai"  value="yes">Yes
								 <input type="radio" name="avai"  value="no">No
                             </div>
							 <div class="form-group col-sm-4">
                                     <label class="sr-only" for="available">If No,tell when you are free:</label>
                                     <input type="text" class="form-control form-control-sm mr-1" name="available" id="available" >
                             </div>
                        </div>
						<div class="form-group row">
							 <div class="form-group col-sm-4">
                                     <label class="sr-only" for="desc">Add Description:</label>
                                     <textarea rows="1" cols="30" class="form-control form-control-sm mr-1" name="desc" id="desc"></textarea>
                             </div>
							 <div class="form-group col-sm-4">
                                     <label class="sr-only" for="cover">Cover Image:</label>
                                     <input type="file" class="form-control form-control-sm mr-1" name="cover" id="cover">
                             </div>
							 <div class="form-group col-sm-4">
									 <br>
                                     <input type="submit" value="Update" class="btn btn-sm btn-success"/>
                             </div>
                        </div>
	</form>
	</div>
	</div>
	</div>
    </section>

    <section id="progress" class="resume">
      <div class="container">

        <div class="section-title">
          <h2>Progress</h2>
          <p>This is a timeline of <%=name%> blood donated event.(Approved by Admin)</p>
		  <%
			  if(!sessionID.equals("77560")){
		  %>
			  <button type="button" class="btn btn-sm btn-primary" id="blooddonateedit">+Edit</button>
		  <%
			  }
		  %> 
        </div>

        <div class="row">
          <div class="col-lg-6" data-aos="fade-up">
		   <h3 class="resume-title">Summary</h3>
		  <% for(DonorProgress d:donorProgress){ %>
            <div class="resume-item">
              <h5><%=d.getDay()%></h5>
			  <h5><%=d.getTime()%></h5>
              <p><em><%=d.getDescription()%></em></p>
              <ul>
                <li>City:<%=d.getCity()%></li>
				<li>District:<%=d.getDistrict()%></li>
                <li>Blood Donate Amount:<%=d.getAmount()%></li>
                <li>Blood Donated Place:<%=d.getPlace()%></li>
              </ul>
            </div>
		  <%}%>
          </div>
          
        </div>

      </div>
	<div id="addBloodDonateEvent" class="modal">
	<div class="modal-content">
	<div class="modal-header">
		<span class="close2">&times;</span>
		<h2>Add Blood Donate Event:(From Oldest TO Newest)</h2>
	</div>
	<div class="modal-body">
	<form action=<%=url2%> method="POST" autocomplete="off" enctype="multipart/form-data">
						<div class="form-group row">
                             <div class="form-group col-sm-4">
                                 <label class="sr-only" for="place">Place:</label>
                                 <input type="text" class="form-control form-control-sm mr-1" id="place" name="place" required >
                             </div>
                             <div class="form-group col-sm-4">
                                 <label class="sr-only" for="givenCity">City:</label>
                                 <input type="text" class="form-control form-control-sm mr-1" name="givenCity" id="givenCity" required>
                             </div>
                             <div class=" form-group col-sm-4">
                                  <label class="sr-only" for="givenDist">District:</label>
                                 <input type="text" class="form-control form-control-sm mr-1" name="givenDist" id="givenDist" required >
                             </div>
                        </div>
						<div class="form-group row">
						     <div class="form-group col-sm-4">
                                  <label class="sr-only" for="givenAmount">Blood Donated Amount:</label>
                                 <input type="text" class="form-control form-control-sm mr-1" name="givenAmount" id="givenAmount" required >
                             </div>
							 <div class="form-group col-sm-4">
                                     <label class="sr-only" for="givenDesc">Add Description:</label>
                                     <textarea rows="1" cols="30" class="form-control form-control-sm mr-1" name="givenDesc" id="givenDesc"></textarea>
                             </div>
							 <div class="form-group col-sm-4">
                                     <label class="sr-only" for="time">Time:(Optional)</label>
									 <input type="text" class="form-control form-control-sm mr-1" name="time" id="time">
							 </div>
                        </div>
						<div class="form-group row">
						     <div class="form-group col-sm-4">
                                     <label class="sr-only" for="day">Day:</label>
									 <input type="date" class="form-control form-control-sm mr-1" name="day" >
							 </div>
						     <div class="form-group col-sm-4">
                                     <label class="sr-only" for="image1">Image</label>
                                     <input type="file" class="form-control form-control-sm mr-1" name="image1" id="image1" required>
                             </div>
						     <div class="form-group col-sm-4">
							 <br>
						     <input type="submit" value="Submit" class="btn btn-sm btn-info"/>
							 </div>
					    </div>
	</form>
	</div>
	</div>
	</div>
    </section>

    <section id="photos" class="portfolio section-bg">
      <div class="container">

        <div class="section-title">
          <h2>Photos</h2>
          <p>Description</p>
        </div>

        <div class="row portfolio-container" data-aos="fade-up" data-aos-delay="100">
		  <% for(DonorProgress d:donorProgress){
		         String photos=d.getImgSrc();%>
		  
          <div class="col-lg-4 col-md-6 portfolio-item filter-app">
            <div class="portfolio-wrap">
              <img src=<%=photos%> class="img-fluid" alt="Photos">
              <div class="portfolio-links">
                <a href="assets/img/portfolio/portfolio-1.jpg" class="portfolio-lightbox" title="App 1"><i class="bx bx-plus"></i></a>
                <a href="portfolio-details.html" title="More Details"><i class="bx bx-link"></i></a>
              </div>
            </div>
          </div>  
	      <%}%>

        </div>

      </div>
    </section>

</body>

</html>