<%-- 
    Document   : buyerfeedback
    Created on : 16 May, 2014, 9:35:19 PM
    Author     : sony
--%>

<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.SQLException"%>
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
            input
            {
                width: 180px;
            }
        </style>
    </head>
    <body>
        <%@include file="masterbuyer.jsp" %>
        <%
            int row=0;
            try
            {
            String str=request.getParameter("button");
            String fname=request.getParameter("fname").trim();
            String lname=request.getParameter("lname").trim();
            String email=request.getParameter("email").trim();
            String msg=request.getParameter("msg").trim();
            if(str.equals("Submit"))
            {
                try
                {
                    MyConnection.pst.close();
                    MyConnection.pst=MyConnection.con.prepareStatement("insert into feedback(f_name,l_name,email_id,feedback)values(?,?,?,?)");
                    MyConnection.pst.setString(1, fname);
                    MyConnection.pst.setString(2, lname);
                    MyConnection.pst.setString(3, email);
                    MyConnection.pst.setString(4, msg);
                    row=MyConnection.pst.executeUpdate();
                    if(row>0)
                    {
                        JOptionPane.showMessageDialog(null, "Feedback Sent");
                        response.sendRedirect("buyerfeedback.jsp");
                    }
                }
                catch(SQLException ex)
                {
                    System.out.println(ex);
                }
            }
            }
            catch(Exception ex)
            {
                System.out.println(ex);
            }            
        %>
        
         
         <div id="content-outer">
<!-- start content -->
<div id="content">

	<!--  start page-heading -->
	<div id="page-heading">
		<h1>Buyer</h1>
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
                ResultSet resultSet;
                HttpSession sess=request.getSession();
                int bid=(Integer)sess.getAttribute("buyer_id");
                MyConnection.pst.close();
                MyConnection.pst=MyConnection.con.prepareStatement("select f_name,l_name,email_id from buyer where buyer_id=?");
                MyConnection.pst.setInt(1,bid);
                resultSet=MyConnection.pst.executeQuery();
                while(resultSet.next())
                {              
            %>
        <form action="buyerfeedback.jsp" method="post">
            <table>
                <tr><td><label>First Name:</label></td><td><input type="text" name="fname" value="<%=resultSet.getString("f_name")%>"/></td></tr>
                <tr><td><label>Last Name:</label></td><td><input type="text" name="lname" value="<%=resultSet.getString("l_name")%>"/></td></tr>
                <tr><td><label>Email:</label></td><td><input type="text" name="email" value="<%=resultSet.getString("email_id")%>"/></td></tr>
                <tr><td><label>Feedback:</label></td><td><textarea name="msg" onfocus="if(this.value=='**Type Message Here**'){this.value='';}" onblur="if(this.value==''){this.value='**Type Message Here**';}" style="font-family: Arial, Helvetica, sans-serif; height: 100px; width: 180px; color: #3079ed">**Type Message Here**</textarea></td></tr>
                
            </table><br/>
                <input type="submit" name="button" value="Submit" class="btn btn-blue"/><br/><br/>         
        </form>
                <%
                    }
                    MyConnection.pst.close();
                %>
                   
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

