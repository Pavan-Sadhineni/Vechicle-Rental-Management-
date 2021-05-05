
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.util.Random;

/**
 * Servlet implementation class Otpverify
 */
public class Verify{
public void service(HttpServletRequest request, HttpServletResponse response)  
        throws ServletException, IOException {  
String s1=request.getParameter("first");
String s2=request.getParameter("second");
String s3=request.getParameter("third");
String s4=request.getParameter("fourth");
String s5=request.getParameter("fifth");
String s6=request.getParameter("sixth");
String s=s1+s2+s3+s4+s5+s6;
int t=Integer.parseInt(s);
HttpSession session=request.getSession();
int k=(int)session.getAttribute("otp");
if(k==t) {
response.sendRedirect("home2.html");
System.out.println("hello");
}
else {
response.sendRedirect("Cars.jsp");
System.out.println("11111");
}

}}

