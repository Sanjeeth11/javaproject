package com.firstadvancejavaproject.controller;

import java.io.IOException;
import java.util.List;

import com.firstadvancejavaproject.DAO.EmployeeDAO;
import com.firstadvancejavaproject.model.EmployeeModel;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/DeleteEmployee")
public class DeleteEmployee extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String idstr = request.getParameter("id");
		int id = Integer.parseInt(idstr);

		EmployeeModel em = new EmployeeModel();
		em.setEmpId(id);

		EmployeeDAO edao = new EmployeeDAO();
		boolean status = edao.deleteEmp(em);

		if (status) {

			request.setAttribute("message", "Employee deleted successfully!");
			request.setAttribute("messageType", "success");
		} else {
			// If insertion fails, set error message
			request.setAttribute("message", "Failed to delete Employee.");
			request.setAttribute("messageType", "error");
		}

		List<EmployeeModel> employees = edao.getEmpInfo();
		request.setAttribute("employees", employees);

		// Forward to JSP page to display result
		RequestDispatcher rdisp = request.getRequestDispatcher("/displayemployee.jsp");
		rdisp.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
