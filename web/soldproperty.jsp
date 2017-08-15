<%-- 
    Document   : soldproperty
    Created on : 11 May, 2014, 10:54:08 PM
    Author     : sony
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="connections.MyConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sold</title>
    </head>
    <body>
        
        <%
            ResultSet rs=null;
            Thread.sleep(1000);
            int pid=Integer.parseInt(request.getParameter("id"));
           
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
