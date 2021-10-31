<%@ page import="java.sql.*"%>
<%@ page import="bean.*"%>
<%
ED ed=new ED();
DButil db=new DButil();
short flag=0;
String email=request.getParameter("email");
String password=request.getParameter("password");
String conf_password=request.getParameter("conf_password");
if(email!=null && password!=null && conf_password!=null && conf_password.equals(password)){
	password=ed.encrypt(password);
	try{
		Connection con=db.getConnection();
		PreparedStatement st=con.prepareStatement("update donors_login set password=? where email=?");
		st.setString(1,password);
		st.setString(2,email);
		int res=st.executeUpdate();
		if(res>0){
			request.setAttribute("success-msg","Password changed successfully.Now Close this window and go to login page.");
		}
		else{
			request.setAttribute("error-msg","Please make account first!");
		}
		con.close();
	}
	catch(Exception e){
		request.setAttribute("exception-msg","Database down.Please try again later.");
	}
}
%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

   <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link href="assets/css/register/font-awesome.min.css" rel="stylesheet">
    <link href="assets/css/register/style.css" rel="stylesheet">

    <title>Login</title>
  </head>
  <body>
    <section class="form-07" id="login">
	 <form action="reset_password.jsp" method="POST" role="form" autocomplete="off">
      <div class="container">
        <div class="row">
                <div class="col-sm-4 offset-sm-4">
                  <div class="_pl_nb_df">
                    <div class="_bg_cs">
                      <h2>Reset Password</h2>
                    </div>
					<% if(request.getAttribute("success-msg")!=null){%>
					 <div class="form-group">
                       <%=request.getAttribute("success-msg")%>
                     </div>
					<%}%>
					<% if(request.getAttribute("error-msg")!=null){%>
					 <div class="form-group">
                       <%=request.getAttribute("error-msg")%>
                     </div>
					<%}%>
					<% if(request.getAttribute("exception-msg")!=null){%>
					 <div class="form-group">
                       <%=request.getAttribute("exception-msg")%>
                     </div>
					<%}%>
                    <div class="form-group">
                      <label>Email:</label>
                      <input type="text" name="email" class="form-control" placeholder="Enter Mail ID" required  pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2, 4}$">
                    </div>
					
					<div class="form-group">
					  <label>Password:</label>
                      <input type="password" name="password" class="form-control" placeholder="Enter Password"   required>
                    </div>
					
					<div class="form-group">
					  <label>Confirm Password:</label>
                      <input type="text" name="conf_password" class="form-control" placeholder="Confirm Password"   required>
                    </div>
					
					<div class="form-group">
					  <input type="submit" class="btn btn-primary btn-lg" value="Submit"/>
                    </div>
					
                  </div>
                </div>
          </div>
        </div>
	  </form>
    </section>
    </body>
	</html>