<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.ebilling.DBConnection.DBConnect"%>
<%@page import="java.sql.Connection"%>
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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>

body {
	background-image: url(images/elec.jpg);
	background-repeat: no-repeat;
	background-size: cover;
}

table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 50%;
  
}

td, th {
  border: ;
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: ;
}
.profile-card {
  background: #FFB300;
  width: 56px;
  height: 56px;
  position: absolute;
  left: 50%;
  top: 50%;
  z-index: 2;
  overflow: hidden;
  opacity: 0;
  margin-top: 70px;
  -webkit-transform: translate(-50%, -50%);
  transform: translate(-50%, -50%);
  -webkit-border-radius: 50%;
  border-radius: 50%;
  box-shadow: 0px 3px 6px rgba(0, 0, 0, 0.16), 0px 3px 6px rgba(0, 0, 0, 0.23);
  animation: init 0.5s 0.2s cubic-bezier(0.55, 0.055, 0.675, 0.19) forwards, 
             moveDown 1s 0.8s cubic-bezier(0.6, -0.28, 0.735, 0.045) forwards, 
             moveUp 1s 1.8s cubic-bezier(0.175, 0.885, 0.32, 1.275) forwards, 
             materia 0.5s 2.7s cubic-bezier(0.86, 0, 0.07, 1) forwards;
}


@keyframes init {
  0% {
    width: 0px;
    height: 0px;
  }
  100% {
    width: 56px;
    height: 56px;
    margin-top: 0px;
    opacity: 1;
  }
}

@keyframes moveDown {
  0% {
    top: 50%;
  }
  50% {
    top: 40%;
  }
  100% {
    top: 100%;
  }
}

@keyframes moveUp {
  0% {
    background: #FFB300;
    top: 100%;
  }
  50% {
    top: 40%;
  }
  100% {
    top: 50%;
    background: #E0E0E0;
  }
}

@keyframes materia {
  0% {
    background: #E0E0E0;
  }
  50% {
    border-radius: 4px;
  }
  100% {
    width: 440px;
    height: 400px;
    background: #FFFFFF;
    border-radius: 4px;
  }
}

</style>

</head>
<body>

<form action="CalcBillCtrl" method="post">
<br><br><br>
<tr>
<td><span style="color: #00e676; font-style: inherit;"><%=(request.getAttribute("msg") == null) ? "" : request.getAttribute("msg")%></span></td>
</tr>
<%
Connection con=DBConnect.getConn();
Statement statement=con.createStatement();
ResultSet rs=statement.executeQuery("SELECT * FROM E_UNIT ORDER BY ID DESC");
if(rs.next())
{%>

<aside class="profile-card">


<table align="center">
<tr>
<th >Unit</th>
<th>Charge/Unit</th>
</tr>

<tr><td>Unit Greater than 300</td><td><input type="text" name="c1" value="<%=rs.getInt(2)%>"></td></tr>
<tr><td>Unit Greater 200 less than 300</td><td><input type="text" name="c2" value="<%=rs.getInt(3)%>" required></td></tr>
<tr><td>Unit Greater than 100 and less than 200</td><td><input type="text" name="c3" value="<%=rs.getInt(4)%>" required></td></tr>

<tr><td>Unit Less than 100</td><td><input type="text" name="c4" value="<%=rs.getInt(5)%>" required></td></tr>
<tr><td><button type="submit" class="btn btn-primary" name="Action" value="Update Cost" style="margin-left: 50%;">Update Cost</button></td></tr>
<% }%>
</table></aside>
</form>
</body>
</html>