<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<!-- session -->

<%
if(request.getSession(false).getAttribute("user")==null)
{
	%>
<jsp:forward page="login.jsp"></jsp:forward>
<% 
}
%>
<!-- css -->
<style>
ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
	background-color: #333;
}

li {
	float: left;
}

li a {
	display: block;
	color: white;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
}

li a:hover:not (.active ) {
	background-color: #111;
}

.active {
	background-color: #4CAF50;
}

li.dropdown {
	display: inline-block;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: #f9f9f9;
	min-width: 160px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
}

.dropdown-content a {
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
	text-align: left;
}

.dropdown-content a:hover {
	background-color: #f1f1f1;
}

.dropdown:hover .dropdown-content {
	display: block;
}
</style>

</head>
<body>

	<ul>
		<li><a href="userhome.jsp">Home</a></li>
		<li><a href="viewprofile.jsp">View profile</a></li>
		<li><a href="viewbill.jsp">View Bill</a></li>
		<li><a href="paymenthistory.jsp">Payment History</a></li>

		<li style="float: right"><a class="active" href="logout.jsp">Logout</a></li>
		<li style="float: right; color: white"><a>Welcome <%=session.getAttribute("user") %></a>

		</li>

	</ul>
</head>
<body>



</body>
</html>