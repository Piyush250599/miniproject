<%-- 
    Document   : productpurchasecomp
    Created on : 7 Oct, 2019, 10:39:28 AM
    Author     : piyush
--%>

<<%@page import="java.util.*,java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String proname=request.getParameter("proname");
    String qua=request.getParameter("qua");
    String reqdate=request.getParameter("reqdate");
    int pid=0;
    String depr="";
try{
    Class.forName("com.mysql.jdbc.Driver");
    
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/miniproject","root","piyush123");
    
    PreparedStatement st= conn.prepareStatement("select productid from productdetails where name=?");
      
    st.setString(1, proname);
    ResultSet rs = st.executeQuery();
    
    if(rs.next())
    {
    pid = rs.getInt("productid");
    }
    Random random=new Random();
    int rn=random.nextInt(10000);
    String dept = "Computer";
    Calendar calendar = Calendar.getInstance();
    java.sql.Date place_order = new java.sql.Date(calendar.getTime().getTime());
    Calendar oneyearplus = Calendar.getInstance();
    oneyearplus.add(Calendar.MONTH,12);
   
    Statement str= conn.createStatement();
    int x=str.executeUpdate("insert into userchooses(orderid,prodid,reqbydate,deptid,status,placeddate,quantity)values('"+rn+"','"+pid+"','"+reqdate+"','"+dept+"','"+0+"','"+place_order+"','"+qua+"')");
    
    if(x==1)
    {
%>
<script>        
alert("Order Send Successfully");
</script>

<%
    }
    response.sendRedirect("productpurchasecomp.jsp");
}
catch(Exception e)
{
    System.out.print(e);
    e.printStackTrace();
}
%>