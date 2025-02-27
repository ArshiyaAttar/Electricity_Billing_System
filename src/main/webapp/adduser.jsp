<%@page import="com.ebilling.bean.UserBean"%>
<%@page import="com.ebilling.DBConnection.DBConnect"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add User</title>
<!-- css -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
<%
String errormsg="";
if(session.getAttribute("ERROR")!=null)
{
	errormsg=(String)session.getAttribute("ERROR");
}


%>

<body>

	<main class="d-flex align-items-center" style="height:90vh">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-5 offset-md-6">
				<div class="card" >
					<div class="card-header">Register</div>
					<div class="card-body">
						<form action="RegCtrl" method="post">
<center><span style="color: #00e676; font-style: inherit;"><%=(request.getAttribute("regmsg") == null) ? "" : request.getAttribute("regmsg")%></span></center>

							<div class="form-group">
								<label for=""><span class="fa fa-user-circle"></span> Username</label>
								<input class="form-control" placeholder="Enter Username"  id="username" 
									name="username" required>
									<span style="color: red; font-style: inherit;"><%=(request.getAttribute("umsg") == null) ? "" : request.getAttribute("umsg")%></span>
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1"><span class="fa fa-envelope-open"></span> Email address</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="email" placeholder="Enter email">								
							</div>
							<div class="form-group">
								<label for=""><span class="fa fa-phone"></span> Phone</label>
								<input class="form-control" maxlength="10" placeholder="Enter Mobile number"
									name="phone" required>
									<span style="color: red; font-style: inherit;"><%=(request.getAttribute("no") == null) ? "" : request.getAttribute("no")%></span>
							</div>
							<div class="form-group">
								<label for=""><span class="fa fa-address-card"></span> Address</label>
								<input class="form-control" placeholder="Enter Address"
									name="address" required>
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1"><span
									class="fa fa-eye-slash"></span> Password</label> <input type="password"
									class="form-control" id="exampleInputPassword1"
									placeholder="Enter Password" name="pass" required>
							</div>
							
							<tr>
								<td><%-- <span style="color: #00e676; font-style: inherit;"><%=(request.getAttribute("regmsg") == null) ? "" : request.getAttribute("regmsg")%></span> --%></td>
							</tr>
							<%-- <tr>
								<td><span style="color: #00e676; font-style: inherit;"><%=(request.getAttribute("id") == null) ? "" : request.getAttribute("id")%></span></td>
							</tr> --%>
							<button type="submit" class="btn btn-primary" name="Action" value="Add User">Add User</button>
							
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
	<script type="text/javascript" src="js/myjs.js"></script>
	<script>
	var input = document.getElementById('username');
	input.oninvalid = function(event) {
	    event.target.setCustomValidity('Username should only contain  letters. e.g. john');
	}
	</script>
	
	
</body>
</html>