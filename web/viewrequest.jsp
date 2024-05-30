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
    // Connect to the database and retrieve request details
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/carrental","root","");
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("SELECT * FROM book where sta='requested'");
    %>
    <br>
    <br>
    <br>
    <br><br>
    <br>
    <div align="center">
        <h2>View Requests</h2> <!-- Title -->
        <table border="1" cellspacing="0" class="displaycontent" width="80%">
            <tr>
                <th>Request ID</th>
                <th>User ID</th>
                <th>User Mail</th>
                <th>Car ID</th>
                <th>Car Name</th>
                <th>Date</th>
                <th>No.Of.Days</th>
                <th>Amount Per Day</th>
                <th>Accept</th>
            </tr>
            <%
            while(rs.next()) {
            %>
            <tr>
                <td><%= rs.getString("bid") %></td>
                <td><%= rs.getString("uid") %></td>
                <td><%= rs.getString("usermail") %></td>
                <td><%= rs.getString("cid") %></td>
                <td><%= rs.getString("carname") %></td>
                <td><%= rs.getString("dat") %></td>
                <td><%= rs.getString("day") %></td>
                <td><%= rs.getString("amt") %></td>
                <td><a href="addpayment.jsp?select=<%= rs.getString("bid") %>" class="book-now-btn">Accept</a></td>
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
<br><br><br><br><br><br><br><br><br><br><br><br>
<%@include file="footer.jsp" %>
