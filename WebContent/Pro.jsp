<%@page import="java.sql.DriverManager"%>
		<%@page import="java.sql.ResultSet"%>
		<%@page import="java.sql.Statement"%>
		<%@page import="java.sql.Connection"%>
				<%@page import="java.sql.PreparedStatement"%>
		
		<%!
		String email;
		%>
<!doctype html>
                        <html>
                            <head>
                                <meta charset='utf-8'>
                                <meta name='viewport' content='width=device-width, initial-scale=1'>
                                <title>Cars4U</title>
                                <link href='https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css' rel='stylesheet'>
                                <link href='https://cdnjs.cloudflare.com/ajax/libs/MaterialDesign-Webfont/3.6.95/css/materialdesignicons.css' rel='stylesheet'>
                                <style>body {
    background-color: #f9f9fa
}

.padding {
    padding: 3rem !important
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
.user-card-full {
    overflow: hidden
}

.card {
    border-radius: 5px;
    -webkit-box-shadow: 0 1px 20px 0 rgba(69, 90, 100, 0.08);
    box-shadow: 10px 1px 20px 0 rgba(69, 90, 100, 0.08);
    border: none;
    margin-bottom: 30px
}

.m-r-0 {
    margin-right: 0px
}

.m-l-0 {
    margin-left: 0px
}

.user-card-full .user-profile {
    border-radius: 10px 0 0 5px
}

.bg-c-lite-green {
    background: -webkit-gradient(linear, left top, right top, from(#f29263), to(#ee5a6f));
    background: linear-gradient(to right, #ee5a6f, #f29263)
}

.user-profile {
    padding: 20px 0
}

.card-block {
    padding: 1.25rem
}

.m-b-25 {
    margin-bottom: 25px
}

.img-radius {
    border-radius: 5px
}

h6 {
    font-size: 14px
}

.card .card-block p {
    line-height: 25px
}

@media only screen and (min-width: 1400px) {
    p {
        font-size: 14px
    }
}

.card-block {
    padding: 1.25rem
}

.b-b-default {
    border-bottom: 1px solid #e0e0e0
}

.m-b-20 {
    margin-bottom: 20px
}

.p-b-5 {
    padding-bottom: 5px !important
}

.card .card-block p {
    line-height: 25px
}

.m-b-10 {
    margin-bottom: 10px
}

.text-muted {
    color: #919aa3 !important
}

.b-b-default {
    border-bottom: 1px solid #e0e0e0
}

.f-w-600 {
    font-weight: 600
}

.m-b-20 {
    margin-bottom: 20px
}

.m-t-40 {
    margin-top: 20px
}

.p-b-5 {
    padding-bottom: 5px !important
}

.m-b-10 {
    margin-bottom: 10px
}

.m-t-40 {
    margin-top: 20px
}

.user-card-full .social-link li {
    display: inline-block
}
.center {
  display: block;
  margin-left: 0px;
  margin-right: auto;
  width: 100%;
}

.user-card-full .social-link li a {
    font-size: 20px;
    margin: 0 10px 0 0;
    -webkit-transition: all 0.3s ease-in-out;
    transition: all 0.3s ease-in-out
}</style>
                                <script type='text/javascript' src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
                                <script type='text/javascript' src='https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.bundle.min.js'></script>
                                <script type='text/javascript'></script>
                                <script type="text/javascript">
                                window.addEventListener( "pageshow", function ( event ) {
                                	  var historyTraversal = event.persisted ||
                                	                         ( typeof window.performance != "undefined" &&
                                	                              window.performance.navigation.type === 2 );
                                	  if ( historyTraversal ) {
                                	    // Handle page restore.
                                	    window.location.reload();
                                	  }
                                	});</script>
                            </head>
                            <body oncontextmenu='return false' class='snippet-body'>
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
  <a href="Cars.jsp" ><i>Dashboard</i></a>
<div class="topnav-right">
 <a href="PastBookings.jsp">Past Bookings</a>
   <a href="CurrentBookings.jsp">Current Bookings</a>
 
  <a href="Pro.jsp"  style="background-color:steelblue"><i class="fa fa-fw fa-user"></i>Profile</a>
  <a href="Aboutus.html">Aboutus</a>
  <a href="signout.jsp" onload="window.location.reload();">Signout</a>
  
</div>
  
</div>
<%HttpSession se=request.getSession()
		;
		email=(String)se.getAttribute("n");
		if(email==null){
			response.sendRedirect("Signin.html");
		}
		
		%>
		
		
		<%
		try{
			Connection connection = null;
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","manager");
            
            PreparedStatement ps=con.prepareStatement(  
            "select * from registeruser where email=?");  
              
            ps.setString(1,email);
			ResultSet rs= ps.executeQuery();
					  
					
		while(rs.next()){
		%>
		
		
                            <div class="center" id="page-content" >
    <div class="padding">
        <div class="row container d-flex justify-content-center">
            <div class="col-xl-6 col-md-12">
                <div class="card user-card-full">
                    <div class="row m-l-0 m-r-0">
                        <div class="col-sm-4 bg-c-lite-green user-profile">
                            <div class="card-block text-center text-white">
                                <div class="m-b-25"> <img src="https://img.icons8.com/bubbles/100/000000/user.png" class="img-radius" alt="User-Profile-Image"> </div>
                                <h6 class="f-w-600"><%=rs.getString("first_name") %> <%=rs.getString("last_name") %></h6>
                                <p>Customer</p> <a href="EditUser.jsp"><i class=" mdi mdi-square-edit-outline feather icon-edit m-t-10 f-16"></i></a>
                            </div>
                        </div>
                        <div class="col-sm-8">
                            <div class="card-block">
                                <h6 class="m-b-20 p-b-5 b-b-default f-w-600">Personal Information</h6>
                                <div class="row">
                                    <div class="col-sm-6">
                                        <p class="m-b-10 f-w-600">Email</p>
                                        <h6 class="text-muted f-w-400"><%=rs.getString("email") %></h6>
                                    </div>
                                    <div class="col-sm-6">
                                        <p class="m-b-10 f-w-600">Phone</p>
                                        <h6 class="text-muted f-w-400">00000000</h6>
                                    </div>
                                </div>
                                <h6 class="m-b-20 m-t-40 p-b-5 b-b-default f-w-600">Details</h6>
                                <div class="row">
                                    <div class="col-sm-6">
                                        <p class="m-b-10 f-w-600">First Name</p>
                                        <h6 class="text-muted f-w-400"><%=rs.getString("first_name") %></h6>
                                    </div>
                                    <div class="col-sm-6">
                                        <p class="m-b-10 f-w-600">Last Name</p>
                                        <h6 class="text-muted f-w-400"><%=rs.getString("last_name") %></h6>
                                    </div>
                                </div>
								<br>
								<h6>CONTACT US</h6>
								<hr>
								
                                <ul class="social-link list-unstyled m-t-40 m-b-10">
                                    <li><a href="https:www.instagram.com" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="facebook" data-abc="true"><i class="mdi mdi-facebook feather icon-facebook facebook" aria-hidden="true"></i></a></li>
                                    <li><a href="https:www.instagram.com" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="twitter" data-abc="true"><i class="mdi mdi-twitter feather icon-twitter twitter" aria-hidden="true"></i></a></li>
                                    <li><a href="https:www.instagram.com" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="instagram" data-abc="true"><i class="mdi mdi-instagram feather icon-instagram instagram" aria-hidden="true"></i></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%
		}
		connection.close();
		} catch (Exception e) {
		e.printStackTrace();
		}
		%>
                            </body>
							<input type="file" name="resume">
                        </html>