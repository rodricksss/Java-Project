<%-- 
    Document   : index
    Created on : 26 Apr, 2014, 9:41:22 AM
    Author     : Mannu
--%>

<%@page import="connections.MyConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration</title>
    <link rel="stylesheet" type="text/css" href="signup/css/style.css" media="all" />
    <script language="javascript" src="js/ajax.js" type="text/javascript"></script>
	
    <script type="text/javascript" src="js/jquery/jquery.1.4.1.min.js"></script>
    <script type="text/javascript" src="js/jquery/jquery.1.8.6.ui.min.js"></script>
    
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js"></script>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.6/jquery-ui.min.js"></script>
    <script type="text/javascript" src="signup/js/jquery.inputfocus-0.9.min.js"></script>
    <script type="text/javascript" src="signup/js/jquery.main1.js"></script>
    <script type="text/javascript" src="signup/js/jquery.inputfocus-0.9.min.js"></script>
    <script type="text/javascript" src="signup/js/jquery-1.7.2.min"></script>
    
    
<!--  date picker script -->
<link rel="stylesheet" href="signup/calander/css/datePicker.css" type="text/css" />
<script src="signup/calander/js/jquery/date.js" type="text/javascript"></script>
<script src="signup/calander/js/jquery/jquery.datePicker.js" type="text/javascript"></script>
<script type="text/javascript" charset="utf-8">
        $(function()
{

// initialise the "Select date" link
$('#date-pick')
	.datePicker(
		// associate the link with a date picker
		{
			createButton:false,
			startDate:'01/01/1980',
			endDate:'31/12/2014'
		}
	).bind(
		// when the link is clicked display the date picker
		'click',
		function()
		{
			updateSelects($(this).dpGetSelected()[0]);
			$(this).dpDisplay();
			return false;
		}
	).bind(
		// when a date is selected update the SELECTs
		'dateSelected',
		function(e, selectedDate, $td, state)
		{
			updateSelects(selectedDate);
		}
	).bind(
		'dpClosed',
		function(e, selected)
		{
			updateSelects(selected[0]);
		}
	);
	
var updateSelects = function (selectedDate)
{
	var selectedDate = new Date(selectedDate);
	$('#d option[value=' + selectedDate.getDate() + ']').attr('selected', 'selected');
	$('#m option[value=' + (selectedDate.getMonth()+1) + ']').attr('selected', 'selected');
	$('#y option[value=' + (selectedDate.getFullYear()) + ']').attr('selected', 'selected');
}
// listen for when the selects are changed and update the picker
$('#d, #m, #y')
	.bind(
		'change',
		function()
		{
			var d = new Date(
						$('#y').val(),
						$('#m').val()-1,
						$('#d').val()
					);
			$('#date-pick').dpSetSelected(d.asString());
		}
	);

// default the position of the selects to today
var today = new Date();
//updateSelects(today.getTime());

// and update the datePicker to reflect it...
$('#d').trigger('change');
});
</script>
    
