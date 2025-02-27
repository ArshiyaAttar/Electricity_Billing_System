<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@include file="loginheader.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<%


HttpSession session2=request.getSession(false);
if(session2!=null)
{
	
	//session2.invalidate();
	session2.removeAttribute("admin");
	request.setAttribute("ermsg","You have logged out");
	RequestDispatcher dispatcher=request.getRequestDispatcher("login.jsp");
	dispatcher.forward(request, response);
	
}

%>
</body>
</html>