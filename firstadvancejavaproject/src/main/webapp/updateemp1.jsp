<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="com.firstadvancejavaproject.model.EmployeeModel"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Include Font Awesome for icons -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
<%@ page import="com.firstadvancejavaproject.DAO.EmployeeDAO"%>
<%
    int empNo = Integer.parseInt(request.getParameter("id"));
    
    // Retrieve the employee details from the database using the ID
    EmployeeModel employee = EmployeeDAO.getEmpById(empNo);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Employee Details</title>
</head>
<body>

	<div class="container mt-5">
		<h1 class="mb-4 text-center">Edit Employee Details</h1>

		<!-- Form for editing employee details -->
		<form action="UpdateEmployee" method="post" class="border p-5 rounded shadow-lg">
			<!-- Hidden field to pass employee ID for updating -->
			<input type="hidden" id="eid" name="eid" value="<%=employee.getEmpId() %>" />

			<div class="mb-4">
				<label for="ename" class="form-label fs-5">Employee Name:</label>
				<div class="input-group">
					<span class="input-group-text"><i class="fas fa-user"></i></span>
					<input type="text" id="ename" name="ename" class="form-control form-control-sm rounded-3 py-2 px-3" 
						   value="<%=employee.getEmpName() %>" required>
				</div>
			</div>

			<div class="mb-4">
				<label for="egender" class="form-label fs-5">Employee Gender:</label>
				<div class="input-group">
					<span class="input-group-text"><i class="fas fa-genderless"></i></span>
					<input type="text" id="egender" name="egender" class="form-control form-control-sm rounded-3 py-2 px-3" 
						   value="<%=employee.getEmpGender() %>" required>
				</div>
			</div>

			<div class="mb-4">
				<label for="ejob" class="form-label fs-5">Employee Job:</label>
				<div class="input-group">
					<span class="input-group-text"><i class="fas fa-briefcase"></i></span>
					<input type="text" id="ejob" name="ejob" class="form-control form-control-sm rounded-3 py-2 px-3" 
						   value="<%=employee.getEmpJob() %>" required>
				</div>
			</div>

			<div class="mb-4">
				<label for="estatus" class="form-label fs-5">Employee Status:</label>
				<div class="input-group">
					<span class="input-group-text"><i class="fas fa-check-circle"></i></span>
					<input type="text" id="estatus" name="estatus" class="form-control form-control-sm rounded-3 py-2 px-3" 
						   value="<%=employee.getEmpStatus() %>" required>
				</div>
			</div>

			<div class="mb-4">
				<label for="dno" class="form-label fs-5">Department Number:</label>
				<div class="input-group">
					<span class="input-group-text"><i class="fas fa-building"></i></span>
					<input type="text" id="dno" name="dno" class="form-control form-control-sm rounded-3 py-2 px-3" 
						   value="<%=employee.getDeptNo() %>" required>
				</div>
			</div>

			<div class="text-center">
				<button type="submit" class="btn btn-primary rounded-pill px-5 py-3 fs-5">Update Details</button>
			</div>
		</form>
	</div>

</body>
</html>
