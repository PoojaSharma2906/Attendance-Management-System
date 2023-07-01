<%@page errorPage="error.jsp" %>

<!DOCTYPE html>
<html>
<head>
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
    <title>Admin Welcome Page</title>
<%@include file="components/allcsscdn.jsp" %>

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
    
    	if(session.getAttribute("role") != "Admin"){
    		
    		application.setAttribute("errMsg","Pls Login First as Admin !!");
    		request.getRequestDispatcher("index.jsp").forward(request,response);
    	}
    %>
</head>
<body background="Images/Admin.jpg">
			<%@include file="components/navbar.jsp" %>
			
			<div class="d-grid gap-4 col-6 mx-auto" class="container center">
  			
  			<form>
  			<button formaction= "Adduser.jsp" class="btn btn-dark block" type="submit">Add New User</button>
 			<button formaction= "Allusers.jsp" class="btn btn-dark block" type="submit">All Users Details</button>
 			<button formaction= "AllAttendance.jsp" class="btn btn-dark block" type="submit">All User Attendance</button>
 			<button formaction= "Approveleave.jsp" class="btn btn-dark block" type="submit">Approve Leave</button>
 			<button formaction= "LeaveDetails.jsp" class="btn btn-dark block" type="submit">Leave Details</button>
 			
 			</form>
 			
			</div>

        
    
    
</body> 
</html> 
  
    