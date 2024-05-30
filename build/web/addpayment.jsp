<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.sql.*" %>
<%@include file="adminheader.jsp" %> 
<%@include file="style.jsp" %> 
<!DOCTYPE html>

<style>
      .book-now-btn {
        background-color: #4CAF50;
        border: none;
        color: white;
        padding: 8px 12px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 14px;
        margin: 2px 2px;
        cursor: pointer;
        border-radius: 4px;
        
    }
      body {
            background-image: url('car.jpg');
            background-size: cover;
            background-repeat: no-repeat;
            color:white;
        }


</style>
<body>
<html>
    <br>
    
    <% Class.forName("com.mysql.jdbc.Driver");
try
   {
    Connection con1 =DriverManager.getConnection("jdbc:mysql://localhost:3306/carrental","root","");
  Statement st=con1.createStatement();

    ResultSet resultset = st.executeQuery("select * from book where bid="+ request.getParameter("select") +"") ;

    %>
    
    
      <% try
   {
if (request.getParameter("book")!=null)
    {


     Class.forName("com.mysql.jdbc.Driver");
    Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/carrental","root","");
    
    
    String a1=request.getParameter("bid");
    String a2=request.getParameter("usermail");
    String a3=request.getParameter("carname");
    String a4=request.getParameter("dat");
    String a5=request.getParameter("day");
    String a6=request.getParameter("tamt");
 
   
       Statement st1=con.createStatement();
   // out.println(uid);
        int i=0;
      i= st1.executeUpdate("update  book  set tamt='"+ a6 +"', sta='accepted' where bid='"+ a1 +"'");
     if (i==1)
   {
    
             
             out.println("<script>alert('Add Successfully');</script>");
   response.sendRedirect("userpayment.jsp");
  
   }
    
     else
         {
         out.println("<script>alert('Not Successful');</script>");
          }
 
    }
                    }
catch(Exception ex)
                       {
        out.println(ex);
               }
%>
    
<br>
<br>
<br>
<br>
<br>

  <div align="center">
<form action="" name="register_form"  id="register_form"  method="post" >
	<% while(resultset.next()){ %>
	<table border="0" cellspacing="0"  class="displaycontent"  width="500" Height="300">
	
      
    
	<tr>
		<th colspan="2">Payment DETAILS</th>
	<tr>
            <tr>
		<td class="col">Request id</td>
		<td><input type="text" name="bid" value="<%= resultset.getString(1) %>" readonly/></td>
	</tr>
        <tr>
		<td class="col">User mail</td>
		<td><input type="text" name="usermail" value="<%= resultset.getString(4) %>"readonly/></td>
	</tr>
        <tr>
		<td class="col">Car name</td>
		<td><input type="text" name="carname" value="<%= resultset.getString(5) %>"readonly/></td>
	</tr>
	
<tr>
		<td class="col">No.Of.Days</td>
		<td><input type="text" name="dat" value="<%= resultset.getString(7) %>" readonly/></td>
	</tr>
	<tr>
		<td class="col">Amount Per Day:</td>
		<td><input type="text" name="day" value="<%= resultset.getString(8) %>" readonly/></td>
	</tr>
	<tr>
		<td class="col">Total Amount:</td>
		<td><input type="text" name="tamt" value="" /></td>
	</tr>
        <td></td>
        <td class="book-now-btn"><input type="submit" name="book" value="Add Now"></a></td>
	

        
        <tr>
            <th colspan="2" >
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="viewcarr.jsp">BACK</a>
                </th>
        </tr>
	<br>
        <% } 
}
catch(Exception ex1)
                       {
        out.println(ex1);
               }
%>
	</table>

	</form>
</div>

</body>

<br>
<br>
<br>
<br><br>
<br>
<br>
<%@include file="footer.jsp" %>
</html>