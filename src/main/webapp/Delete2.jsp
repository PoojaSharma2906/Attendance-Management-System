<%@page import="com.nobious.bean.Admin"%>
<%@page import="com.nobious.dao.impl.AdminDaoImpl"%>
<%@page import="com.nobious.dao.AdminDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page errorPage="error.jsp" %>

 <%
    
    	if(session.getAttribute("role") != "Admin"){
    		application.setAttribute("errMsg","Please login first as Admin !!!");
    		request.getRequestDispatcher("index.jsp").forward(request,response);
    	}
    %>

<%
	    String username=request.getParameter("username");
		AdminDao dao=new AdminDaoImpl();
		boolean status=dao.deleteUser(username);
		
		if(status)
		{
			%>
<div class="alert alert-success alert-dismissible fade show"
	role="alert">
	User <strong>Deleted </strong> Successfully!!!
	<button type="button" class="btn-close" data-bs-dismiss="alert"
		aria-label="Close"></button>
</div>
<%
		}
		else
		{
			%>
<div class="alert alert-danger alert-dismissible fade show" role="alert">
	Unable to <strong>Delete </strong> User!!!
	<button type="button" class="btn-close" data-bs-dismiss="alert"
		aria-label="Close"></button>
</div>
<%
		}
		
		request.getRequestDispatcher("Allusers.jsp").include(request,response);
	%>
