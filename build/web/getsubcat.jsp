<%-- 
    Document   : getsubcat
    Created on : 27 Apr, 2014, 6:52:50 PM
    Author     : sony
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="connections.MyConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script language="javascript" src="js/ajax.js" type="text/javascript"></script>
    </head>
    <body>
      <%!
     ResultSet rs=null;
     %>

     <select name="subcatid">
         <option disabled selected class="s">-- Select Sub-Category --</option>

 <%
     int catid = Integer.parseInt(request.getParameter("catid"));
      MyConnection.pst.close();
     MyConnection.pst = MyConnection.con.prepareStatement("select * from subcategory where cat_id=?");
     MyConnection.pst.setInt(1, catid);
     rs = MyConnection.pst.executeQuery();
        while(rs.next())
        {
%>


<option value="<%= rs.getInt("subcat_id") %>"> <%= rs.getString("subcat_name") %></option>
<%
}
         MyConnection.pst.close();
%>

     </select>

    </body>
</html>
