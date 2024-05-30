<%@include file="header.jsp" %>
<%@include file="style.jsp" %>

 <style>
body {
  background-image: url('car.jpg');
  background-repeat: no-repeat;
  background-attachment: fixed;
  background-size: cover;
  color:white;
}
</style>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
   <form action="" name="login_form" id="login_form"  method="post" >
<table border="0" align="center" cellspacing="0"  class="displaycontent"  width="500" Height="300">
	
	<tr>
        <center><font color="white"> <h3> Admin Login</h3> </font></center>
	<tr>
	<tr>
        
		<td  class="col" >Username:</td>
		<td><input  type="text" name="uname"  value=""  class="required email" /></td>
	</tr>
	<tr>
		<td  class="col">Password:</td>
		<td><input type="password" name="password" value="" class="required"/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td >
			<input type="submit" name="login" value="Login" />
		     	<input type="Reset"  value="Reset" />
			
		</td>
	</tr>
	<tr><td colspan="2">&nbsp;</td></tr>
		</table>
   </form>

<%@ page import="java.io.*,java.sql.*" %>
<% 
if (request.getParameter("login")!=null)
    {
    String uid=request.getParameter("uname");
    String pwd=request.getParameter("password");
    
if (uid.equals("admin") && pwd.equals("admin") )
{
         response.sendRedirect("adminhome.jsp");

} 
else 
{
        
 out.println("<script>alert('invalid Login!');</script>");   
   
 }
}


%>

<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>

 

 <%@include file="footer.jsp" %>