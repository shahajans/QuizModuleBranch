<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> Login Form </title>


<style type="text/css">
faffbd
	body { 
		padding:0; 
		margin:0;
		font-family:Arial, Helvetica, sans-serif;
		background-color:#f0f0f0;
		
	}
	h1 {
		font-size:18px;
		font-weight:bold;
		color:#1F3F90;
		padding:0px;
		margin:0px;
	}
	h3 {
		padding:0;
		margin:0;
		font-size:15px;
		font-weight:bold;
		color:#000000;
	}
	
	input[type=button] {
	    background-color:#e5e5e7;
		padding:8px;
		text-decoration:none;
		border:none;
	}

	input[type=button]:hover {
	    background-color:#e30303;
		color:#ffffff;
		padding:8px;
		text-decoration:none;
		border:none;
	}
	
	input[type=reset] {
	    background-color:#e5e5e7;
		padding:8px;
		text-decoration:none;
		border:none;
	}

	input[type=reset]:hover {
	    background-color:#e30303;
		color:#ffffff;
		padding:8px;
		text-decoration:none;
		border:none;
	}
	input[type=submit] {
	    background-color:#e5e5e7;
	    padding:8px;
	    text-decoration:none;
	    color:#000000;
	    font-size:14px;
	    font-weight:normal;
	    border:none;
	}
	input[type=submit]:hover {
	    background-color:#224974;
	    padding:8px;
	    text-decoration:none;
	    color:#ffffff;
	    font-size:14px;
	    font-weight:normal;
	    border:none;
	
	}
	input[type="text"] {
	    text-align:left;
	    border:1px solid #1d1d1d;
	    padding:3px;
	    line-height:20px;
	    /*background-color:#f6f6f6;*/
		background-color: rgba(0,0,0,0.1);
		color: #000000;
		font-weight:600;
	}

	input[type="password"] {
	    text-align:left;
	    border:1px solid #1d1d1d;
	    padding:3px;
	    line-height:20px;
		background-color: rgba(0,0,0,0.1);
		color: #000000;
		font-weight:600;
	}
	select {
	    text-align:left;
	    border:1px solid #1d1d1d;
	    padding:3px;
	    line-height:20px;
	    background-color:#f6f6f6;
	}
		
	#login{
		width: 100%;
	}
	
	.loginbox{
		min-width: 1348px;
		min-height: 172px;
		background-position: left top;
		background-repeat: no-repeat;
		float: left;
	}
	
	#username{
		border-color: white;
	}
	
	#Password{
		border-color: white;
	}
	
	
</style>

<script>
    history.forward();
    
    $(document).ready(function(){

    	$("#reset").click(function(){
    		//debugger;
    		var isValid = 1;
    		
    		if ($('#question').val().trim() == "") 
    		{
    			$("#question").addClass("ErrorField");
    			isValid = 0;
    		} else
    			$("#question").removeClass("ErrorField");
    		
    		
    		
    		if(isValid ==0)
    		{
    			return false;
    		}
    		else
    		{
    			$("#createQues").submit();	
    		}
    		
    	});	
    	
    });
</script>

<script type="text/javascript">
	function preventBack() { window.history.forward(); }
    setTimeout("preventBack()", 0);
    window.onunload = function () { null };
</script>


</head>

<body class="loginbox" background="./resources/assets/images/loginPage.jpg" data-url="http://neon.dev">
	<div class="main-content">
	<form action="/QuestionPaperModule/login" method="post" id="frm">
		<div style="width:100%;height:100%;">
    	<div id="login">
    		
            <div style="width:800px;padding-left:7%;padding-top:17%;text-align:center;">
            <div style="height: 30px;width: 498px;padding-bottom: 10px;">
                <label style="font-family:Artifika;color: red; font-size: 20px;font-weight: bold;"><b>${success}</b></label>
				<label style="font-family:Artifika;color: red; font-size: 20px;font-weight: bold;"><b>${error}</b></label>
			</div>
           	<div style="width:500px;border-top:2px solid #ffffff;border-right:2px solid #ffffff;border-bottom:2px solid #ffffff;border-left:2px solid #ffffff;">
            	
				
            	<div style="font-family:Artifika;font-size:23px;font-weight:bold;color:#ffffff;border-bottom:2px solid #ffffff;width:498px;">
            		 Welcome for the Quiz...
            	</div>
            	
            	<div style="font-family:Artifika;font-size:18px;font-weight:bold;color:#000000;width:498px;padding-top:10px;">
            		Enter Your Login Credentials
            	</div>
            	
                <div style="padding-top:20px;line-height:28px;font-size:15px;font-weight:600;color:#000000;float:left;width:120px;">
                	User Name :
                </div>
                
                <div style="padding:20px 0px 0px 5px;">
                	<input type="text" id="username"  name="employeeCode" size="40" style="background-color: white;" required/>  
                </div>
                
                <div style="padding-top:20px;line-height:28px;font-size:15px;font-weight:600;color:#000000;float:left;width:120px;">
                	Password :
                </div>
                
              	<div style="padding:20px 0px 0px 5px;">
              		<input type="Password" id="Password"  name="password" size="40" style="background-color: white;" required/>        	
              	</div>
              	
                <div style="padding-top:30px;text-align:center;width:500px;">
                	<div style="float:left;width:50%;text-align:right;">
                		<button type="submit" id="submit" class="btn btn-green btn-icon btnsubmit">
                			Login
                			<i class="entypo-login"></i>
                		</button>
                		&nbsp;&nbsp;&nbsp;
                    </div>
                    <div style="text-align:left;">
                    	<a href="./getRegistration"> 
							<i class="entypo-logout"></i>
							click here for Registration
						</a>
                    </div>
                </div>
            </div>
        </div>
        </div>
    </div>
	</form>
	</div>
	<br><br>
	<br><br>
	
	
	<div align="center">
	<label>
		<marquee style="font-weight: bold;font-size: 16px;color: #faffbd;">
			This page uses features, if that might be unavailable in your browser. 
			Please view this page in a modern Internet browser like Mozilla Firefox, Internet Explorer 10+ and Google Chrome for best view.
		</marquee>
	</label>
	</div>
		
</body>

</html>