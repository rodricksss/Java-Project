<%-- 
    Document   : loginpage
    Created on : 23 Apr, 2014, 8:11:54 PM
    Author     : sony
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
	<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        <title>Login Page</title>
       
        <meta name="keywords" content="css3, login, form, custom, input, submit, button, html5, placeholder" />
        
        <link rel="shortcut icon" href="../favicon.ico"> 
        <link rel="stylesheet" type="text/css" href="css/stylelogin.css"/>
		<script src="js/modernizr.custom.63321.js"></script>
		<!--[if lte IE 7]><style>.main{display:none;} .support-note .note-ie{display:block;}</style><![endif]-->
		<style>
			@import url(http://fonts.googleapis.com/css?family=Ubuntu:400,700);
			body 
                        {
				background: url(images/blurred.jpg) no-repeat center top;
				-webkit-background-size: cover;
				-moz-background-size: cover;
				background-size: cover;
			}
			.container > header h1,.container > header h2 
                        {
				color: #fff;
				text-shadow: 0 1px 1px rgba(0,0,0,0.7);
			}
		</style>
                                    
    </head>
    <body>
        <%
                    response.setHeader("Cache-Control", "no-cache");
                    response.setHeader("Cache-Control", "no-store");
                    response.setHeader("Pragma", "no-cache");
                    response.setDateHeader("Expires", 0);

        %>
        

        <div class="container">			
			<section class="main">
                            <form class="form-1" action="LoginCheckServlet" method="post">
				    <p class="clearfix">
				        <label for="login">Username</label>
                                        <input type="text" name="login" id="login"  value="Username" autocomplete="off" onfocus="if(this.value=='Username'){this.value='';}" onblur="if(this.value==''){this.value='Username';}">
				    </p>
				    <p class="clearfix">
				        <label for="password">Password</label>
				        <input type="password" name="password" id="password" value="Password" onfocus="if(this.value=='Password'){this.value='';}" onblur="if(this.value==''){this.value='Password';}"> 
				    </p>
				    <p class="clearfix">
                                        
				        
				    </p>
                                    
                                    <p class="clearfix">
                                        <label for="forgot"><a href="forgotpassword.jsp">Forgot Password?</a></label>
                                    </p>
				    <p class="clearfix">
                                        <input type="submit" name="submit" value="Sign In"/>
				    </p> 
                                    <p class="clearfix">
                                        <label for="goto"><a href="index.jsp">Go To Home Page</a></label>
                                    </p>
				</form>​
			</section>
			
        </div>
    </body>
</html>