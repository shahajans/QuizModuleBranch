<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title> Create Info Page </title> 
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

<script>
    history.forward();
</script>

<script type="text/javascript">

$(document).ready(function(){

	var flag = "${flag}";

	if(parseInt(flag) == 1){	
		
		$('#invdiv').css("display", "block");	
	}
	
	$('#btnsubmit').click(function(e){
		
		var isValid=1;
		
		if($('#QuizType').val().trim()=="")
		{
			$("#QuizType").addClass("ErrorField");
			isValid=0; 	
		} else
			$("#QuizType").removeClass("ErrorField");
		
		if(isValid==0)
			return false;
		else
			$('#createQuizInfo').submit(); 
	});
});



</script>

<style type="text/css">
	.main-content{
		color: black;
	}
	
	.ErrorField {
        border-color: red !important;
        border-width: thin !important;
    }
    input[type="text"]{
   		border: 1px solid;
   	}
   	
   	input[type="file"]{
   		border: 1px solid;
   	}
   	
   	input[type="number"]{
   		border: 1px solid;
   	}
   	
   	textarea#productDescription{
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
</style>

</head>

<body>
	<%
		if(session.getAttribute("masterUser")==null){
		response.sendRedirect(request.getContextPath() + "/");
		}
	%>
	<div id="header">
		<jsp:include page="../Layout/TeacherHeader.jsp"></jsp:include>
	</div>
	
	<div id="details" align="center">
		<h4 style="color: green;">${success}</h4>
		<h4 style="color: red;">${error}</h4>
	</div>
	<br />
	<div class="main-content">

		<div class="form-group" >
			<marquee direction="left" style="color: navy;" onmouseover="stop()"
				onmouseout="start()">
				<B></B>
			</marquee>

			<form method="post" action="/QuestionPaperModule/createQuizInfo" id="createQuizInfo">
			<div class="form-group" style="margin: 0;padding: 0;padding-left: 5%;" >							
					<label for="QuizType" class="col-sm-2 control-label">Quiz Type<span class="span1">*</span></label>
				<div class="col-sm-3">
						<input type="text" name="QuizType" id="QuizType" class="form-control" 
							 value="" >
					</div>
					
					<button type="submit" id="btnsubmit" class="btn btn-default btn-icon btnsubmit">
							Create
							<i class="entypo-cancel"></i>
						</button>
						
				</div>
			</form>



		</div>
	</div>


	<div class="main-content">
    	<div class="row" style="margin: 0;padding: 0;">
            <h2 align="center" style="color: #3b5998;" ><strong> Teacher </strong> </h2>
            <hr style="border-color: #00639e;width: 50%;">
            <div class="col-md-6" style=" margin-left: 350px; text-align: center !important;font-size: larger;">
  
           </div>
     	</div>
   	</div>
	<br>
	<br>
	<br>
	<br>
	<br>

	<div id="footer" align="center">
		<h5>
		<jsp:include page="../Layout/ForAllFooter.jsp"></jsp:include>
		</h5>
	</div>
</body>
</html>