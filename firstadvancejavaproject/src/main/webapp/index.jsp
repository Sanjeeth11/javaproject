<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Form</title>
    <link href="https://fonts.googleapis.com/css2?family=Lobster&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Verdana', sans-serif;
            background-color: #f4f4f9;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-image: url("https://img.freepik.com/premium-photo/modern-office-interior-design-3d-rendering-concept_433009-8894.jpg");
            background-size: cover;
            background-position: center;
            font-style: italic;
        }

        .formbox {
            background-color: rgba(255, 255, 255, 0.9);
            padding: 40px;
            border-radius: 50%; /* Make the form oval */
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
            height: 480px; /* Adjust height to make the shape oval */
            text-align: center;
            font-family: 'Verdana', sans-serif;
            opacity: 0.9;
        }

        .formbox h1 {
            font-size: 2rem;
            margin-bottom: 20px;
            color: #333;
        }

        .formbox p {
            font-size: 1rem;
            margin-bottom: 10px;
            text-align: left;
            color: #333;
        }

        .textbox-container {
            position: relative;
            margin-bottom: 20px;
        }

        .textbox {
            width: 100%;
            padding: 12px;
            padding-left: 40px; /* Space for icon */
            border-bottom: 3px solid black;
            border-top: none;
            border-radius: 25px;
            font-size: 1rem;
            color: #333;
        }

        .textbox:focus {
            outline: none;
            border-color: #5c6bc0;
        }

        .textbox-container i {
            position: absolute;
            left: 12px;
            top: 50%;
            transform: translateY(-50%);
            color: #5c6bc0;
        }

        .btn {
            width: 50%; /* Adjust the width to 50% of the container */
            padding: 6px; /* Reduced padding */
            background-color: #5c6bc0;
            border: none;
            border-radius: 6px;
            font-size: 0.8rem; /* Reduced font size */
            color: white;
            cursor: pointer;
            transition: background-color 0.3s ease;
            margin-top: 20px; /* Added margin for spacing */
        }

        .btn:hover {
            background-color: #3f51b5;
        }

        .btn:active {
            background-color: #303f9f;
        }

        .error-message {
            color: red;
            font-size: 0.875rem;
            margin-bottom: 10px;
        }

        .role-selector {
            width: 100%;
            padding: 12px;
            border-radius: 25px;
            font-size: 1rem;
            color: #333;
            margin-top: 10px;
            margin-bottom: 20px;
        }
    </style>
</head>

<body>

    <div class="formbox">
        <h1>Login</h1>
        <form id="loginForm" method="POST" onsubmit="return redirect()">
            <div id="error-container"></div>

            <p><b>Role</b></p>
            <!-- Dropdown to select Admin or Employee -->
            <select name="role" class="role-selector" id="role" required>
                <option value="">Select Role</option>
                <option value="admin">Admin</option>
                <option value="employee">Employee</option>
            </select>

            <p><b>Email</b></p>
            <div class="textbox-container">
                <i class="fas fa-envelope"></i>
                <input type="text" class="textbox" placeholder="Enter Email" name="email" id="email" maxlength="50" required>
            </div>

            <p><b>Password</b></p>
            <div class="textbox-container">
                <i class="fas fa-lock"></i>
                <input type="password" class="textbox" placeholder="Enter Password" name="psw" id="psw" minlength="6" maxlength="15" required>
            </div>

            <button type="submit" class="btn">Submit</button>
        </form>
    </div>

    <script>
        function redirect() {
            let email = document.getElementById("email").value;
            let password = document.getElementById("psw").value;
            let role = document.getElementById("role").value;
            let errorContainer = document.getElementById("error-container");
            let emailRegex = /^\w+([\.-]?\w+)@\w+([\.-]?\w+)(\.\w{2,3})+$/;

            errorContainer.innerHTML = ""; // Reset error container

            // Validate role, email, and password
            if (role === "") {
                errorContainer.innerHTML = "<p class='error-message'>Please select a role.</p>";
                return false;
            }

            if (email === "" || password === "") {
                errorContainer.innerHTML = "<p class='error-message'>Both fields are required.</p>";
                return false;
            }

            if (!emailRegex.test(email)) {
                errorContainer.innerHTML = "<p class='error-message'>Please enter a valid email address.</p>";
                return false;
            }

            // Dynamically set form action based on selected role
            if (role === "admin") {
                document.getElementById("loginForm").action = "LoginServlet";  // If admin is selected
            } else if (role === "employee") {
                document.getElementById("loginForm").action = "EmployeeLogin";  // If employee is selected
            }

            return true;
        }

        document.getElementById("psw").addEventListener("keypress", function (event) {
            let key = event.which || event.keyCode;
            if (!((key >= 65 && key <= 90) || (key >= 97 && key <= 122) || key == 32 || key == 8 || key == 0)) {
                event.preventDefault();
            }
        });
    </script>

</body>

</html>
