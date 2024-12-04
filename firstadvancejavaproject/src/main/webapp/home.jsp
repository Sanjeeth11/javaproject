<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Institute Home</title>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

<style>
    body {
        background-color: #f4f4f9; /* Optional background color */
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh; /* Full height */
        margin: 0;
        flex-direction: column; /* Change to column to make space for the logout button */
    }

    /* Logout Button Style */
    .logout-btn-container {
        position: absolute;
        top: 20px;
        right: 20px;
    }

    .logout-btn {
        font-size: 16px;
        padding: 10px 20px;
        background-color: #dc3545; /* Red color for logout */
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-weight: bold;
        transition: background-color 0.3s ease;
    }

    .logout-btn:hover {
        background-color: #c82333; /* Darker red on hover */
    }

    .content {
        display: flex;
        align-items: center; /* Vertically center the content */
        justify-content: center;
        flex-direction: row; /* Align items in a row (left to right) */
    }

    .heading {
        margin-right: 30px; /* Space between heading and buttons */
        font-size: 30px; /* Font size for the heading */
        font-weight: bold;
        color: #333;
        font-family: 'Verdana', sans-serif;
        font-style: italic;
    }

    .btn-custom {
        width: 150px; /* Adjust the size to make it larger */
        height: 150px; /* Adjust the size to make it larger */
        padding: 20px; /* Padding for extra space */
        font-size: 18px;
        font-weight: bold;
        text-align: center;
        cursor: pointer;
        background-color: #007BFF; 
        color: white;
        border: 2px solid transparent;
        border-radius: 50%; /* Makes the button circular */
        transition: background-color 0.3s ease, transform 0.2s ease, border-color 0.3s ease;
        margin: 15px; /* Adds spacing between the buttons */
        display: flex;
        justify-content: center;
        align-items: center;
        text-decoration: none; /* Ensures no underline for anchor tags */
    }

    /* Hover Effect for Buttons */
    .btn-custom:hover {
        background-color: #0056b3; /* Darker blue on hover */
        transform: scale(1.1); /* Slightly increase size on hover */
        border-color: #0056b3; /* Matching border on hover */
        color: white;
    }

    .btn-custom form {
        margin: 0;
        padding: 0;
    }
    
</style>
</head>
<body>

  <!-- Logout Button -->
  <div class="logout-btn-container">
      <form action="LogoutServlet" method="POST">
          <button type="submit" class="logout-btn">Logout</button>
      </form>
  </div>

  <!-- Main Content -->
  <div class="content">
    <!-- Heading on the left side -->
    <div class="heading">
        <h1 class="heading">Welcome to the Institute 	Hello 
            <%=request.getParameter("name")%>! </h1>
    </div>
    
    <!-- Buttons and Links -->
    <div>
        <!-- Display Department -->
        <form id="hpc1" name="hpc1" method="post" action="HomePageController1">
            <button type="submit" class="btn-custom">DISPLAY DEPARTMENT</button>
        </form>

        <!-- Add Department -->
        <a href="adddepartment.jsp" class="btn-custom">ADD DEPARTMENT</a>

        <!-- Display Employee -->
        <form id="hpc3" name="hpc3" method="post" action="HomePageController3">
            <button type="submit" class="btn-custom">DISPLAY EMPLOYEE</button>
        </form>

        <!-- Add Employee -->
        <a href="addemployee.jsp" class="btn-custom">ADD EMPLOYEE</a>
    </div>
  </div>

  <!-- Optional Bootstrap JS & Dependencies -->
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  
</body>
</html>
