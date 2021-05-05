import java.io.*;  
import java.sql.*;  
import javax.servlet.ServletException;
import javax.servlet.http.*;  
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.*;
import javax.mail.event.*;
public class Register extends HttpServlet {  
public void service(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  
  
response.setContentType("text/html");  
PrintWriter out = response.getWriter();  
          
String n=request.getParameter("fname");  
String p=request.getParameter("lname");  
String e=request.getParameter("email");  
String c=request.getParameter("password");  
System.out.println(n);
System.out.println(p);
System.out.println(e);
System.out.println(c);

try{  
Class.forName("oracle.jdbc.driver.OracleDriver");  
Connection con=DriverManager.getConnection(  
"jdbc:oracle:thin:@localhost:1521:xe","system","manager");  
  
PreparedStatement ps=con.prepareStatement(  
"insert into registeruser values(?,?,?,?)");  
  
ps.setString(1,n);  
ps.setString(2,p);  
ps.setString(3,e);  
ps.setString(4,c);  
          
int i=ps.executeUpdate();  


if(i>0)  
{
	account.emsend(e);
response.sendRedirect("Signin.html");
 

}       
}catch (Exception e2) {System.out.println(e2);}  
          
out.close();  
}  

}  