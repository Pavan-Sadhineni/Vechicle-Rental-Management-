<%@page import="java.sql.DriverManager"%>
		<%@page import="java.sql.ResultSet"%>
		<%@page import="java.sql.Statement"%>
		<%@page import="java.sql.Connection"%>
				<%@page import="java.sql.PreparedStatement"%>
				
		
		<%!
		String email;
		%>
		<!DOCTYPE html>
		<html>
		<head>
		<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-black.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>

* {
  box-sizing: border-box;
}

body {
  background-color: #f1f1f1;
  font-family: Arial;
  margin:0;
}

/* Center website */
.main {
  max-width: 1000px;
  margin: auto;
}

h1 {
  font-size: 30px;
  word-break: break-all;
}

.row {
  margin: 10px -16px;
}

/* Add padding BETWEEN each column */
.row,
.row > .column {
  padding: 8px;
}

/* Create three equal columns that floats next to each other */
.column {
  float: left;
  width: 33.33%;
  display: none; /* Hide all elements by default */
}

/* Clear floats after rows */ 
.row:after {
  content: "";
  display: table;
  clear: both;
}

/* Content */
.content {
  background-color: white;
  padding: 10px;
}

/* The "show" class is added to the filtered elements */
.show {
  display: block;
}

/* Style the buttons */
.btn {
  border: none;
  outline: none;
  padding: 12px 16px;
  background-color: white;
  cursor: pointer;
}

.btn:hover {
  background-color: #ddd;
}

.btn.active {
  background-color: #666;
  color: white;
}
.checked {
  color: orange;
}
.button {
  background-color: #4CAF50; /* Green */
  border: none;
  color: white;
  padding: 5px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 2px 2px;
  cursor: pointer;
}
.button4 {border-radius: 10px;}
.topnav {
  overflow: hidden;
  background-color: #333;
}

.footer {
  padding: 20px;
  text-align: center;
  background: black;
  margin-top: 20px;
  color:white;
}
.column1 {
  float: left;
  width: 50%;
  padding: 10px;
  height: 175px;
}
.btn1 {
  background-color: red;
  border: none;
border-radius:100px;
  color: white;
  text-align: center;
  font-size: 16px;
  margin: 2px 3px;
  transition: 0.3s;
  
}

.btn1:hover {
  background-color: green;
  color: white;
}

.center {
  display: block;
  margin-left: auto;
  margin-right: auto;
  width: 15%;
}
.center1 {
 
  margin-left: auto;
  margin-right: auto;
  
}

table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 90%;
  align:center;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #dddddd;
}
#myInput {
  background-image: url('https://i.ytimg.com/vi/_NltVXqwGQw/maxresdefault.jpg'); /* Add a search icon to input */
  background-position: 10px 12px; /* Position the search icon */
  background-repeat: no-repeat; /* Do not repeat the icon image */
  width: 50%; /* Full-width */
  font-size: 16px; /* Increase font-size */
  padding: 12px 20px 12px 40px; /* Add some padding */
  border: 1px solid #ddd; /* Add a grey border */
  margin-bottom: 12px; /* Add some space below the input */
  
}
</style>


</head>
		<body>

<div class="w3-top">
 <div class="w3-bar w3-theme-d2 w3-left-align">
  <a class="w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-hover-white w3-theme-d2" href="javascript:void(0);" onclick="openNav()"><i class="fa fa-bars"></i></a>
  <a href="#" class="w3-bar-item w3-button w3-teal"><i class="fa fa-home w3-margin-right"></i>Logo</a>
  <a href="Addvechicle.html" class="w3-bar-item w3-button w3-hide-small w3-hover-white">Add Vechicle</a>
  <a href="add_admin.html" class="w3-bar-item w3-button w3-hide-small w3-hover-white">Add Admin</a>
  <a href="ADcurr.jsp" class="w3-bar-item w3-button w3-hide-small w3-hover-white">Rented Vechicles</a>
  <a href="Availablev.jsp" class="w3-bar-item w3-button w3-hide-small w3-hover-white">Available Vechicles</a>
    <div class="w3-dropdown-hover w3-hide-small">
    <button class="w3-button" title="Notifications">View <i class="fa fa-caret-down"></i></button>     
    <div class="w3-dropdown-content w3-card-4 w3-bar-block">
      <a href="viewusers.jsp" class="w3-bar-item w3-button">View Users</a>
      <a href="#" class="w3-bar-item w3-button">View Admins</a>
      <a href="DeletedV.jsp" class="w3-bar-item w3-button">Deleted Vechicles</a>
    </div>
  </div>
  <div class="w3-dropdown-hover w3-hide-small">
    <button class="w3-button" title="Notifications">Bookings <i class="fa fa-caret-down"></i></button>     
    <div class="w3-dropdown-content w3-card-4 w3-bar-block">
      <a href="ADcurr.jsp" class="w3-bar-item w3-button">Current Bookings</a>
      <a href="AllBookings.jsp" class="w3-bar-item w3-button">All Bookings</a>
     
    </div>
  </div>
  <a href="#" class="w3-bar-item w3-button w3-hide-small w3-right w3-hover-teal" title="Search"><i class="fa fa-search"></i></a>
 </div>

  <!-- Navbar on small screens -->
  <div id="navDemo" class="w3-bar-block w3-theme-d2 w3-hide w3-hide-large w3-hide-medium">
    <a href="#team" class="w3-bar-item w3-button">Team</a>
    <a href="#work" class="w3-bar-item w3-button">Work</a>
    <a href="#pricing" class="w3-bar-item w3-button">Price</a>
    <a href="#contact" class="w3-bar-item w3-button">Contact</a>
    <a href="#" class="w3-bar-item w3-button">Search</a>
  </div>
</div>

        
		<h1 style="color:blue;text-align:center;">Registered Users</h1>
		<label>Search User:</label>
		<input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search for user..">
		<table align="center" id="myTable" >
		<tr>
		<th><b>First Name</b></th>
		<th><b>Last Name</b></th>
		
		<th><b>Email</b></th>

		</tr>
		<%
		
		try{
			Connection connection = null;
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","manager");
            
            PreparedStatement ps=con.prepareStatement("select * from registeruser");  
			ResultSet rs= ps.executeQuery();
					  
					
		while(rs.next()){
		%>
		<tr>
		<td><%=rs.getString("first_name") %></td>
		<td><%=rs.getString("last_name") %></td>
		<td><%=rs.getString("email") %></td>
		</tr>
		<%
		}
		connection.close();
		} catch (Exception e) {
		e.printStackTrace();
		}
		%>
		</table>
		
		 
<script>
function myFunction() {
  // Declare variables
  var input, filter, table, tr, td, i, txtValue;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("myTable");
  tr = table.getElementsByTagName("tr");

  // Loop through all table rows, and hide those who don't match the search query
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[2];
    if (td) {
      txtValue = td.textContent || td.innerText;
      if (txtValue.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }
  }
}
</script>
		</body>
		
		</html>		