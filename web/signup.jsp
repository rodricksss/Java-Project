<%-- 
    Document   : signup
    Created on : 18 Apr, 2014, 1:56:04 PM
    Author     : sony
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
		<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign Up</title>
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
        <div class="container">			
			<section class="main">
                            <form class="form-1" action="" method="post">
				    
                                    <p class="clearfix" style="padding-top: 80px; padding-left: 90px">
                                        <label for="reg1"><a href="planselect.jsp?identity=1">Sign Up as Property Owner</a></label>
                                    </p>
                                    <p class="clearfix" style="margin-left: 100px;">
                                        <label for="reg2"><a href="planselect.jsp?identity=2">Sign Up as Buyer</a></label>
                                    </p>
				      
				</form>​
			</section>
			
        </div>
    </body>
</html>
