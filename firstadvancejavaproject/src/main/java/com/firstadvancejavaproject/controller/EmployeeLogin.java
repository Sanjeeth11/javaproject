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
import jakarta.servlet.http.HttpSession;

@WebServlet("/EmployeeLogin")
public class EmployeeLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	 @Override
	    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        String email = request.getParameter("email");
	        String password = request.getParameter("psw");
	        String role = request.getParameter("role");

	        // Initialize DAO to interact with database
	        EmployeeDAO employeeDao = new EmployeeDAO();
	        EmployeeModel employee = employeeDao.getEmployeeByLogin(email, password);

	        if (employee != null) {
	            // Successful login: Store employee details in session and forward to profile page
	            HttpSession session = request.getSession();
	            session.setAttribute("employee", employee);

	            // Forward to employee profile page to display details
	            RequestDispatcher dispatcher = request.getRequestDispatcher("displayoneemployee.jsp");
	            dispatcher.forward(request, response);
	        } else {
	            // Invalid login: Show error message
	            request.setAttribute("error", "Invalid email or password.");
	            RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
	            dispatcher.forward(request, response);
	        }
	    }
}
