package com.firstadvancejavaproject.controller;

import java.io.IOException;

import com.firstadvancejavaproject.DAO.DepartmentDAO;
import com.firstadvancejavaproject.model.DepartmentModel;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/UpdateDepartment1")
public class UpdateDepartment1 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Get the student id from the request
		String deptIdParam = request.getParameter("id");
		int deptId = Integer.parseInt(deptIdParam);

		DepartmentModel department = DepartmentDAO.getDeptById(deptId);

		// Set the student object as a request attribute to be used in the JSP
		request.setAttribute("department", department);

		// Forward to the JSP page for displaying the form
		RequestDispatcher dispatcher = request.getRequestDispatcher("update.jsp");
		dispatcher.forward(request, response);
	}

	// Handle form submission to update student details (POST request)
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Get the updated student details from the request
		int deptId = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		String location = request.getParameter("location");

		// Update the student details in the database
		boolean isUpdated = DepartmentDAO.updateDepartmentDetails(deptId, name, location);

		// Redirect to a confirmation page or back to the details page
		if (isUpdated) {
			response.getWriter().write("updated  student details.");
		} else {
			response.getWriter().write("Error updating student details.");
		}
	}

}
