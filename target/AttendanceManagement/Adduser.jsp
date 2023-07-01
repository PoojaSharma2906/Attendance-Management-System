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
    <title>Add User</title>
<%@include file="components/allcsscdn.jsp" %>
<style>
        
        
        .container {
            max-width: 400px;
            margin: 0 auto;
            padding: 20px;
            border-radius: 6px;
            margin-top: 40px;
            background-color: LightGray;
        }
        
</style>
<%
    
    	if(session.getAttribute("role") != "Admin"){
    		application.setAttribute("errMsg","Pls Login First as Admin !!");

    		response.sendRedirect("index.jsp");
    	}
    %>

</head>
<body background="Images/Admin.jpg">
<%@include file="components/navbar.jsp" %>
    

    <div class="container text-center">
        <form action="Add2.jsp" method="post">
        <h2><i>Add New User</i></h2><br>
            <div class="mb-3">
                <label for="uname" class="form-label">UserName:</label>
                <input type="text" class="form-control" id="uname" name="uname" required>
            </div>
            <div class="mb-3">
                <label for="pass1" class="form-label">Email:</label>
                <input type="email" class="form-control" id="email" name="email" required>
            </div>
            <div class="mb-3">
                <label for="phoneno" class="form-label">Phone Number:</label>
                <input type="tel" class="form-control" id="phoneno" name="phoneno" required>
            </div>
            <div class="mb-3">
                <label for="pass" class="form-label">Password:</label>
                <input type="password" class="form-control" id="pass" name="pass" required>
            </div>
            <button type="submit" class="btn btn-primary">Submit</button>
        </form>
        
    </div>
  
</body> 
</html>   
    