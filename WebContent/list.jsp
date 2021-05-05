<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>PRODUCTS DETAILS</h1>
<p>
<%
                //Retrieve the id of the product selected by the user
                //the product id is sent via the URL as a parameter
                int ProductId = -1;
                String strProductId = request.getParameter("ProductId");
                if(strProductId != null) {
                    //Convert from string to int
                    ProductId = Integer.parseInt(strProductId);
                }
                 
                //Load the database driver
                Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","manager");
            
                //create an SQL statement
                PreparedStatement ps = con.prepareStatement("SELECT * FROM products WHERE ProductId=?");
                //set the ID to be the id above
                ps.setInt(1, ProductId);
                //Execute and retrieve our result
                ResultSet rs = ps.executeQuery();
            %>
</p>
<%
            //if there is a result, rs.next() will be true
            //else it will be false
            if(rs.next()) {
        %>
<fieldset>
<legend>Product Information</legend>
<table border="0">
    <tr>
        <td>
        <div style=""><img border="1"
            src="images/Beanie/<%=rs.getString("Image") %>" height="160" width="160" /></div>
        </td>
        <td>Product Name: <%=rs.getString("ProdName")+"\t" %>
 
        <div align="left">Product Color: <%=rs.getString("ProdColor")+"\t" %></div>
 
        <div align="left">Product Description: <%=rs.getString("ProdDesc")+"\t" %></div>
 
        <div align="left">Product Price: <%=String.format("$%.2f",rs.getDouble("UnitPrice"))+"\t" %></div>
 
        <div align="left">Quantity: <%=rs.getString("Quantity")+"\t" %></div>
         
         
 
        </td>
    </tr>
</table>
</fieldset>
 
<%
            }
            else {
                //if no record is found, simply display a no record message
        %>
No record found.
<%
            }
         %>
<p> </p>
 
 
</body>
</html>