<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Quiz</title> 
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
		var isValid = 1;
		
		var quizType = $("#ddlQuizType option:selected").val();
		if(quizType == 0)
		{
			$("#ddlQuizType").addClass("ErrorField");
			isValid = 0;
		}
		
		if(isValid == 0)
		{
			return false;
		}
		else{
			{
				$("#takeQuiz").submit();	
			}
			
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
		<jsp:include page="../Layout/StudentHeader.jsp"></jsp:include>
	</div>
	
	<div id="details" align="center">
		<h4 style="color: green;">${success}</h4>
		<div id="invdiv" style="display: none;">
		</div>	 		
		
		<h4 style="color: red;">${error}</h4>
	</div>
	<br />
	
	<div class="main-content">
		<form action="./getTakeQuiz" method="post" id="takeQuiz" >
			<div id="createQues">
				<fieldset>
					<legend style="text-align: center;">
						<b style="color: #3b5998;"> Welcome to the site</b>
					</legend>
					<div class="row" style="margin: 0;padding: 0;padding-left: 15%;padding-right: 5%;">
					
				
					<br>
						
				<div class="form-group">
						<label for="lblQuizType" id="lblQuizType" class="col-sm-2 control-label">select Quiz Type<span class="span1">*</span></label>
						<div class="col-sm-4">
							<select id="ddlQuizType" name="ddlQuizType"
								class="form-control" style="border: 1px solid;">
								<option value="0">-----Select Type-----</option>
								<jstl:forEach var="data"
									items="${quizInfolist}">
									<option value="${data.quizInfoId}">
										<jstl:out value="${data.quizName}" />
									</option>
								</jstl:forEach>
							</select>
						</div>
					</div>
					<br />
					<br />
					
					<div id="invdiv" >
					    <div class="form-group" style="text-align: center;">
						<div class="col-sm-6" style="padding-left: 30%;">
							<button type="submit" id="btnSubmit" class="btn btn-green btn-icon btnSubmit">
								Submit
							<i class="entypo-check"></i>
							</button>
							
	
						</div>
					</div>
		           </div>				
					
					<br />
					<br />
                   
					</div>
				</fieldset>
			</div>
			
		</form>
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