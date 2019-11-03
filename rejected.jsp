<%-- 
    Document   : rejected
    Created on : 12 Oct, 2019, 10:18:04 PM
    Author     : piyush
--%>

<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*,java.sql.*"%>

<%
    String orderid = request.getParameter("ordid");
try{

    int ordid1=Integer.parseInt(orderid);
    Class.forName("com.mysql.jdbc.Driver");
    
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/miniproject","root","piyush123");
  
    
    Statement str= conn.createStatement();
   
    int x=str.executeUpdate("delete from userchooses where orderid='"+ordid1+"'");
    
    if(x==1)
    {
      response.sendRedirect("ongoing.jsp");   
    }
}
catch(Exception e)
{
    System.out.print(e);
    e.printStackTrace();
}

%>