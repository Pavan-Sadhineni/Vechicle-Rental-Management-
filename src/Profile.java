import java.io.*;  
import java.sql.*;  
import javax.servlet.ServletException;
import javax.servlet.http.*;  
 
public class Profile extends HttpServlet {  
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
"select * from registeruser where EMAIL=?");  
  
ps.setString(1,n);  
ResultSet rs=ps.executeQuery();
String password=null;
while(rs.next()){
	  out.println(rs.getString(1) +" " 
	  + rs.getString(2)+"<br>");
	  } 


          
}catch (Exception e2) {System.out.println(e2);}  
          
out.close();  
}

private void alert(String string) {
	// TODO Auto-generated method stub
	
}  
  
}  