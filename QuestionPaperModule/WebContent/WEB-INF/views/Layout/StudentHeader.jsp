<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
<META HTTP-EQUIV="refresh" CONTENT="<%= session.getMaxInactiveInterval() %>; URL= <%= request.getContextPath()+"/" %>"/>
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> Quiz</title>


<jsp:include page="../neontheme/neon.jsp"></jsp:include>
<style type="text/css">
	nav {    
	  display: block;
	  background: black;
	  padding-left:150px;
	  height: 40px;
	}
	nav ul {
	  margin: 0;
	  padding:0;
	  list-style: none;
	  
	}
	.nav a {
	  height: 40px;
	  display:block; 
	  background: #111; 
	  color: #fff; 
	  text-decoration: none;
	  padding: 0.8em 1.8em;
	  padding-top:10px;	
	  font-size: 12px;
	  letter-spacing: 1px;
	  text-shadow: 0 -1px 0 #000;
	  position: relative;
	}
	.nav{  
	  vertical-align: top; 
	  display: inline-block;
	 /*  box-shadow: 
	    1px -1px -1px 1px #000, 
	    -1px 1px -1px 1px #fff, 
	    0 0 6px 3px #fff; */
	  border-radius:6px;
	}
	.nav li {
	  position: relative;
	}
	.nav > li { 
	  float: left; 
	<!-- border-bottom: 4px #aaa solid; --> 
	  margin-right: 1px; 
	} 
	.nav > li > a { 
	  margin-bottom: 1px;
	 /* box-shadow: inset 0 2em .33em -0.5em #555; */
	}
	.nav li:hover > a { 
	  box-shadow: inset 0 2em .33em -0.5em #555;
	 background-color:gray;
	}
	.nav > li:first-child { 
	  border-radius: 4px 0 0 4px;
	}
	.nav > li:first-child > a { 
	  border-radius: 4px 0 0 0;
	}
	.nav > li:last-child { 
	  border-radius: 0 0 4px 0; 
	  margin-right: 0;
	} 
	.nav > li:last-child > a { 
	  border-radius: 0 4px 0 0;
	}
	.nav li li a { 
	  margin-top: 1px;
	}
	
	.nav ul {
	  position: absolute;
	  white-space: nowrap;
	  z-index: 100;
	  left: -99999em;
	}
	.nav > li:hover > ul {
	  left: auto;
	  <!-- margin-top: 5px; -->
	  min-width: 100%;
	}
	.nav > li li:hover > ul { 
	  left: 100%;
	  margin-left: 1px;
	  top: -1px;
	}
	.nav > li > a:first-child:nth-last-child(2):before { 
	  border-top-color: #aaa; 
	}
	.nav > li:hover > a:first-child:nth-last-child(2):before {
	  border: 5px solid ; 
	  <!-- border-bottom-color: orange; --> 
	  margin-top:-5px
	}
	.nav li a:hover,
	.nav li a:focus {
	  color: white;
	  box-shadow: inset 0 4em .33em -0.5em #555;
	}

	.litemp{
		color: black;
	  	box-shadow: inset 0 4em .33em -0.5em #3b5998;
	}
	
	.dropdown-menu {
		margin-top: 0px !important ;
	}
	
	.nav li a{
        font-size: 11px;
    }
    
    .title{
    font-size: 12px;
    }
	
</style>
</head>
<body class="page-body" data-url="http://neon.dev">
	<%
	response.setHeader("Cache-Control","no-cache");
	response.setHeader("Cache-Control","no-store");
	response.setHeader("Pragma","no-cache");
	response.setDateHeader ("Expires", 0);
	if(session.getAttribute("masterUser")==null){
	 response.sendRedirect(request.getContextPath() + "/");
	}
	%>
	<div style="width: 100%;height: 100%">
		<div>
			<div style="width: 100%; height: 90px; background-color: #ffffff; border-bottom: 1pm solid #000000;">
				
				
				<div style="padding-top: 40px;font-size: 24px;color: #F00;font-weight: bold;padding-left: 35%;">
					 Welcome
				
					<div style="float: right;">
						<ul class="user-info pull-left pull-none-xsm">
		
							<!-- Profile Info -->
							<li class="profile-info pull-right dropdown"><!-- add class "pull-right" if you want to place this from right -->
				
								<a href="#" class="dropdown-toggle"  data-toggle="dropdown">
									<i class="entypo-user"></i>
									${masterUser.getUserName()}
								</a>
				
								<ul class="dropdown-menu">
									<li class="caret"></li>

									<li class="litemp">
										<a href="./LogOut"> 
											<i class="entypo-logout"></i>
											Log Out 
										</a>
									</li>
									
								</ul>

							</li>
				
						</ul>
					</div>
					
				</div>
				
			</div>
		</div>
	</div>
	<div>
		<nav>
			<ul class="nav">
			    <li>
			    	<a href="./home">
			    		<i class="entypo-home"></i>
						<span class="title">
							<b>Home</b>
						</span>
			    	</a>
			    </li>
	
				<li>
					<a href="#">
						<i class="entypo-newspaper"></i>
					   		<span class="title"><b>Task</b></span>
					</a>
					<ul>
						<li>
							<a href="./getQuizSubPage">
								 Take Quiz
							</a>
						</li>
						
						
					</ul>
				</li>
			</ul>	
		</nav>
  </div>
</body>
</html>