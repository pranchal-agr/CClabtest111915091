package com.login;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.login.dao.LoginDao;

@WebServlet("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Login() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String first = request.getParameter("first");
		String mis = request.getParameter("mis");
		
		LoginDao dao = new LoginDao();
		
		if(dao.check(first, mis))
		{	
			HttpSession session = request.getSession();
			session.setAttribute("first",first);
			response.sendRedirect("report.jsp");
		}
		else
		{
			response.sendRedirect("login.jsp");
		}
		
	}

}
