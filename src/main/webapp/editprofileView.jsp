<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.ebilling.Model.RegDAO"%>
<%@page import="com.ebilling.bean.UserBean"%>
     <%@ include file="header2.jsp" %>
     <%@page import="com.ebilling.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Insert title here</title>
<style>
body {
	background-image: url(images/elec.jpg);
	background-repeat: no-repeat;
	background-size: cover;
}</style>
</head>
<body>

<%
String id=request.getParameter("id");
UserBean bean=RegDAO.getRecordById(Integer.parseInt(id));
%>
<main class="d-flex align-items-center" style="height:105vh">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-5 offset-md-6">
				<div class="card" >
					<div class="card-header">Edit the user</div>
					<div class="card-body">
<form action="RegCtrl" method="post">
<center><span style="color: #00e676; font-style: inherit;"><%=(request.getAttribute("msg") == null) ? "" : request.getAttribute("msg")%></span></center>
<input  type="hidden" name="id" value="<%=bean.getUserid()%>">
  <div class="form-group">
    <label for="formGroupExampleInput">UserID</label>
    <input type="text" class="form-control" id="formGroupExampleInput" placeholder="Example input" name="userid" value="<%=bean.getUserid()%>" disabled>
  </div>
  <div class="form-group">
    <label for="formGroupExampleInput2">UserName</label>
    <input type="text" class="form-control" id="formGroupExampleInput2" placeholder="Another input" name="uname" value="<%=bean.getUsername()%>">
  </div>
  <div class="form-group">
    <label for="formGroupExampleInput2">Email</label>
    <input type="text" class="form-control" id="formGroupExampleInput2" placeholder="Another input" name="email" value="<%=bean.getUseremail()%>">
  </div>
  <div class="form-group">
    <label for="formGroupExampleInput2">Phone</label>
    <input type="text" class="form-control" id="formGroupExampleInput2" placeholder="Another input" name="phone" value="<%=bean.getUserphone()%>">
  </div>
  <div class="form-group">
    <label for="formGroupExampleInput2">Address</label>
    <input type="text" class="form-control" id="formGroupExampleInput2" placeholder="Another input" name="address" value="<%=bean.getUseraddress()%>">
  </div>
  <div class="form-group">
    <label for="formGroupExampleInput2">Password</label>
    <input type="text" class="form-control" id="formGroupExampleInput2" placeholder="Another input" name="password" value="<%=bean.getPassword()%>">
  </div>
  <button type="submit" class="btn btn-info" name="Action" value="Edit Profile">Edit profile</button>
  </div>
  </div>
			</div>
		</div>
	</div>
	</main>
</form>
</body>
</html>