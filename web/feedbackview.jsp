<%-- 
    Document   : feedbackview
    Created on : 15 May, 2014, 5:05:57 PM
    Author     : sony
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="connections.MyConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Feedback</title>
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
			  
         
        <%         
            ResultSet rs = null;
            int fid=Integer.parseInt(request.getParameter("feedbackid"));
            MyConnection.pst.close();
            MyConnection.pst=MyConnection.con.prepareStatement("select * from feedback where feedback_id=?");
            MyConnection.pst.setInt(1, fid);
            rs=MyConnection.pst.executeQuery();
            while(rs.next())
            {
        %>
        <table>
        <form action="FeedbackReply" method="post">            
                <tr><td><label>First Name:</label></td><td><%=rs.getString("f_name")%></td></tr>
                <tr><td><label>Last Name:</label></td><td><%=rs.getString("l_name")%></td></tr>
                <%
                    String eid=rs.getString("email_id").trim();
                %>
                <tr><td><label>Email:</label></td><td><%=eid%></td></tr>
                <tr><td><label>Feedback:</label></td><td><%=rs.getString("feedback")%></td></tr>
                <tr><td><label>Reply:</label></td><td><textarea name="msg" onfocus="if(this.value=='**Type Message Here**'){this.value='';}" onblur="if(this.value==''){this.value='**Type Message Here**';}" style="font-family: Arial, Helvetica, sans-serif; height: 100px; width: 150px; color: #3079ed">**Type Message Here**</textarea></td></tr>
                <tr><td><label><b>Enter Login and Password</b></label></td></tr>
                <tr><td><label>Login:</label></td><td><input type="text" name="id" value="" autocomplete="off"/></td></tr>
                <tr><td><label>Password:</label></td><td><input type="password" name="pwd" value="" autocomplete="off"/></td></tr>
                <input type="hidden" name="email" value="<%=eid%>"/>
        
                <tr><td><br><input type="submit" value="Submit" class="btn btn-blue"/></td></tr><br/><br/>            
        </form>
                <%
                    }
                    MyConnection.pst.close();
                %>
                </table>
                
        <form action="feedbacklist.jsp" method="post">
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
    </table>   
    </body>
</html>


