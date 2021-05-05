import java.io.*;  
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;  
 
public class add_admin extends HttpServlet {  
public void service(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  
  
response.setContentType("text/html");  
PrintWriter out = response.getWriter();  
String f=request.getParameter("firstname");  
String l=request.getParameter("lastname");       
String e=request.getParameter("email");  
String p1=request.getParameter("psw1");  
String p2=request.getParameter("psw2");  

System.out.println(e);
System.out.println(p1);
System.out.println(p2);
HttpSession session=request.getSession();
String email=(String)session.getAttribute("Ad_email");

System.out.println(email);
try{  
Class.forName("oracle.jdbc.driver.OracleDriver");  
Connection con=DriverManager.getConnection(  
"jdbc:oracle:thin:@localhost:1521:xe","system","manager");  
 PreparedStatement p=con.prepareStatement("select password from admin where EMAIL=?") ; 
 p.setString(1,email);
 ResultSet rs=p.executeQuery();
 String password=null;
 while (rs.next()) {
     password=rs.getString(1);
    
 } 

if(p2.equals(password))
{
PreparedStatement ps=con.prepareStatement(  
"insert into admin values(?,?,?,?)");  
  
ps.setString(1,e);  
ps.setString(2,p1);  
ps.setString(3,f);  
ps.setString(4,l);  
  
          
ps.executeUpdate(); 
RequestDispatcher rd=request.getRequestDispatcher("add_admin.html");
rd.include(request, response);
out.print("<h1 align='center' style='color:green;'>Nem admin added Sucessfully !</h1>");
}      
else {
	RequestDispatcher rd=request.getRequestDispatcher("add_admin.html");
    rd.include(request, response);
	out.print("<h1 align='center' style='color:red;'>incorrect password</h1>");
}
}catch (Exception e2) {System.out.println(e2);}  
          
out.close();  
}  

}  