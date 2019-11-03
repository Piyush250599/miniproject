<%-- 
    Document   : vendorsendrequest1.jsp
    Created on : 11 Oct, 2019, 10:35:09 PM
    Author     : piyush
--%>
<%@page import="java.util.*,java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
     String user1= (String) session.getAttribute("lid");
    String proname=request.getParameter("proname");
    
    String prize1=request.getParameter("prize");
    int pid=0;
    String depr="";
try{
    Class.forName("com.mysql.jdbc.Driver");
    
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/miniproject","root","piyush123");
    
   
    //Random random=new Random();
    //int rn=random.nextInt(10000);
   // String dept = "Information Technology";
   // Calendar calendar = Calendar.getInstance();
    //java.sql.Date place_order = new java.sql.Date(calendar.getTime().getTime());
    Statement str= conn.createStatement();
    int x=str.executeUpdate("insert into vendorproducts values('"+user1+"','"+prize1+"','"+proname+"')");
    
    if(x==1)
    {
%>
<script>        
alert("Order Send Successfully");
</script>

<%
    }
    response.sendRedirect("vendorsendrequest.jsp");
}
catch(Exception e)
{
    System.out.print(e);
    e.printStackTrace();
}
%>