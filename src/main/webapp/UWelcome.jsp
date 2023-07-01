
<%@page import="java.util.List"%>
<%@page import="com.nobious.dao.impl.AdminDaoImpl"%>
<%@page import="com.nobious.dao.AdminDao"%>
<%@page errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous" defer></script>

<meta charset="UTF-8">
<title>User Welcome Page</title>
<%@include file="components/allcsscdn.jsp"%>

<style>
.container {
	max-width: 400px;
	margin: 0 auto;
	padding: 20px;
	border-radius: 5px;
	margin-top: 50px;
}

.block {
	display: block;
	width: 100%;
	border: none;
	margin: 25px;
	padding: 14px 28px;
	font-size: 16px;
	cursor: pointer;
	text-align: center;
}
</style>
<%
	if(session.getAttribute("role") != "User"){
		
		application.setAttribute("errMsg","Please login first as User !!!");
		request.getRequestDispatcher("index.jsp").forward(request,response);
	}
    %>
</head>
<body background="Images/Admin.jpg">
	<%@include file="components/navbar.jsp"%>
	<form action= "index.jsp"><button type="Submit" class="btn btn-lg text-center"><span><i class="fa fa-arrow-left fa-1x"></i></span></button></form>
	
	<%
		AdminDao dao=new AdminDaoImpl();
		List<Object[]> leave_details=dao.getAcknowledgement((String)session.getAttribute("uname"));
		
		for(Object[] data:leave_details)
		{
			if((boolean)data[1]==true)
			{
				%>
				<div class="alert alert-success alert-dismissible fade show" role="alert">
				Your <%=data[2]%> of <%=data[0]%> is Approved!!
				  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
				</div>
				<%
			}
		}
		
		for(Object[] data:leave_details)
		{
			if((boolean)data[1]==false)
			{
				%>
				<div class="alert alert-danger alert-dismissible fade show" role="alert">
				Your <%=data[2]%> of <%=data[0]%> is Rejected!!
				  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
				</div>
				<%
			}
		}
	
	%>
	
	<div class="d-grid gap-4 col-6 mx-auto" class="container center">

		<form>
			<button formaction="components/Calender1.jsp" class="btn btn-dark block" type="submit">Mark Attendance and Apply Leave</button>
			<button formaction="Leave.jsp" class="btn btn-dark block" type="submit">Leave Details</button>
			<button formaction="Attendance.jsp" class="btn btn-dark block" type="submit">Attendance Details</button>


		</form>
	</div>
</body>
</html>
