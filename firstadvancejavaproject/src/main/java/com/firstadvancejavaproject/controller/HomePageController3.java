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

@WebServlet("/HomePageController3")
public class HomePageController3 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		EmployeeDAO ddao = new EmployeeDAO();
		List<EmployeeModel> employees = ddao.getEmpInfo();
		System.out.println(employees);
		request.setAttribute("employees", employees);

		RequestDispatcher rdisp = request.getRequestDispatcher("/displayemployee.jsp");
		rdisp.forward(request, response);

	}

}
