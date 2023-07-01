<%@page import="com.nobious.dao.impl.AdminDaoImpl"%>
<%@page import="com.nobious.dao.AdminDao"%>
<%@page import="com.nobious.bean.User"%>
<%@page import="com.nobious.dao.impl.UserDaoImpl"%>
<%@page import="com.nobious.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page errorPage="error.jsp" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit User</title>
<%@include file="components/allcsscdn.jsp" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
 <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf"
      crossorigin="anonymous">
</script>
</head>
<body>
	
		 <%
    
    	if(session.getAttribute("role") != "Admin"){
    		
    		application.setAttribute("errMsg","Please login first as Admin !!!");
    		request.getRequestDispatcher("index.jsp").forward(request,response);
    	}
    %>
		<%
		int id = Integer.parseInt(request.getParameter("uid"));
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		Long phoneno = Long.parseLong(request.getParameter("phoneno"));
		User s=new User(id,email,phoneno);
		AdminDao dao=new AdminDaoImpl();
		//dao.updateUser(s);
		boolean status=dao.updateUser(s);
		
		if(status)
		{
			%>
<div class="alert alert-success alert-dismissible fade show"
	role="alert">
	User <strong>Edited </strong> Successfully!!!
	<button type="button" class="btn-close" data-bs-dismiss="alert"
		aria-label="Close"></button>
</div>
<%
		}
		else
		{
			%>
<div class="alert alert-danger alert-dismissible fade show" role="alert">
	Unable to <strong>Edit </strong> User!!!
	<button type="button" class="btn-close" data-bs-dismiss="alert"
		aria-label="Close"></button>
</div>
<%
		}
		
		request.getRequestDispatcher("Allusers.jsp").include(request,response);
	%>
			
</body>
</html>