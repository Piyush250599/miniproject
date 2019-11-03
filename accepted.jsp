<%-- 
    Document   : accepted
    Created on : 12 Oct, 2019, 10:16:41 PM
    Author     : piyush
--%>

<%@page import="com.itextpdf.text.pdf.PdfPTable"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="javax.mail.internet.MimeMultipart"%>
<%@page import="javax.mail.internet.MimeBodyPart"%>
<%@page import="javax.print.DocFlavor.STRING"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.Message.RecipientType"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Session"%>
<%@page  import="com.itextpdf.text.Document,com.itextpdf.text.DocumentException,com.itextpdf.text.Paragraph,com.itextpdf.text.pdf.PdfWriter,com.itextpdf.text.pdf.PdfPCell"%>;

<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*,java.sql.*,javax.mail.*,javax.servlet.*,javax.activation.*,com.itextpdf.text.*"%>

<%
    Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", 465);
        props.put("mail.smtp.user", "agrawalpiyush2505@gmail.com");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.debug", "true");
        props.put("mail.smtp.socketFactory.port", 465);
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.socketFactory.fallback", "false"); 
        Document document = new Document();
        
    String orderid = request.getParameter("orderid");
try{
    int ordid=Integer.parseInt(orderid);
    Class.forName("com.mysql.jdbc.Driver");
    
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/miniproject","root","piyush123");
    
    PreparedStatement str= conn.prepareStatement("update userchooses set status=? where orderid=?");
    str.setInt(1, 1);
    str.setInt(2, ordid);
    int x=str.executeUpdate();
    
    PreparedStatement pst = conn.prepareStatement("select * from userchooses where orderid=?");
    pst.setInt(1,ordid);
    ResultSet rs = pst.executeQuery();
    
    String dept="";
    String pid="";
    String qua="";
    String req="";
    String place="";
    if(rs.next())
    {
        pid=rs.getString("prodid");
        qua=rs.getString("quantity");
        req=rs.getString("reqbydate");
        place=rs.getString("placeddate");
        dept=rs.getString("deptid");
    }
    
    PreparedStatement pstq = conn.prepareStatement("select * from productdetails where productid=?");
    pstq.setString(1,pid);
    ResultSet rsa = pstq.executeQuery();
    
    String pname="";
    if(rsa.next())
    {
        pname=rsa.getString("name");
    }
        int pd=Integer.parseInt(pid);
    
    PreparedStatement pste=conn.prepareStatement("select * from vendorproducts where prodid=?");
    pste.setInt(1,pd);
    ResultSet rss = pste.executeQuery();
            
    PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream("/home/piyush/NetBeansProjects/login/web/xyz1.pdf"));
    document.open();
    
        Image image = Image.getInstance("/home/piyush/NetBeansProjects/login/web/assets/images/icon");
    image.scaleAbsolute(100,100);
    image.setAbsolutePosition(20f, 750f);
    
    document.add(image);
    Font font1 = new Font(Font.FontFamily.HELVETICA  , 22, Font.BOLD);
    Font font2 = new Font(Font.FontFamily.COURIER    , 15,Font.BOLD);
    Paragraph paragraph=new Paragraph();
    
    paragraph.setAlignment(Element.ALIGN_CENTER);
    Chunk chunk =new Chunk("Product Purchase System",font1);
    paragraph.add(chunk);
    document.add(paragraph);
    
     Paragraph para=new Paragraph();    
    para.setAlignment(Element.ALIGN_RIGHT);
    chunk=new Chunk("PICT COLLEGE",font2);
    para.add(chunk);
    document.add(para);
    
    Paragraph paragraph1=new Paragraph();
     
    paragraph1.setAlignment(Element.ALIGN_LEFT);
    Chunk chunk2 =new Chunk("\n\nShip To:\nPICT COLLEGE,",font2);
    Chunk chunk5 =new Chunk("\n"+dept+" "+"Department",font2);
    paragraph1.add(chunk2);
    paragraph1.add(chunk5);
       document.add(paragraph1);
    
       
    Paragraph paragraph2=new Paragraph();
    paragraph2.setAlignment(Element.ALIGN_RIGHT);
    Chunk chunk3 =new Chunk("Bill To:\nAccount Section,",font2);
    paragraph2.add(chunk3);
    Chunk chunk6 =new Chunk("\nPICT COLLEGE",font2);
    paragraph2.add(chunk6);
    document.add(paragraph2);
    
    document.add(new Paragraph("Purchase Order:",font2));
    
    PdfPTable table = new PdfPTable(5);
    
    table.setWidthPercentage(100); //Width 100%
    table.setSpacingBefore(50f); //Space before table
    table.setSpacingAfter(50f); //Space after table
            PdfPCell cell1 = new PdfPCell(new Paragraph("Order Id"));
        cell1.setBorderColor(BaseColor.BLACK);
        cell1.setPaddingLeft(10);
        cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
        
                PdfPCell cell2 = new PdfPCell(new Paragraph("Product Name"));
        cell2.setBorderColor(BaseColor.BLACK);
        cell2.setPaddingLeft(10);
        cell2.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell2.setVerticalAlignment(Element.ALIGN_MIDDLE);
        
                PdfPCell cell3 = new PdfPCell(new Paragraph("Quantity"));
        cell3.setBorderColor(BaseColor.BLACK);
        cell3.setPaddingLeft(10);
        cell3.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell3.setVerticalAlignment(Element.ALIGN_MIDDLE);
        
                PdfPCell cell4 = new PdfPCell(new Paragraph("Order Plcaed On"));
        cell4.setBorderColor(BaseColor.BLACK);
        cell4.setPaddingLeft(10);
        cell4.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell4.setVerticalAlignment(Element.ALIGN_MIDDLE);
        
                PdfPCell cell5 = new PdfPCell(new Paragraph("Required By Date"));
        cell5.setBorderColor(BaseColor.BLACK);
        cell5.setPaddingLeft(10);
        cell5.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell5.setVerticalAlignment(Element.ALIGN_MIDDLE);
        
                    PdfPCell cell6 = new PdfPCell(new Paragraph(orderid));
        cell6.setBorderColor(BaseColor.BLACK);
        cell6.setPaddingLeft(10);
        cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell6.setVerticalAlignment(Element.ALIGN_MIDDLE);
        
                PdfPCell cell7 = new PdfPCell(new Paragraph(pname));
        cell7.setBorderColor(BaseColor.BLACK);
        cell7.setPaddingLeft(10);
        cell7.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell7.setVerticalAlignment(Element.ALIGN_MIDDLE);
        
                PdfPCell cell8 = new PdfPCell(new Paragraph(qua));
        cell8.setBorderColor(BaseColor.BLACK);
        cell8.setPaddingLeft(10);
        cell8.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell8.setVerticalAlignment(Element.ALIGN_MIDDLE);
        
                PdfPCell cell9 = new PdfPCell(new Paragraph(place));
        cell9.setBorderColor(BaseColor.BLACK);
        cell9.setPaddingLeft(10);
        cell9.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell9.setVerticalAlignment(Element.ALIGN_MIDDLE);
        
                PdfPCell cell10 = new PdfPCell(new Paragraph(req));
        cell10.setBorderColor(BaseColor.BLACK);
        cell10.setPaddingLeft(10);
        cell10.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell10.setVerticalAlignment(Element.ALIGN_MIDDLE);
        
        table.addCell(cell1);
        table.addCell(cell2);
        table.addCell(cell3);
        table.addCell(cell4);
        table.addCell(cell5);
        table.addCell(cell6);
        table.addCell(cell7);
        table.addCell(cell8);
        table.addCell(cell9);
        table.addCell(cell10);
 
        document.add(table);
    Paragraph para1=new Paragraph();    
    para1.setAlignment(Element.ALIGN_RIGHT);
    chunk=new Chunk("Purchase Order Is Approved By Purchase Admin.",font2);
    para1.add(chunk);
    document.add(para1);
        
    document.close();
