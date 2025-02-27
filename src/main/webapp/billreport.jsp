
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.lang.*"%>
   <%@page import="java.time.format.*"%>
    <%@ page import="java.sql.Timestamp" %>
    <%@page import="java.util.*" %>
    <%@ page import="java.text.SimpleDateFormat" %>
    <%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.ebilling.DBConnection.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.ebilling.Model.*" %>
<%@ page import="com.ebilling.bean.*" %>
    <%@include file="header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<!-- css -->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
 <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
         <!-- Script -->
   <!-- <script src='jquery-3.3.1.js' type='text/javascript'></script>
   <script src='jquery-ui.min.js' type='text/javascript'></script> -->
  
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

<form class="example" action="billreport.jsp" style="margin:auto;max-width:300px; float:inherit;" >

 <!-- <label><strong style="color: red;"> User Id &nbsp&nbsp&nbsp</label></strong> <input type="text" placeholder="Search.." name="userid" required> -->
<!--  <label><strong> Zone Name</label></strong> <input type="text" placeholder="Search.." name="zone"> -->
 <div class="input-group rounded">
<strong style="color: red;"> User Id &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</label></strong>
  <input type="search" class="form-control rounded" placeholder="Search By Id" name="userid" aria-label="Search"
    aria-describedby="search-addon" required />&nbsp
  <button type="submit"><i class="fa fa-search " style="color: blue;"></i></button>
</div>
   
</form>
<br>
<form class="example" action="" style="margin:auto;max-width:300px; float:inherit;" >

 
  <!-- <label><strong style="color: red;"> Date&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</label></strong> <input type="date"  placeholder="Search.." name="dor"  id="myInput"> -->  
  <!-- <button type="submit"><i class="fa fa-search"></i></button> -->
</form>
<table class="table table-striped" border="1"   bordercolor="black" style="font-family: sans-serif; font-variant: normal; " align="center" cellpadding="10" cellspacing="5">
<tr>
<thead align="center">
<th>ID</th>
<th>USERID</th>
	<th>NAME</th>
	<th>UNIT</th>
	<!-- <th>YEAR</th>
	<th>MONTH</th> -->
	<th>Bill Amount <i class="fa fa-inr" aria-hidden="true"></i></th>
	<!-- <th>Due</th> -->
	<th>Amount Paid <i class="fa fa-inr" aria-hidden="true"></i></th>
	<th>Date & Time </th></thead>
	<!-- <th>ACTION</th> -->
	</tr>
	<%
	int index=1;
/* 	Timestamp date1=Validation.convertStringToTimestamp(request.getParameter("dor")); */
	String id=request.getParameter("userid");
	
	
	//System.out.print("field of date is "+date1);
Connection con=DBConnect.getConn();
Statement statement=con.createStatement();
String sql=null;
if(id!=null )
{
	sql="SELECT * FROM E_CALBILL WHERE STATUS= 'PAID' AND USERID='"+id+"'";
}
/* else if(date1!=null)
{
	sql="SELECT * FROM E_CALBILL WHERE STATUS= 'NOT PAID' AND DATEANDTIME='"+date1+"'";
	 //sql="SELECT * FROM E_CALBILL WHERE STATUS= 'NOT PAID' AND DATEANDTIME like '"+date1+"GMT%'";
}  */  
 
else
{
	sql="SELECT * FROM E_CALBILL WHERE STATUS= 'PAID' ORDER BY ID DESC ";
}
ResultSet resultSet=statement.executeQuery(sql);
while(resultSet.next())
{
	%>
	
	<tbody align="center">
	<tr>
	<td><%=index++ %></td>
	<td><%=resultSet.getInt(2) %></td>
	
	<td><%=resultSet.getString(7) %></td>
	<td><%=resultSet.getInt(3) %></td>
	
	
	<td><%=resultSet.getInt(6) %></td>
	

	<%-- <td><%=resultSet.getString(5) %></td> --%>
	
	
	
	
	
	
	
	
	
	
	
	
	
	<td><%=resultSet.getInt(11) %></td>
	<td><%=resultSet.getTimestamp(12).toGMTString()
	
	
  /* //Date d=resultSet.getTimestamp(12); 
	
	//out.println(formatter6.format(d)); */  %></td>
	
	
	
	
	<%
}
%>

</tr>
</tbody>
	</table>
</body>
</html>