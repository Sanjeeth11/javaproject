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

@WebServlet("/HomePageController4")
public class HomePageController4 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String eid = request.getParameter("eid");
		int empid = Integer.parseInt(eid);
		String ename = request.getParameter("ename");
		String egender = request.getParameter("egender");
		String ejob = request.getParameter("ejob");
		String estatus = request.getParameter("estatus");
		String dno = request.getParameter("dno");
		int deptno = Integer.parseInt(dno);
		System.out.println(eid + " " + ename + " " + egender + " " + ejob + " " + estatus+ " " + deptno);

		EmployeeModel em = new EmployeeModel();
		em.setEmpId(empid);
		em.setEmpName(ename);
		em.setEmpGender(egender);
		em.setEmpJob(ejob);
		em.setEmpStatus(estatus);
		em.setDeptNo(deptno);

		EmployeeDAO edao = new EmployeeDAO();
		String status = edao.insertEmp(em);

		if (status.equals("true")) {
			// If insertion is successful, set success message
			request.setAttribute("message", "Employee added successfully!");
			request.setAttribute("messageType", "success");
		} else {
			// If insertion fails, set error message
			request.setAttribute("message", "Failed to add Employee.");
			request.setAttribute("messageType", "error");
		}

		// Forward to JSP page to display result
		RequestDispatcher rdisp = request.getRequestDispatcher("/addemployee.jsp");
		rdisp.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
