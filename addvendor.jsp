<%-- 
    Document   : addvendor
    Created on : 10 Oct, 2019, 9:58:47 AM
    Author     : piyush
--%>

<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*,java.sql.*"%>

<%
try{
    Class.forName("com.mysql.jdbc.Driver");
    
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/miniproject","root","piyush123");
    
    String uid=request.getParameter("userid");
    String usname=request.getParameter("uname");
    String email1=request.getParameter("email");
    String password1=request.getParameter("password");
    int id=0;
    
    Statement st= conn.createStatement();
    int x=st.executeUpdate("insert into vendors(vid,password)values('"+uid+"','"+password1+"')");
    
    
   
    
    int m=st.executeUpdate("insert into login values('"+uid+"','"+password1+"','vendor','"+email1+"','vendor')");
    if(x==1 && m==1)
    {
%>
<script>
alert("Inserted Successfully");
</script>
<%
    response.sendRedirect("newvendor.jsp");
    }   
}
catch(Exception e)
{
    System.out.print(e);
    e.printStackTrace();
}
%>