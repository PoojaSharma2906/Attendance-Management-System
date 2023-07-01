<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">

#oops{
font-size: 16rem;
 background: -webkit-linear-gradient(60deg,orange,red);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  text-align: center;
  margin: 0px;
}
.errMsg{
color:red;
}
.box{
	display:flex;
	justify-content:center;
	align-item:center;
}
.btn
{
 background: -webkit-linear-gradient(60deg,violet,greenyellow);
padding:10px;
border-radius:15px;
border: none;
}
</style>
</head>
<body>
	
	
	
	<h1 id="oops"> Ooops! </h1>
	
	<div class="box">
	<h1 class="errMsg">Error :<%=exception.getMessage() %></h1>
	</div>
		<div class="box">
	<br>
	<a href="index.jsp"><button class="btn">Go to HomePage</button></a>
	</div>
	
</body>
</html>
