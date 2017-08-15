<%-- 
    Document   : index
    Created on : 4 Apr, 2014, 10:47:36 PM
    Author     : sony
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<title>Home Page</title>
		<link rel="icon" href="images/logo.ico">
		<link rel="shortcut icon" href="images/logo.ico" />
		<link rel="stylesheet" href="css/style.css">
		<link rel="stylesheet" href="css/zerogrid.css" >
		<link rel="stylesheet" href="css/camera.css">
		<link rel="stylesheet" href="css/form.css">
		<link rel="stylesheet" href="css/responsive.css">
		<script src="js/jquery.js"></script>
		<script src="js/jquery-migrate-1.1.1.js"></script>
		<script src="js/superfish.js"></script>
		<script src="js/forms.js"></script>
		<script src="js/jquery.ui.totop.js"></script>
		<script src="js/jquery.equalheights.js"></script>
		<script src="js/jquery.easing.1.3.js"></script>
		<script src="js/jquery.ui.totop.js"></script>
		<script src="js/tms-0.4.1.js"></script>
		<script src="js/css3-mediaqueries.js"></script>

		<script>
			$(document).ready(function(){
				$('.slider_wrapper')._TMS({
					show:0,
					pauseOnHover:false,
					prevBu:'.prev',
					nextBu:'.next',
					playBu:false,
					duration:800,
					preset:'fade',
					pagination:true,//'.pagination',true,'<ul></ul>'
					pagNums:false,
					slideshow:8000,
					numStatus:false,
					banners: 'fade',
					waitBannerAnimation:false,
					progressBar:false
				});
			});
			$(document).ready(function(){
				!function(){
			var map=[]
			 ,names=[]
			 ,win=$(window)
			 ,header=$('header')
			 ,currClass
			$('.content').each(function(n){
			 map[n]=this.offsetTop
			 names[n]=$(this).attr('id')
			})
			win
			 .on('scroll',function(){
				var i=0
				while(map[i++]<=win.scrollTop());
				if(currClass!==names[i-2])
				currClass=names[i-2]
				header.removeAttr("class").addClass(names[i-2])
			 })
			}(); });
					function goToByScroll(id){
				$('html,body').animate({scrollTop: $("#"+id).offset().top},'slow');
				}
				$(document).ready(function(){
					$().UItoTop({ easingType: 'easeOutQuart' });
				});
		</script>
		<!--[if lt IE 8]>
			<div style=' clear: both; text-align:center; position: relative;'>
				<a href="http://windows.microsoft.com/en-US/internet-explorer/products/ie/home?ocid=ie6_countdown_bannercode">
					<img src="http://storage.ie6countdown.com/assets/100/images/banners/warning_bar_0000_us.jpg" border="0" height="42" width="820" alt="You are using an outdated browser. For a faster, safer browsing experience, upgrade for free today." />
				</a>
			</div>
		<![endif]-->
		<!--[if lt IE 9]>
			<script src="js/html5shiv.js"></script>
			<link rel="stylesheet" media="screen" href="css/ie.css">
		<![endif]-->
	</head>
	<body class="">
            
        <%
            response.setHeader("Cache-Control", "no-cache");
            response.setHeader("Cache-Control", "no-store");
            response.setHeader("Pragma", "no-cache");
            response.setDateHeader("Expires", 0);
        %>
<!--==============================header=================================-->
		<header class="page1">
			<div class="zerogrid">
				<div class="col-full">
					<div class="wrap-col">
						<div class="menu_block">
							<nav class="">
								<ul class="sf-menu">
									<li class="current men"><a onClick="goToByScroll('page1'); return false;" href="#">Home</a> <strong class="hover"></strong></li>
									<li class="men1"><a onClick="goToByScroll('page2'); return false;" href="#">About</a><strong class="hover"></strong></li>
									<li class="men2"><a onClick="goToByScroll('page3'); return false;" href="#">Services</a> <strong class="hover"></strong></li>
									<li class="men3"><a onClick="goToByScroll('page4'); return false;" href="#">Clients</a> <strong class="hover"></strong></li>
									<li class="men4"><a onClick="goToByScroll('page5'); return false;" href="#">Gallery</a> <strong class="hover"></strong></li>
                                                                        <li class="men5"><a onClick="goToByScroll('page6'); return false;" href="#">Contacts</a> <strong class="hover"></strong></li>
                                                                        <li>
                                                                            <table>
                                                                            <thead>
                                                                                <th><a class="button" href="loginpage.jsp">Sign In</a></th>
                                                                                <th><a class="button" href="signup.jsp">Sign Up</a></th>
                                                                            </thead>              
                                                                            </table>
                                                                        </li>
                                                                        
                                                                </ul>              
                
							</nav>
                                                    
                  
                                                    
							<div class="clear"></div>
                                                        
                
               
						</div>
                                            <h1><a href="#" onClick="goToByScroll('page1'); return false;"><img src="images/favicon.ico" width='100' height='60'></a></h1>                                          
                                 
					</div>                                            
                                            
				</div>
				<div class="clear"></div>                                           
                    
		</header>
                    
