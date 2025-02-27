<%@page import="com.ebilling.Model.RegDAO"%>
<%@page import="com.ebilling.bean.UserBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="header.jsp"%>
<%@page import="com.ebilling.*"%>
<%
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>

/* table formatting */
table {
	font-family: arial, sans-serif;
	border-collapse: collapse;
	width: 100%;
}

td, th {
	border: 1px solid #dddddd;
	text-align: left;
	padding: 8px;
}

tr:nth-child(even) {
	background-color: #dddddd;
}

body {
	background-image: url(images/elec.jpg);
	background-repeat: no-repeat;
	background-size: cover;
}
</style>
</head>
<body>

	<%
		String id = request.getParameter("id");
		UserBean bean = RegDAO.getRecordById(Integer.parseInt(id));
	%>
	<main class="d-flex align-items-center" style="height:105vh">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-5 offset-md-6">
				<div class="card">
					<div class="card-header">Edit the user</div>
					<div class="card-body">
						<form action="RegCtrl" method="post">
							<center>
								<span style="color: #00e676; font-style: inherit;"><%=(request.getAttribute("msg") == null) ? "" : request.getAttribute("msg")%></span>
							</center>
							<input type="hidden" name="id" value="<%=bean.getUserid()%>">

							<div class="form-group">
								<label for="formGroupExampleInput">User Id</label> <input
									type="text" class="form-control" id="formGroupExampleInput"
									placeholder="Example input" name="userid"
									value="<%=bean.getUserid()%>" disabled>
							</div>
							<div class="form-group">
								<label for="formGroupExampleInput2">UserName</label> <input
									type="text" class="form-control" id="formGroupExampleInput2"
									placeholder="Another input" name="uname"
									value="<%=bean.getUsername()%>" disabled>
							</div>
							<div class="form-group">
								<label for="formGroupExampleInput2">Email</label> <input
									type="text" class="form-control" id="formGroupExampleInput2"
									placeholder="Another input" name="email"
									value="<%=bean.getUseremail()%>">
							</div>
							<div class="form-group">
								<label for="formGroupExampleInput2">Phone</label> <input
									type="text" class="form-control" id="formGroupExampleInput2"
									placeholder="Another input" name="phone"
									value="<%=bean.getUserphone()%>">
							</div>
							<div class="form-group">
								<label for="formGroupExampleInput2">Address</label> <input
									type="text" class="form-control" id="formGroupExampleInput2"
									placeholder="Another input" name="address"
									value="<%=bean.getUseraddress()%>">
							</div>
							<div class="form-group">
								<label for="formGroupExampleInput2">Password</label> <input
									type="text" class="form-control" id="formGroupExampleInput2"
									placeholder="Another input" name="password"
									value="<%=bean.getPassword()%>" disabled>
							</div>
							<button type="submit" class="btn btn-info" name="Action"
								value="Edit">Edit</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	</main>
	</form>
</body>
</html>