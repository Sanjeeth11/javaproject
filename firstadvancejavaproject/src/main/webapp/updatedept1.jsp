<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.firstadvancejavaproject.model.DepartmentModel"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Include Font Awesome for icons -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
<%@ page import="com.firstadvancejavaproject.DAO.DepartmentDAO"%>
<%
    int deptNo = Integer.parseInt(request.getParameter("id"));
    
    // Retrieve the department details from the database using the ID
    DepartmentModel department = DepartmentDAO.getDeptById(deptNo);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Department Details</title>
</head>

<body>
	<div class="container mt-5">
		<h1 class="mb-4 text-center">Edit Department Details</h1>

		<!-- Form for editing department details -->
		<form action="UpdateDepartment1" method="post" class="border p-5 rounded shadow-lg">
			<!-- Hidden field to pass department ID for updating -->
			<input type="hidden" name="id" value="<%= department.getDeptNo() %>" />

			<div class="mb-4">
				<label for="name" class="form-label fs-5">Dept Name:</label>
				<div class="input-group">
					<span class="input-group-text"><i class="fas fa-building"></i></span>
					<input type="text" id="name" name="name" class="form-control form-control-sm rounded-3 py-2 px-3" 
						   value="<%= department.getDeptName() %>" required>
				</div>
			</div>

			<div class="mb-4">
				<label for="location" class="form-label fs-5">Dept Location:</label>
				<div class="input-group">
					<span class="input-group-text"><i class="fas fa-map-marker-alt"></i></span>
					<input type="text" id="location" name="location" class="form-control form-control-sm rounded-3 py-2 px-3" 
						   value="<%= department.getLocation() %>" required>
				</div>
			</div>

			<div class="text-center">
				<button type="submit" class="btn btn-primary rounded-pill px-5 py-3 fs-5">Update Details</button>
			</div>
		</form>
	</div>

</body>
</html>
