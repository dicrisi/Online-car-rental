<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.sql.*" %>
<%@include file="userheader.jsp" %> 
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

    ResultSet resultset = st.executeQuery("select * from carreg where id="+ request.getParameter("select") +"") ;

    %>
    
    
      <% try
   {
if (request.getParameter("book")!=null)
    {


     Class.forName("com.mysql.jdbc.Driver");
    Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/carrental","root","");
    
    
    String a1=request.getParameter("cid");
    String a2=request.getParameter("uid");
    String a3=request.getParameter("umail");
    String a4=request.getParameter("carname");
    String a5=request.getParameter("carnum");
    String a6=request.getParameter("carcap");
    String a7=request.getParameter("fuel");
    String a8=request.getParameter("rent");
    String a9=request.getParameter("dat");
    String a10=request.getParameter("da");
   
       Statement st1=con.createStatement();
   // out.println(uid);
        int i=0;
      i= st1.executeUpdate("insert into  book  values(null,'"+ a1 +"','"+ a2 +"', '"+ a3 +"', '" + a4 + "', '" + a9 +"', '"+ a10 +"', '"+ a8 +"','requested','nil')");
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
		<th colspan="2">BOOKING DETAILS</th>
	<tr>
            <tr>
		<td class="col">Car id</td>
		<td><input type="text" name="cid" value="<%= resultset.getString(1) %>" readonly/></td>
	</tr>
        <tr>
		<td class="col">User id</td>
		<td><input type="text" name="uid" value="<%= session.getAttribute("uid") %>"readonly/></td>
	</tr>
        <tr>
		<td class="col">Usermail</td>
		<td><input type="text" name="umail" value="<%= session.getAttribute("mail") %>"readonly/></td>
	</tr>
	
<tr>
		<td class="col">car name</td>
		<td><input type="text" name="carname" value="<%= resultset.getString(2) %>" readonly/></td>
	</tr>
	<tr>
		<td class="col">car number:</td>
		<td><input type="text" name="carnum" value="<%= resultset.getString(3) %>" readonly/></td>
	</tr>
	<tr>
		<td class="col">car capacity</td>
                <td><input type="text" name="carcap" value="<%= resultset.getString(4) %>" readonly/> </td>
	</tr>
        <tr>
		<td class="col">fuel</td>
                <td><input type="text" name="fuel"  value="<%= resultset.getString(5) %>" readonly /> </td>
                
	</tr>
	<tr>
		<td class="col">rent:</td>
                <td><input type="text" name="rent" id="rent" value="<%= resultset.getString(6) %>" readonly/></td>
	</tr>
        <tr>
		<td class="col">From Date:</td>
                <td><input type="date" name="dat" value="" required/></td>
	</tr>
        <tr>
		<td class="col">Days:</td>
                <td><input type="text" name="da" id="da" value="" required/></td>
	</tr>
        

        <td></td>
        <td class="book-now-btn"><input type="submit" name="book" value="Book Now"></a></td>
	

        
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
<%@include file="footer.jsp" %>
</html>