writer.close();
 
    String name="";
    while(rss.next())
    {
    name=rss.getString("vid");
PreparedStatement ps=conn.prepareStatement("select * from login where loginid=?");
    ps.setString(1,name);
    ResultSet rsr = ps.executeQuery();
    String Email="";
    while(rsr.next())
    {
                Email=rsr.getString("email");               
                Session session1 = Session.getDefaultInstance(props, null);
                session1.setDebug(true);
                MimeMessage message = new MimeMessage(session1);                 
                message.setFrom(new InternetAddress("agrawalpiyush2505@gmail.com"));
                BodyPart messageBodyPart = new MimeBodyPart(); 
                messageBodyPart.setText("Required Purchase Order Is:"); 
                Multipart multipart = new MimeMultipart(); 
                multipart.addBodyPart(messageBodyPart); 
                messageBodyPart = new MimeBodyPart(); 
                String filename = "/home/piyush/NetBeansProjects/login/web/xyz1.pdf"; 
                DataSource source = new FileDataSource(filename); 
                messageBodyPart.setDataHandler(new DataHandler(source)); 
                messageBodyPart.setFileName(filename); 
                multipart.addBodyPart(messageBodyPart);   
                message.setContent(multipart); 
                message.addRecipient(RecipientType.TO, new InternetAddress(Email));
                message.saveChanges();
                Transport transport = session1.getTransport("smtp");
                transport.connect("smtp.gmail.com", "agrawalpiyush2505@gmail.com","piyushishere@01");
                transport.sendMessage(message, message.getAllRecipients());
                transport.close();
        }
    }
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