<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="component/allcss.jsp" %>
</head>
<body style="height:100vh; display:flex; flex-direction:column" >
<%@include file="component/navbar.jsp" %>
<%
if(user==null) {
	session.setAttribute("invalidmsg", "login please...");
 response.sendRedirect("login.jsp");}
 %>
 <div class="container-fluid">
		<div class="row p-2">

			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center text-success">Add Contact Page</h4>
						<%
;
String errormsg = (String) session.getAttribute("failedMsg");


if (errormsg != null) {
%>
    <p class="text-danger text-center"><%= errormsg %></p>
<% session.removeAttribute("failedMsg");
}
%>
						<form action="update" method="post">
						<%@ page import="com.dao.ContactDAO" %>
<%@ page import="com.conn.DbConnect" %>
<%@ page import="com.entity.Contact" %>

							<%
							int cid=Integer.parseInt(request.getParameter("cid"));
							ContactDAO dao=new ContactDAO(DbConnect.getConn());
							Contact c=dao.getContactByID(cid);

%>
          <input type="hidden" value="<%=cid %>" name="cid">
							<div class="form-group">
								<label for="exampleInputEmail1">Enter Name</label> <input
									value="<%=c.getName()%>" name="name"  type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									placeholder="Enter Name">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									value="<%=c.getEmail()%>" name="email" type="email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									placeholder="Enter email">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Enter Phone No.</label> <input
									value="<%=c.getPhno()%>" name="phno" type="number" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									placeholder="Enter Phone No">
							</div>

							<div class="text-center mt-2">
								<button type="submit" class="btn btn-primary" >Update
									Contact</button>

							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div style="margin-top: auto">
		<%@include file="component/footer.jsp"%>
	</div>
 
</body>
</html>