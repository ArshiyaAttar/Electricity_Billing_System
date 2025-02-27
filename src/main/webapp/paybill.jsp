<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.ebilling.DBConnection.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.ebilling.Model.CalcDAO"%>
<%@page import="com.ebilling.bean.CalcBill"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ include file="header2.jsp" %>
    <%@page import="com.ebilling.*" %>
    
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
<%
String id=request.getParameter("id");
CalcBill bean=CalcDAO.getRecordById(Integer.parseInt(id));
int id2=bean.getCid();
System.out.print("ID2 IS "+id2);
%>

 <%
int result=0;
    Connection connection=DBConnect.getConn();
    Statement statement=connection.createStatement();
    ResultSet resultSet=statement.executeQuery("SELECT * FROM E_CALBILL where id='"+id2+"'");
    if(resultSet.next())
    {
    	result=resultSet.getInt(6);
    	System.out.print(result);
    }
    
    
    %> 
<form action="CalcBillCtrl" method="post">
<input  type="hidden" name="id" value="<%=bean.getCid()%>">
<main  class="d-flex align-items-center" >
<div class="container" >
<div class="card" style="width: 40rem; margin-left: 50%;" align="center" >
<div class="card-body">
<h1>Pay Bill</span></h1>
<td><span style="color: #00e676; font-style: inherit;"><%=(request.getAttribute("msg") == null) ? "" : request.getAttribute("msg")%></span></td>
<table align="center" style="font-weight: 400; font: 200; font-family: sans-serif; font-size: 100%; font-stretch:expanded;" >
<tr><td><label>Card Number</td></label>
<td><input type="text" name="card" placeholder="Valid Card Number" maxlength="12" required></td></tr>
<tr><td><label>Expiry Date</td></label>
<td><input type="text" name="ex" placeholder="MM/YY" maxlength="5" required></td></tr>
<tr><td><label>CVV Code</td></label>
<td><input type="password" name="ex" placeholder="***" maxlength="3" required></td></tr>
<tr><td><label>Bill Amount</td></label>
<td><input type="text" name="bamt" value="<%=result%>" ></td></tr>
<tr><td>
<br>
 &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<button type="submit" class="btn btn-primary" action="/Ebilling/CalcBillCtrl" name="Action" value="Pay Bill">Pay Bill</button> 
<%-- <button type="submit" class="btn btn-primary" name="Action" value="Pay Bill" ${result eq PAID ? 'disabled="disabled"' : ''} >Pay Bill</button> --%>
</td></tr>
</div>
</div>
</div>
</main>
<tr>
								<%-- <td><span style="color: #00e676; font-style: inherit;"><%=(request.getAttribute("msg") == null) ? "" : request.getAttribute("msg")%></span></td> --%>
							</tr> 
							
</table>
</form>



</body>
</html>