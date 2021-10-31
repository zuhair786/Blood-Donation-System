<% 
String sessionID=request.getParameter("sessionID");
String email=request.getParameter("email");
if(sessionID.equals("77560")){
  session.removeAttribute("admin");
}
else{
  session.removeAttribute(email);
}  
response.sendRedirect("index.jsp");
%>