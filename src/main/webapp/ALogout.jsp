<%@page errorPage="error.jsp" %>

	<%
	request.getSession(false);
	if(session != null)
	{
		session.invalidate();
		application.setAttribute("successMsg","Logout Succesfully!!!");
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}
	%>