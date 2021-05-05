import java.io.*;  
import java.sql.*;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;  
 
public class SaveDetails extends HttpServlet {  
public void service(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  
  
response.setContentType("text/html");  
PrintWriter out = response.getWriter();  


HttpSession session=request.getSession();
long hi=(long)session.getAttribute("Total_cost");
long hii=(long)session.getAttribute("Totaldays");
String car_num=(String)session.getAttribute("car_num");
String car_name=(String)session.getAttribute("car_name");
String Type=(String)session.getAttribute("Type");
String Mileage=(String)session.getAttribute("Mileage");
String seat_capacity=(String)session.getAttribute("seat_capacity");
String Total_cost=Long.toString(hi);
String Booking_date=(String)session.getAttribute("Booking_date");
String Return_date=(String)session.getAttribute("Return_date");
String Source=(String)session.getAttribute("Source");
String Dest=(String)session.getAttribute("Dest");
String Totaldays=Long.toString(hii);
String c_img=(String)session.getAttribute("c_img");
String email=(String)session.getAttribute("n");
String CperH=(String)session.getAttribute("CPerH");
String fuel_tank=(String)session.getAttribute("fuel_tank");




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
	String but = null;
	Cookie[] cookies = request.getCookies();
	if(cookies !=null){
	for(Cookie cookie : cookies){
		if(cookie.getName().equals("but")) but = cookie.getValue();
	}
	}
	connection = DriverManager.getConnection(connectionUrl+database, userid, password);
	statement=connection.createStatement();
	
	PreparedStatement p1=connection.prepareStatement("INSERT INTO CurrentBookings values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
	p1.setInt(1,Integer.parseInt(but));
	
	p1.setString(2, car_name);
	p1.setString(3, c_img);
	p1.setString(4, Mileage);
	p1.setString(5, Type);
	p1.setString(6, seat_capacity);
	p1.setString(7, car_num);
	p1.setString(8, email);
	p1.setString(9, Booking_date);
	p1.setString(10, Return_date);
	p1.setString(11, Source);
	p1.setString(12,Dest );
	p1.setString(13, Totaldays);
	p1.setString(14, fuel_tank);
	p1.setString(15,CperH );
	p1.setString(16, Total_cost);
	
	p1.execute();
	
		PreparedStatement p2=connection.prepareStatement("INSERT INTO AllBookings values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
		p2.setInt(1,Integer.parseInt(but));
		
		p2.setString(2, car_name);
		p2.setString(3, c_img);
		p2.setString(4, Mileage);
		p2.setString(5, Type);
		p2.setString(6, seat_capacity);
		p2.setString(7, Booking_date);
		p2.setString(8, Return_date);
		p2.setString(9, CperH);
		p2.setString(10,Totaldays );
		p2.setString(11, Total_cost);
		p2.setString(12, email);
		p2.setString(13,Source );
		p2.setString(14, Dest);
		p2.setString(15, car_num);
		p2.execute();
		PreparedStatement p3=connection.prepareStatement("delete from cars where id=?");
		p3.setInt(1,Integer.parseInt(but));
		p3.execute();
		Random rnd = new Random();
	    int number = rnd.nextInt(999999);
	    HttpSession s3=request.getSession();
	    s3.setAttribute("otp", number);
	    System.out.println(number);
    	RequestDispatcher rd=request.getRequestDispatcher("Confirm.html");
        rd.include(request, response);
		System.out.println("sucessfull");
	account s4=new account();
	s4.otpsend(email, number);
	
	
	

	
    connection.close();
} 
catch (Exception e) { 
    e.printStackTrace(); 
} 
out.close();  
}  

}  