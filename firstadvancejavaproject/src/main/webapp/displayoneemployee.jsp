<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee Profile</title>
    <link href="https://fonts.googleapis.com/css2?family=Lobster&display=swap" rel="stylesheet">

   <style>
    body {
        font-family: 'Arial', sans-serif;
        background-color: #f4f4f9;
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
    }

    .profile-container {
        width: 60%;  /* Reduced width */
        max-width: 700px;  /* Reduced max-width */
        background-color: #ffffff;
        border-radius: 8px;
        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        padding: 30px;  /* Reduced padding */
        margin-top: 50px;
    }

    h1 {
        font-size: 2rem;
        color: #333;
        text-align: center;
        margin-bottom: 20px;
    }

    h3 {
        font-size: 1.5rem;
        color: #555;
        margin-bottom: 30px;
        text-align: center;
    }

    .detail {
        display: flex;
        justify-content: space-between;
        padding: 15px;
        margin-bottom: 15px;
        background-color: #f8f8f8;
        border: 1px solid #ddd;
        border-radius: 5px;
        font-size: 1rem;
    }

    .detail b {
        font-weight: bold;
        color: #333;
    }

    .detail span {
        color: #555;
    }

    .btn-logout {
        display: block;
        width: 30%;
        padding: 10px;  /* Reduced padding */
        background-color: blue;
        color: white;
        text-align: center;
        text-decoration: none;
        border-radius: 5px;
        margin-top: 30px;
        font-size: 1rem;  /* Reduced font size */
        transition: background-color 0.3s;
    }

    .btn-logout:hover {
        background-color: #45a049;
    }

    .btn-logout:active {
        background-color: #388e3c;
    }

    @media (max-width: 768px) {
        .profile-container {
            width: 85%;  /* Adjust width for smaller screens */
            padding: 20px;
        }

        h1 {
            font-size: 1.8rem;
        }

        h3 {
            font-size: 1.3rem;
        }

        .detail {
            flex-direction: column;
            align-items: flex-start;
            padding: 10px;
        }

        .detail b {
            margin-bottom: 5px;
        }

        .detail span {
            font-size: 0.95rem;
        }
    }
</style>
   
</head>

<body>

    <div class="profile-container">
        <h1>Welcome, ${employee.empName}</h1>
        <h3>Employee Details</h3>

        <div class="detail">
            <b>Employee Number:</b> <span>${employee.empId}</span>
        </div>
        <div class="detail">
            <b>Name:</b> <span>${employee.empName}</span>
        </div>
        <div class="detail">
            <b>Gender:</b> <span>${employee.empGender}</span>
        </div>
        <div class="detail">
            <b>Job Title:</b> <span>${employee.empJob}</span>
        </div>
        <div class="detail">
            <b>Status:</b> <span>${employee.empStatus}</span>
        </div>
        
        <div class="detail">
            <b>Department Number:</b> <span>${employee.deptNo}</span>
        </div>
        
        <div class="detail">
            <b>Email:</b> <span>${employee.email}</span>
        </div>
        
        <div class="detail">
            <b>Password:</b> <span>${employee.password}</span>
        </div>

        <a href="logoutServlet" class="btn-logout">Logout</a>
    </div>

</body>

</html>
