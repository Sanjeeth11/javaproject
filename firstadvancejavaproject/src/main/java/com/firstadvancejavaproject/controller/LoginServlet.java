package com.firstadvancejavaproject.controller;

import java.io.IOException;

import com.firstadvancejavaproject.DAO.AdminDAO;
import com.firstadvancejavaproject.model.AdminLoginModel;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();

		String email = request.getParameter("email");
		String psw = request.getParameter("psw");

		AdminLoginModel alm = new AdminLoginModel();
		alm.setEmail(email);
		alm.setPassword(psw);

		AdminDAO adao = new AdminDAO();
		boolean status = adao.getAdminInfo(alm);

		if (status) {
			session.setAttribute("email", email);
			response.sendRedirect("home.jsp?name=" + email);
			
		}

		else {
			RequestDispatcher rd = request.getRequestDispatcher("index.jsp");

			rd.include(request, response);
		}
	}

}
