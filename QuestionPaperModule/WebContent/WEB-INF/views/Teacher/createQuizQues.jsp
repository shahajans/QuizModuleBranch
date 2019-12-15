<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="spring" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title> Create Question </title> 
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

	$("#btnSubmit").click(function(){
		//debugger;
		var isValid = 1;
		
		if ($('#question').val().trim() == "") 
		{
			$("#question").addClass("ErrorField");
			isValid = 0;
		} else
			$("#question").removeClass("ErrorField");
		
		if ($('#optiona').val().trim() == "") 
		{
			$("#optiona").addClass("ErrorField");
			isValid = 0;
		} else
			$("#optiona").removeClass("ErrorField");
		
		if ($('#optionb').val().trim() == "") 
		{
			$("#optionb").addClass("ErrorField");
			isValid = 0;
		} else
			$("#optionb").removeClass("ErrorField");
		
		if ($('#optionc').val().trim() == "") 
		{
			$("#optionc").addClass("ErrorField");
			isValid = 0;
		} else
			$("#optionc").removeClass("ErrorField");
		
		if ($('#optiond').val().trim() == "") 
		{
			$("#optiond").addClass("ErrorField");
			isValid = 0;
		} else
			$("#optiond").removeClass("ErrorField");
		
		if ($('#answer').val().trim() == "") 
		{
			$("#answer").addClass("ErrorField");
			isValid = 0;
		} else
			$("#answer").removeClass("ErrorField");
		
		
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

<style type="text/css">
	body {
		color: black;
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
		<spring:form action="./createQues" method="post" id="createQues" modelAttribute="Quesform">
			<div id="createQues">
				<fieldset>
					<legend style="text-align: center;">
						<b style="color: #3b5998;"> Question</b>
					</legend>
					<div class="row" style="margin: 0;padding: 0;padding-left: 15%;padding-right: 5%;">
					
				
					<br>
						
					<div class="form-group">		
						<label for="lblForquestion" class="col-sm-3 control-label">Question<span class="span1">*</span></label>
						<div class="col-sm-4">
							<spring:input type="text" id="question" path="quizQuestions.question" class="form-control" autocomplete="off"/>
						</div>	
					</div>
					<br />
					<br />

					<div class="form-group">		
						<label for="lblForOptionA" class="col-sm-3 control-label">Option A<span class="span1">*</span></label>
						<div class="col-sm-4">
							<spring:input type="text" id="optiona" path="quizQuestions.optiona" class="form-control" autocomplete="off" />
						</div>	
					</div>
					<br />
					<br />
					
					<div class="form-group">		
						<label for="lblOptionB" class="col-sm-3 control-label">Option B</label>
						<div class="col-sm-4">
							<spring:input type="text"  path="quizQuestions.optionb" id="optionb" class="form-control" autocomplete="off" />							
						</div>	
					</div>
					<br />
					<br />
					
					<div class="form-group">
						<label for="lblForOptionC" class="col-sm-3 control-label">Option C<span class="span1">*</span></label>
						<div class="col-sm-4">
							<spring:input type="text"  path="quizQuestions.optionc" id="optionc" class="form-control" autocomplete="off" />	
					     </div>
						
					</div>
					<br>
					<br>
					
					<div class="form-group">
						<label for="lblForOptionD" class="col-sm-3 control-label">Option D<span class="span1">*</span></label>
						<div class="col-sm-4">
							<spring:input type="text"  path="quizQuestions.optiond" id="optiond" class="form-control" autocomplete="off" />	
						</div>
					</div>
					<br>
					<br>
					
					
					<div class="form-group" id="gst_numberdiv">
						<label for="LblforAnswer" class="col-sm-3 control-label">Answer<span class="span1">*</span></label>
						<div class="col-sm-4">
							<spring:input type="text" id="answer" path="quizQuestions.answer"  class="form-control gst_no" autocomplete="off" />
						</div>
					</div>
					<br>
					<br>
				    <div>
						<spring:input type="hidden" path="quizQuestions.quizinfoid" id="questionInfoID" value="${questionInfoID}"/>
						
					</div>			
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