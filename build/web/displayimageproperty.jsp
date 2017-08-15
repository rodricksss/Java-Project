<%-- 
    Document   : displayimageproperty
    Created on : May 4, 2013, 11:14:22 AM
    Author     : sony
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="connections.MyConnection"%>

<html>
    <head>
        <title>JSP Page</title>
    </head>
    <body> 
        
        <%
            ResultSet rs=null;
            Thread.sleep(1000);
            int pid=Integer.parseInt(request.getParameter("pid"));
           
            System.out.println("%%%%%%%"+pid+"%%%%%%%");
            String imgLen = null;
            MyConnection.pst.close();
            MyConnection.pst = MyConnection.con.prepareStatement("select pics from images where property_id=?");
            MyConnection.pst.setInt(1, pid);
            rs = MyConnection.pst.executeQuery();
            if (rs.next()) {
                imgLen = rs.getString("pics");
                System.out.println(imgLen.length());
            }
            rs.close();
            rs=null;
            MyConnection.pst.close();
            MyConnection.pst = MyConnection.con.prepareStatement("select pics from images where property_id=?");
            MyConnection.pst.setInt(1, pid);
            rs = MyConnection.pst.executeQuery();
            if (rs.next()) {
                int len = imgLen.length();
                byte[] rb = new byte[len];                
                InputStream readImg = rs.getBinaryStream("pics");
                int index = readImg.read(rb, 0, len);
                System.out.println("index" + index);
                MyConnection.pst.close();
                response.reset();
                response.setContentType("image/jpg");
                OutputStream o=response.getOutputStream();                
                o.write(rb, 0, len);
                o.flush();
                o.wait(1000);
                o.close();
                out.close();                
                rs.close();             
            }            
            MyConnection.pst.close();
        %>
    </body>
</html>
