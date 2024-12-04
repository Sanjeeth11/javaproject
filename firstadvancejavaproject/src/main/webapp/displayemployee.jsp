<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.firstadvancejavaproject.model.EmployeeModel"%>
<%@page import="java.util.List"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Font Awesome CDN for Icons -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Employees List</title>
</head>

<body>

    <h2 class="text-center mt-4">List of Employees</h2>

    <% 
    List<EmployeeModel> list = (List<EmployeeModel>) request.getAttribute("employees");
    String message = (String) request.getAttribute("message");
    String messageType = (String) request.getAttribute("messageType");
    %>

    <div class="container mt-5">
        <h3 class="text-center mb-4">Employee Data</h3>

        <!-- Display the message (either success or error) -->
        <% if (message != null) { %>
            <div class="alert alert-<%= messageType %> alert-dismissible fade show" role="alert">
                <%= message %>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        <% } %>

        <table class="table table-striped table-bordered table-sm">
            <thead style="background-color: lightblue;">
                <tr>
                    <th class="text-center p-3">Employee ID</th>
                    <th class="text-center p-3">Employee Name</th>
                    <th class="text-center p-3">Employee Gender</th>
                    <th class="text-center p-3">Employee Job</th>
                    <th class="text-center p-3">Employee Status</th>
                    <th class="text-center p-3">Department Number</th>
                    <th class="text-center p-3">Delete Employee</th>
                    <th class="text-center p-3">Update Employee</th>
                </tr>
            </thead>

            <tbody>
                <% 
                if (list != null) { 
                    for (EmployeeModel e : list) { 
                %>
                    <tr>
                        <td class="text-center p-3"><%= e.getEmpId() %></td>
                        <td class="text-center p-3"><%= e.getEmpName() %></td>
                        <td class="text-center p-3"><%= e.getEmpGender() %></td>
                        <td class="text-center p-3"><%= e.getEmpJob() %></td>
                        <td class="text-center p-3"><%= e.getEmpStatus() %></td>
                        <td class="text-center p-3"><%= e.getDeptNo() %></td>
                        <!-- Delete button with trash icon -->
                        <td class="text-center p-3">
                            <a href="DeleteEmployee?id=<%= e.getEmpId() %>" class="btn btn-danger btn-sm">
                                <i class="fas fa-trash"></i> <!-- Trash icon from Font Awesome -->
                            </a>
                        </td>
                        <!-- Update button with edit icon -->
                        <td class="text-center p-3">
                            <a href="updateemp1.jsp?id=<%= e.getEmpId() %>" class="btn btn-success btn-sm">
                                <i class="fas fa-edit"></i> <!-- Edit icon from Font Awesome -->
                            </a>
                        </td>
                    </tr>  
                <% 
                    } 
                } else { 
                %>
                    <tr><td colspan="8" class="text-center p-3">No employees found.</td></tr>
                <% 
                } 
                %>
            </tbody>
        </table>
    </div>

    <!-- Bootstrap JS and Popper.js CDN -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>

</body>
</html>