</head>
<body>
    
        <%        
            ResultSet rs = null;
        %>     
        
	<div id="container">
            
            <form action="RegistrationServlet" method="post" name='regform'>
	
            <!-- #first_step -->
            <div id="first_step">
                <h1 class="line_strait">SIGN UP FOR A FREE <strong><font style="color:#4598EF">ThinkAHome</font></strong> ACCOUNT</h1>
                <div class="form">
                    <input type="text" name="username" id="username" value="Username" autocomplete="off" onfocus="if(this.value=='Username'){this.value='';}" onblur="if(this.value==''){this.value='Username';}"/>
                    <label for="username">At least 4 characters. Uppercase letters, lowercase letters and numbers only.</label>
                                       
                    <input type="password" name="password" id="password" value="Password" onfocus="if(this.value=='Password'){this.value='';}" onblur="if(this.value==''){this.value='Password';}"/>
                    <label for="password">At least 4 characters. Use a mix of upper and lowercase for a strong password.</label>
                                        
                    <input type="password" name="cpassword" id="cpassword" value="Password" onfocus="if(this.value=='Password'){this.value='';}" onblur="if(this.value==''){this.value='Password';}"/>
                    <label for="cpassword">If your passwords aren’t equal, you won’t be able to continue with signup.</label>
                    
                </div>      <!-- clearfix --><div class="clear"></div><!-- /clearfix -->
                <input class="submit1" type="Button" name="submit_first" id="submit_first" value="" />
            </div>      <!-- clearfix --><div class="clear"></div><!-- /clearfix -->


            <!-- #second_step -->
            <div id="second_step">
                <h1 class="line_strait">SIGN UP FOR A FREE <strong><font style="color:#4598EF">ThinkAHome</font></strong> ACCOUNT</h1>

                <div class="form">
                    <input type="text" name="firstname" id="firstname" value="First Name" autocomplete="off" onfocus="if(this.value=='First Name'){this.value='';}" onblur="if(this.value==''){this.value='First Name';}"/>
                    <label for="firstname">Your First Name. </label>
                    <input type="text" name="lastname" id="lastname" value="Last Name" autocomplete="off" onfocus="if(this.value=='Last Name'){this.value='';}" onblur="if(this.value==''){this.value='Last Name';}"/>
                    <label for="lastname">Your Last Name. </label>
                    <input type="text" name="email" id="email" value="Email Address" autocomplete="off" onfocus="if(this.value=='Email Address'){this.value='';}" onblur="if(this.value==''){this.value='Email Address';}"/>
                    <label for="email">Your Email Address. We send important administration notices to this address.</label>                    
                </div>      <!-- clearfix --><div class="clear"></div><!-- /clearfix -->
                <input class="submit_to_prev" type="Button" name="submit_back_tofirst" id="submit_back_tofirst" value="" />
              <input class="submit_to_next" type="Button" name="submit_second" id="submit_second" value="" />
                
          </div>      <!-- clearfix --><div class="clear"></div><!-- /clearfix -->


            <!-- #third_step -->
            <div id="third_step"> 
                <h1>SIGN UP FOR A FREE <strong><font style="color:#4598EF">ThinkAHome</font></strong> ACCOUNT</h1>

                <div class="form">
				
				<select id="d" name="d" class="styledselect-day">
					<option value="" disabled selected class="s">day</option>
					 <% for(int i=1;i<31;i++)
                                                {%>
                                                <option value="<%= i %>"><%= i %></option>
                                                <% } %>
				</select>
				
					<select id="m" name="m" class="styledselect-month">
						<option value="" disabled selected class="s">month</option>
						<option value="1">Jan</option>
						<option value="2">Feb</option>
						<option value="3">Mar</option>
						<option value="4">Apr</option>
						<option value="5">May</option>
						<option value="6">Jun</option>
						<option value="7">Jul</option>
						<option value="8">Aug</option>
						<option value="9">Sep</option>
						<option value="10">Oct</option>
						<option value="11">Nov</option>
						<option value="12">Dec</option>
					</select>
				
					<select  id="y" name="y" class="styledselect-year">
						<option value="" disabled selected class="s">year</option>
                                                <% for(int i=1980;i<2015;i++)
                                                {%>
                                                <option value="<%= i %>"><%= i %></option>
                                                <% } %>
                                          
					</select>
				
				<a href=""  id="date-pick"><img src="signup/images/icon_calendar.jpg" alt="Calander" style="margin-right: 4px;margin-top: 16px;padding: 3px;width: 30px;"/></a>
			
		
                    <label for="age">Your age range. </label> <!-- clearfix --><div class="clear"></div><!-- /clearfix -->
					
		    <select id="gender" name="gender">
			<option value="" disabled selected class="s">gender</option>
                        <option>Male</option>
                        <option>Female</option>
                        <option>Others</option>
                    </select>
                    <label for="gender">Your Gender. </label> <!-- clearfix --><div class="clear"></div><!-- /clearfix -->
                    
		<input type="text" name="landline" id="landline" value="Landline No" autocomplete="off" onfocus="if(this.value=='Landline No'){this.value='';}" onblur="if(this.value==''){this.value='Landline No';}"/>
		<label for="landline">Your Residence Number.</label> <!-- clearfix --><div class="clear"></div><!-- /clearfix -->
                    
                </div>      <!-- clearfix --><div class="clear"></div><!-- /clearfix -->
                <input class="submit_to_prev" type="Button" name="submit_back_tosecond" id="submit_back_tosecond" value="" />
                <input class="submit_to_next" type="Button" name="submit_third" id="submit_third" value="" />
                
                
            </div>      <!-- clearfix --><div class="clear"></div><!-- /clearfix-->
            
            
            
			<!-- #fourth_step -->
            <div id="fourth_step">
                <h1 class="line_strait">SIGN UP FOR A FREE <strong><font style="color:#4598EF">ThinkAHome</font></strong> ACCOUNT</h1>

                <div class="form">
                    
                    <select id="" name="stateid" onchange="getcity(this.value)">
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
                    MyConnection.pst.close();
                %>
                    </select>
                    <label for="state">Your State. </label> <!-- clearfix --><div class="clear"></div><!-- /clearfix -->
					
                    <select id="txtCity" name="cityid">
                        <option value="" disabled selected class="s">-- Select City --</option>
                        
                    </select>
		<label for="city">Your City. </label> <!-- clearfix --><div class="clear"></div><!-- /clearfix -->
					
                  					
		<select id="" name="securityid">
		<option value="" disabled selected class="s">-- Question --</option>
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
                    </select>
                    <label for="security">Your Security Question.</label> <!-- clearfix --><div class="clear"></div><!-- /clearfix -->
					
                </div>      <!-- clearfix --><div class="clear"></div><!-- /clearfix -->
                <input class="submit_to_prev" type="Button" name="submit_back_tothird" id="submit_back_tothird" value="" />
                <input class="submit_to_next" type="Button" name="submit_fourth" id="submit_fourth" value="" />
                          
            </div>	<!-- clearfix --><div class="clear"></div><!-- /clearfix-->
			
			
			<!-- #fifth_step -->
            <div id="fifth_step">
                <h1 class="line_strait">SIGN UP FOR A FREE <strong><font style="color:#4598EF">ThinkAHome</font></strong> ACCOUNT</h1>

                <div class="form">
                    <input type="text" name="answer" id="answer" value="Answer" autocomplete="off" onfocus="if(this.value=='Answer'){this.value='';}" onblur="if(this.value==''){this.value='Answer';}"/>
                    <label for="answer">Your Answer. </label>
                    <input type="text" name="address" id="address" value="Address" autocomplete="off" onfocus="if(this.value=='Address'){this.value='';}" onblur="if(this.value==''){this.value='Address';}"/>
                    <label for="address">Your Address. </label>
                    <input type="text" name="mobile" id="mobile" value="Mobile" autocomplete="off" onfocus="if(this.value=='Mobile'){this.value='';}" onblur="if(this.value==''){this.value='Mobile';}"/>
                    <label for="mobile">Your Mobile. </label>              
                </div>      <!-- clearfix --><div class="clear"></div><!-- /clearfix -->
                <input class="submit_to_prev" type="Button" name="submit_back_tofourth" id="submit_back_tofourth" value="" />
              <input class="submit_to_next" type="Button" name="submit_fifth" id="submit_fifth" value="" />
                
          </div>      <!-- clearfix --><div class="clear"></div><!-- /clearfix -->

            <!-- #sixth_step -->
            <div id="sixth_step">
                <h1>YOUR <span>ThinkAHome</span> ACCOUNT IS CREATED</h1>

                <div class="form">
                    <h2>Summary</h2>
                    
                    <table>
                        <tr><td>Username</td><td></td></tr>
                        <tr><td>Password</td><td></td></tr>
                        <tr><td>Email</td><td></td></tr>
                        <tr><td>Name</td><td></td></tr>
                        <tr><td>Date of Birth</td><td></td></tr>
                        <tr><td>Gender</td><td></td></tr>
                        <tr><td>Mobile</td><td></td></tr>
                    </table>
                </div>      <!-- clearfix --><div class="clear"></div><!-- /clearfix -->
                
                <input type="hidden" value="<%= Integer.parseInt(request.getParameter("planid")) %>" name="planid"/>
               
                
                
                <input type="hidden" value="Send" name="submit_sixth"/>
                <input class="send submit1" onclick="document.forms['regform'].submit();"/>    
            </div>
                

            
        </form>
	</div>
	<div id="progress_bar">
        <div id="progress"></div>
        <div id="progress_text">0% Complete</div>
	</div>
	
</body>
</html>