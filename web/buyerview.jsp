<%-- 
    Document   : buyerview
    Created on : 19 Apr, 2014, 12:27:55 AM
    Author     : Mannu
--%>

<%@page import="connections.MyConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Buyer Portal</title>
        <style>
            td
            {
                padding: 5px;
            }
            
        </style>
    </head>
    <body>
        <%@include file="master.jsp" %>
         <%
            int bid = Integer.parseInt(request.getParameter("buyerid").trim());

            ResultSet rs = null;
            MyConnection.pst.close();
            MyConnection.pst = MyConnection.con.prepareStatement("select b.f_name, b.l_name, b.user_name, b.user_pass, b.email_id, b.address_line1, b.address_line2, b.mobile_no, b.landline_no, b.gender, b.dob, sc.security_ques, b.answer, "
                    + "st.state_name, ci.city_name, pl.plan_name from buyer b "
                    + "join state st on b.state_id=st.state_id "
                    + "join city ci on b.city_id=ci.city_id "
                    + "join plans pl on b.plan_id=pl.plan_id "
                    + "join security sc on b.security_id=sc.security_id where buyer_id=?");
            MyConnection.pst.setInt(1, bid);
            rs = MyConnection.pst.executeQuery();
            rs.next();
        %>     
     
        <div id="content-outer">
<!-- start content -->
<div id="content">

	<!--  start page-heading -->
	<div id="page-heading">
		<h1>Administrator </h1>
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
            <tr><td><label>First Name: </label></td><td><%=rs.getString("f_name")%></td></tr>
            <tr><td><label>Last Name: </label></td><td><%=rs.getString("l_name")%></td></tr>
            <tr><td><label>User Name: </label></td><td><%=rs.getString("user_name")%></td></tr>
            <tr><td><label>Password: </label></td><td><%=rs.getString("user_pass")%></td></tr>
            <tr><td><label>Email: </label></td><td><%=rs.getString("email_id")%></td></tr>
            <tr><td><label>Address Line1: </label></td><td><%=rs.getString("address_line1")%></td></tr>
            <tr><td><label>Address Line2: </label></td><td><%=rs.getString("address_line2")%></td></tr>           
            <tr><td><label>Mobile: </label></td><td><%=rs.getInt("mobile_no")%></td></tr>
            <tr><td><label>Landline: </label></td><td><%=rs.getInt("landline_no")%></td></tr>            
            <tr><td><label>Gender: </label></td><td><%=rs.getString("gender")%></td></tr>
            <tr><td><label>Date of Birth: </label></td><td><%=rs.getString("dob")%></td></tr>
            <tr><td><label>Security Question: </label></td><td><%=rs.getString("security_ques")%></td></tr>
            <tr><td><label>Answer: </label></td><td><%=rs.getString("answer")%></td></tr>
            <tr><td><label>State: </label></td><td><%=rs.getString("state_name")%></td></tr>
            <tr><td><label>City: </label></td><td><%=rs.getString("city_name")%></td></tr>
            <tr><td><label>Plan: </label></td><td><%=rs.getString("plan_name")%></td></tr>
        </table>  
                            <%
                                   MyConnection.pst.close();
                            %>
                             <form action="buyerslist.jsp">
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
