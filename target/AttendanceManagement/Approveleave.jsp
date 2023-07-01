<%@page import="com.nobious.dao.impl.AdminDaoImpl"%>
<%@page import="com.nobious.dao.AdminDao"%>
<%@page import="com.nobious.bean.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.nobious.dao.impl.ConnectionProvider"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%@page errorPage="error.jsp" %>
	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Approve Leave</title>
<link rel="stylesheet" type="text/css"	href="https://cdn.datatables.net/v/bs4-4.6.0/dt-1.12.1/datatables.min.css" />
<%@include file="components/allcsscdn.jsp"%>
   <%
    
    	if(session.getAttribute("role") != "Admin"){
    		
    		application.setAttribute("errMsg","Pls Login First as Admin !!");
    		request.getRequestDispatcher("index.jsp").forward(request,response);
    	}
AdminDao dao=new AdminDaoImpl();
    %>
    <script type="text/javascript">

    function approve(username,date,ltype)
    {
    	location.href=`ApproveOrDisapprove.jsp?username=${username}&date=${date}&status=approve&ltype=${ltype}`;
    }
    function disApprove(username,date,ltype)
    {
    	location.href=`ApproveOrDisapprove.jsp?username=${username}&date=${date}&status=disapprove&ltype=${ltype}`;
    }
    
    </script>
</head>
<body background="Images/Admin.jpg">

	<%@include file="components/navbar.jsp"%>
	<h1>
		<i><center>Leave Request</center></i>
	</h1>
	<div class="container">
		<br> <br>
		<table id="mytable" class="table table-striped" style="width: 100%">
			<% ArrayList<Object[]> list=dao.getAllLeaveRequest();%>

			<thead>
				<tr>
					<th>Leave Request ID</th>
					<th>User Name</th>
					<th>Date</th>
					<th>is Approved</th>
					<th>Leave type</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>
				<% for(Object[] att:list)
        	{
        %>
				<tr>
					<td><%=att[0]%></td>
					<td><%=att[1]%></td>
					<td><%=att[2]%></td>
					<td><%=att[3]%></td>
					<td><%=att[4]%></td>
					<td><button type="button" class="btn btn-primary" onclick="approve('<%=(String)att[1] %>','<%=String.valueOf(att[2]) %>','<%=String.valueOf(att[4]) %>')" >Accept</button>
					 <button type="button" class="btn btn-danger" onclick="disApprove('<%=(String)att[1] %>','<%=String.valueOf(att[2]) %>','<%=String.valueOf(att[4]) %>')" >Reject</button></td>
					
				</tr>
				<%}%>
			</tbody>
			<tfoot>
				<tr>
					<th>Leave Request ID</th>
					<th>User Name</th>
					<th>Date</th>
					<th>is Approved</th>
					<th>Leave type</th>
					<th>Actions</th>
				</tr>
			</tfoot>
		</table>
	</div>
</body>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<script type="text/javascript"
	src="https://cdn.datatables.net/v/bs4-4.6.0/dt-1.12.1/datatables.min.js"></script>
<!-- <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/js/bootstrap.min.js"></script> -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
	crossorigin="anonymous"></script>


<script>
    $(document).ready(function() {
        $('#mytable').DataTable();
    } );

</script>
</html>