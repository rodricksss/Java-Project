<%-- 
    Document   : getcity
    Created on : Apr 18, 2013, 7:32:52 PM
    Author     : Administrator
--%>
<%@page import="connections.MyConnection"%>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script language="javascript" src="js/ajax.js" type="text/javascript"></script>
            </head>
    <body>

     <%!
     ResultSet rs=null;
     %>

     <select name="cityid">
         <option disabled selected class="s">-- Select City --</option>

 <%
     int sid = Integer.parseInt(request.getParameter("ids"));
      MyConnection.pst.close();
     MyConnection.pst = MyConnection.con.prepareStatement("select * from city where state_id=?");
     MyConnection.pst.setInt(1, sid);
     rs = MyConnection.pst.executeQuery();
        while(rs.next())
        {
%>


<option value="<%= rs.getInt("city_id") %>"> <%= rs.getString("city_name") %></option>
<%
}
         MyConnection.pst.close();
%>

     </select>

    </body>
</html>
