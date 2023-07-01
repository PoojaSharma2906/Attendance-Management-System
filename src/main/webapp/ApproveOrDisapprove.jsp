<%@page import="com.nobious.dao.impl.UserDaoImpl"%>
<%@page import="com.nobious.dao.UserDao"%>
<%@page import="com.nobious.dao.impl.ConnectionProvider"%>
	<%@page import="java.sql.PreparedStatement"%>
	<%@page import="java.sql.Connection"%>
	<%@page import="com.nobious.dao.impl.AdminDaoImpl"%>
	<%@page import="com.nobious.dao.AdminDao"%>
	<%@page errorPage="error.jsp" %>
	
	<%
	String leaveType=request.getParameter("ltype");
	String uname=request.getParameter("username");
	String date=request.getParameter("date");
	Connection con=ConnectionProvider.getConnection();
	AdminDao dao=new AdminDaoImpl();
	boolean status=false;
	if(request.getParameter("status").equals("approve"))
	{
		status=dao.approveLeaveTransaction(uname, leaveType, date);
		if(status)
			application.setAttribute("successMsg","Leave Approved Succesfully!!!");
		else
			application.setAttribute("errMsg","Unable to Approve Leave!!!");

	}
	else
	{
		status=dao.disApproveLeaveTransaction(uname, leaveType, date);
		if(status)
			application.setAttribute("successMsg","Leave Disapproved Succesfully!!!");
		else
			application.setAttribute("errMsg","Unable to Disapprove Leave!!!");
	}
	%>
	<jsp:forward page="Approveleave.jsp"/>