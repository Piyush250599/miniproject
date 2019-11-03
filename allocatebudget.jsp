<%-- 
    Document   : allocatebudget
    Created on : 3 Oct, 2019, 9:54:43 PM
    Author     : piyush
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Allocate budget</title>
    </head>
    <body>
        <%
    String depart=request.getParameter("dep");
    String bud=request.getParameter("budget");
try{
    Class.forName("com.mysql.jdbc.Driver");
    
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/miniproject","root","piyush123");
    
    Statement st= conn.createStatement();
    int x=st.executeUpdate("insert into department(dname,budget)values('"+depart+"','"+bud+"')");
    
    if(x==1)
    {
%>
<script>
alert("Updated Successfully");
</script>
<%
    response.sendRedirect("allocatebudget.html");
    }   
}
catch(Exception e)
{
    System.out.print(e);
    e.printStackTrace();
}
%>
    </body>
</html>
