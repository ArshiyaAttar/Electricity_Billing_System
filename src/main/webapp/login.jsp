<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%@include file="loginheader.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>

<!-- css -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link href="css/style.css" rel="stylesheet" type="text/css" />

<style>
body {
	background-image: url(images/elec.jpg);
	background-repeat: no-repeat;
	background-size: cover;
}
</style>

</head>

<body>

	<main class="d-flex align-items-center" style="height:70vh">
	
	<div class="container-fluid">
	
							
		<div class="row">
		
			<div class="col-md-4 offset-md-6">
				<div class="card">
				
					<div class="card-header">Login <span style="color: red; font-style: inherit;"><%=(request.getAttribute("msg") == null) ? "" : request.getAttribute("msg")%></span>
					<span style="color: red"><%=(request.getAttribute("ermsg") == null) ? "" : request.getAttribute("ermsg")%></span>
					</div>
					
					<div class="card-body">
						<form action="LoginCtrl" method="post">


							<div class="form-group">
								<label for=""><span class="fa fa-user-circle"></span>Username</label> <input class="form-control"
									placeholder="Enter Username" name="username" required>

							</div>
							<div class="form-group">
								<label for="exampleInputPassword1"><span class="fa fa-eye-slash"></span>Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									placeholder="Enter Password" name="pass" required>
							</div>
							<!-- <div class="form-check">
    <input type="checkbox" class="form-check-input" id="exampleCheck1">
    <label class="form-check-label" for="exampleCheck1">Check me out</label>
  </div> -->
							<%-- <tr>
								<td><span style="color: #00e676; font-style: inherit;"><%=(request.getAttribute("msg") == null) ? "" : request.getAttribute("msg")%></span></td>
							</tr> --%>
							<button type="submit" class="btn btn-primary" >Login</button>
							<%-- <tr>
								<td><span style="color: #00e676"><%=(request.getAttribute("ermsg") == null) ? "" : request.getAttribute("ermsg")%></span></td>
							</tr> --%>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	</main>

	<!--  js-->
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"
		integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
	<script type="text/javascript" src="js/myjs.js">
</script>
</body>

</html>