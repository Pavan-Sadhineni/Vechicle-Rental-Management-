import java.io.*;  
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;  
 
public class ReturnVech extends HttpServlet {  
public void service(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  
  
response.setContentType("text/html");  
PrintWriter out = response.getWriter();  


HttpSession session=request.getSession();
String email=(String)session.getAttribute("n");

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
	
	
	 
	
	
		PreparedStatement p1=connection.prepareStatement("INSERT INTO cars(id,car_name,c_img,Type,Mileage,seat_capacity,fuel_tank,car_num,CPerH) select id,car_name,c_img,Type,Mileage,seat_capacity,fuel_tank,car_num,CPerH from CurrentBookings where usermail=?");
		p1.setString(1, email);
		p1.execute();
		PreparedStatement p2=connection.prepareStatement("delete  from CurrentBookings where usermail=?");
		p2.setString(1, email);
		p2.execute();
    	RequestDispatcher rd=request.getRequestDispatcher("Cars.jsp");
        rd.include(request, response);
		System.out.println("sucessfull");
	
	
	

	
    connection.close();
} 
catch (Exception e) { 
    e.printStackTrace(); 
} 
out.close();  
}  

}  