<%-- 
    Document   : admin1
    Created on : 18 Apr, 2014, 6:18:46 PM
    Author     : Mannu
--%>
<%@page import="java.io.InputStream"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="connections.MyConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Portal</title>
    </head>
    <body>
        <%
            response.setHeader("Cache-Control", "no-cache");
            response.setHeader("Cache-Control", "no-store");
            response.setHeader("Pragma", "no-cache");
            response.setDateHeader("Expires", 0);
        %>
      
        <%@include file="master.jsp" %>
        <%
            HttpSession sess = request.getSession();
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
			<h2>   <img src="DisplayImageServlet" id="photo" height="130" width="130" alt="images/imageicon.jpg"/>
            <form enctype="multipart/form-data" action="InsertImageServlet" method="post">
            <input type="file" name="file"/>
          <input type="submit" name="submit" value="Upload" class="btn btn-blue"/> </h2>
                       <b>Username: </b><h3><%=sess.getAttribute("adminid")%></h3>
                       <b>Session Id: </b><h3><%=sess.getId()%></h3>
                        Hello <b>Administrator</b>!!!<br/>
                        Welcome to <b>ThinkAHome</b> Admin Portal.<br/><br/>
                        We assure you that it is a unique experience for you to use this particular module.<br/>
                        A specially designed panel for your ease.<br/><br/>
			
			You are advised to read the specifications and functionality of the module before using it.<br/>
                        This allows you to change the existing owners/buyers according to requirements felt necessary.<br/><br/>		
			
                        In case of any changes to be made in the panel contact developer.<br/>
                        Mandatory changes would be reflected in panel as soon as possible.
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
