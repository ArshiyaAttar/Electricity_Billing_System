<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.ebilling.DBConnection.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.ebilling.Model.*" %>
<%@ page import="com.ebilling.bean.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@include file="header2.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- css -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
<style>
body {
	background-image: url(images/elec.jpg);
	background-repeat: no-repeat;
	background-size: cover;
}
</style>
</head>
<body>
 <%-- <%
String user=(String)session.getAttribute("user");
Connection con=DBConnect.getConn();
Statement statement=con.createStatement();
ResultSet rs=statement.executeQuery("SELECT USERID,MONTH,TAMT FROM E_CALBILL WHERE NAME='"+user+"'");
while(rs.next())
{
	%>
	<table align="center">
	<tr><td>UserId:</td><td><%=rs.getInt(1) %></td></tr>
	<tr><td>Month:</td><td><%=rs.getString(2) %></td></tr>
	<tr><td>Bill:</td><td><%=rs.getInt(3) %></td></tr>
	<tr><td><button type="submit" class="btn btn-primary" name="Action" value="Pay">Pay</button></td></tr>
	</table>
	
	
	<%
}
%>

 --%>
<!-- New code for testing purpose  -->
<%-- <div class="container">
<div class="col-sm-5">
<select  class="form-control" name="month">
<option>Select Month</option>
<%
Connection con=DBConnect.getConn();
Statement statement=con.createStatement();
ResultSet rs=statement.executeQuery("SELECT DISTINCT MONTH,USERID,NAME,TAMT FROM E_CALBILL");
while(rs.next())
{
	%>
	
	<option value="<%=rs.getInt("month")%>"><%=rs.getInt("month") %></option>
	<%
}
%>
</select>
</div>
</div>

 --%>



 
<table class="table table-striped" border="1"   bordercolor="black" style="font-family: sans-serif; font-variant: normal; " align="center" cellpadding="10" cellspacing="5">
<tr>
<th>ID</th>
<th>USERID</th>
	<th>NAME</th>
	<th>UNIT</th>
	<th>YEAR</th>
	<th>MONTH</th>
	<th>Bill</th>
	<th>Due</th>
	<th>STATUS</th>
	<th>ACTION</th>
	</tr>
	<%int index=1; %>
<%
String user=(String)session.getAttribute("user");
UserBean bean=new UserBean();
bean.getUserid();
System.out.print(bean.getUserid());
Connection con=DBConnect.getConn();
Statement statement=con.createStatement();
ResultSet resultSet=statement.executeQuery("SELECT ID,USERID,NAME,UNIT,YEAR,MONTH,TAMT,DUES,STATUS FROM E_CALBILL where NAME='"+user+"' ");
while(resultSet.next())
{
	%>
	
	
	<tr>
	<td><%=index++%></td>
	<td><%=resultSet.getInt(2) %></td>
	<td><%=resultSet.getString(3) %></td>
	
	
	
	<td><%=resultSet.getInt(4) %></td>
	
	

	<td><%=resultSet.getString(5) %></td>
	
	
	
	<td><%=resultSet.getString(6) %></td>
	
	
	
	<td><%=resultSet.getInt(7) %></td>
	
	
	
	<td><%=resultSet.getInt(8) %></td>
	
	
	
	<td><%=resultSet.getString(9) %></td>
	
	<%String a=resultSet.getString(9);
	System.out.print("value of a is "+a);
	if(a.equals("PAID"))
	{%>
	<td><a  onclick="return false" class="btn btn-warning" >Pay</a></td></tr>
	
	<%}
	else{%>
	
	<td><a class="btn btn-primary" href="paybill.jsp?id=<%=resultSet.getInt(1)%>" onclick="return true">Pay</a></td></tr>
	<%}%>
	
	
	<%
}
%>


	</table>
	
	

<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
</body>
</html>