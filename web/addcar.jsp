<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.sql.*, javax.servlet.http.*" %>
<%@include file="adminheader.jsp" %>
<%@include file="style.jsp" %>

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
<%
try {
    if (request.getParameter("add") != null) {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/carrental","root","");
        
        String a2 = request.getParameter("carname");
        String a3 = request.getParameter("carnum");
        String a4 = request.getParameter("carcap");
        String a5 = request.getParameter("fuel");
        String a6 = request.getParameter("rent"); // new parameter for rent
        
        Statement st = con.createStatement();
        int i = st.executeUpdate("insert into carreg values(null,'" + a2 + "','" + a3 + "','" + a4 + "','" + a5 + "','" + a6 + "')"); // modified query
        
        if (i == 1) {
            out.println("<script>alert('Add Successfully');</script>");
        } else {
            out.println("<script>alert('Not Successful');</script>");
        }
    }
} catch(Exception ex) {
    out.println(ex);
}
%>
<div align="center">
    <form action="" name="register_form"  id="register_form"  method="post">
        <table border="0" cellspacing="0" class="displaycontent" width="500" Height="300">
            <caption></caption><br>
            <br><br>
<br><br>
<br><br>
            <tr>
            <center>    <th colspan="2">ADD NEW CAR DETAILS</th></center>
            </tr>
           
       <tr>
		<td class="col">Car name:<font></td>
		<td><input type="text" name="carname" value="" required/></td>
	</tr>
	<tr>
		<td class="col">Car Number:</td>
                <td><input type="text" name="carnum" required/> </td>
	</tr>
        <tr>
		<td class="col"> Car Capacity:</td>
                <td><input type="text" name="carcap"  value="" required/> </td>
                
	</tr>
	<tr>
		<td class="col">Fuel:</td>
                <td><input type="text" name="fuel"required /></td>
	</tr>
	

        <tr>
                <td class="col">Rent:</td>
                <td>
                    <div style="position: relative;">
                        <input type="text" name="rent" style="padding-right: 10px;" />
                        <span style="position: absolute; right: 2px; top: 50%; transform: translateY(-50%);">/ per day</span>
                    </div>
                </td>
            </tr>
            
            <tr>
                <td>&nbsp;</td>
                <td>
                    <input type="submit" name="add" value="Register" />
                    <input type="reset"  value="Reset" />
                </td>
            </tr>
            <tr>
                <th colspan="2">
                    <a href="adminhome.jsp">BACK</a>
                </th>
            </tr>
        </table>
    </form>
</div>
</body>
<br>
<br><br>
<br><br>
<br><br>
<br>
<%@include file="footer.jsp" %>
