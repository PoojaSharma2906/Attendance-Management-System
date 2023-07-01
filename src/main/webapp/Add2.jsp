<%@page errorPage="error.jsp"%>
<%@page import="com.nobious.bean.User"%>
<%@page import="com.nobious.dao.impl.AdminDaoImpl"%>
<%@page import="com.nobious.dao.AdminDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add User</title>
<%@include file="components/allcsscdn.jsp"%>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
	integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer" defer></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous" defer></script>
<%
    
    	if(session.getAttribute("role") != "Admin"){
    		
    		application.setAttribute("errMsg","Please login first as Admin !!!");
    		request.getRequestDispatcher("index.jsp").forward(request,response);
    	}
    %>
</head>
<body>

	<%
		String uname=request.getParameter("uname");
		String email=request.getParameter("email");
		String pass=request.getParameter("pass");
		Long phoneno = Long.parseLong(request.getParameter("phoneno"));
		
		AdminDao dao=new AdminDaoImpl();
		User user=new User();
		user.setName(uname);
		user.setPhoneno(phoneno);
		user.setEmail(email);
		user.setPassword(pass);
		System.out.println(user);
		boolean status=dao.addUser(user);
		if(status)
		{
			application.setAttribute("successMsg","User Added Successfully!!!");
	%>
	<div class="modal" tabindex="-1" id="success">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Success</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<p>User added successfully!</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>

				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
// $('#success').modal('show');
window.onload = function () {
        // https://getbootstrap.com/docs/5.0/components/modal/#via-javascript
        let myModal = new bootstrap.Modal(
          document.getElementById("success"),
          {}
        );
        // https://getbootstrap.com/docs/5.0/components/modal/#show
        myModal.show();
      };
</script>
	<%
	    request.getRequestDispatcher("Adduser.jsp").forward(request, response);
		}
		else
		{
		application.setAttribute("errMsg","Unable to Add user!!!");
%>

	<div class="modal" tabindex="-1" id="error">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Error : Unable to Add!!!</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<p>Unable to add user!!</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>

				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
// $('#success').modal('show');
window.onload = function () {
        // https://getbootstrap.com/docs/5.0/components/modal/#via-javascript
        let myModal = new bootstrap.Modal(
          document.getElementById("error"),
          {}
        );
        // https://getbootstrap.com/docs/5.0/components/modal/#show
        myModal.show();
      };
</script>
	<%
			request.getRequestDispatcher("Adduser.jsp").forward(request, response);	
			}
			%>





</body>
</html>