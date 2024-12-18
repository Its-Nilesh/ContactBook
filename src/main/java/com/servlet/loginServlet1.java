package com.servlet;

import jakarta.servlet.ServletException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

import com.conn.DbConnect;
import com.dao.UserDao;
import com.entity.User;

/**
 * Servlet implementation class loginServlet1
 */
@WebServlet("/login")
public class loginServlet1 extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = request.getParameter("email");
        String pass = request.getParameter("password");
        UserDao dao=new UserDao(DbConnect.getConn());
        User u=dao.loginUser(email, pass);
        HttpSession session=request.getSession();
       
        if(u !=null) {
        	session.setAttribute("user", u);
        	response.sendRedirect("index.jsp");
        	//System.out.println("User is available"+u);
        }else {
        	session.setAttribute("invalidmsg", "Invalid Email & password");
//        	PrintWriter out= response.getWriter();
//			out.println("Password is incorrect");
        	response.sendRedirect("login.jsp");
        	//System.out.println("User is not available"+u);
        }
	}

}
