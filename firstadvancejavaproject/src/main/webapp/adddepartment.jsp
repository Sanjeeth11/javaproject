<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Add Department</title>
    <style>
        *,
        *::before,
        *::after {
            box-sizing: border-box;
        }

        .bg-img {
            background-image: url("siimple2.jpg");
            height: 100vh;
            width: 100%;
            background-repeat: no-repeat;
            background-size: cover;
            background-position: center;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 100%;
            max-width: 1200px;
            margin: 0 auto;
            padding: 1rem;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .form-container {
            background-color: #fff;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
            margin-right: 2rem;
        }

        .form-container h2 {
            text-align: center;
            margin-bottom: 1.5rem;
            color: #333;
        }

        .form-group {
            margin-bottom: 1rem;
        }

        .form-group label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: bold;
            color: #333;
        }

        .form-group input {
            width: 100%;
            padding: 0.8rem;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 1rem;
        }

        .form-group input[type="submit"] {
            background-color: #00aaff;
            color: white;
            border: none;
            cursor: pointer;
            padding: 0.75rem;
            font-size: 1rem;
            border-radius: 5px;
            transition: background-color 0.3s ease;
            width: 100%;
        }

        .form-group input[type="submit"]:hover {
            background-color: #0077cc;
        }

        footer {
            text-align: center;
            margin-top: 1.5rem;
            color: #333;
            font-size: 0.875rem;
        }

        /* Add a class for the cartoon image */
        .employee-image {
            max-width: 300px; /* Adjust size as needed */
            height: auto;
            animation: slideIn 1s ease-in-out;
        }

        /* Add animation to the image */
        @keyframes slideIn {
            from {
                transform: translateX(-100%);
                opacity: 0;
            }

            to {
                transform: translateX(0);
                opacity: 1;
            }
        }

        /* Responsive adjustments */
        @media (max-width: 575px) {
            .form-container {
                padding: 1.5rem;
                width: 90%;
            }

            .form-group input {
                padding: 0.7rem;
                font-size: 0.9rem;
            }

            .form-group input[type="submit"] {
                padding: 0.65rem;
                font-size: 0.9rem;
            }

            footer {
                font-size: 0.75rem;
            }

            /* Stack image and form on small screens */
            .container {
                flex-direction: column;
                align-items: center;
            }

            .form-container {
                margin-bottom: 2rem;
            }
        }

        /* Medium Devices (576px - 768px) */
        @media (min-width: 576px) and (max-width: 768px) {
            .form-container {
                padding: 2rem;
                max-width: 70%;
            }

            .container {
                padding: 0.5rem;
            }
        }

        /* Large Devices (769px - 1024px) */
        @media (min-width: 769px) and (max-width: 1024px) {
            .form-container {
                max-width: 500px;
            }

            .container {
                padding: 2rem;
            }
        }

        /* Extra Large Devices (1025px and up) */
        @media (min-width: 1025px) {
            .container {
                max-width: 1200px;
            }

            .form-container {
                max-width: 400px;
            }

            .form-group input {
                font-size: 1.2rem;
                padding: 1rem;
            }

            .form-group input[type="submit"] {
                padding: 1rem;
                font-size: 1.1rem;
            }
        }

        .error-message {
            color: red;
            font-size: 0.875rem;
            display: none;
        }
    </style>
    <script type="text/javascript">
        function showPopup(message, type) {
            if (type === "success") {
                alert(message);  // Success pop-up
            } else if (type === "error") {
                alert(message);  // Error pop-up
            }
        }
    </script>
</head>

<body>

<% 
    // Retrieve session and user-specific data
    HttpSession session1 = request.getSession(false);
    String username = null;
    if (session != null) {
        username = (String) session1.getAttribute("email");  // Retrieve the username from session
    }
    %>
            <h1 class="heading">Hello <%= username != null ? username : "Guest" %>!</h1>
    
    <div class="bg-img">
        <div class="container">
            <!-- Form and Image Section -->
            <div class="form-container">
                <h2>Add Department</h2>

                <!-- Display message based on the type -->
                <c:if test="${not empty message}">
                    <div class="<c:out value='${messageType}' />-message">
                        <p><c:out value="${message}" /></p>
                    </div>

                    <!-- Trigger pop-up based on message type -->
                    <script type="text/javascript">
                        showPopup("${message}", "${messageType}");
                    </script>
                </c:if>

                <form class="form-group" id="registrationForm" action="HomePageController2" method="POST">
                    <div class="form-group">
                        <label for="DeptName">Department Name:</label>
                        <input type="text" id="dname" name="dname" maxlength="30" required placeholder="Department Name">
                    </div>

                    <div class="form-group">
                        <label for="DeptLocation">Department Location:</label>
                        <input type="text" id="dloc" name="dloc" maxlength="20" required placeholder="Department Location">
                    </div>

                    <div class="form-group">
                        <input type="submit" id="submit" value="Submit">
                    </div>
                </form>
            </div>

            <!-- Cartoon image of the employee -->
            <div>
                <img src="https://i.pinimg.com/originals/42/36/d0/4236d00b6df31c5c1dab3566fa61ff3c.gif" alt="Employee Cartoon" class="employee-image">
            </div>
        </div>
    </div>
</body>

</html>
