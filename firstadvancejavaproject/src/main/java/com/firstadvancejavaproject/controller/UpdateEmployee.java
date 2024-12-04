package com.firstadvancejavaproject.controller;

import java.io.IOException;

import com.firstadvancejavaproject.DAO.EmployeeDAO;
import com.firstadvancejavaproject.model.EmployeeModel;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/UpdateEmployee")
public class UpdateEmployee extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Get the student id from the request
		String empNoParam = request.getParameter("eid");
		int empNo = Integer.parseInt(empNoParam);

		EmployeeModel employee = EmployeeDAO.getEmpById(empNo);

		// Set the student object as a request attribute to be used in the JSP
		request.setAttribute("employee", employee);

		// Forward to the JSP page for displaying the form
		RequestDispatcher dispatcher = request.getRequestDispatcher("update.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int empNo = Integer.parseInt(request.getParameter("eid"));
		String ename = request.getParameter("ename");
		String egender = request.getParameter("egender");
		String ejob = request.getParameter("ejob");
		String estatus = request.getParameter("estatus");
		int dNo = Integer.parseInt(request.getParameter("dno"));

		// Update the student details in the database
		boolean isUpdated = EmployeeDAO.updateEmployeeDetails(empNo, ename, egender, ejob, estatus, dNo);

		// Redirect to a confirmation page or back to the details page
		if (isUpdated) {
			response.getWriter().write("updated  student details.");
		} else {
			response.getWriter().write("Error updating student details.");
		}

	}

}
