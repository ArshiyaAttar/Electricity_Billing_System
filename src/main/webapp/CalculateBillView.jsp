<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ page import="java.util.*" %>
    <%@page import="com.ebilling.DBConnection.DBConnect"%>
<%@page import="java.sql.*"%>
    <%@include file="header.jsp" %>
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

 <main class="d-flex align-items-center" style="height:128vh">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-8 offset-md-2">
				<div class="card">
					<div class="card-header"><strong>Enter Bill Information</strong></div>
					<div class="card-body">
					
						 <form action="CalcBillCtrl" method="post" > 
<center><span style="color: #00e676; font-style: inherit;" ><%=(request.getAttribute("msg") == null) ? "" : request.getAttribute("msg")%></span>
</center>
							<div class="form-group">
								<label for="">UserId</label>
								<input class="form-control" type="text" placeholder="Search.." name="userid" pattern="\d*"  required>
								 <input  type="submit" name="Action" value="Search" class="btn btn-info"> 
								<!--  <input class="form-control"
									placeholder="Enter User id" name="userid" onchange="myFunction(this.value)"  pattern="(1/2)?[7-9][0-9]{9}" required> -->
									</div>
								</form>	
	
							<%
                int count = 0;
                String color = "#e0e0e0";
                if (request.getAttribute("piList") != null) {
                    ArrayList al = (ArrayList) request.getAttribute("piList");
                    System.out.println(al);
                    Iterator itr = al.iterator();
                    while (itr.hasNext()) {
 
                        /* if ((count % 2) == 0) {
                            color = "#eeffee";
                        } */
                        count++;
                        ArrayList pList = (ArrayList) itr.next();
            %>
							<form action="CalcBillCtrl" method="post" >
							<div class="form-group">
								<label for="">UserId</label>
								<input class="form-control" type="text" value="<%=pList.get(0)%>" name="userid" >
								 
								<!--  <input class="form-control"
									placeholder="Enter User id" name="userid" onchange="myFunction(this.value)"  pattern="(1/2)?[7-9][0-9]{9}" required> -->
									</div>
									
							<div class="form-group">
								<label for="exampleInputPassword1">Name</label> <input
									type="text" class="form-control" id="exampleInputPassword1"
									placeholder="Enter Name" name="name" value="<%=pList.get(1)%>" >
							</div>
							
								<div class="form-group">
								<label for="exampleInputPassword1">Zone name</label> <input
									type="text" class="form-control" id="exampleInputPassword1"
									placeholder="Enter Zone name" name="zonename" value="<%=pList.get(2)%>">
							</div>
							
							<div class="form-group">
								<label for="exampleInputPassword1">Unit Consumed</label> <input
									type="unit" class="form-control" id="exampleInputPassword1"
									placeholder="Enter Unit" name="unit" pattern="\d*" id="unitconsumed" required>
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Any Dues</label> <input
									type="text" class="form-control" 
									placeholder="Enter Dues" name="dues" pattern="\d*" required>
							</div>
							
						
							
							<div class="form-group">
								<label for="exampleInputPassword1">Year</label>
								 <!-- <input
									type="text" class="form-control" id="exampleInputPassword1"
									placeholder="Enter Month" name="month" required> -->
									<select name="year" class="form-control">
									<option value="2020">2020</option>
									<option value="2019">2019</option>
									
									<option value="2018">2018</option>
									<option value="2017" >2017</option>
									
									
									
									
									</select>
									
							</div>
							
							<div class="form-group">
								<label for="exampleInputPassword1">Month</label>
								 <!-- <input
									type="text" class="form-control" id="exampleInputPassword1"
									placeholder="Enter Month" name="month" required> -->
									<select name="month" class="form-control">
									<option value="January">January</option>
									<option value="February">February</option>
									<option value="March">March</option>
									<option value="April">April</option>
									<option value="May">May</option>
									<option value="June">June</option>
									<option value="July">July</option>
									<option value="August">August</option>
									<option value="September">September</option>
									<option value="October">October</option>
									<option value="November">November</option>
									<option value="Decemeber">December</option>
									</select>
									
							</div>
							 <tr>
								<td><span style="color: #00e676; font-style: inherit;"><%=(request.getAttribute("msg") == null) ? "" : request.getAttribute("msg")%></span></td>
							</tr> 
							
							<button type="submit" class="btn btn-primary" name="Action" value="Calculate Bill">Calculate Bill</button>
							<%
                    }
                }
                 if (count == 0) {
            %>
            
                <b>Enter valid Record</b>
                		       
             
            <%            }
            %>
						
							
						 </form> 
						
					</div>
					
				</div>
			</div>
		</div>
	</div>
	</main> 
	
	
	<!--  js-->
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"
		integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
	<script type="text/javascript" src="js/myjs.js">	
</script>
<script>

	  var input = document.getElementById('unitconsumed');
	  input.oninvalid = function(event) {
		    event.target.setCustomValidity('Please enter number only!!');
		}
	

</script>
</body>
</html>