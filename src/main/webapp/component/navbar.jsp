<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <a class="navbar-brand" href="#">ContactBook<i class="fa-solid fa-address-book"></i></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="index.jsp">Home<i class="fa-solid fa-house"></i> <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="addcontact.jsp">Add Phone No <i class="fa-solid fa-plus"></i></a>
      </li>
      
      <li class="nav-item active">
        <a class="nav-link " href="viewContact.jsp">View Contact<i class="fa-regular fa-eye"></i></a>
      </li>
    </ul>
    <%@ page import="com.entity.User" %>
    <%User user=(User) session.getAttribute("user");
    if(user==null){%>
    
    <form class="form-inline my-2 my-lg-0">
     <a href="login.jsp" class="btn btn-success">Login<i class="fa-solid fa-right-to-bracket"></i></a>
     <a href="register.jsp" class="btn btn-danger ml-2">Register<i class="fa-solid fa-user"></i></a>
     </form>
     <%}
    else{ %>
     <form class="form-inline my-2 my-lg-0">
     <button class="btn btn-success"><%= user.getName() %></button>
   <a data-toggle="modal" data-target="#exampleModalCenter" class="btn btn-danger ml-2">logout<i class="fa-solid fa-right-to-bracket"></i></a>
     </form>
    <%  }%>
  </div>
  
<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Log out</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body text-center">
      <h6>Do you Want Logout</h6>
         <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <a href="logout"  class="btn btn-primary">Logout</a>
      </div>
      <div class="modal-footer">
       
      </div>
    </div>
  </div>
</div>
</nav>