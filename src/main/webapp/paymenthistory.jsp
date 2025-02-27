<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.ebilling.DBConnection.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.ebilling.Model.*" %>
<%@ page import="com.ebilling.bean.*" %>
    <%@include file="header2.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- css -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link href="css/style.css" rel="stylesheet" type="text/css" />
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
<table class="table table-striped" border="1"   bordercolor="black" style="font-family: sans-serif; font-variant: normal; " align="center" cellpadding="15" cellspacing="8">
<tr>
<th>ID</th>
<th>USERID</th>
<th>Username</th>	
	
	
	<th>Amount Paid</th>
	<th>Date & Time</th>
	
	
	</tr>
	<%int index=1; %>
<%
String user=(String)session.getAttribute("user");
UserBean bean=new UserBean();
bean.getUserid();
System.out.print(bean.getUserid());
Connection con=DBConnect.getConn();
Statement statement=con.createStatement();
ResultSet resultSet=statement.executeQuery("SELECT * FROM E_CALBILL where NAME='"+user+"' AND STATUS='PAID'");
while(resultSet.next())
{
	%>
	
	
	<tr>
	<td><%=index++ %></td>
	<td><%=resultSet.getInt(2) %></td>
	<td><%=resultSet.getString(7) %></td>
	<td><%=resultSet.getInt(11) %></td>
	
	
	
	
	
	

	<td><%=resultSet.getTimestamp(12) %></td>
	
	
	
	
	
	
	
	<%
}
%>


	</table>
	
</body>
</html>