<%-- 
    Document   : insertdata
    Created on : 13 Sep, 2019, 7:56:36 PM
    Author     : piyush
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            
            String lid=request.getParameter("username");
            session.setAttribute("lid", lid);
            
            String lpass=request.getParameter("password");
            
       try{
           Class.forName("com.mysql.jdbc.Driver");
           Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/miniproject","root","piyush123");
           Statement st=con.createStatement();
           ResultSet rs=st.executeQuery("select logintype,dept from login where loginid='"+lid+"' and loginpassword='"+lpass+"'");
           //out.println("Data is inserted");
           if(rs.next())
           {
               String type=rs.getString("logintype");
                String depa=rs.getString("dept");
               if("admin".equals(type))
               {
                   out.println("Welcome,'"+lid+"','"+type+"'");
                   response.sendRedirect("adminfront.jsp");
               }
               else if("user".equals(type)&&"Computer".equals(depa))
               {
                   out.println("Welcome,'"+lid+"','"+type+"'");
                   response.sendRedirect("userfrontcomp.jsp");
               }
               else if("user".equals(type)&&"Information Technology".equals(depa))
               {
                   out.println("Welcome,'"+lid+"','"+type+"'");
                   response.sendRedirect("userfrontIT.jsp");
               }
               else if("user".equals(type)&&"Electronic and Telecommunication".equals(depa))
               {
                   out.println("Welcome,'"+lid+"','"+type+"'");
                   response.sendRedirect("userfrontEnTC.jsp");
               }
               else if("vendor".equals(type))
               {
                   out.println("Welcome,'"+lid+"','"+type+"'");
                   response.sendRedirect("vendorfront.jsp");
               }
               
           }
           else
           {
               out.println("Invalid login credentials");
           }
           
           
           
       }catch(Exception e){
           out.println(e);
           
       }
       
       
       
       %>
    </body>
</html>
