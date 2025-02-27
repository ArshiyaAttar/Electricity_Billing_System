<%@page import="com.ebilling.Model.RegDAO"%>
<%@page import="com.ebilling.bean.UserBean"%>
<%@page import="com.ebilling.DBConnection.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="header2.jsp"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/style2.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style>
body {
	background-image: url(images/elec.jpg);
	background-repeat: no-repeat;
	background-size: cover;
}
</style>
<!-- <style>

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

</style> -->
<title></title>
</head>





<%

String user=(String)session.getAttribute("user");
Connection con=DBConnect.getConn();
Statement statement=con.createStatement();
String sql="SELECT * FROM E_USER WHERE USERNAME='"+user+"'";
ResultSet rs=statement.executeQuery(sql);
while(rs.next())
{
	%>
<body>


	<div class="container " style="margin-right: -30%;">
		<div class="row">
			<h2></h2>


			<div class="col-md-7 ">

				<div class="panel panel-default">
					<div class="panel-heading">
						<h4>
							User Profile <a href="editprofileView.jsp?id=<%=rs.getInt(1)%>"><span
								class="fa fa-edit" style="font-size: 20px; color: gray;">Edit</span></a>
						</h4>
					</div>
					<div class="panel-body">

						<div class="box box-info">

							<div class="box-body">
								<div class="col-sm-6"></div>

								<br>

								<!-- /input-group -->
							</div>
							<div class="col-sm-6">
								<h4 style="color: #00b1b1;"><%=rs.getString(2) %>
								</h4>
								</span> <span><p>
										User ID:
										<%=rs.getInt(1) %></p></span>
							</div>
							<div class="clearfix"></div>
							<hr style="margin: 5px 0 5px 0;">


							<div class="col-sm-5 col-xs-6 tital ">User ID:</div>
							<div class="col-sm-7 col-xs-6 "><%=rs.getInt(1) %></div>
							<div class="clearfix"></div>
							<div class="bot-border"></div>

							<div class="col-sm-5 col-xs-6 tital ">User Name:</div>
							<div class="col-sm-7">
								<%=rs.getString(2) %></div>
							<div class="clearfix"></div>
							<div class="bot-border"></div>

							<div class="col-sm-5 col-xs-6 tital ">Email:</div>
							<div class="col-sm-7">
								<%=rs.getString(3) %></div>
							<div class="clearfix"></div>
							<div class="bot-border"></div>

							<div class="col-sm-5 col-xs-6 tital ">Contact:</div>
							<div class="col-sm-7"><%=rs.getString(4) %></div>

							<div class="clearfix"></div>
							<div class="bot-border"></div>

							<div class="col-sm-5 col-xs-6 tital ">Address:</div>
							<div class="col-sm-7"><%=rs.getString(5) %></div>

							<div class="clearfix"></div>
							<div class="bot-border"></div>

							<div class="col-sm-5 col-xs-6 tital ">Password:</div>
							<div class="col-sm-7"><%=rs.getString(6) %></div>




							<!-- /.box-body -->
						</div>
						<!-- /.box -->

					</div>


				</div>
			</div>
		</div>
		<script>
              $(function() {
    $('#profile-image1').on('click', function() {
        $('#profile-image-upload').click();
    });
});       
              </script>









	</div>
	</div>







	<%
}
%>
</body>
</html>