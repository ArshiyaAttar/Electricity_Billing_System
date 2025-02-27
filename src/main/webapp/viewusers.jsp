<%@page import="com.ebilling.DBConnection.DBConnect"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@include file="header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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

body {
  font-family: Arial;
}

* {
  box-sizing: border-box;
}

form.example input[type=text] {
  padding: 10px;
  font-size: 17px;
  border: 1px solid grey;
  float: left;
  width: 80%;
  background: #f1f1f1;
}

form.example button {
  float: left;
  width: 20%;
  padding: 10px;
  background: #2196F3;
  color: white;
  font-size: 17px;
  border: 1px solid grey;
  border-left: none;
  cursor: pointer;
}

form.example button:hover {
  background: #0b7dda;
}

form.example::after {
  content: "";
  clear: both;
  display: table;
}

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

</style>
<!-- Load icon library -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View users to Admin</title>
</head>
<body>
<form class="example" action="" style="margin:auto;max-width:300px">
  <input type="text" placeholder="Search.." name="userid">
  <!-- <button type="submit"><i class="fa fa-search"></i></button> -->
</form>
<br>

	<table>
	<tr>
	<th>User Id</th>
	<th>UserName</th>
	<th>Email</th>
	<th>Phone no</th>
	<th>Address</th>
	<!-- <th>Password</th> -->
	<th>Action</th></tr>
	<tr>
	<%
Connection con=DBConnect.getConn();
Statement statement=con.createStatement();
String id=request.getParameter("userid");
String sql=null;
if(id!=null)
{
	sql="SELECT * FROM E_USER WHERE USERID='"+id+"'";
}
else
{
	sql="SELECT * from E_USER WHERE ROLEID=2";
}
ResultSet rs=statement.executeQuery(sql);
while(rs.next())
{
	%>
	<td><%=rs.getInt(1) %></td>
	<td><%=rs.getString(2) %></td>
	<td><%=rs.getString(3) %></td>
	<td><%=rs.getString(4) %></td>
	<td><%=rs.getString(5) %></td>
	<%-- <td><%=rs.getString(6) %></td> --%>
	<td><a  href="edituser.jsp?id=<%=rs.getInt(1)%>" class="btn btn-success" >Edit</a>&nbsp
	<a  href="deleteuser.jsp?id=<%=rs.getInt(1)%>" class="btn btn-danger">Delete</a></td>
	</tr>
	
<%}
%>
</table>
</body>
</html>