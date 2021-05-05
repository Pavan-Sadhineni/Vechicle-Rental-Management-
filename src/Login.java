import java.io.*;  
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;  
 
public class Login extends HttpServlet {  
public void service(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  
  
response.setContentType("text/html");  
PrintWriter out = response.getWriter();  
          
String n=request.getParameter("email");  
String p=request.getParameter("password");  
  System.out.println(n);        
try{  
Class.forName("oracle.jdbc.driver.OracleDriver");  
Connection con=DriverManager.getConnection(  
"jdbc:oracle:thin:@localhost:1521:xe","system","manager");  
  
PreparedStatement ps=con.prepareStatement(  
"select PASSWORD from registeruser where EMAIL=?");  
  
ps.setString(1,n);  
ResultSet rs=ps.executeQuery();
String password=null;
while (rs.next()) {
    password=rs.getString(1);
   
} 


if(p.equals(password)) 
{
	HttpSession session=request.getSession();
	session.setAttribute("n",n);
	response.sendRedirect("Cars.jsp");
	
}
else {
	RequestDispatcher rd=request.getRequestDispatcher("Signin.html");
     rd.include(request, response);
	out.print("<h1 align='center' style='color:blue;'>incorrect Eamil or password</h1>");
}  
          
}catch (Exception e2) {System.out.println(e2);}  
          
out.close();  
}

private void alert(String string) {
	// TODO Auto-generated method stub
	
}  
  
}  