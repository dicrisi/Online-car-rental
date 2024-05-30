<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.sql.*, javax.servlet.http.*" %>
<%@include file="header.jsp" %>
<%@include file="style.jsp" %>
<style>
    body {
        background-image: url('car.jpg');
        background-size: cover;
        background-repeat: no-repeat;
        color:white;
    }
</style>

<%
try {
    if (request.getParameter("add") != null) {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/carrental","root","");
        
        String a2 = request.getParameter("first_name");
        String a3 = request.getParameter("U_name");
        String a4 = request.getParameter("password");
        String a5 = request.getParameter("address");
        String a6 = request.getParameter("mobile");
        String a7 = request.getParameter("email_id");
        
        Statement st = con.createStatement();
        int i = st.executeUpdate("insert into usertbl values(null,'" + a2 + "','" + a3 + "','" + a4 + "','" + a5 + "','" + a6 + "','" + a7 + "')");
        
        if (i == 1) {
%>
            <!-- Registration successful, redirecting to user login page -->
            <script>
                alert('Add Successfully');
                window.location.href = 'userlogin.jsp';
            </script>
<%
        } else {
%>
            <script>
                alert('Not Successful');
            </script>
<%
        }
    }
} catch(Exception ex) {
    out.println(ex);
}
%>

<body>
    <div align="center">
        <form action="" name="register_form"  id="register_form"  method="post">
            <table border="0" cellspacing="0" class="displaycontent" width="500" Height="300">
                <caption></caption>
                <br><br><br><br><br><br><br><br>
                <tr>
                    <center>
                        <th colspan="2">NEW REGISTER</th>
                    </center>
                </tr>
                <tr>
                    <td class="col">Name:<font></td>
                    <td><input type="text" name="first_name" value=""/></td>
                </tr>
                <tr>
                    <td class="col">Username</td>
                    <td><input type="text" name="U_name"/> </td>
                </tr>
                <tr>
                    <td class="col">Password</td>
                    <td><input type="password" name="password"  value="" /> </td>
                </tr>
                <tr>
                    <td class="col">Address:</td>
                    <td><input type="text" name="address" /></td>
                </tr>
                <tr>
                    <td class="col">Mobile</td>
                    <td><input type="text" name="mobile" /></td>
                </tr>
                <tr>
                    <td class="col">Email id</td>
                    <td><input type="text" name="email_id" value=""/></td>
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
                        <a href="index.jsp">BACK</a>
                    </th>
                </tr>
            </table>
        </form>
    </div>
</body>
<br><br><br><br><br>
<%@include file="footer.jsp" %>
