package com.servlet;

import com.entity.User;
import jakarta.servlet.ServletException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import com.dao.UserDao;
import com.conn.DbConnect;
import com.entity.User;
/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	//private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
//    public RegisterServlet() {
//        super();
//        // TODO Auto-generated constructor stub
//    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
//	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	try {
		
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		PrintWriter out= response.getWriter();
		Connection conn = DbConnect.getConn();
		//out.print(conn);
		UserDao udao = new UserDao(conn);
		
		User u=new User(name,email,password);
		boolean f=udao.userRegister(u);
		
	
		
		HttpSession session=request.getSession();
		response.setContentType("text/html");
				

		if(f) {
			
			session.setAttribute("successmsg","User Register Successfully");
			response.sendRedirect("register.jsp");
			//System.out.println("User Register Successfuly..");
			//response.setContentType("text/html");
			//PrintWriter out1= response.getWriter();
			//out1.println("<h2>Welcome to Register Servlet </h2>");
			
		}else {
			session.setAttribute("errormsg","Something wrong on server");
			response.sendRedirect("register.jsp");
			//response.setContentType("text/html");
			//PrintWriter out= response.getWriter();
			//out.println("<h2>something went wrong </h2>");
           // System.out.print("something went wrong");
			//System.out.println("Something wrong on Server..");
		}
	}catch (Exception e) {
        e.printStackTrace();
        response.setContentType("text/html");
		PrintWriter out= response.getWriter();
        out.println("<h2>Exception occurred: " + e.getMessage() + "</h2>");
    } finally {
    	response.setContentType("text/html");
		PrintWriter out= response.getWriter();
        out.close();
    }
		
		//doGet(request, response);
	}

}
