<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="spring" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<link rel="stylesheet"
	href="./resources/assets/js/jquery-ui/css/no-theme/jquery-ui-1.10.3.custom.min.css">
<link rel="stylesheet"
	href="./resources/assets/css/font-icons/entypo/css/entypo.css">
<link rel="stylesheet"
	href="http://fonts.googleapis.com/css?family=Noto+Sans:400,700,400italic">
<link rel="stylesheet" href="./resources/assets/css/bootstrap.css">
<link rel="stylesheet" href="./resources/assets/css/neon-core.css">
<link rel="stylesheet" href="./resources/assets/css/neon-theme.css">
<link rel="stylesheet" href="./resources/assets/css/neon-forms.css">
<link rel="stylesheet" href="./resources/assets/css/custom.css">

<title> Registration Form </title>


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
	
	.main-content {
		color: black;
	}
	
	input[type="text"]{
	   	border: 1px solid;
	}
	
	.span1 {
		color: red;
		font-size: 16px;
		font-weight: bold;
	}
	
	label{
		font-weight: bold;
	}
	
	.ErrorField {
		border-color: red !important;
		border-width: thin !important;
	}
	
</style>

<script>
    history.forward();
</script>

<script type="text/javascript">
	function preventBack() { window.history.forward(); }
    setTimeout("preventBack()", 0);
    window.onunload = function () { null };
    
    $(document).ready(function(){

    	$("#btnSubmit").click(function(){
    		//debugger;
    		var isValid = 1;
    		
    		if ($('#userName').val().trim() == "") 
    		{
    			$("#userName").addClass("ErrorField");
    			isValid = 0;
    		} else
    			$("#userName").removeClass("ErrorField");
    		
    		
    		if ($('#password').val().trim() == "") 
    		{
    			$("#password").addClass("ErrorField");
    			isValid = 0;
    		} else
    			$("#password").removeClass("ErrorField");
    		
    		if ($('#fullName').val().trim() == "") 
    		{
    			$("#fullName").addClass("ErrorField");
    			isValid = 0;
    		} else
    			$("#fullName").removeClass("ErrorField");
    		
    		if ($('#email').val().trim() == "") 
    		{
    			$("#email").addClass("ErrorField");
    			isValid = 0;
    		} else
    			$("#email").removeClass("ErrorField");
    		
    		var quizType = $("#userType option:selected").val();
    		if(quizType == 0)
    		{
    			$("#userType").addClass("ErrorField");
    			isValid = 0;
    		}
    		
    		
    		if(isValid ==0)
    		{
    			return false;
    		}
    		else
    		{
    			$("#registration").submit();	
    		}
    		
    	});	
    	
    });
</script>


</head>

<body>
	<div class="main-content">
		<spring:form action="./registration" method="post" id="registration" modelAttribute="userRegForm">
			<div id="registration">
				<fieldset>
					<legend style="text-align: center;">
						<b style="color: #3b5998;">Enter user details</b>
					</legend>
					<div class="row" style="margin: 0;padding: 0;padding-left: 15%;padding-right: 5%;">
				
					<div class="form-group">		
						<label for="lbluserName" class="col-sm-3 control-label">User Name<span class="span1">*</span></label>
						<div class="col-sm-4">
							<spring:input type="text" id="userName" path="master_User.userName" class="form-control" autocomplete="off"/>
						</div>	
					</div>
					<br />
					<br />

					<div class="form-group">		
						<label for="lblForpassword" class="col-sm-3 control-label">Password<span class="span1">*</span></label>
						<div class="col-sm-4">
							<spring:input type="Password" id="password" path="master_User.password" class="form-control" autocomplete="off" />
						</div>	
					</div>
					<br />
					<br />
					
					<div class="form-group">		
						<label for="lblfullName" class="col-sm-3 control-label">Full Name<span class="span1">*</span></label>
						<div class="col-sm-4">
							<spring:input type="text"  path="master_User.fullName" id="fullName" class="form-control" autocomplete="off" />							
						</div>	
					</div>
					<br />
					<br />
					
					<div class="form-group">
						<label for="lblemail" class="col-sm-3 control-label">Email<span class="span1">*</span></label>
						<div class="col-sm-4">
							<spring:input type="text"  path="master_User.email" id="email" class="form-control" autocomplete="off" />	
					     </div>
						
					</div>
					<br>
					<br>
					
					<div class="form-group">
					<label for="lbluserType" class="col-sm-3 control-label">User Type<span class="span1">*</span></label>
					<div class="col-sm-4">
							<spring:select id="userType" path="master_User.userType"
								class="form-control" style="border: 1px solid;">
								<option value="0">-----Select Type-----</option>
								<option value="1">Teacher</option>
								<option value="2">student</option>	
							</spring:select>
							</div>
						</div>	
					
					<br>
					<br>			
					<div class="form-group" style="text-align: center;">
						<div class="col-sm-6" style="padding-left: 30%;">
							<button type="submit" id="btnSubmit" class="btn btn-green btn-icon btnSubmit">
								Submit
							<i class="entypo-check"></i>
							</button>
							
	
						</div>
					</div>
					<br />
					<br />
                   
					</div>
				</fieldset>
			</div>
			
		</spring:form>
	</div>
	<br><br>
	<br><br>
	
	
	<div align="center">
	
	</div>
		
</body>

</html>