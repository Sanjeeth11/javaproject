package com.firstadvancejavaproject.controller;

import java.io.IOException;
import java.util.List;

import com.firstadvancejavaproject.DAO.DepartmentDAO;
import com.firstadvancejavaproject.model.DepartmentModel;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/HomePageController1")
public class HomePageController1 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		 HttpSession session = request.getSession(false);  // Get existing session
	        if (session != null) {
	            String username = (String) session.getAttribute("email");  // Retrieve username

		
		
		DepartmentDAO ddao = new DepartmentDAO();
		List<DepartmentModel> departments = ddao.getDeptInfo();
		System.out.println(departments);
		request.setAttribute("departments", departments);

		RequestDispatcher rdisp = request.getRequestDispatcher("/displaydepartment.jsp");
		rdisp.forward(request, response);

	

	}

}
}
