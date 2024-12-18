<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ContactBook</title>
<%@include file="component/allcss.jsp" %>
<style type="text/css">
.back-img{
background: url("img/my contact.jpeg")no-repeat center center ;
height: 100vh;
    width: 100vw;

background-size:cover;
}

</style>
</head>
<body style="height:100vh; display:flex; flex-direction:column"  >
<%@include file="component/navbar.jsp" %>

<div class="container-fluid back-img text-center text-success">
<h1>Welcome to ContactBook</h1>
</div>
<div style="margin-top:auto;" >
<%@include file="component/footer.jsp" %>
</div></body>
</html>