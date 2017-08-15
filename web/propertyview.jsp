<%-- 
    Document   : propertyview
    Created on : 25 Apr, 2014, 2:19:31 PM
    Author     : Neha
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="connections.MyConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Property Information</title>
    <style>
            td
            {
                padding: 5px;
            }            
        </style>
    </head>
    <body>
        <%@include file="masterseller.jsp" %>
         <%
            int pid = Integer.parseInt(request.getParameter("propertyid").trim());

            ResultSet rs = null;
            MyConnection.pst.close();
            MyConnection.pst = MyConnection.con.prepareStatement("select p.available_option, s.f_name, c.cat_name, sc.subcat_name, st.state_name, ct.city_name, "
                    + "p.address_line, p.area, p.price, p.describe, p.know_status from property p "
                    + "join seller s on p.seller_id=s.seller_id "
                    + "join category c on p.cat_id=c.cat_id "
                    + "join subcategory sc on p.subcat_id=sc.subcat_id "
                    + "join state st on p.state_id=st.state_id "
                    + "join city ct on p.city_id=ct.city_id where property_id=?");
            MyConnection.pst.setInt(1, pid);
            rs = MyConnection.pst.executeQuery();
            rs.next();
        %>     
     
        <div id="content-outer">
<!-- start content -->
<div id="content">

	<!--  start page-heading -->
	<div id="page-heading">
		<h1>User</h1>
	</div>
	<!-- end page-heading -->

	<table border="0" width="100%" cellpadding="0" cellspacing="0" id="content-table">
	<tr>
		<th rowspan="3" class="sized"><img src="images/shared/side_shadowleft.jpg" width="20" height="300" alt="" /></th>
		<th class="topleft"></th>
		<td id="tbl-border-top">&nbsp;</td>
		<th class="topright"></th>
		<th rowspan="3" class="sized"><img src="images/shared/side_shadowright.jpg" width="20" height="300" alt="" /></th>
	</tr>
	<tr>
		<td id="tbl-border-left"></td>
		<td>
		<!--  start content-table-inner ...................................................................... START -->
		<div id="content-table-inner">
		
			<!--  start table-content  -->
			<div id="table-content">
            <table>
            <tr><td><label>Availability: </label></td><td><%=rs.getString(1)%></td></tr>
            <tr><td><label>Seller Name: </label></td><td><%=rs.getString(2)%></td></tr>
            <tr><td><label>Category: </label></td><td><%=rs.getString(3)%></td></tr>
            <tr><td><label>Sub-Category: </label></td><td><%=rs.getString(4)%></td></tr>
            <tr><td><label>State: </label></td><td><%=rs.getString(5)%></td></tr>
            <tr><td><label>City: </label></td><td><%=rs.getString(6)%></td></tr>
            <tr><td><label>Address: </label></td><td><%=rs.getString(7)%></td></tr>           
            <tr><td><label>Area: </label></td><td><%=rs.getString(8)%></td></tr>
            <tr><td><label>Price: </label></td><td><%=rs.getFloat(9)%></td></tr>            
            <tr><td><label>Description: </label></td><td><%=rs.getString(10)%></td></tr>
            <tr><td><label>Status: </label></td><td><%=rs.getString(11)%></td></tr>
        </table>  
                            <%
                                   MyConnection.pst.close();
                            %>
                             <form action="propertylist.jsp">
                                 <br><input type="submit" value="Back" class="btn btn-blue"/>
                             </form>      
                </div>
			<!--  end table-content  -->
	
			<div class="clear"></div>
		 
		</div>
		<!--  end content-table-inner ............................................END  -->
		</td>
		<td id="tbl-border-right"></td>
	</tr>
	<tr>
		<th class="sized bottomleft"></th>
		<td id="tbl-border-bottom">&nbsp;</td>
		<th class="sized bottomright"></th>
	</tr>
	</table>
	<div class="clear">&nbsp;</div>

</div>
<!--  end content -->
<div class="clear">&nbsp;</div>
</div>
<!--  end content-outer........................................................END -->

<div class="clear">&nbsp;</div>
          
    </body>
</html>

