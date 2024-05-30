<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.sql.*" %>
<%@include file="adminheader.jsp" %> 
<%@include file="style.jsp" %> 
<!DOCTYPE html>


<style>
    
    body {
            background-image: url('car.jpg');
            background-size: cover;
            background-repeat: no-repeat;
            color: white;
        }
        
         th.title {
            font-size: 24px; /* Adjust font size as needed */
            text-align: center; /* Center align the text */
            padding: 10px 0; /* Add padding for better spacing */
        }

</style>
<body>
<html>
    <br>
    <br>
    <br>
    <br>
    <% Class.forName("com.mysql.jdbc.Driver");
try
   {
    Connection con1 =DriverManager.getConnection("jdbc:mysql://localhost:3306/carrental","root","");
  Statement st=con1.createStatement();

    ResultSet resultset = st.executeQuery("select * from carreg where id="+ request.getParameter("select") +"") ;

    %>
    
    
      <% try
   {
if (request.getParameter("update")!=null)
    {


     Class.forName("com.mysql.jdbc.Driver");
    Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/carrental","root","");
    
    
    String a1=request.getParameter("id");
      String a2=request.getParameter("carname");
    String a3=request.getParameter("carnum");
    String a4=request.getParameter("carcap");
    String a5=request.getParameter("fuel");
    String a6=request.getParameter("rent");
   
       Statement st1=con.createStatement();
   // out.println(uid);
        int i=0;
      i= st1.executeUpdate("update  carreg set carname='"+ a2 +"', carnum='"+ a3 +"', carcap='" + a4 + "', fuel='" + a5 +"', rent='"+ a6 +"' where id="+ a1 +"");
     if (i==1)
   {
    
             
             out.println("<script>alert('Add Successfully');</script>");
   response.sendRedirect("viewcar.jsp");
  
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
    
    	
  <div align="center">
<form action="" name="register_form"  id="register_form"  method="post" >
	<% while(resultset.next()){ %>
	<table border="0" cellspacing="0"  class="displaycontent"  width="500" Height="300">
	<caption></caption><br>
        <br>
        <br>
       
		<th colspan="2" class="title">Update Car Details</th> <!-- Apply title class here -->
	<tr>
            <tr>
		<td class="col">Id</td>
		<td><input type="text" name="id" value="<%= resultset.getString(1) %>" readonly/></td>
	</tr>
	
<tr>
		<td class="col">Car name</td>
		<td><input type="text" name="carname" value="<%= resultset.getString(2) %>"/></td>
	</tr>
	<tr>
		<td class="col">Car number:</td>
		<td><input type="text" name="carnum" value="<%= resultset.getString(3) %>"/></td>
	</tr>
	<tr>
		<td class="col">Car capacity</td>
                <td><input type="text" name="carcap" value="<%= resultset.getString(4) %>"/> </td>
	</tr>
        <tr>
		<td class="col">Fuel</td>
                <td><input type="text" name="fuel"  value="<%= resultset.getString(5) %>" /> </td>
                
	</tr>
	<tr>
		<td class="col">Rent:</td>
                <td><input type="text" name="rent" value="<%= resultset.getString(6) %>"/></td>
	</tr>
	
	
	<tr>
		<td>&nbsp;</td>
		<td >
			<input type="submit" name="update" value="Update" />
		     	
		</td>
	</tr>
        
        <tr>
            <th colspan="2" >
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="viewcar.jsp">BACK</a>
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
<br><br>
<br><br><br>
<br>
<%@include file="footer.jsp" %>
</html>