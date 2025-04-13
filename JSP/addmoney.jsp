<%-- 
    Document   : addmoney
    Created on : 12-Apr-2025, 2:08:49 pm
    Author     : Priyanshu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%
    String account_no = (String) session.getAttribute("account_no");
    if (account_no == null) {
        response.sendRedirect("index.jsp?error=Please+login+first");
        return;
    }
    String error = request.getParameter("error");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Money</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Center the content of the body */
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
            background-color: #f8f9fa;
        }

        .container {
            width: 400px; /* Fixed width */
            height: 400px; /* Fixed height for square container */
            background-color: white;
            border-radius: 10px; /* Optional: round corners for the container */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        .text-center {
            margin-bottom: 20px;
        }

        h2 {
            font-size: 22px;
            color: #28a745; /* Green color for the heading */
        }

        .alert {
            font-size: 14px;
            padding: 10px;
            margin-top: 15px;
            border-radius: 5px;
            width: 100%;
        }

        .alert-danger {
            background-color: #f8d7da;
            color: #721c24;
        }

        .form-label {
            font-weight: bold;
            font-size: 14px;
        }

        .form-control {
            border-radius: 4px;
            padding: 10px;
            font-size: 14px;
        }

        .btn {
            width: 48%; /* Ensure buttons fit on the same line */
        }

        .btn-group {
            display: flex;
            justify-content: space-between;
        }

        .card {
            width: 100%;
            padding: 15px;
        }

        .d-flex {
            display: flex;
            justify-content: space-between;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="text-center">
            <h2 class="fw-bold text-success">Add Money</h2>
        </div>

        <% if (error != null) { %>
            <div class="alert alert-danger text-center">
                <%= error %>
            </div>
        <% } %>

        <div class="card shadow p-4">
            <form action="AddMoneyServlet" method="post">
                <div class="mb-3">
                    <label for="amount" class="form-label fw-semibold">Enter Amount</label>
                    <input type="number" class="form-control" name="amount" id="amount" min="0" placeholder="e.g. 100">
                </div>
                <div class="d-flex justify-content-between">
                    <button type="submit" class="btn btn-success px-4">Add</button>
                    <a href="userdetails.jsp" class="btn btn-secondary">Back to Dashboard</a>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
