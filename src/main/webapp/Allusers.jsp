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
<title>All Employees</title>
<link rel="stylesheet" type="text/css"	href="https://cdn.datatables.net/v/bs4-4.6.0/dt-1.12.1/datatables.min.css" />
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

<%@include file="components/allcsscdn.jsp"%>
<%
    
    	if(session.getAttribute("role") != "Admin"){
    		application.setAttribute("errMsg","Please login first as Admin !!!");
    		response.sendRedirect("index.jsp");
    	}
    %>
</head>
<body  background="Images/Admin.jpg">
<%@include file="components/navbar.jsp" %>
<form action= "AWelcome.jsp"><button type="Submit" class="btn btn-lg text-center"><span><i class="fa fa-arrow-left fa-1x"></i></span></button></form>
	<h1>
		<i><center>All Employees Detail</center></i>
	</h1>
	<div class="container">
		<br> <br>
		<table id="mytable" class="table table-striped" style="width: 100%">
			<% AdminDao dao=new AdminDaoImpl();
   			 ArrayList<User> list=dao.getAllUsers();%>

			<thead>
				<tr>
					<th>ID</th>
					<th>UserName</th>
					<th>Email</th>
					<th>Password</th>
					<th>Phone No</th>
					<th>Actions</th>

				</tr>
			</thead>
			<tbody>
				<% for(User user:list)
        	{
        %>
				<tr>
					<td><%=user.getUserId()%></td>
					<td><%=user.getName()%></td>
					<td><%=user.getEmail()%></td>
					<td><%=user.getPassword()%></td>
					<td><%=user.getPhoneno()%></td>
					<td><a href='EditUser.jsp?uid=<%=user.getUserId()%>' data-bs-toggle="modal"
						data-bs-target="#edituser" data-bs-userid='<%=user.getUserId()%>'>Edit</a>
						/<a href='Delete2.jsp?username=<%=user.getName()%>'>Delete</a></td>
			
				</tr>
				<%}%>
			</tbody>
			<tfoot>
				<tr>
					<th>ID</th>
					<th>UserName</th>
					<th>Email</th>
					<th>Password</th>
					<th>Phone No.</th>
					<th>Actions</th>
				</tr>
			</tfoot>
		</table>

		<div class="modal fade" id="edituser" data-bs-backdrop="static"
			data-bs-keyboard="false" tabindex="-1"
			aria-labelledby="staticBackdropLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h1 class="modal-title fs-5" id="staticBackdropLabel">Edit
							User</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<form action="EditUser.jsp" class="m-3" method="post">
						 <div class="formgroup">
				       <label for="id" class="form-label">Id</label>
				        <input type="text" name="id" class="form-control" id="edituserid" disabled>
				    </div>
							<input type='hidden' name='uid' id='hiddenid'>
							<div class="formgroup">
								<label for="email" class="form-label">Email</label> <input
									type="email" name="email" class="form-control" id="email">
							</div>
							<div class="formgroup">
								<label for="tel" class="form-label">Phone</label> <input
									type="tel" name="phoneno" class="form-control" id="phoneno">
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">Close</button>
								<button type="submit" class="btn btn-primary">Edit</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>

	</div>
</body>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<script type="text/javascript"	src="https://cdn.datatables.net/v/bs4-4.6.0/dt-1.12.1/datatables.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>


<script>
    $(document).ready(function() {
        $('#mytable').DataTable();
    } );
const exampleModal = document.getElementById('edituser');
exampleModal.addEventListener('show.bs.modal',event=>{
		const button = event.relatedTarget;
		const data = button.getAttribute('data-bs-userid')
		const inp = document.querySelector('#edituserid')
		inp.value = data
		document.querySelector('#hiddenid').value=data;
	});
</script>
</html>