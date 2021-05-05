

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.cj.jdbc.JdbcConnection;

/**
 * Servlet implementation class Updatecost
 */
public class Updatecost extends HttpServlet {

    protected void service(HttpServletRequest request,  
HttpServletResponse response) 
        throws ServletException, IOException 
    { 
        try { 
        	String i=request.getParameter("Id");
        	int k=Integer.parseInt(i);
        			String j=request.getParameter("cost");
        	String id = request.getParameter("userid");
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
        	String sql="update cars set CPerH=? where id=?";
        	PreparedStatement p=connection.prepareStatement("update cars set CPerH=? where id=?");
        	p.setString(1,j); 
        	p.setInt(2, k);
        	p.execute();
        	
            connection.close();
            RequestDispatcher rd=request.getRequestDispatcher("Availablev.jsp");
            rd.include(request, response);
        } 
        catch (Exception e) { 
            e.printStackTrace(); 
        } 
    }

}
