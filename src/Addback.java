

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
import javax.servlet.http.HttpSession;

import com.mysql.cj.jdbc.JdbcConnection;

public class Addback extends HttpServlet {

    protected void service(HttpServletRequest request,  
HttpServletResponse response) 
        throws ServletException, IOException 
    { 
        try { 
        	String i=request.getParameter("V_id");
        	int k=Integer.parseInt(i);
        			String j=request.getParameter("psw");
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
        	HttpSession session=request.getSession();
        	String email=(String)session.getAttribute("Ad_email");
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

        	if(j.equals(password1)) 
        	{
        		PreparedStatement p1=connection.prepareStatement("INSERT INTO cars SELECT * FROM dcars where id=?");
        		p1.setInt(1, k);
        		p1.execute();
        		PreparedStatement p=connection.prepareStatement("delete from dcars where id=?"); 
            	p.setInt(1, k);
            	p.execute();
            	RequestDispatcher rd=request.getRequestDispatcher("DeletedV.jsp");
                rd.include(request, response);
        		
        	}
        	
        	

        	con.close();
            connection.close();
        } 
        catch (Exception e) { 
            e.printStackTrace(); 
        } 
    }

}
