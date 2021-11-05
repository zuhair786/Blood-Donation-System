import java.io.*;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import bean.*;


@WebServlet(name="uploadServlet",urlPatterns="/uploadServlet")
@MultipartConfig(maxFileSize = 16177215) 
public class FileUploadServlet extends HttpServlet {
	PrintWriter out;
    private static final long serialVersionUID = 1L;
	DButil db=new DButil();
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
		    response.setContentType("text/html;charset=UTF-8");
			out=response.getWriter();
			if(request.getParameter("send")!=null && request.getParameter("send").equals("yes")){
				request.setAttribute("successMsg","Application added to database.Password has been sent to Your email id.");
			}
			else if(request.getParameter("send")!=null && request.getParameter("send").equals("no")){
				String email=request.getParameter("email");
				try{
					Connection con=db.getConnection();
					PreparedStatement st=con.prepareStatement("delete from donors where email=?");
					st.setString(1,email);
					st.executeUpdate();
					st=con.prepareStatement("delete from donors_login where email=?");
					st.setString(1,email);
					st.executeUpdate();
					con.close();
					}catch(Exception e){}
				request.setAttribute("errorMsg1","Cannot Able to Send Email,Please Try Again!");
			}	
			out.println("<html>");
			out.println("<head><title>Upload Details</title></head>");
			out.println("<body>");
			out.println("<p style=\"color:green;position:relative;top:10px;left:40%;\">");
			if(request.getAttribute("successMsg")!=null){
			 out.println(request.getAttribute("successMsg"));
			}
			if(request.getAttribute("errorMsg1")!=null){
			 out.println(request.getAttribute("errorMsg1"));
			}
			out.println("</p>");
			out.println("<a href=\"register.html\">Back</a>");
			out.println("</body></html>");
	}
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
		    response.setContentType("text/html;charset=UTF-8");
			out=response.getWriter();
				int errorflag=0;
				String name=request.getParameter("name");
				String phone=request.getParameter("phone");
				String phone1=request.getParameter("phone1");
				String email=request.getParameter("email");
				String blood_group=request.getParameter("bld-grp");
				String street=request.getParameter("street");
				String city=request.getParameter("city");
				String district=request.getParameter("district");
				String dob=request.getParameter("dob");
				String available=request.getParameter("avai");
				String avaino=request.getParameter("avaino");
				Part part=request.getPart("image");
				String pwd="";
				OPT opt=new OPT();
				int age=opt.getAge(dob);
				if(age<18){
					request.setAttribute("errorMsg2","Not eligible to Donate Blood");
					errorflag=1;
				}
				else{
				try{
					Connection con=db.getConnection();
					PreparedStatement prestat1=con.prepareStatement("select email from donors");
					ResultSet rs=prestat1.executeQuery();
					while(rs.next()){
					if(email.equals(rs.getString(1))){
						request.setAttribute("errorMsg3","Email already registered.Try with other Email.");
						errorflag=1;
						}
					}
					con.close();
				}catch(Exception e){ out.println(e);}
				}
				if(errorflag==0){
					ED ed=new ED();
					String enname=ed.encrypt(name);
					String enphone=ed.encrypt(phone);
					String enphone1=ed.encrypt(phone1);
					String enstreet=ed.encrypt(street);
					String encity=ed.encrypt(city);
					String endistrict=ed.encrypt(district);
				try
				{
					Connection con=db.getConnection();
					PreparedStatement st=con.prepareStatement("insert into donors(name,email,phone_number,second_phone_number,blood_group,street,city,district,dob,anytime,when_free,img) values(?,?,?,?,?,?,?,?,?,?,?,?)");
					st.setString(1,enname);
					st.setString(2,email);
					st.setString(3,enphone);
					st.setString(4,enphone1);
					st.setString(5,blood_group);
					st.setString(6,enstreet);
					st.setString(7,encity);
					st.setString(8,endistrict);
					st.setString(9,dob);
					st.setString(10,available);
					st.setString(11,avaino);
					InputStream is=part.getInputStream();
					st.setBlob(12,is);
					int res=st.executeUpdate();
					if(res<=0){
						request.setAttribute("errorMsg4","Failed to Add Application to database");
					}	
					con.close();	
				}
				catch(Exception e)
				{
					out.println(e);
				}


				RandomPassWord rp=new RandomPassWord();
				pwd=rp.giveRandom();
				String enpassword=ed.encrypt(pwd);
				try{
					Connection con=db.getConnection();
					PreparedStatement st1=con.prepareStatement("insert into donors_login(email,phone,password) values(?,?,?)");
					st1.setString(1,email);
					st1.setString(2,enphone);
					st1.setString(3,enpassword);
					int res=st1.executeUpdate();
					if(res<=0){
						request.setAttribute("errorMsg5","Error Happen to Create Login.Try Again.");
						PreparedStatement st2=con.prepareStatement("delete from donors where email=?");
						st2.setString(1,email);
						st2.executeUpdate();
					}
					else{
						response.sendRedirect("mail1.jsp?email="+email+"&pwd="+pwd);	
					}
					con.close();
				}
				catch(Exception e){
					e.printStackTrace();
				}
				}
		out.println("<html>");
		out.println("<head><title>Upload Details</title></head>");
        out.println("<body>");
		out.println("<p style=\"color:green;position:relative;top:10px;left:40%;\">");
        if(request.getAttribute("successMsg")!=null){
			 out.println(request.getAttribute("successMsg"));
	    }
        if(request.getAttribute("errorMsg1")!=null){
			 out.println(request.getAttribute("errorMsg1"));
		}
		if(request.getAttribute("errorMsg2")!=null){
			 out.println(request.getAttribute("errorMsg2"));
		}
		if(request.getAttribute("errorMsg3")!=null){
			 out.println(request.getAttribute("errorMsg3"));
		}
		if(request.getAttribute("errorMsg4")!=null){
			 out.println(request.getAttribute("errorMsg4"));
		}
		if(request.getAttribute("errorMsg5")!=null){
			 out.println(request.getAttribute("errorMsg5"));
		}
		out.println("</p>");
		out.println("<a href=\"register.html\">Back</a>");
        out.println("</body></html>");
    }
}