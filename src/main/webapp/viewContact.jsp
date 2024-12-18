<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="component/allcss.jsp" %>
<style type="text/css">
.crd-ho:hover{
background-color:#f7f7f7;
}
</style>
</head>
<body>
<%@include file="component/navbar.jsp" %>
<%
if(user==null) {
	session.setAttribute("invalidmsg", "login please...");
 response.sendRedirect("login.jsp");}
 %>
 <%
 String succMsg=(String)session.getAttribute("succMsg");
 String errormsg = (String) session.getAttribute("failedMsg");
 if(succMsg!=null){
%>
<div class="alert alert-success" role="alert">
 <%=succMsg %>
</div>
<% 
session.removeAttribute("succMsg"); 
 }
 if (errormsg != null) {
	 %>
	     <p class="text-danger text-center"><%= errormsg %></p>
	 <% session.removeAttribute("failedMsg");
	 }
	 %>
 
 <div class="container">
 <div class="row p-4">
 
 <%@ page import="com.dao.ContactDAO" %>
<%@ page import="com.conn.DbConnect" %>
<%@ page import="java.util.*" %>
<%@ page import="com.entity.Contact" %>
 <%
 if(user!=null){
  ContactDAO dao= new ContactDAO(DbConnect.getConn());
 
  List<Contact> contact = dao.getAllContact(user.getId());
  for(Contact c:contact){
	 %>
<div class="col-md-3">
 <div class="card crd-ho">
 <div class="card-body">
 <h5>Name:
        <%=c.getName() %></h5>
 <p>Phno:
         <%= c.getPhno()%></p>
 <p>Email:<%=c.getEmail() %></p>
 <div class="text-center">
 <a href="editcontact.jsp?cid=<%=c.getId() %>"  class="btn btn-success btn-sm text-white">Edit</a>
 <a href="delete?cid=<%=c.getId() %>"  class="btn btn-danger btn-sm text-white">Delete</a>
 </div>
 </div>
 </div>
 </div>
 <%
 } 
    } %>
 
 
 </div>
 </div>
</body>
</html>