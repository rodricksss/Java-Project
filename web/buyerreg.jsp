<%-- 
    Document   : buyerreg
    Created on : 19 Apr, 2014, 1:17:25 AM
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
        <script language="javascript" src="js/ajax.js" type="text/javascript"></script>
        <style>
            td
            {
                padding: 5px;
            }            
        </style>
    </head>
    <body>
         <%@include file="master.jsp" %>
         
         <div id="content-outer">
<!-- start content -->
<div id="content">

	<!--  start page-heading -->
	<div id="page-heading">
		<h1>Administrator</h1>
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
			  
         
        <%!         
            ResultSet rs = null;
        %>
        <form action="BuyerSaveServlet" method="post">
            <table>
                <tr><td><label>First Name:</label></td><td><input type="text" name="fname" value=""/></td></tr>
                <tr><td><label>Last Name:</label></td><td><input type="text" name="lname" value=""/></td></tr>
                <tr><td><label>User Name:</label></td><td><input type="text" name="uname" value=""/></td></tr>
                <tr><td><label>Password:</label></td><td><input type="text" name="upass" value=""/></td></tr>
                <tr><td><label>Email:</label></td><td><input type="text" name="email" value=""/></td></tr>
                <tr><td><label>Address Line1:</label></td><td><input type="text" name="add1" value=""/></td></tr>
                <tr><td><label>Address Line2:</label></td><td><input type="text" name="add2" value=""/></td></tr>
                <tr><td><label>State:</label></td><td><select name="stateid" onchange="getcity(this.value)">
                    <option value="" disabled selected class="s">-- Select State --</option>
                <%
                    MyConnection.pst.close();
                    MyConnection.pst = MyConnection.con.prepareStatement("select * from state");
                    rs = MyConnection.pst.executeQuery();
                    while (rs.next()) 
                    {
                %>
                <option value="<%=rs.getInt("state_id")%>"> <%= rs.getString("state_name")%></option>
                <%
                    }
                %>
            </select></td></tr>
                <tr><td><label> City:</label></td>
                    <td><select name="cityid" id="txtCity">
                <option value="" disabled selected class="s">-- Select City --</option>
            </select></td></tr>
                <tr><td><label>Mobile:</label></td><td><input type="text" name="mobile" value=""/></td></tr>
                <tr><td><label>Landline:</label></td><td><input type="text" name="landline" value=""/></td></tr>
                <tr><td><label>Gender:</label></td><td><input type="text" name="gender" value=""/></td></tr>
                <tr><td><label>Date of Birth:</label></td><td><input type="text" name="dob" value=""/></td></tr>
                <tr><td><label>Plan:</label></td><td><select name="planid">
                <option value="" disabled selected class="s">-- Select Plan --</option>
                <%
                    MyConnection.pst.close();
                    MyConnection.pst = MyConnection.con.prepareStatement("select * from plans");
                    rs = MyConnection.pst.executeQuery();
                    while (rs.next()) 
                    {
                %>
                <option value="<%=rs.getInt("plan_id")%>"> <%= rs.getString("plan_name")%></option>
                <%
                    }
                %>
            </select></td></tr>
                <tr><td><label>Security Question:</label></td><td><select name="secid">
                <option value="" disabled selected class="s">-- Select Security Question --</option>
                <%
                    MyConnection.pst.close();
                    MyConnection.pst = MyConnection.con.prepareStatement("select * from security");
                    rs = MyConnection.pst.executeQuery();
                    while (rs.next()) 
                    {
                %>
                <option value="<%=rs.getInt("security_id")%>"> <%= rs.getString("security_ques")%></option>
                <%
                    }
                %>
            </select></td></tr>
                <tr><td><label>Answer:</label></td><td><input type="text" name="answer" value=""/></td></tr>
            </table><br/>
            <input type="submit" value="Submit" class="btn btn-blue"/><br/><br/>
            
        </form>
        <form action="buyerslist.jsp" method="post">
            <input type="submit" value="Back" class="btn btn-blue"/>
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

