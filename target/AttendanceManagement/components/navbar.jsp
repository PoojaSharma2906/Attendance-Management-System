
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	<div class="container-fluid">
		<a class="navbar-brand" href="#">Nobious</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="index.jsp">Home</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" role="button"
					data-bs-toggle="dropdown" aria-expanded="false"> Services </a>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="AWelcome.jsp">Admin
								Page</a></li>
						<li><hr class="dropdown-divider"></li>
						<li><a class="dropdown-item" href="UWelcome.jsp">User
								Page</a></li>

					</ul></li>

			</ul>
			<%
			if ((String) session.getAttribute("uname") == null) {
			%>
			<button class="btn btn-primary" data-bs-toggle="modal"
				data-bs-target="#AdminModal">Login</button>

			<%
			} else {
			%>
			<button class="btn btn-primary me-2"><%=(String) session.getAttribute("uname")%></button>
			<form action="ALogout.jsp" method="get">
				<button type="submit" class="btn btn-danger">Logout</button>
			</form>
			<%
			}
			%>
		</div>
	</div>
</nav>
<%
if (application.getAttribute("errMsg") != null) {
%>
<div class="alert alert-danger alert-dismissible fade show m-0"
	role="alert">
	<%=application.getAttribute("errMsg")%>
	<button type="button" class="btn-close" data-bs-dismiss="alert"
		aria-label="Close"></button>
</div>
<%
application.setAttribute("errMsg", null);
}
%>
<%
if (application.getAttribute("successMsg") != null) {
%>
<div class="alert alert-success alert-dismissible fade show m-0"
	role="alert">
	<%=application.getAttribute("successMsg")%>
	<button type="button" class="btn-close" data-bs-dismiss="alert"
		aria-label="Close"></button>
</div>
<%
application.setAttribute("successMsg", null);

}
%>


<!-- 	<div class="container"> -->

<!--Login Modal -->
<div class="modal fade" id="AdminModal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h1 class="modal-title fs-5" id="exampleModalLabel">Login</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<form action="Login.jsp" method="post">
					<div class="mb-3">
						<label for="exampleInputEmail1" class="form-label">User
							Name </label> <input type="text" class="form-control"
							id="exampleInputEmail1" aria-describedby="emailHelp"
							name="uname1">

					</div>
					<div class="mb-3">
						<label for="exampleInputPassword1" class="form-label">Password</label>
						<input type="password" class="form-control"
							id="exampleInputPassword1" name="pass1">
					</div>
					<div class="mb-3">
						<button type="reset" class="btn btn-primary">Reset</button>
						<button type="submit" class="btn btn-primary">Login</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>




