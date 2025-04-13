<!DOCTYPE html>
<html>
<head>
    <title>Bank Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body, html {
            height: 100%;
            background-color: #f4f6f9;
        }

        .center-wrapper {
            height: 100%;
        }

        .login-container {
            max-width: 900px;
            background-color: #ffffff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 12px;
            padding: 30px;
        }

        .user-login-img {
            max-width: 100%;
            border-radius: 12px;
        }

        h2 {
            color: #007bff;
            font-weight: bold;
            font-size: 1.5rem;
        }

        .form-label {
            font-weight: 600;
            font-size: 0.9rem;
        }

        .form-control {
            border-radius: 8px;
        }

        .btn-container {
            display: flex;
            gap: 10px;
            margin-top: 10px;
        }

        .btn-link {
            font-weight: bold;
        }

        .alert-danger {
            font-size: 0.9rem;
        }
    </style>
</head>
<body>
<div class="container d-flex justify-content-center align-items-center center-wrapper">
    <div class="row login-container w-100 align-items-center">
        <!-- Left Side Image -->
        <div class="col-md-5 text-center">
            <img src="https://cdn-icons-png.flaticon.com/512/2922/2922510.png" alt="User Image" class="user-login-img" />
        </div>

        <!-- Spacer -->
        <div class="col-md-1"></div>

        <!-- Right Side Form -->
        <div class="col-md-6">
            <h2 class="text-center mb-4">Mala Mal Bank - Login</h2>
            <form action="LoginServlet" method="post">
                <div class="mb-3">
                    <label for="name" class="form-label">Name</label>
                    <input type="text" class="form-control" name="name" required />
                </div>
                <div class="mb-3">
                    <label for="mobile" class="form-label">Mobile</label>
                    <input type="text" class="form-control" name="mobile" required />
                </div>
                <div class="mb-3">
                    <label for="account_no" class="form-label">Account Number</label>
                    <input type="text" class="form-control" name="account_no" required />
                </div>
                <div class="mb-3">
                    <label for="email" class="form-label">Email</label>
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

                <div class="btn-container">
                    <button type="submit" class="btn btn-primary w-50">Login</button>
                    <a href="register.jsp" class="btn btn-secondary w-50">Create Account</a>
                </div>

                <div class="text-center mt-3">
                    <button type="button" class="btn btn-link" data-bs-toggle="modal" data-bs-target="#forgotPasswordModal">
                        Forgot Password?
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Forgot Password Modal -->
<div class="modal fade" id="forgotPasswordModal" tabindex="-1" aria-labelledby="forgotPasswordModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header bg-primary text-white">
        <h5 class="modal-title" id="forgotPasswordModalLabel">Forgot Password</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <p>Please visit our nearest bank branch to reset your password.</p>
        <ol>
          <li>Bring valid ID to the branch</li>
          <li>Request password reset form</li>
          <li>Verify identity and submit form</li>
          <li>Bank staff will reset your password</li>
        </ol>
        <p>Need help? Contact <strong>mala_mal_bank@.com</strong></p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Okay</button>
      </div>
    </div>
  </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
