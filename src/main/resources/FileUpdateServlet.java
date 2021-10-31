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


@WebServlet(name="updateServlet",urlPatterns="/updateServlet")
@MultipartConfig(maxFileSize = 16177215) 
public class FileUpdateServlet extends HttpServlet {
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
			String sessionID=(String)request.getSession(false).getAttribute(email);
			String phn=ed.encrypt(request.getParameter("phone"));
			String str=ed.encrypt(request.getParameter("street"));
			String city=ed.encrypt(request.getParameter("city"));
			String dist=ed.encrypt(request.getParameter("district"));
			String avail=request.getParameter("avai");
			String avail1=request.getParameter("available");
			StringBuffer desc=new StringBuffer(request.getParameter("desc"));
			String desc1=ed.encrypt(desc.toString());
			Part part=request.getPart("cover");
			OPT opt=new OPT();
			String query=opt.verifyDetails(phn,str,city,dist,avail,avail1,desc1,email);
			try
			{
				Connection con=db.getConnection();
				PreparedStatement st=null;
				
				if(part.getSize()>0){
					query+=",cover_img=? where email='"+email+"'";
					st=con.prepareStatement(query);
					InputStream is=part.getInputStream();
					st.setBlob(1,is);
				}
				else{
					query+=" where email='"+email+"'";
					st=con.prepareStatement(query);
				}
				int res1=st.executeUpdate();
				if(res1>0){
					response.sendRedirect("donor_page.jsp?sessionID="+sessionID+"&email="+email);
				}
				else{
					response.sendRedirect("donor_page.jsp?sessionID="+sessionID+"&email="+email+"&update=no");
				}
			}
			catch(Exception e){
				e.printStackTrace();
				response.sendRedirect("donor_page.jsp?sessionID="+sessionID+"&email="+email+"&update=no");
			}
	}
}