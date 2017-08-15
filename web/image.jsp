<%-- 
    Document   : image
    Created on : 30 Apr, 2014, 7:10:55 PM
    Author     : sony
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.InputStream"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            if (request.getParameter("imgid") != null && request.getParameter("imgid") != "") 
            {
                int imageid =Integer.parseInt(request.getParameter("imgid"));
                System.out.println("*******"+imageid+"*******");
                String filename = "image" + imageid + ".jpg";
                Connection con1 = null;
                ResultSet rs1 = null;
                try 
                { 
                    Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
                    con1=DriverManager.getConnection("jdbc:odbc:dsnapp","sa","abc123");
                    
                    Statement st1 = con1.createStatement();
                    String strQuery = "select pics from images where image_id=" + imageid;
                    rs1 = st1.executeQuery(strQuery);
                    String imgLen = "";
                    if (rs1.next()) 
                    {
                        imgLen = rs1.getString("pics");
                    }
                    rs1.close();
                    rs1 = st1.executeQuery(strQuery);                    
                    if (rs1.next()) 
                    {
                        int len = imgLen.length();
                        byte[] rb = new byte[len];
                        InputStream readImg = rs1.getBinaryStream("pics");
                        int index = readImg.read(rb, 0, len);
                        st1.close();
                        response.reset();
                        response.setContentType("image/jpg");
                        response.setHeader("Content-disposition", "attachment; filename=" + filename + " index=" +index);
                        response.getOutputStream().write(rb, 0, len);
                        response.getOutputStream().flush();
                        response.getOutputStream().close();
                    }
                    rs1.close();
                } 
                catch (Exception e) 
                {
                    e.printStackTrace();
                }
            }
%>
    </body>
</html>
