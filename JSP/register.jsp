<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Register - Bank Management System</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            width: 80%; /* Set container width */
            max-width: 1200px; /* Set a max width */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            background-color: #ffffff;
            border-radius: 8px;
            padding: 20px;
        }

        .form-container {
            width: 50%; /* Form takes up half of the container */
            padding: 20px;
        }

        .form-label {
            font-weight: bold;
            font-size: 14px;
        }

        .form-control {
            border-radius: 4px;
            padding: 8px;
            font-size: 14px;
        }

        .image-container {
            width: 50%; /* Image takes up the other half */
            text-align: center;
        }

        .image-container img {
            max-width: 80%; /* Make sure the image doesn't overflow */
            height: auto;
            margin-top: 30px;
        }

        .btn-group {
            display: flex;
            justify-content: space-between;
        }

        h2 {
            font-size: 20px;
            color: #343a40;
        }

        .alert {
            font-size: 14px;
            padding: 10px;
            margin-top: 15px;
            border-radius: 5px;
        }

        .alert-danger {
            background-color: #f8d7da;
            color: #721c24;
        }

        .alert-success {
            background-color: #d4edda;
            color: #155724;
        }

        .text-center {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
<div class="container">
    <!-- Form Section -->
    <div class="form-container">
        <div class="text-center">
            <h2>Create New Account</h2>
        </div>
        <form action="RegisterServlet" method="post">
            <div class="mb-3">
                <label for="name" class="form-label">Full Name</label>
                <input type="text" class="form-control" name="name" required />
            </div>
            <div class="mb-3">
                <label for="mobile" class="form-label">Mobile Number</label>
                <input type="text" class="form-control" name="mobile" required />
            </div>
            <div class="mb-3">
                <label for="account_no" class="form-label">Account Number</label>
                <input type="text" class="form-control" name="account_no" id="account_no" required readonly />
            </div>
            <div class="mb-3">
                <label for="email" class="form-label">Email ID</label>
                <input type="email" class="form-control" name="email" required />
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" class="form-control" name="password" required />
            </div>

            <% String error = request.getParameter("error");
                if (error != null) { %>
                <div class="alert alert-danger"><%= error %></div>
            <% } %>

            <div class="btn-group">
                <button type="submit" class="btn btn-success">Submit</button>
                <a href="index.jsp" class="btn btn-secondary">Back to Login</a>
            </div>
        </form>
    </div>

    <!-- Image Section -->
    <div class="image-container">
        <img src="images/register_2.png" alt="Bank Image" /> 
    </div>
</div>

<script>
    // Function to generate a random 6-digit account number
    function generateAccountNumber() {
        var accountNumber = Math.floor(100000 + Math.random() * 900000); // Generates a 6-digit number
        document.getElementById("account_no").value = accountNumber; // Set the value of the input field
    }

    // Call the function on page load to set a random account number
    window.onload = generateAccountNumber;
</script>
</body>
</html>
