import java.io.*;  
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;  
 
public class add_vech extends HttpServlet {  
public void service(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  
  
response.setContentType("text/html");  
PrintWriter out = response.getWriter();  
String v=request.getParameter("vid"); 
int k=Integer.parseInt(v);

String m=request.getParameter("mo");       
String i=request.getParameter("imu");  
String t=request.getParameter("ty");  
String mi=request.getParameter("mileage");  
String s=request.getParameter("sc");       
String f=request.getParameter("fc");  
String vr=request.getParameter("vr");  
String vc=request.getParameter("vc");  
String p2=request.getParameter("psw2");  
System.out.println(k+m+i+t+mi+s+f+vr+vc+p2);

System.out.println(p2);
HttpSession session=request.getSession();
String email=(String)session.getAttribute("Ad_email");

System.out.println(email);
try{  
	String driver = "com.mysql.jdbc.Driver";
	String connectionUrl = "jdbc:mysql://localhost:3306/";
	String database = "cars4u";
	String userid = "root";
	String password = "190031435@s24";
	try {
	Class.forName(driver);
	} catch (ClassNotFoundException e) {
	e.printStackTrace();
	}
	Connection connection = null;
	Statement statement = null;
	ResultSet resultSet = null;

	connection = DriverManager.getConnection(connectionUrl+database, userid, password);
	statement=connection.createStatement();
	
	Class.forName("oracle.jdbc.driver.OracleDriver");  
	Connection con=DriverManager.getConnection(  
	"jdbc:oracle:thin:@localhost:1521:xe","system","manager");  
	  
	PreparedStatement ps=con.prepareStatement(  
	"select PASSWORD from admin where EMAIL=?");  
	 
	ps.setString(1,email);  
	ResultSet rs=ps.executeQuery();
	String password1=null;
	while (rs.next()) {
	    password1=rs.getString(1);
	 
	} 
	System.out.println(password1);

	if(p2.equals(password1)) 
	{
		PreparedStatement p1=connection.prepareStatement("INSERT INTO cars values(?,?,?,?,?,?,?,?,?)");
		p1.setInt(1, k);
		
		p1.setString(2, m);
		p1.setString(3, i);
		p1.setString(4, t);
		p1.setString(5, mi);
		p1.setString(6, s);
		p1.setString(7, f);
		p1.setString(8, vr);
		p1.setString(9, vc);
		p1.execute();
		
    	RequestDispatcher rd=request.getRequestDispatcher("Addvechicle.html");
        rd.include(request, response);
		System.out.println("sucessfull");
	}
	else {
		System.out.println("some thing went wrong");
	}
	
	

	con.close();
    connection.close();
} 
catch (Exception e) { 
    e.printStackTrace(); 
} 
out.close();  
}  

}  