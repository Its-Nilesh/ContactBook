<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="component/allcss.jsp" %>

</head>
<body style="background-color:#f7faf8; display:flex; height:100vh;flex-direction:column ">
<%@include file="component/navbar.jsp" %>
<div class="container-fluid">
<div class="row p-2">

<div class="col-md-4 offset-md-3">
<div class="card">
<div class="card-body">
<h4 class="text-center text-success">Login Page</h4>
<%String invalidmsg=(String)session.getAttribute("invalidmsg");
if(invalidmsg != null){%>
<p class="text-center text-success "><%=invalidmsg %></p>
<% session.removeAttribute("invalidmsg");
}
%>
<%String logmsg=(String)session.getAttribute("logmsg");
if(logmsg != null){%>
<p class="text-center text-success "><%=logmsg %></p>
<% session.removeAttribute("logmsg");
}
%>
<form action="login" method="post">

  <div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input name="password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
  </div>
<div class="text-center mt-2">
  <button type="submit" class="btn btn-primary">Login</button>

</div>
</form>
</div>
</div>
</div>
</div>
</div>
<div style="margin-top:auto">
<%@include file="component/footer.jsp" %>
</div>
</body>
</html>