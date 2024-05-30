<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.sql.*, javax.servlet.http.*" %>
<%@include file="adminheader.jsp" %>
<%@include file="style.jsp" %>

<style>
    /* Style for table */
    .displaycontent {
        border-collapse: collapse;
        width: 80%;
        margin: 20px auto; /* Center the table */
    }

    /* Style for table header */
    .displaycontent th {
        border: 1px solid #000;
        padding: 8px;
        text-align: left;
    }

    /* Style for table data */
    .displaycontent td {
        border: 1px solid #000;
        padding: 8px;
    }
body {
            background-image: url('car.jpg');
            background-size: cover;
            background-repeat: no-repeat;
            color:white;
        }

     
   
</style>
<body>
<%
// Connect to the database and retrieve car details
try {
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/carrental","root","");
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("select * from carreg");
%>
<br>
<br>
<br>
<br><br>
<br>
<div align="center">
    <h2>View Car Details</h2> <!-- Title -->
    <table border="1" cellspacing="0" class="displaycontent" width="80%">
        <tr>
            <th>id</th>
            <th>Car Name</th>
            <th>Car Number</th>
            <th>Car Capacity</th>
            <th>Fuel</th>
            <th>Rent</th>
            <th>Update</th> 
            <th>Delete</th><!-- New column for actions -->
        </tr>
        <%
        while(rs.next()) {
        %>
        <tr>
            <td><%= rs.getString("id") %></td>
            <td><%= rs.getString("carname") %></td>
            <td><%= rs.getString("carnum") %></td>
            <td><%= rs.getString("carcap") %></td>
            <td><%= rs.getString("fuel") %></td>
            <td><%= rs.getString("rent") %> / per day</td>
             <td>
                <a href="update.jsp?select=<%= rs.getString(1) %>">Update</a>
            </td>
             <td>
                <a href="?delete=<%= rs.getString(1) %>">Delete</a>
            </td
        </tr>
        <%
        }
        %>
    </table>
</div>



<%
// Close database connection
rs.close();
st.close();
con.close();
} catch(Exception ex) {
    out.println(ex);
}
%>
</body>
<br>
<br>
<br>
<br><br>
<br>
<br><br>
<br>
<br><br>
<br>
<br>


<%@include file="footer.jsp" %>
