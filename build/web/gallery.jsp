<%-- 
    Document   : index
    Created on : 3 May, 2014, 6:06:21 PM
    Author     : sony
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="connections.MyConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<style>
#flip
{
    cursor: pointer;
}
#panel
{
padding:5px;
text-align:center;
background: #cedb32;
border:solid 1px #c3c3c3;
}
#panel
{
padding:50px;
display:none;
}
th
{                          
    height: 30px;                                           
    line-height: 2em;
    background: #645954;
    font-size: 0.8725em;
    text-align: center;
    width: 400px;
    color: #ffffff;                     
}
tr
{
    background: #d14;
}

</style>

<script> 
$(document).ready(function(){
  $("#flip").click(function(){
    $("#panel").slideToggle("slow");
  });
});
</script>

        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gallery Page</title>
        <style>
        .buttong
        {
        margin-top: 50px;
	color: #FFF;
	font-size: 1em;
        font-family: inherit; 
	padding: 0.8em;
	display: inline-block;
	background: #d14;
        }

        .buttong:hover
        {
	background:#363638;
	color: gold;
        }

        </style>
 <link href="slidercss/style_slider.css" rel="stylesheet" type="text/css" media="all" />      
<!--slider-->
<link href="slidercss/camera_slider.css" rel="stylesheet" type="text/css" media="all" />
    <script type='text/javascript' src='sliderjs/jquery.min.slider.js'></script>
    <script type='text/javascript' src='sliderjs/jquery.mobile.customize.min.js'></script>
    <script type='text/javascript' src='sliderjs/jquery.ease.1.3.js'></script> 
    <script type='text/javascript' src='sliderjs/camera.min.slider.js'></script> 
    
        <script>
		jQuery(function(){
			
			jQuery('#camera_wrap_1').camera({
				thumbnails: true
			});

			jQuery('#camera_wrap_2').camera({
				height: '400px',
				loader: 'bar',
				pagination: false,
				thumbnails: true
			});
		});
	</script>
        <!--start lightbox -->
<link rel="stylesheet" type="text/css" href="slidercss/jquery.lightbox.slider.min.css">
<script src="sliderjs/jquery.lightbox.slider.js"></script>
<script>
  // Initiate Lightbox
  $(function() {
    $('.gallery a').lightbox(); 
  });
</script>
    </head>
    <body style="background-color: #a90329;">        
     
        <div class="wrapper_slider">
        <div class="wrap">
        <div class="wrap_inner">
            
            <!-- #camera_wrap_1 -->
	<div class="fluid_container">
        <div class="camera_wrap_slider camera_azure_skin" id="camera_wrap_1">
            <div data-thumb="images/thumbs/slider1.jpg" data-src="images/slider/slider1.jpg">
            </div>
            <div data-thumb="images/thumbs/slider2.jpg" data-src="images/slider/slider2.jpg">
            </div>
            <div data-thumb="images/thumbs/slider3.jpg" data-src="images/slider/slider3.jpg">
            </div>
            <div data-thumb="images/thumbs/slider4.jpg" data-src="images/slider/slider4.jpg">
            </div>  
            <div data-thumb="images/thumbs/5.jpg" data-src="images/slider/5.jpg">
            </div> 
            <div data-thumb="images/thumbs/6.jpg" data-src="images/slider/6.jpg">
            </div> 
            <div data-thumb="images/thumbs/7.jpg" data-src="images/slider/7.jpg">
            </div> 
            <div data-thumb="images/thumbs/8.jpg" data-src="images/slider/8.jpg">
            </div> 
             </div><!-- #camera_wrap_1 -->
         <div class="clear"></div>
	</div>
            
            <!-- end #camera_wrap_1 -->
            
            <div class="grids_1_of_3">
				<div class="grid_1_of_3 images_1_of_3 bg1">
					 <h3>Picture 1</h3>
					<div class="gallery">
						<a href="images/pic1.jpg"><img src="images/pic1.jpg" title="pic1.jpg"></a>
					</div>
					  <p>Interior designing done by professionals who are hired specially. Effort made to give a unique quality space for living.</p>
					<div class="plus_btn">
						<span></span>
					</div>
				</div>
				<div class="grid_1_of_3 images_1_of_3 bg2">
					 <h3>Picture 2</h3>
					<div class="gallery">
						<a href="images/pic2.jpg"><img src="images/pic2.jpg" title="pic2.jpg"></a>
					</div>
					  <p>Offices designed with all equipped furniture and enough required area left for setting up office desks and other furniture.</p>
	 		   		<div class="plus_btn">
						<span></span>
					</div>
				</div>
				<div class="grid_1_of_3 images_1_of_3 bg3">
					 <h3>Picture 3</h3>
					<div class="gallery">
						<a href="images/pic3.jpg"><img src="images/pic3.jpg" title="pic3.jpg"></a>
					</div>
					  <p>Airy and spacious bedrooms with full ventilation facility. Good view of outside that is free from all sorts of pollution.</p>
				 	<div class="plus_btn">
						<span></span>
					</div>
				</div>
					<div class="clear"></div>
                                        
            <input type="button" id="flip" class="buttong" value="Show/Hide Sold Property"/>
            
            <div id="panel">
                
                <table border="1" style="margin: 0px auto;">                    
                    <thead>                       
                        <th style="padding-top: 10px;">Property</th>
                        <th style="width: 200px; padding-top: 10px;">Price</th>                       
                    </thead> 
                    <tbody>
                        <%
                            ResultSet rs;
                            MyConnection.pst.close();
                            MyConnection.pst=MyConnection.con.prepareStatement("select p.property_id, p.price from property p join images i on i.property_id=p.property_id where know_status='sold'");
                            rs=MyConnection.pst.executeQuery();
                            while(rs.next())
                            {
                                int id=rs.getInt(1);
                        %> 
                        <tr>                                                   
                            <td><img src="soldproperty.jsp?id=<%=id%>" height='200px' width='300px' style="padding-top: 20px; padding-bottom: 20px"/></td>  
                            <td style="color: whitesmoke; padding-bottom: 10px"><img src="images/rupee.png" height='40px' width='30px'/><b><%=rs.getFloat(2)%></b></td>
                        </tr>
                        <%
                            }
                            MyConnection.pst.close();
                        %>
                        
                    </tbody>
                </table>
            </div>
            <div class="clear"></div>

		</div>   
<div style="background-color: black; width: 480px; height: 410px; margin: 0px auto">
<video width="470" height="400" controls="controls" autoplay="autoplay">
<source src="video/video.mp4" type="video/mp4"/>
<object data="" width="470" height="400">
<embed width="470" height="400" src="video/video.mp4"/>
</object>
</video>
</div>
            
        </div>
        </div>
        </div>
    </body>
</html>
