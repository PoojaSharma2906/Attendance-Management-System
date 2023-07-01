
<%@page import="java.sql.SQLException"%>
<%@page import="com.nobious.util.DateTimeFomatter"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.nobious.dao.impl.ConnectionProvider"%>
<%@page errorPage="error.jsp" %>

<%
	try
	{
		Connection con=ConnectionProvider.getConnection();
		Statement st=con.createStatement();
		System.out.print(session.getAttribute("uname"));
	 	st.executeUpdate("insert into attendance(username,Adate) values('"+session.getAttribute("uname")+"','"+DateTimeFomatter.getCurrentTimeStamp()+"');");
		con.close();
		System.out.print("Attendance Marked");
		application.setAttribute("successMsg","Attendance Marked!!!");
	}
	catch(SQLException  se)
	{
		if(se.getMessage().contains("attendance.PRIMARY"))
		application.setAttribute("errMsg","Attendance Already Marked!!!");
	}
%>
<jsp:forward page="components/Calender1.jsp"/>