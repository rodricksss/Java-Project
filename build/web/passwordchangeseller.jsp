<%-- 
    Document   : passwordchangeseller
    Created on : 30 Apr, 2014, 4:21:27 PM
    Author     : sony
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Seller Page</title>
    </head>
    <body>
         <%!
            RequestDispatcher rd;
        %>
        <script>
            function checkPass()
            {   
                var str1=document.getElementById("newpass1");
                var str2=document.getElementById("newpass2");
                if(str1.value==str2.value)
                {
    
                    document.getElementById("para1").innerHTML="Matched.";
                    document.getElementById("para2").innerHTML="Matched.";
                   
                    //alert("Both Strings Match");
                    
                }
                else
                {
                    document.getElementById("para").innerHTML="Not Matched.";
                    alert("Fill correct 'New password' and 'Re-type Password' fields.");
                    document.getElementById("newpass1").value="";
                    document.getElementById("newpass2").value="";
                    document.getElementById("para").innerHTML="";
                    
                    str1.focus();
                }
     
            }
        </script>
        
        <%
            HttpSession sess = request.getSession();
        %>
        
    </head>
    <body>
        
        <%@include file="masterseller.jsp" %>       
       
            
        <div id="content-outer">
<!-- start content -->
<div id="content">

	<!--  start page-heading -->
	<div id="page-heading">
		<h1>Change Password </h1>
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
			<h2>   <img src="SellerImageDisplay" id="photo" height="130" width="130" alt="images/imageicon.jpg"/>
            
                        </h2>
			<h3><%=sess.getAttribute("sellerid")%></h3>
			
			
                        <form action="ChangePwdServletSeller" method="post" name="form">
		<table border="0" cellpadding="0" cellspacing="0"  id="id-form">
		<tr>
			<th valign="top">Current Password:</th>
                        <td><input type="password" class="inp-form" name="oldpass" autocomplete="off"/></td>
			<td></td>
                        
		</tr>
                <tr>
			<th valign="top">New Password:</th>
                        <td><input id="newpass1" type="password" class="inp-form" name="newpass" autocomplete="off"/></td>
                        <td><font style="color: green"><b><p style="padding: 10px;" id="para1"></p></b></font></td>
		</tr>
                <tr>
			<th valign="top">Re-type Password:</th>
                        <td><input id="newpass2" type="password" class="inp-form" name="newpass" autocomplete="off" onblur="checkPass()"/></td>
			<td><font style="color: green"><b><p style="padding: 10px;" align="right" id="para2"></p></b></font></td>
		
                </table>
                
                <table>
                    <thead>
                        <th>
                            <font style="color: red"><b><div id="para"></div></b></font><br/>
                                                        
                        <input type="button" value="Change" onclick="document.forms['form'].submit();" class="btn btn-blue"/>
                            </form>
                        </th>
                    </thead>
                </table>
               
			
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
