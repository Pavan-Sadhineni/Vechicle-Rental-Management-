<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.DriverManager"%>
		<%@page import="java.sql.ResultSet"%>
		<%@page import="java.sql.Statement"%>
		<%@page import="java.sql.Connection"%>
				<%@page import="java.sql.PreparedStatement"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="myscripts.js"></script>
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
  font-size: 50px;
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
.header{

background-image: url('s51.jfif');
padding:20px;
text-align: center;


}

.topnav {

  overflow: hidden;
  background-color: #333;
  width:100%;
 position: -webkit-sticky; 
  position: sticky;
  top: 0;
  z-index: 9999;
}
.topnav a {
  float: left;
  display: block;
  color: #f2f2f2;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}
.topnav a:hover {
  background-color: #ddd;
  color: black;
}
.leftcolumn {   
  float: left;
  width: 75%;
}
.topnav-right {
  float: right;
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
.img {
    float: left;
    width:  260px;
    height: 180px;
    background-size: cover;
}

.dropdown {
  float: left;
  overflow: hidden;
}

.dropdown .dropbtn {
  cursor: pointer;
  font-size: 16px;  
  border: none;
  outline: none;
  color: white;
  padding: 14px 16px;
  background-color: inherit;
  font-family: inherit;
  margin: 0;
}

.dropdown:hover .dropbtn, .dropbtn:focus {
  background-color: red;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f9f9f9;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-content a {
  float: none;
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
  text-align: left;
}

.dropdown-content a:hover {
  background-color: #ddd;
}

.show {
  display: block;
}
</style>

</head>
<body>

<div
    class="p-5 text-center bg-image"
    style="
      background-image: url('https://img.philkotse.com/2018/08/21/3vWWA7rJ/nissancars-3-5b80.jpg');
      height: 200px;
    "
  >
    <div class="mask" style="background-color: rgba(0, 0, 0, 0.6)">
      <div class="d-flex justify-content-center align-items-center h-100">
        <div class="text-white">
          
          
        </div>
      </div>
    </div>
  </div>
<div class="topnav">
  <img align="left" height="50" src="s28.png"/>
  <a href="Cars.jsp"  style="background-color:steelblue"><i>Dashboard</i></a>
   
<div class="topnav-right">

   <a href="PastBookings.jsp">Past Bookings</a>
   <a href="CurrentBookings.jsp">Current Bookings</a>
  <a href="Pro.jsp"><i class="fa fa-fw fa-user"></i>Profile</a>
  <a href="Aboutus.html">Aboutus</a>
  <a href="signout.jsp" onclick="window.location.reload();">Signout</a>
  
</div>
  
</div>

<!-- MAIN (Center website) -->
<div class="main">

<h1>Cars4U</h1>
<hr>

<h2>List of Cars</h2>

<div id="myBtnContainer">
  <button class="btn active" onclick="filterSelection('all')"> Show all</button>
  
</div>

<!-- Portfolio Gallery Grid -->
<div class="row">
  
<%

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
%>
<% 
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from cars";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>

  <div class="column nature">
  
    <div class="content">
 <form action="Bookdetails.jsp" method="post">
    
<img class="img" src=<%=resultSet.getString("c_img") %>>
      
      <h4><%=resultSet.getString("car_name") %></h4>
      <p style="font-size:13px"><b>Fuel Type: </b><%=resultSet.getString("Type") %><b>&nbsp  Fuel Tank Capacity: </b><%=resultSet.getString("fuel_tank") %></p>
      <p style="font-size:13px"><b>Seating Capacity: </b><%=resultSet.getString("seat_capacity") %>&nbsp <b>Mileage: </b><%=resultSet.getString("Mileage") %></p>
<p style="font-size:13px"><b>Ratings: </b>
<span class="fa fa-star checked"></span>
<span class="fa fa-star checked"></span>
<span class="fa fa-star checked"></span>
<span class="fa fa-star-half-o" style="color:orange"></span>
<span class="fa fa-star"></span>
<button type="submit" class="btn1" id=<%=resultSet.getInt("id")%>  value=<%=resultSet.getInt("id") %> onclick="reply_click(this.id)"name="but"  style="float:right">Book</button></p>
 </form>
    </div>
  </div>
  
 
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
 
<!-- END GRID -->
</div>

<!-- END MAIN -->
</div>
<div class="footer">
  <div class="row">
  <div class="column" >
    <h2 style="text-align:left;">ABOUT US</h2>
    <ul style="text-align:left; align:left;">
  <a href="Aboutus.html"><li>About Us</li></a><br>
  <li>FAQ</li><br>
  <li>AdminLogin</li>
</ul>  
  </div>
  
  <div class="column1" >
    <h2 >SUBSCRIBE</h2><br>
    <input placeholder="Enter Email" type="email" id="email"   required> <br><br>
    <button type="button" onclick="alert('You Have Subscribed')" style="background-color: red;color:white;">Subscribe</button> <br>
    <p style="color:white;">We send great deals and latest auto news to our subscribed users every week</p> 
</div>
</div>
</div>

<script>
filterSelection("all")
function filterSelection(c) {
  var x, i;
  x = document.getElementsByClassName("column");
  if (c == "all") c = "";
  for (i = 0; i < x.length; i++) {
    w3RemoveClass(x[i], "show");
    if (x[i].className.indexOf(c) > -1) w3AddClass(x[i], "show");
  }
}



function w3AddClass(element, name) {
  var i, arr1, arr2;
  arr1 = element.className.split(" ");
  arr2 = name.split(" ");
  for (i = 0; i < arr2.length; i++) {
    if (arr1.indexOf(arr2[i]) == -1) {element.className += " " + arr2[i];}
  }
}

function w3RemoveClass(element, name) {
  var i, arr1, arr2;
  arr1 = element.className.split(" ");
  arr2 = name.split(" ");
  for (i = 0; i < arr2.length; i++) {
    while (arr1.indexOf(arr2[i]) > -1) {
      arr1.splice(arr1.indexOf(arr2[i]), 1);     
    }
  }
  element.className = arr1.join(" ");
}


// Add active class to the current button (highlight it)
var btnContainer = document.getElementById("myBtnContainer");
var btns = btnContainer.getElementsByClassName("btn");
for (var i = 0; i < btns.length; i++) {
  btns[i].addEventListener("click", function(){
    var current = document.getElementsByClassName("active");
    current[0].className = current[0].className.replace(" active", "");
    this.className += " active";
  });
}
function myFunction() {
	  document.getElementById("myDropdown").classList.toggle("show");
	}

	// Close the dropdown if the user clicks outside of it
	window.onclick = function(e) {
	  if (!e.target.matches('.dropbtn')) {
	  var myDropdown = document.getElementById("myDropdown");
	    if (myDropdown.classList.contains('show')) {
	      myDropdown.classList.remove('show');
	    }
	  }
	}
</script>

</body>
</html>
		