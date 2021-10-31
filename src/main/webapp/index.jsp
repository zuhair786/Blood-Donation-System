<%@ page import="java.sql.*" %> 
<%@ page import="java.util.Date" %> 
<%@ page import="bean.*"%> 

<%
DButil db=new DButil();
String donor_count="",people_count="";
int count=0;
 try
{
	Connection con=db.getConnection();
    PreparedStatement st=con.prepareStatement("select * from donors");
	ResultSet rs=st.executeQuery();
	while(rs.next()){
		count++;
	}
	donor_count=Integer.toString(count);
	count=0;
	st=con.prepareStatement("select * from needed_people");
    rs=st.executeQuery();
	while(rs.next()){
		count++;
	}
	people_count=Integer.toString(count);
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
  <link href="webjars/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/css/style.css" rel="stylesheet">
</head>

<body>

  <div id="topbar" class="d-flex align-items-center fixed-top">
    <div class="container d-flex justify-content-between">
      <div class="contact-info d-flex align-items-center">
        <i class="bi bi-envelope"></i> <a href="mailto:contact@example.com">kishorem@student.tce.edu</a>
      </div>
      <div class="d-none d-lg-flex social-links align-items-center">
        <a href="https://twitter.com" class="twitter"><i class="bi bi-twitter"></i></a>
        <a href="https://facebook.com" class="facebook"><i class="bi bi-facebook"></i></a>
        <a href="https://instagram.com" class="instagram"><i class="bi bi-instagram"></i></a>
        <a href="https://linkedin.com" class="linkedin"><i class="bi bi-linkedin"></i></i></a>
      </div>
    </div>
  </div>

  <header id="header" class="fixed-top">
    <div class="container d-flex align-items-center">

      <h1 class="logo me-auto"><a href="index.html">Blood Donation System</a></h1>

     <nav id="navbar" class="navbar order-last order-lg-0">
				<ul class="mr-auto">
					<li><a class="nav-link scrollto active" href="#home">Home</a></li>
					<li><a class="nav-link scrollto" href="#about">About</a></li>
					<li><a class="nav-link scrollto" href="#services">Services</a></li>
					<li><a class="nav-link scrollto" href="#faq">FAQ</a></li>
					<li><a class="nav-link scrollto" href="register.html">Register(Donor)</a></li>
					<li><a class="nav-link scrollto" href="login.html">Login</a></li>
					<li><a class="nav-link scrollto" href="#contact">Contact</a></li>
				</ul>
		</nav>
		<div class="btn-group-vertical d-block d-md-block d-lg-none col-md-3">
		<button type="button" class="btn btn-info btn-sm"><a href="register.html">Register</a></button>
		<button type="button" class="btn btn-info btn-sm"><a href="login.html">Login</a></button>
	    </div>
	    <a href="#appointment" class="appointment-btn scrollto">Find Donors</a>
    </div>
  </header><!-- End Header -->

  <section id="home" class="d-flex align-items-center">
    <div class="container">
      <h1>Welcome to Blood Donation System</h1>
      <h2>Quicker and Faster to Get Needed Blood</h2>
      <a href="blog.html" class="btn-get-started scrollto">Get Started</a>
    </div>
  </section>

  <main id="main">
    <section id="why-us" class="why-us">
      <div class="container">

        <div class="row">
          <div class="col-lg-4 d-flex align-items-stretch">
            <div class="content">
              <h3>Why Blood Donation System?</h3>
              <p>
                 This webpage is focus on how to help people to get required blood at faster rate to save people from emergency.
              </p>
              <div class="text-center">
                <a href="https://www.mayoclinic.org/tests-procedures/blood-donation/about/pac-20385144" class="more-btn">Learn More <i class="bx bx-chevron-right"></i></a>
              </div>
            </div>
          </div>
          <div class="col-lg-8 d-flex align-items-stretch">
            <div class="icon-boxes d-flex flex-column justify-content-center">
              <div class="row">
                <div class="col-xl-4 d-flex align-items-stretch icon-box-hover">
                  <div class="icon-box mt-4 mt-xl-0">
                    <i class='bx bxs-donate-blood'></i>
                    <h4>Be a Donors</h4>
                    <p>Donating Blood not only saves life of a person but a family.</p>
                  </div>
                </div>
                <div class="col-xl-4 d-flex align-items-stretch icon-box-hover">
                  <div class="icon-box mt-4 mt-xl-0">
					<i class='bx bx-info-square' ></i>                    
					<h4>Finding Donors</h4>
                    <p>Based on informtion collected, we track donors corresponding to needed people location.</p>
                  </div>
                </div>
                <div class="col-xl-4 d-flex align-items-stretch icon-box-hover">
                  <div class="icon-box mt-4 mt-xl-0">
                    <i class='bx bxs-award' ></i>
                    <h4>Respect Donors</h4>
                    <p>We respect donors for their help and also provide privacy to their details.</p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

      </div>
    </section>

    <section id="about" class="about">
      <div class="container-fluid">

        <div class="row">

          <div class="col-xl-7 col-lg-6 icon-boxes d-flex flex-column align-items-stretch justify-content-center py-5 px-lg-5">
            <h3>Reason to Develop Blood Donation System(WebPage)?</h3>
            <p>This webpage was created as a project by us to solve problems in places where the need of required blood is complicated.It is like an extension to some rural areas to contact people and get blood at right time. </p>

            <div class="icon-box">
              <div class="icon"><i class='bx bxs-alarm-exclamation'></i></div>
              <h4 class="title">Importance of Donating Blood</h4>
              <p class="description">An adequate amount of blood is needed in all health care facilities to meet the urgent need for patients facing trauma and other lifesaving procedures, such as blood transfusions a which saves millions of lives each year. </p>
            </div>

            <div class="icon-box">
              <div class="icon"><i class='bx bxs-user-plus'></i></div>
              <h4 class="title">Benefits of Donors</h4>
              <p class="description">After each donation,new blood will created and it freshens the body.Also some governments honour the donors and give some gifts to encourage.</p>
            </div>

            <div class="icon-box">
              <div class="icon"><i class="bx bx-atom"></i></div>
              <h4 class="title">Encourage Others</h4>
              <p class="description">Make others to donate blood to reduce risks dramatically.</p>
            </div>

          </div>
		  <div class="col-xl-5 col-lg-6 video-box d-flex justify-content-center align-items-stretch position-relative">
            <a href="https://www.youtube.com/watch?v=7HXJyMjUBqI" class="play-btn mb-4"></a>
          </div>
        </div>
      </div>
    </section>

    <section id="counts" class="counts">
      <div class="container">

        <div class="row">

          <div class="col-lg-3 col-md-4">
            <div class="count-box">
			  <i class='bx bxs-user'></i>             
			  <span data-purecounter-start="0" data-purecounter-end=<%=donor_count%> data-purecounter-duration="1" class="purecounter"></span>
              <p>Donors Registered</p>
            </div>
          </div>

          <div class="col-lg-3 col-md-4 mt-5 mt-md-0">
            <div class="count-box">
              <i class='bx bxs-user-plus' ></i>
              <span data-purecounter-start="0" data-purecounter-end=<%=people_count%> data-purecounter-duration="1" class="purecounter"></span>
              <p>Needed People</p>
            </div>
          </div>

          <div class="col-lg-3 col-md-4 mt-5 mt-lg-0">
            <div class="count-box">
              <i class='bx bxs-bank' ></i>
              <span data-purecounter-start="0" data-purecounter-end="0" data-purecounter-duration="1" class="purecounter"></span>
              <p>Blood Bank</p>
            </div>
          </div>
		  
		   <div class="col-lg-3 col-md-4 mt-5 mt-lg-0">
            <div class="count-box">
              <i class='bx bx-bar-chart-alt-2' ></i>
              <span data-purecounter-start="0" data-purecounter-end="0" data-purecounter-duration="1" class="purecounter"></span>
              <p>Blood Donation Per Month</p>
            </div>
          </div>


        </div>

      </div>
    </section>

    <section id="services" class="services">
      <div class="container">

        <div class="section-title">
          <h2>Services</h2>
          <p>Below are the services we can provide to </p>
        </div>

        <div class="row">
          <div class="col-lg-4 col-md-6 d-flex align-items-stretch">
            <div class="icon-box">
              <div class="icon"><i class="fas fa-heartbeat"></i></div>
              <h4><a href="">Blood Donation</a></h4>
              <p>Donors are biggest support for our webpage.So we make donors to create account on our webpage to call them at emergency situation.</p>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4 mt-md-0">
            <div class="icon-box">
              <div class="icon"><i class="fas fa-pills"></i></div>
              <h4><a href="">Blood Bank</a></h4>
              <p>Instead of alerting donors at emergency period,we can also make donors to donate blood to bllod bank corresponds to their free time and working hours of bank.</p>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4 mt-lg-0">
            <div class="icon-box">
              <div class="icon"><i class="fas fa-hospital-user"></i></div>
              <h4><a href="">Health Check</a></h4>
              <p>Donors are helping unknown people lives.We offer some free health check up for them in some hospitals.</p>
            </div>
          </div>
        </div>

      </div>
    </section>

    <section id="appointment" class="appointment section-bg">
      <div class="container">

        <div class="section-title">
          <h2>Fill Details to Find Donor</h2>
          <p>Please give respond correcly to all fields.Based on given information, we can search donors for you.</p>
        </div>

        <form action="findingdonor.jsp" method="POST" role="form" class="php-email-form">
          <div class="row">
            <div class="col-md-4 form-group">
              <input type="text" name="name" class="form-control" id="name" placeholder="Your Name" required >
            </div>
            <div class="col-md-4 form-group mt-3 mt-md-0">
              <input type="text" class="form-control" name="hospital" id="hospital" placeholder="Enter hospital name" required>
            </div>
            <div class="col-md-4 form-group mt-3 mt-md-0">
              <input type="tel" class="form-control" name="phone" id="phone" placeholder="Your Phone Number" data-rule="minlen:4" pattern="[0-9]{10}">
            </div>
          </div>
          <div class="row">
            <div class="col-md-4 form-group mt-3">
              <input type="text" name="street" class="form-control" id="street" placeholder="Hospital residing Street Name">
            </div>
			<div class="col-md-4 form-group mt-3">
              <input type="text" name="city" class="form-control" id="city" placeholder="City">
            </div>
            <div class="col-md-4 form-group mt-3">
              <select name="group" id="group" class="form-select">
                <option value="">Blood Group</option>
                <option value="O+">O+</option>
                <option value="A+">A+</option>
                <option value="A-">A-</option>
				<option value="B+">B+</option>
                <option value="B-">B-</option>
              </select>
            </div>
          </div>
          <div class="row"> 
		    <div class="col-md-4 form-group mt-3">
              <input type="text" name="district" class="form-control" id="district" placeholder="District">
            </div>
			<div class="col-md-4 form-group mt-3">
              <input type="email" name="email" class="form-control" id="email" placeholder="Email">
            </div>
		  </div>
		  <div class="form-group mt-3"> 
            <textarea class="form-control" name="message" rows="5" id="message" placeholder="Message (Optional)"></textarea>
          </div>
          <div class="mb-3">
            <div class="loading">Loading</div>
            <div class="error-message"></div>
            <div class="sent-message">Your appointment request has been sent successfully. Thank you!</div>
          </div>
          <div class="text-center"><button type="submit">Send</button></div>
        </form>

      </div>
    </section>
	
    <section id="faq" class="faq section-bg">
      <div class="container">

        <div class="section-title">
          <h2>Frequently Asked Questions</h2>
        </div>

        <div class="faq-list">
          <ul>
            <li>
              <i class="bx bx-help-circle icon-help"></i> <a data-bs-toggle="collapse" class="collapse" data-bs-target="#faq-list-1">Will this website helps needed people in emergency situation?<i class="bx bx-chevron-down icon-show"></i><i class="bx bx-chevron-up icon-close"></i></a>
              <div id="faq-list-1" class="collapse show" data-bs-parent=".faq-list">
                <p>
                  Yes, it will help people who are in urgent need of blood by finding donors within the district where the needed people are present and send out details to them immediately.
                </p>
              </div>
            </li>

            <li>
              <i class="bx bx-help-circle icon-help"></i> <a data-bs-toggle="collapse" data-bs-target="#faq-list-2" class="collapsed">How many litres of blood a donor can donate? <i class="bx bx-chevron-down icon-show"></i><i class="bx bx-chevron-up icon-close"></i></a>
              <div id="faq-list-2" class="collapse" data-bs-parent=".faq-list">
                <p>
                  The average adult has 4 to 5 litres of blood. During a donation, only 350 to 450 ml of blood is drawn. About 8% to 12% of your blood volume (depending on your weight) will be taken during blood donation. The fluid (plasma) portion of your donated blood will be replaced in a few days.
                </p>
              </div>
            </li>

            <li>
              <i class="bx bx-help-circle icon-help"></i> <a data-bs-toggle="collapse" data-bs-target="#faq-list-3" class="collapsed">Can I donate blood after 2 months? <i class="bx bx-chevron-down icon-show"></i><i class="bx bx-chevron-up icon-close"></i></a>
              <div id="faq-list-3" class="collapse" data-bs-parent=".faq-list">
                <p>
                  The minimum interval between 2 donations is 12 weeks (3 months). This interval allows our body Val allows our body to restore it iron stock. Platelet (aphaeresis) donors may donate more frequently than - as often as once every two weeks and up to 24 times per year.
                </p>
              </div>
            </li>

            <li>
              <i class="bx bx-help-circle icon-help"></i> <a data-bs-toggle="collapse" data-bs-target="#faq-list-4" class="collapsed">How do you alert donors?<i class="bx bx-chevron-down icon-show"></i><i class="bx bx-chevron-up icon-close"></i></a>
              <div id="faq-list-4" class="collapse" data-bs-parent=".faq-list">
                <p>
                  Based on needed people location, we sort out donors and alert them using our technology and if they(donor) accept we will communicate (needed people and donor) them for further process.
                </p>
              </div>
            </li>

            <li>
              <i class="bx bx-help-circle icon-help"></i> <a data-bs-toggle="collapse" data-bs-target="#faq-list-5" class="collapsed">How do donors get free health check up? <i class="bx bx-chevron-down icon-show"></i><i class="bx bx-chevron-up icon-close"></i></a>
              <div id="faq-list-5" class="collapse" data-bs-parent=".faq-list">
                <p>
                  They can get free health check up by requesting in their account.So, we will send some code to donor to some hospitals nearer to them(hospitals with which we have contract).On showing the code, they evaluate and give free health check up. 
                </p>
              </div>
            </li>

          </ul>
        </div>

      </div>
    </section>     

    <section id="gallery" class="gallery">
      <div class="container">

        <div class="section-title">
          <h2>Gallery</h2>
          <p>Some of the pictures taken from internet regard to blood donating events.</p>
        </div>
      </div>

      <div class="container-fluid">
        <div class="row no-gutters">

          <div class="col-lg-3 col-md-4">
            <div class="gallery-item">
              <a href="assets/img/gallery/gallery-1.jpg" class="galelry-lightbox">
                <img src="assets/img/gallery/gallery-1.jpg" alt="" class="img-fluid">
              </a>
            </div>
          </div>

          <div class="col-lg-3 col-md-4">
            <div class="gallery-item">
              <a href="assets/img/gallery/gallery-2.jpg" class="galelry-lightbox">
                <img src="assets/img/gallery/gallery-2.jpg" alt="" class="img-fluid">
              </a>
            </div>
          </div>

          <div class="col-lg-3 col-md-4">
            <div class="gallery-item">
              <a href="assets/img/gallery/gallery-3.jpg" class="galelry-lightbox">
                <img src="assets/img/gallery/gallery-3.jpg" alt="" class="img-fluid">
              </a>
            </div>
          </div>

          <div class="col-lg-3 col-md-4">
            <div class="gallery-item">
              <a href="assets/img/gallery/gallery-4.jpg" class="galelry-lightbox">
                <img src="assets/img/gallery/gallery-4.jpg" alt="" class="img-fluid">
              </a>
            </div>
          </div>

          <div class="col-lg-3 col-md-4">
            <div class="gallery-item">
              <a href="assets/img/gallery/gallery-5.jpg" class="galelry-lightbox">
                <img src="assets/img/gallery/gallery-5.jpg" alt="" class="img-fluid">
              </a>
            </div>
          </div>

          <div class="col-lg-3 col-md-4">
            <div class="gallery-item">
              <a href="assets/img/gallery/gallery-6.jpg" class="galelry-lightbox">
                <img src="assets/img/gallery/gallery-6.jpg" alt="" class="img-fluid">
              </a>
            </div>
          </div>

          <div class="col-lg-3 col-md-4">
            <div class="gallery-item">
              <a href="assets/img/gallery/gallery-7.jpg" class="galelry-lightbox">
                <img src="assets/img/gallery/gallery-7.jpg" alt="" class="img-fluid">
              </a>
            </div>
          </div>

          <div class="col-lg-3 col-md-4">
            <div class="gallery-item">
              <a href="assets/img/gallery/gallery-8.jpg" class="galelry-lightbox">
                <img src="assets/img/gallery/gallery-8.jpg" alt="" class="img-fluid">
              </a>
            </div>
          </div>

        </div>

      </div>
    </section>
    <section id="contact" class="contact">
      <div class="container">

        <div class="section-title">
          <h2>Contact</h2>
          <p>Below are the information regard to our location and contact.</p>
        </div>
      </div>

      <div>
		<iframe style="border:0; width: 100%; height: 350px;" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3930.6209038198144!2d78.07936421394443!3d9.882137377765993!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3b00c58f98cfb84d%3A0x29f51efea3e84bf2!2sThiagarajar%20College%20of%20Engineering!5e0!3m2!1sen!2sin!4v1631102355197!5m2!1sen!2sin" frameborder="0" allowfullscreen></iframe>
      </div>

      <div class="container">
        <div class="row mt-5">

          <div class="col-lg-4">
		    <div class="info">
             <p>Make Your <br>Response Here<i class='bx bxs-right-arrow-circle' ></i></p>
			 </div>
          </div>

          <div class="col-lg-8 mt-5 mt-lg-0">

            <form action="http://localhost:9999/Blood Donation System/responses.jsp" method="POST" role="form" class="php-email-form">
              <div class="row">
                <div class="col-md-6 form-group">
                  <input type="text" name="name" class="form-control" id="name" placeholder="Your Name" required>
                </div>
                <div class="col-md-6 form-group mt-3 mt-md-0">
                  <input type="email" class="form-control" name="email" id="email" placeholder="Your Email" required>
                </div>
              </div>
              <div class="form-group mt-3">
                <input type="text" class="form-control" name="subject" id="subject" placeholder="Subject" required>
              </div>
              <div class="form-group mt-3">
                <textarea class="form-control" name="message" rows="5" placeholder="Message" required></textarea>
              </div>
              <div class="my-3">
                <div class="loading">Loading</div>
                <div class="error-message"></div>
                <div class="sent-message">Your message has been sent. Thank you!</div>
              </div>
              <div class="text-center"><button type="submit">Send Message</button></div>
            </form>

          </div>

        </div>

      </div>
    </section>

  </main>

  <footer id="footer">

    <div class="footer-top">
      <div class="container">
        <div class="row">

          <div class="col-lg-3 col-md-6 footer-contact">
            <h3>Blood Donation System</h3>
            <p>
              Thiagarajar College <br>
              of Engineering<br>
              Madurai. <br><br>
              <strong>Email:</strong> kishorem@student.tce.edu<br>
            </p>
          </div>

          <div class="col-lg-2 col-md-6 footer-links">
            <h4>Useful Links</h4>
            <ul>
              <li><i class="bx bx-chevron-right"></i> <a href="#home">Home</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#about">About us</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#services">Services</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="terms.html">Terms of service</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="terms.html">Privacy policy</a></li>
            </ul>
          </div>

          <div class="col-lg-3 col-md-6 footer-links">
            <h4>Our Services</h4>
            <ul>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Web Design</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Web Development</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Product Management</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Programming</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Graphic Design</a></li>
            </ul>
          </div>

        </div>
      </div>
    </div>

    <div class="container d-md-flex py-4">

      <div class="me-md-auto text-center text-md-start">
        <div class="copyright">
          &copy; Copyright <strong><span>2021</span></strong>. All Rights Reserved
        </div>
      </div>
      <div class="social-links text-center text-md-right pt-3 pt-md-0">
        <a href="https://twitter.com" class="twitter"><i class="bx bxl-twitter"></i></a>
        <a href="https://facebook.com" class="facebook"><i class="bx bxl-facebook"></i></a>
        <a href="https://instagram.com" class="instagram"><i class="bx bxl-instagram"></i></a>
      </div>
    </div>
  </footer>

  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/purecounter/purecounter.js"></script>

  <script src="assets/js/main.js"></script>

</body>

</html>