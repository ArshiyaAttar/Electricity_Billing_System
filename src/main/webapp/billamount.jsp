<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.ebilling.DBConnection.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.ebilling.Model.*" %>
<%@ page import="com.ebilling.bean.*" %>
    <%@include file="header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- css -->
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
body {
	background-image: url(images/elec.jpg);
	background-repeat: no-repeat;
	background-size: cover;
}
</style>
</head>
<body>
<form class="example" action="" style="margin:auto;max-width:300px; float:inherit;" >

 <!-- <label><strong style="color: red;"> User Id &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</label></strong> <input type="text" placeholder="Search.." name="userid"> -->
<div class="input-group rounded">
<strong style="color: red;"> User Id &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</label></strong>
  <input type="search" class="form-control rounded" placeholder="Search By Id" name="userid" aria-label="Search"
    aria-describedby="search-addon" />
  
</div>
<!--  <label><strong> Zone Name</label></strong> <input type="text" placeholder="Search.." name="zone"> -->
  <!-- <button type="submit"><i class="fa fa-search"></i></button> -->
</form>
<br>
<form class="example" action="" style="margin:auto;max-width:300px; float:inherit;" >

 
  <!-- <label><strong style="color: red;"> Zone Name</label></strong> <input type="text" placeholder="Search.." name="zone">  -->
  <!-- <button type="submit"><i class="fa fa-search"></i></button> -->
  <div class="input-group rounded">
<strong style="color: red;"> Zone Name &nbsp</label></strong>
  <input type="search" class="form-control rounded" placeholder="Search By Zone Name" name="zone" aria-label="Search"
    aria-describedby="search-addon" />
  
</div>
</form>

<br>
<table class="table table-striped" border="1"   bordercolor="black" style="font-family: sans-serif; font-variant: normal; " align="center" cellpadding="10" cellspacing="5">
<tr>
<th>ID</th>
<th>USERID</th>
	<th>NAME</th>
	<th>Zone Name</th>
	<th>UNIT</th>
	<!-- <th>YEAR</th>
	<th>MONTH</th> -->
	<th>Bill Amount</th>
	<!-- <th>Due</th> -->
	<!-- <th>Amount Paid <i class="fa fa-inr" aria-hidden="true"></i></th> -->
	<!-- <th>ACTION</th> -->
	</tr>
	<% int index=1;
	String id=request.getParameter("userid");
	String zone=request.getParameter("zone");
Connection con=DBConnect.getConn();
Statement statement=con.createStatement();
String sql=null;
if(id!=null )
{
	sql="SELECT * FROM E_CALBILL WHERE STATUS= 'NOT PAID' AND USERID='"+id+"'";
}
else if(zone!=null)
{
	sql="SELECT * FROM E_CALBILL WHERE STATUS= 'NOT PAID' AND ZONE='"+zone+"'";
}
else
{
	sql="SELECT * FROM E_CALBILL WHERE STATUS= 'NOT PAID'  ORDER BY ID DESC ";
}
ResultSet resultSet=statement.executeQuery(sql);
while(resultSet.next())
{
	%>
	
	
	<tr>
	<td><%=index++ %></td>
	<td><%=resultSet.getInt(2) %></td>
	
	<td><%=resultSet.getString(7) %></td>
	<td><%=resultSet.getString(4) %></td>
	<td><%=resultSet.getInt(3) %></td>
	
	
	<td><%=resultSet.getInt(6) %></td>
	

	<%-- <td><%=resultSet.getString(5) %></td> --%>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<%
	
}
%>


	</table>
</body>
</html>