<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.firstadvancejavaproject.model.DepartmentModel"%>
<%@page import="java.util.List"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Font Awesome CDN for Icons -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Departments</title>
</head>

<body>
	
   
    <% 
    // Retrieve session and user-specific data
    HttpSession session1 = request.getSession(false);
    String username = null;
    if (session != null) {
        username = (String) session1.getAttribute("email");  // Retrieve the username from session
    }
    List<DepartmentModel> list = (List<DepartmentModel>) request.getAttribute("departments");
    String message = (String) request.getAttribute("message");
    String messageType = (String) request.getAttribute("messageType");
    %>
    
        <h1 class="heading">Hello <%= username != null ? username : "Guest" %>!</h1>
    
   
    <div class="container mt-5">
        <h2 class="text-center mb-4">Departments</h2>
        
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
                    <th class="text-center p-3">Department Id</th>
                    <th class="text-center p-3">Department Name</th>
                    <th class="text-center p-3">Department Location</th>
                    <th class="text-center p-3">Delete Department</th>
                    <th class="text-center p-3">Update Department</th>
                </tr>
            </thead>
            
            <tbody>
            <% 
            if (list != null) { 
                for(DepartmentModel d : list) { 
            %>
                <tr>
                    <td class="text-center p-3"><%= d.getDeptNo() %></td>
                    <td class="text-center p-3"><%= d.getDeptName() %></td>
                    <td class="text-center p-3"><%= d.getLocation() %></td>
                    <!-- Delete button with trash icon -->
                    <td class="text-center p-3">
                        <a href="DeleteDepartment?id=<%= d.getDeptNo() %>" class="btn btn-danger btn-sm">
                            <i class="fas fa-trash"></i> <!-- Trash icon from Font Awesome -->
                        </a>
                    </td>
                    <!-- Update button with edit icon -->
                    <td class="text-center p-3">
                        <a href="updatedept1.jsp?id=<%= d.getDeptNo() %>" class="btn btn-success btn-sm">
                            <i class="fas fa-edit"></i> <!-- Edit icon from Font Awesome -->
                        </a>
                    </td>
                </tr>
            <% 
                } 
            } else { 
            %>
                <tr><td colspan="5" class="text-center p-3">No departments found.</td></tr>
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
