package com.servlet;

import java.io.IOException;

import com.conn.DbConnect;
import com.dao.ContactDAO;
import com.entity.Contact;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/addcontact")
public class AddContact extends HttpServlet {

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//String parameter = req.getParameter("userid");
		
		int userId = Integer.parseInt(req.getParameter("userId"));
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String phno = req.getParameter("phno");

		Contact c =new Contact(name,email,phno,userId);
		ContactDAO dao=new ContactDAO(DbConnect.getConn());
		HttpSession session=req.getSession();
		boolean f=dao.saveContact(c);
		if(f) {
			session.setAttribute("succMsg", "Your Contact Saved");
			resp.sendRedirect("addcontact.jsp");
			
			
		}else {
			session.setAttribute("failedMsg", "Something wrong on server...");
			resp.sendRedirect("addcontact.jsp");
		}
	//	System.out.println(userId + " " + email + " " + name + " " + phno);

	}

}
