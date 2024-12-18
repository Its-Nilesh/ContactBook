package com.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

/**
 * Servlet implementation class logoutServlet
 */
@WebServlet("/logout")
public class logoutServlet extends HttpServlet {
	

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     HttpSession session= request.getSession();
		//session.getAttribute("user");
		session.removeAttribute("user");
		HttpSession session2=request.getSession();
		session2.setAttribute("logmsg","logout succesfully..");
		response.sendRedirect("login.jsp");
	}

	

}
