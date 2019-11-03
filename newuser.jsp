<%-- 
    Document   : newuser
    Created on : 3 Oct, 2019, 3:19:01 PM
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
        <title>Add new user</title>
    </head>
    <body>
        <%
    String uid=request.getParameter("userid");
   // String usname=request.getParameter("uname");
    String pword=request.getParameter("pass");
    String department=request.getParameter("dep");
    String emailid1=request.getParameter("email");
try{
    Class.forName("com.mysql.jdbc.Driver");
    
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/miniproject","root","piyush123");
    
    Statement st= conn.createStatement();
   // int x=st.executeUpdate("insert into user(userid,password,uname,adminid)values('"+uid+"','"+pword+"','"+usname+"','"+1+"')");
    
    String user="user";
    int y=st.executeUpdate("insert into login(loginid,loginpassword,logintype,emailid,dept)values('"+uid+"','"+pword+"','"+user+"','"+emailid1+"','"+department+"')");   
    
    if(y==1)
    {
        response.sendRedirect("newuser1.jsp");
%>
<script>
alert("Updated Successfully");
</script>
<%
    
    }   
}
catch(Exception e)
{
    System.out.print(e);
    e.printStackTrace();
}%>

    </body>
</html>
