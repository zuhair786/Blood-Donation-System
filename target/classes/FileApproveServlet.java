import java.io.*;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import bean.*;


@WebServlet(name="approveServlet",urlPatterns="/approveServlet")
@MultipartConfig(maxFileSize = 16177215) 
public class FileApproveServlet extends HttpServlet {
	PrintWriter out;
    private static final long serialVersionUID = 1L;
	DButil db=new DButil();
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
		doPost(request,response);
	}
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
		    response.setContentType("text/html;charset=UTF-8");
			out=response.getWriter();
			ED ed=new ED();
			DButil db=new DButil();
			String email=request.getParameter("email");
			String place=ed.encrypt(request.getParameter("place"));
			String city=ed.encrypt(request.getParameter("givenCity"));
			String dist=ed.encrypt(request.getParameter("givenDist"));
			String amt=ed.encrypt(request.getParameter("givenAmount"));
			StringBuffer desc=new StringBuffer(request.getParameter("givenDesc"));
			String desc1=ed.encrypt(desc.toString());
			String time=request.getParameter("time");
			String day=request.getParameter("day");
			Part part=request.getPart("image1");

			try
			{
				Connection con=db.getConnection();
				PreparedStatement st=null;
				st=con.prepareStatement("insert into donor_donate_details(email,day,description,city,district,amount,time,place,image) values(?,?,?,?,?,?,?,?,?)");
				st.setString(1,email);
				st.setString(2,day);
				st.setString(3,desc1);
				st.setString(4,city);
				st.setString(5,dist);
				st.setString(6,amt);
				st.setString(7,time);
				st.setString(8,place);
				InputStream is=part.getInputStream();
				st.setBlob(9,is);
				int res=st.executeUpdate();
	if(res>0){
	   String sessionID=(String)request.getSession(false).getAttribute(email);
	   response.sendRedirect("donor_page.jsp?sessionID="+sessionID+"&email="+email);
		}
			else{
				request.setAttribute("errorMsg","SomeThing Wrong.Please Try Again Later!!!");
		}
		}
		catch(Exception e){
			e.printStackTrace();
			request.setAttribute("errorMsg1",e.toString());
		}
		out.println("<html>");
		out.println("<head><title>Upload Details</title></head>");
        out.println("<body>");
		out.println("<p style=\"color:red;position:relative;top:10px;left:40%;\">");
        if(request.getAttribute("errorMsg")!=null){
			 out.println(request.getAttribute("errorMsg"));
	    }
		if(request.getAttribute("errorMsg1")!=null){
			 out.println(request.getAttribute("errorMsg1"));
	    }
		out.println("</p>");
		out.println("<a href=\"register.html\">Back</a>");
        out.println("</body></html>");
	}
	
}