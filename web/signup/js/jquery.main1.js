$(function(){
    //original field values
    var field_values = {
            //id        :  value
            'username'  : 'username',
            'password'  : 'password',
            'cpassword' : 'password',
            'firstname'  : 'first name',
            'lastname'  : 'last name',
            'email'  : 'email address',
			'landline':'landline',
			'mobile':'mobile',
			'answere':'answere'
			
    };


    //inputfocus
    $('input#username').inputfocus({ value: field_values['username'] });
    $('input#password').inputfocus({ value: field_values['password'] });
    $('input#cpassword').inputfocus({ value: field_values['cpassword'] }); 
    $('input#lastname').inputfocus({ value: field_values['lastname'] });
    $('input#firstname').inputfocus({ value: field_values['firstname'] });
    $('input#email').inputfocus({ value: field_values['email'] }); 
	$('input#address').inputfocus({ value: field_values['address'] }); 
	$('input#mobile').inputfocus({ value: field_values['mobile'] });
	$('input#answere').inputfocus({ value: field_values['answere'] });
	



    //reset progress bar
    $('#progress').css('width','0');
    $('#progress_text').html('0% Complete');

    //first_step
    $('form').submit(function(){ return false; });
    $('#submit_first').click(function(){
        //remove classes
        $('#first_step input').removeClass('error').removeClass('valid');

        //ckeck if inputs aren't empty
        var fields = $('#first_step input[type=text], #first_step input[type=password]');
        var error = 0;
        fields.each(function(){
            var value = $(this).val();
            if( value.length<4 || value==field_values[$(this).attr('id')] ) {
                $(this).addClass('error');
                $(this).effect("shake", { times:3 }, 50);
                
                error++;
            } else {
                $(this).addClass('valid');
            }
        });        
        
        if(!error) {
            if( $('#password').val() != $('#cpassword').val() ) {
                    $('#first_step input[type=password]').each(function(){
                        $(this).removeClass('valid').addClass('error');
                        $(this).effect("shake", { times:3 }, 50);
                    });
                    
                    return false;
            } else {   
                //update progress bar
                $('#progress_text').html('20% Complete');
				$('#progress').css('width','68px');
                
                //slide steps
                $('#first_step').slideUp();
                $('#second_step').slideDown();
                             
            }               
        } else return false;
    });

//Move back to first slide
$('#submit_back_tofirst').click(function()
{
 	$('#progress_text').html('0% Complete');
	  $('#progress').css('width','0');
                
                //slide steps
	  $('#second_step').slideUp(); 
                $('#first_step').slideDown(); 
});
                

    $('#submit_second').click(function(){
        //remove classes
        $('#second_step input').removeClass('error').removeClass('valid');

        var emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;  
        var fields = $('#second_step input[type=text]');
        var error = 0;
        fields.each(function(){
            var value = $(this).val();
            if( value.length<1 || value==field_values[$(this).attr('id')] || ( $(this).attr('id')=='email' && !emailPattern.test(value) ) ) {
                $(this).addClass('error');
                $(this).effect("shake", { times:3 }, 50);
                
                error++;
            } else {
                $(this).addClass('valid');
            }
        });

        if(!error) {
                //update progress bar
                $('#progress_text').html('40% Complete');
                $('#progress').css('width','136px');
                
                //slide steps
                $('#second_step').slideUp();
                $('#third_step').slideDown();     
        } else return false;

    });
	
	
	//Move back to second slide
$('#submit_back_tosecond').click(function()
{
 	$('#progress_text').html('20% Complete');
	  $('#progress').css('width','68px');
                
                //slide steps
	  $('#third_step').slideUp(); 
       $('#second_step').slideDown(); 
});


    $('#submit_third').click(function(){
		//remove classes
        $('#third_step input').removeClass('error').removeClass('valid');

        //update progress bar
        $('#progress_text').html('60% Complete');
        $('#progress').css('width','204px');

        
        //slide steps
        $('#third_step').slideUp();
        $('#fourth_step').slideDown();            
    });

	
	$('#submit_back_tothird').click(function()
{
 	$('#progress_text').html('40% Complete');
	  $('#progress').css('width','136px'); 
                
                //slide steps
	  $('#fourth_step').slideUp(); 
       $('#third_step').slideDown(); 
	   
});

    $('#submit_fourth').click(function(){
	//remove classes
        $('#fourth_step input').removeClass('error').removeClass('valid');

		
		//update progress bar
		$('#progress_text').html('80% Complete');
        $('#progress').css('width','272px');
		//slide steps
        $('#fourth_step').slideUp();
        $('#fifth_step').slideDown();   
        //send information to server
        //alert('Data sent');
    });

	$('#submit_back_tofourth').click(function()
{
 	$('#progress_text').html('60% Complete');
	  $('#progress').css('width','204px');
                
                //slide steps
	  $('#fifth_step').slideUp(); 
       $('#fourth_step').slideDown(); 
});

    $('#submit_fifth').click(function(){
	//remove classes
        $('#fifth_step input').removeClass('error').removeClass('valid');

		
		//update progress bar
		$('#progress_text').html('100% Complete');
        $('#progress').css('width','340px');
		
		//prepare the fourth step
        var fields = new Array(
            $('#username').val(),
            $('#password').val(),
            $('#email').val(),
            $('#firstname').val() + ' ' + $('#lastname').val(),
            $('#d').val() + '-' + $('#m').val() + '-' + $('#y').val(),
            $('#gender').val(),
            $('#mobile').val()                       
        );
        var tr = $('#sixth_step tr');
        tr.each(function(){
            //alert( fields[$(this).index()] )
            $(this).children('td:nth-child(2)').html(fields[$(this).index()]);
        });
                
		//slide steps
        $('#fifth_step').slideUp();
        $('#sixth_step').slideDown();   
        //send information to server
        //alert('Data sent');
    });
	
	$('#submit_sixth').click(function(){
	//remove classes
        $('#sixth_step input').removeClass('error').removeClass('valid');

		
		//update progress bar
		
		//slide steps
        $('#fifth_step').slideUp();
        $('#sixth_step').slideDown();   
        //send information to server
        alert('Data sent');
    });

});