<!--=========================content================================-->
		<div id="page1" class="content">
			<div class="zerogrid">
				<div class="col-full">
					<div class="wrap-col">
						<div class="slider_wrapper">
							<ul class="items">
								<li>
									<img src="images/spacer.gif" alt="">
									<div class="caption banner">
										<h2>Your No. 1 Property Advisor..</h2>
									</div>
								</li>
								<li>
									<img src="images/spacer.gif" alt="">
									<div class="caption banner">
										<h2>Own The Home Meant For You !</h2>
									</div>
								</li>
								<li>
									<img src="images/spacer.gif" alt="">
									<div class="caption banner">
										<h2>The Power Tools To Sell Your Properties !</h2>
									</div>
								</li>
								<li>
									<img src="images/spacer.gif" alt="">
									<div class="caption banner">
										<h2>You Deserve The Best..</h2>
									</div>
								</li>
							</ul>
						</div>
						<div class="socials">
							<a href="https://www.facebook.com"></a>
							<a href="https://www.twitter.com"></a>
							<a href="https://plus.google.com"></a>
							<a href="https://in.linkedin.com"></a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="page2" class="content">
			<div class="zerogrid">
				<div class="col-full">
					<div class="wrap-col">
						<div class="slogan">
							<h3>Only Professional <a onClick="goToByScroll('page3'); return false;" href="#"><span>Services</span></a> for Our <a onClick="goToByScroll('page4'); return false;" href="#"><em>Clients</em></a></h3>
							<div class="text1">
							 ThinkAHome believes in providing best Services to their Clients. <br> Here we have our management team who put their best effort to make the clients satisfied and happy.
							</div>
						</div>
					</div>
				</div>
				<div class="col-1-4">
					<div class="wrap-col">
						<div class="box maxheight">
							<img src="images/box_img1.jpg" alt="">
							
							<div class="socials1">
								<div class="text1">Aarushi Sondhi<br/>Java Developer</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-1-4">
					<div class="wrap-col">
						<div class="box maxheight">
							<img src="images/box_img2.jpg" alt="">
							
							<div class="socials1">
								<div class="text1">Manpreet Singh<br/>Java Developer</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-1-4">
					<div class="wrap-col">
						<div class="box maxheight">
							<img src="images/box_img3.jpg" alt="">
							
							<div class="socials1">
							<div class="text1">Neha Goel<br/>Java Developer</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-1-4">
					<div class="wrap-col">
						<div class="box maxheight">
							<img src="images/box_img4.jpg" alt="">
							
							<div class="socials1">
                                                    <div class="text1">Lovepreet Kaur<br/>Java Developer</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="page3" class="content">
			<div class="zerogrid">
				<div class="col-full">
					<div class="wrap-col">
						<div class="slogan">
							<h3>Our Services</h3>
							<div class="text1">
							Services that we provide in the field of Selling Property, Buying Property, Property Advice.
							</div>
						</div>
					</div>
				</div>
				<div class="col-1-4">
					<div class="wrap-col">
						<div class="box maxheight1">
							<img src="images/sellingimg.jpg" alt="">
							<div class="text1"><a href="#">SELL PROPERTIES</a></div>Sell your valuable property through our ThinkAHome website because we value your property. 
						</div>
					</div>
				</div>
				<div class="col-1-4">
					<div class="wrap-col">
						<div class="box maxheight1">
							<img src="images/buyimg.jpg" alt="">
							<div class="text1"><a href="#">BUY PROPERTIES</a></div>Buy your dream property. ThinkAHome gives you a platform to come and see your dream property.
						</div>
					</div>
				</div>
				<div class="col-1-4">
					<div class="wrap-col">
						<div class="box maxheight1">
							<img src="images/newprojimg.jpg" alt="">
							<div class="text1"><a href="#">NEW PROJECTS</a></div>Get yourself updated to the new projects we are investing in and value your dreams through these projects.
						</div>
					</div>
				</div>
				<div class="col-1-4">
					<div class="wrap-col">
						<div class="box maxheight1">
							<img src="images/propertyadvice.jpg" alt="">
							<div class="text1"><a href="#">PROPERTY ADVICE</a></div>ThinkAHome provides you the best advice to sell your property and buy a property for you.
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="page4" class="content">
			<div class="zerogrid">
				<div class="col-full">
					<div class="wrap-col">
						<h3>Our Clients</h3>
					</div>
				</div>
				<div class="companies">
					<div class="col-1-4">
						<div class="wrap-col">
							<img src="images/client1.png" width="250" height="100" alt="">
							<div class="text1">DLF Building India</div>DLF offers 6,50,000 Sq. ft. of ready built workspace of global standards for IT/ITES companies an amenities block as part of the complex
							<br>
							<a href="http://www.dlf.in/dlf/wcm/connect/Offices/Offices/Offices+on+Lease/Projects/IT+SEZs+and+Parks/DLF+IT+Park,+Chandigarh/">Go to Site</a>
						</div>
					</div>
					<div class="col-1-4">
						<div class="wrap-col">
							<img src="images/client2.jpg" width="210" height="105" alt="">
							<div class="text1">Maya Garden City</div>Maya Garden City offer 1/2/3/4/5/6 BHK luxurious apartment options and it’s sizes are ranging from 610 sq feet to 4769 sq feet.
							<br>
							<a href="http://mayagardencity.propertywala.com/">Go to Site</a>
						</div>
					</div>
					<div class="col-1-4">
						<div class="wrap-col">
							<img src="images/client3.jpg" width="220" height="105" alt="">
							<div class="text1">MGM Grand </div>MGM Grand ideally located in Delhi in the Hospitality District of DIAL on a 5.03 acre land
							<br>
							<a href="http://www.bluecoast.in/#!mgm-grand-new-delhi/c19rf">Go to Site</a>
						</div>
					</div>
					<div class="col-1-4">
						<div class="wrap-col">
							<img src="images/client4.jpg" width="250" height="100" alt="">
							<div class="text1">Gillco Valley</div>
                                                       Paradise life on 400 Acres of prime land Perched atop a strong foundation of trust and admiration,Gillco Shares an expensive and strenuous profession.
							<br>
							<a href="http://www.gillcovalley.com/">Go to Site</a>
						</div>
					</div>
					<div class="clear"></div>
					<div class="col-1-4">
						<div class="wrap-col">
							<img src="images/client5.jpg" width="250" height="100" alt="">
							<div class="text1">Sebiz Infotech</div>Sebiz Infotech situated at sector 67, Mohali has different offices in it.
							<br>
							<a href="http://www.sebiz.net/">Go to Site</a>
						</div>
					</div>
					<div class="col-1-4">
						<div class="wrap-col">
							<img src="images/client6.gif" width="250" height="100" alt="">
							<div class="text1">Fashion Technology Park</div> Fashion Technology Park is constructed on 13.76 acres to cater to infrastructure needs of the fashion houses, exporters, research units, manufacturers, designers etc.
							<br>
							<a href="http://www.ftpmohali.com/">Go to Site</a>
						</div>
					</div>
					<div class="col-1-4">
						<div class="wrap-col">
							<img src="images/client7.jpg"  height='120' width='175' alt="">
							<div class="text1">KPMG</div>KPMG in India, recognize that major global companies with operations in many countries around the world.
							<br>
							<a href="http://www.kpmg.com/in/en/industry/Pages/default.aspx">Go to Site</a>
						</div>
					</div>
					<div class="col-1-4">
						<div class="wrap-col">
                                                    <img src="images/client8.jpg" height='120' width='180'  alt="">
							<div class="text1">North Country Mall</div>North Country Mall situated at Mohali is North India's biggest mall.
							<br>
							<a href="http://www.northcountrymall.com/">Go to Site</a>
						</div>
					</div>
				</div>
			</div>
		</div>
