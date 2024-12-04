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

@WebServlet("/HomePageController2")
public class HomePageController2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(false); // Get existing session
		if (session != null) {
			String username = (String) session.getAttribute("email"); // Retrieve username

			String dname = request.getParameter("dname");
			String dloc = request.getParameter("dloc");
			System.out.println(dname + " " + dloc);

			DepartmentModel dm = new DepartmentModel();
			dm.setDeptName(dname);
			dm.setLocation(dloc);

			DepartmentDAO ddao = new DepartmentDAO();
			String status = ddao.insertDept(dm);

			if (status.equals("true")) {
				// If insertion is successful, set success message
				request.setAttribute("message", "Department added successfully!");
				request.setAttribute("messageType", "success");
			} else {
				// If insertion fails, set error message
				request.setAttribute("message", "Failed to add Department.");
				request.setAttribute("messageType", "error");
			}

			// Forward to JSP page to display result
			RequestDispatcher rdisp = request.getRequestDispatcher("/adddepartment.jsp");
			rdisp.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
