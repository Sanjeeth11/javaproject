package com.firstadvancejavaproject.controller;

import java.io.IOException;
import java.util.List;

import com.firstadvancejavaproject.DAO.DepartmentDAO;
import com.firstadvancejavaproject.model.DepartmentModel;
import com.firstadvancejavaproject.model.EmployeeModel;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/DeleteDepartment")
public class DeleteDepartment extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String idstr = request.getParameter("id");
		int id = Integer.parseInt(idstr);

		DepartmentModel dm = new DepartmentModel();
		dm.setDeptNo(id);

		DepartmentDAO ddao = new DepartmentDAO();
		boolean status = ddao.deleteDept(dm);

		if (status) {

			request.setAttribute("message", "Department deleted successfully!");
			request.setAttribute("messageType", "success");
		} else {
			// If insertion fails, set error message
			request.setAttribute("message", "Failed to delete Department.");
			request.setAttribute("messageType", "error");
		}

		List<DepartmentModel> departments = ddao.getDeptInfo();
		request.setAttribute("departments", departments);

		// Forward to JSP page to display result
		RequestDispatcher rdisp = request.getRequestDispatcher("/displaydepartment.jsp");
		rdisp.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