<div id="page5" class="content">
			<div class="zerogrid">                                                      
				<div class="col-full">
                                    <div class="wrap-col">
                                        <div class="slogan">
                                    <h3>Our Gallery</h3>
                                    <div class="text1">We provide you the best of comfort and luxurious infrastructure with well furnished lush free environment.</div><br>
                                    <div class="text1">Here is what are you going to get. You deserve it when you can afford it.</div><br>
                                    <div class="text1">All this available at reasonable and marginal rates.</div><br>
                                    <div class="text1">Own property at government approved prices. No more no less.</div>
                                        </div>
                                    </div>
                                </div>                             
                        </div>
    <div class="clear"></div>
        <div class="homes">            
            <marquee behavior="alternate">                                  
                <img src="images/1.jpg" heigth="1200" width="1100">
                <img src="images/2.jpg" heigth="1200" width="1100">
                <img src="images/3.jpg" heigth="1200" width="1100">
                <img src="images/4.jpg" heigth="1200" width="1100">                
            </marquee> 
            
            <a class="buttong" href="gallery.jsp">Go to Gallery</a>
            <div class="clear"></div>
        </div>   
    </div>



<div class="clear"></div>

		<div id="page6" class="content">
			<div class="zerogrid">
				<div class="col-full">
					<div class="wrap-col">
						<div class="slogan">
							<h3>Get in Touch</h3>
							<div class="text1">
								Customer's satisfaction is our first priority and we believe in customers feedback and suggestions.
							</div>
						</div>
					</div>
				</div>
				<div class="clear"></div>
				<div class="map">
					<div class="col-1-4">
						<div class="wrap-col">
							<div class="text1">Address</div>
							<address>
								<dl>
									<dt>ThinkAHome<br>
									<br>
							                Chandigarh (Union Territory)
									</dt>
									<dd><span>Contact 1:</span>+91 9501043255</dd>
									<dd><span>Contact 2:</span>+91 9888550858 </dd>
									
									<dd>E-mail: <a href="#" class="link-1">thinkahome@gmail.com</a></dd>
									<dd>Skype: <a href="#" class="link-1">thinkahomeskype</a></dd>
								</dl>
							</address>
						</div>
					</div>
					<div class="col-1-4">
						<div class="wrap-col">							                                                      
                                                            
                                                            <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
                                                            <div style="overflow:hidden;height:350px;width:260px;">
                                                                <div id="gmap_canvas" style="height:350px;width:260px;"></div>
                                                                <a class="google-map-code" href="http://www.map-embed.com" id="get-map-data">map-embed.com</a>
                                                                <style>#gmap_canvas img{max-width:none!important;background:none!important}</style>
                                                                <a class="google-map-data" href="http://www.staubers.de" id="get-map-data">sie es sehen koennen</a>
                                                            </div>
                                                            <script type="text/javascript"> function init_map(){var myOptions = {zoom:14,center:new google.maps.LatLng(30.7333148,76.7794179),mapTypeId: google.maps.MapTypeId.ROADMAP};map = new google.maps.Map(document.getElementById("gmap_canvas"), myOptions);marker = new google.maps.Marker({map: map,position: new google.maps.LatLng(30.7333148, 76.7794179)});infowindow = new google.maps.InfoWindow({content:"<b>Chandigarh</b><br/><pre>Sector 17<br/>Chandigarh</pre>" });google.maps.event.addListener(marker, "click", function(){infowindow.open(map,marker);});infowindow.open(map,marker);}google.maps.event.addDomListener(window, 'load', init_map);</script>							
						</div>
					</div>
					<div class="col-2-4">
						<div class="wrap-col">
							<div class="text1">Ask a Question</div>
                                                        <form id="form" action="AskQuestion" method="post" name="form">
							<fieldset>                                                            
                                                        <label class="email">
                                                            <input type="text" name="email" value="E-mail:" autocomplete="off">
                                                        <br class="clear">
							<span class="error error-empty">*This is not a valid email address.</span><span class="empty error-empty">*This field is required.</span> </label>
							<label class="password">
                                                            <input type="text" name="pwd" value="Password:" autocomplete="off">
                                                        <br class="clear">
							<span class="error error-empty">*This is not a valid password.</span><span class="empty error-empty">*This field is required.</span> </label>	
							<label class="message">
                                                            <textarea name="msg">Message:</textarea>                                              
							<br class="clear">
							<span class="error">*The message is too short.</span> <span class="empty">*This field is required.</span> </label>
							<div class="clear"></div>
                                                        <div class="btns">
                                                        <a type="submit" class="link1" onclick="document.forms['form'].submit();">Send</a>
							<div class="clear"></div>
							</div></fieldset></form>
						</div>
					</div>
					<div class="clear"></div>
				</div>
			</div>
		</div>
<!--==============================footer=================================-->
		<footer>
			<div class="zerogrid">
				<div class="col-full">
					<div class="wrap-col">
						<div class="copy">
                                                    <a onClick="goToByScroll('page1'); return false;" href="#"><img src="images/logo.ico" height='120' width='120' alt=""></a>&nbsp;&nbsp; &copy; 2014 | <a href="#">Privacy Policy
						</div>
					</div>
				</div>
				<div class="clear"></div>
			</div>
		</footer>
	</body>
</html>