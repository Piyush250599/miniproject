<%-- 
    Document   : addproduct
    Created on : 10 Oct, 2019, 9:26:08 AM
    Author     : piyush
--%>

<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*,java.sql.*"%>

<%
    String i=request.getParameter("productid");
    String prname=request.getParameter("prname");
    String desc=request.getParameter("prodesc");
try{
    Class.forName("com.mysql.jdbc.Driver");
    
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/miniproject","root","piyush123");
    
    Statement st= conn.createStatement();
    int x=st.executeUpdate("insert into productdetails(productid,name,description)values('"+i+"','"+prname+"','"+desc+"')");
    
        
    if(x==1)
    {
        response.sendRedirect("newproduct.jsp");
    }
    
    
}
catch(Exception e)
{
    System.out.print(e);
    e.printStackTrace();
}
%>