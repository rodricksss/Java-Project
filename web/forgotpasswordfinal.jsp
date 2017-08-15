<%-- 
    Document   : forgotpasswordfinal
    Created on : 20 Apr, 2014, 2:09:16 PM
    Author     : sony
--%>

<%@page import="connections.MyConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
        <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        <meta name="keywords" content="css3, login, form, custom, input, submit, button, html5, placeholder" />
        <!--[if lte IE 7]><style>.main{display:none;} .support-note .note-ie{display:block;}</style><![endif]-->
        <link rel="shortcut icon" href="../favicon.ico"> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Forgot Password Page 2</title>
        <link rel="stylesheet" type="text/css" href="css/stylelogin.css"/>
        <script src="js/modernizr.custom.63321.js"></script>
                <style>
                        @import url(http://fonts.googleapis.com/css?family=Ubuntu:400,700);
                        body 
                        {
				background: url(images/blurred.jpg) no-repeat center top;
				-webkit-background-size: cover;
				-moz-background-size: cover;
				background-size: cover;
			}
			
                </style>
    </head>
    <body>
        <%
            HttpSession sess=request.getSession();
            String uname=(String)sess.getAttribute("uname");
            String email=(String)sess.getAttribute("email");
        %>
        <%
            RequestDispatcher rd;
            try
            {               
                String str=request.getParameter("button");
                if(str.equals("Send Mail"))
                {
                    rd=request.getRequestDispatcher("EmailServlet");
                    rd.include(request, response);
                    return;
                }
                if(str.equals("Go Back"))
                {
                    response.sendRedirect("forgotpassword.jsp");
                }
            }
            catch(Exception e)
            {
                System.out.println(e);
            }
        %>
        <div class="container">			
			<section class="main">
                            <form class="pwd2" action="" method="post">
                                    <p class="clearfix">
				        <label>From</label>
				        <input type="text" value="<%=uname%>" disabled/>
				    </p>
                                    <input type="hidden" name="from" value="<%=uname%>"/>
				    <p class="clearfix">
				        <label>To</label>
				        <input type="text" value="<%=email%>" disabled/>
				    </p>
                                    <input type="hidden" name="to" value="<%=email%>"/>
                                    <p class="clearfix">
                                        <label for="message">Enter Alternate Email & Password:</label>
                                    </p>
                                    <p class="clearfix">
				        <label>Email:</label>
				        <input type="text" name="altemail" value="Email" autocomplete="off" onfocus="if(this.value=='Email'){this.value='';}" onblur="if(this.value==''){this.value='Email';}"/>
				    </p>
                                    <p class="clearfix">
				        <label>Password:</label>
                                        <input type="password" name="altpass" value="Password" autocomplete="off" onfocus="if(this.value=='Password'){this.value='';}" onblur="if(this.value==''){this.value='Password';}"/>
				    </p>
				    <p class="clearfix">
				        <input type="submit" name="button" value="Send Mail">   
                                        <input type="submit" name="button" value="Go Back">
				    </p> 
				</form>​
   			</section>
        
    </body>
</html>
