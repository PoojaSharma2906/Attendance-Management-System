<%@page import="java.io.IOException"%>
<%@page import="com.nobious.bean.User"%>
<%@page import="com.nobious.dao.impl.AdminDaoImpl"%>
<%@page import="com.nobious.dao.AdminDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page errorPage="error.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<%@include file="components/allcsscdn.jsp"%>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
	integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf"
	crossorigin="anonymous"></script>
</head>
<body>

	<%
	String uname = request.getParameter("uname1");
	String pass = request.getParameter("pass1");
	AdminDao dao = new AdminDaoImpl();

	try

	{

		String Validateuser = dao.validateUser(uname, pass);

		if(Validateuser==null)
		{
			application.setAttribute("errMsg","Invalid credentials");
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
		else if (Validateuser.equals("Admin")) 
		{
			session.setAttribute("uname", uname);
			session.setAttribute("role", "Admin");
			session.setAttribute("Admin", uname); //setting session attribute
			session.setMaxInactiveInterval(60 * 60);
			request.setAttribute("userName", uname);
			request.getRequestDispatcher("AWelcome.jsp").forward(request, response);

		}

		else if (Validateuser.equals("User"))

		{
			session.setAttribute("uname", uname);
			session.setAttribute("role", "User");
			session.setMaxInactiveInterval(60 * 60);
			session.setAttribute("User", uname);

			request.setAttribute("userName", uname);

			request.getRequestDispatcher("UWelcome.jsp").forward(request, response);

		}

	}
	catch (Exception e2)
	{
		e2.printStackTrace();

	}
	%>

</body>
</html>
