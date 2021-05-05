<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.DriverManager"%>
		<%@page import="java.sql.ResultSet"%>
		<%@page import="java.sql.Statement"%>
		<%@page import="java.sql.Connection"%>
				<%@page import="java.sql.PreparedStatement"%>
				<%@page import="java.time.temporal.ChronoUnit"%>
				<%@page import="java.time.LocalDate"%>
                 <%@page import ="java.time.temporal.ChronoUnit"%>
                  <%@page import ="javax.servlet.http.Cookie"%>
                   <%@page import ="java.net.HttpCookie"%>
				
				
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="myscripts.js"></script>
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

background-image: url("s51.jfif");
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
  left: 0;
  
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
.space_lg
{
width:870px;
}
.img {
    float: left;
    width:  260px;
    height: 180px;
    background-size: cover;
}
fieldset {
  background-color: black;
  width:60%;
  align:center;
  border-radius: 20px;
  color:white;
  border: 1px solid rgb(255,232,57);
  
  margin:auto;
  
  
}


input {
  margin: 5px;
  background: rgba(255,255,255,0.4);
  border: none;
 
  border-radius: 20px;
  outline: none;
 
 
  color: white;
  -webkit-box-shadow: 0 2px 10px 1px rgba(0,0,0,0.5);
  box-shadow: 0 2px 10px 1px rgba(0,0,0,0.5);
}
.button3 {border-radius: 8px;
 background-color: red;
 float:right;}
 div.transbox {
  margin: 30px;
  background-color: #ffffff;
  border: 1px solid black;
  opacity: 0.8;
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
  <a href="Pro.jsp"><i class="fa fa-fw fa-user"></i>Profile</a>
  <a href="Aboutus.html">Aboutus</a>
  <a href="signout.jsp" onclick="window.location.reload();">Signout</a>
  
</div>
  
</div>

<!-- MAIN (Center website) -->
<div class="main">

<h1>Booking Details</h1>
<hr>

<!-- Portfolio Gallery Grid -->
<div class="row">
  
<%

HttpSession sesson=request.getSession();
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

	
	String but = null;
	Cookie[] cookies = request.getCookies();
	if(cookies !=null){
	for(Cookie cookie : cookies){
		if(cookie.getName().equals("but")) but = cookie.getValue();
	}
	}
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from cars where id=?";

sesson.setAttribute("id",Integer.parseInt(but));
PreparedStatement p=connection.prepareStatement("select * from cars where id=?");

p.setInt(1,Integer.parseInt(but));

resultSet = p.executeQuery();

String s=request.getParameter("pl");
String d=request.getParameter("dl");
String sd=request.getParameter("pd");
String ed=request.getParameter("dd");
LocalDate dateBefore = LocalDate.parse(sd);
LocalDate dateAfter = LocalDate.parse(ed);
sesson.setAttribute("Booking_date",request.getParameter("pd") );
sesson.setAttribute("Return_date",request.getParameter("dd") );
sesson.setAttribute("Source",request.getParameter("pl") );
sesson.setAttribute("Dest",request.getParameter("dl") );
	
//calculating number of days in between
long noOfDaysBetween = ChronoUnit.DAYS.between(dateBefore, dateAfter);
	String c=null;
	int x=0;
//displaying the number of days
System.out.println(noOfDaysBetween);
 

 
while(resultSet.next()){
	c=resultSet.getString("CPerH");
	x=Integer.parseInt(c);
	long v=x*noOfDaysBetween;
%>
 
 

 
 <h2>Conformation Details:</h2>

<table style="width:100%">
<tr>
    <th>Vechicle Registration Number :</th>
    <td><%=resultSet.getString("car_num") %></td>
  </tr>
  <tr>
    <th>Car Model:</th>
    <td><%=resultSet.getString("car_name") %></td>
  </tr>
  <tr>
    <th>Fuel Type:</th>
    <td><%=resultSet.getString("Type") %></td>
  </tr>
  <tr>
    <th>Seating Capacity:</th>
    <td><%=resultSet.getString("seat_capacity") %></td>
  </tr>
  <tr>
    <th>Mileage:</th>
    <td><%=resultSet.getString("Mileage") %></td>
  </tr>
  <tr>
    <th>Pickup Location:</th>
    <td><%=request.getParameter("pl")%></td>
  </tr>
  <tr>
    <th>Drop Off Location</th>
    <td><%=request.getParameter("dl")%></td>
  </tr>
  <tr>
    <th>Start Date:</th>
    <td><%=request.getParameter("pd")%></td>
  </tr>
  <tr>
    <th>End Date :</th>
    <td><%=request.getParameter("dd")%></td>
  </tr>
  
   <tr>
    <th>Total Number of days: </th>
    <td><%=noOfDaysBetween %>  Days</td>
  </tr>
   <tr>
    <th>Total Rent:</th>
    <td><%=v%> /-</td>
  </tr>
</table><br>

<button onclick="location.href = 'Bookdetails.jsp';" style="background-color: red;"  type="submit" class="button button8">&#10094Back</button> <div class="space_lg">&nbsp;</div>


<button  onclick="location.href = 'checkout.jsp';" class="button button8" style="float: right;" type="submit" >Proceed&#10095</button>
 
 <%
 sesson.setAttribute("Totaldays",noOfDaysBetween );
 sesson.setAttribute("car_num",resultSet.getString("car_num") );
 sesson.setAttribute("car_name",resultSet.getString("car_name"));
 sesson.setAttribute("Type",resultSet.getString("Type") );
 sesson.setAttribute("Mileage",resultSet.getString("Mileage") );
 sesson.setAttribute("seat_capacity",resultSet.getString("seat_capacity") );
 sesson.setAttribute("Total_cost",v );
 sesson.setAttribute("c_img",resultSet.getString("c_img") );
 sesson.setAttribute("CostPerhour",resultSet.getString("CPerH"));
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
$(function(){
    var dtToday = new Date();
    
    var month = dtToday.getMonth() + 1;
    var day = dtToday.getDate();
    var year = dtToday.getFullYear();
    if(month < 10)
        month = '0' + month.toString();
    if(day < 10)
        day = '0' + day.toString();
    
    var maxDate = year + '-' + month + '-' + day;

    // or instead:
    // var maxDate = dtToday.toISOString().substr(0, 10);

    alert(maxDate);
    $('#txtDate').attr('min', maxDate);
});

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

</script>

</body>
</html>
		