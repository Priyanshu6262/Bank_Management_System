<%-- 
    Document   : userdetails
    Created on : 12-Apr-2025, 2:08:38 pm
    Author     : Priyanshu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.mycompany.bankmanagementsystem.dao.DBConnection" %>
<%@ page session="true" %>
<%
    String name = (String) session.getAttribute("name");
    String mobile = (String) session.getAttribute("mobile");
    String account_no = (String) session.getAttribute("account_no");

    if (name == null || account_no == null) {
        response.sendRedirect("index.jsp?error=Please+login+first");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>User Dashboard - Bank Management</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<style>
    .user-image {
        width: 120px;
        border-radius: 50%;
    }

/*    .button-grid {
        display: grid;
        grid-template-columns: repeat(2, auto);
        gap: 10px 15px;
        margin-right: 30px;
    }

    .button-grid .btn {
        white-space: nowrap;
    }*/
    .top-button-container {
        position: absolute;
        top: 120px;
        right: 30px;
    }

    .button-grid {
        display: grid;
        grid-template-columns: repeat(2, auto);
        gap: 12px 15px;
    }

    .button-grid .btn {
        min-width: 150px;
        white-space: nowrap;
    }

</style>

</head>

</head>
<body class="bg-light">
<div class="container mt-5">
    <h2 class="text-center mb-4">Welcome, <%= name %></h2>

    <div class="mb-3">
        <strong>Account Number:</strong> <%= account_no %><br/>
        <strong>Mobile:</strong> <%= mobile %>
    </div>

<!-- First group: Add Money & Withdraw -->
<div class="button-group section-gap">
    <a href="addmoney.jsp" class="btn btn-success">Add Money</a>
    <a href="withdraw.jsp" class="btn btn-danger">Withdraw</a>
</div>

<div class="d-flex justify-content-between align-items-start">
    <!-- Centered User Image -->
    <div class="text-center flex-grow-1">
        <img src="https://cdn-icons-png.flaticon.com/512/2922/2922510.png" alt="User" class="user-image mt-3">
    </div>

   <div class="top-button-container">
    <div class="button-grid">
        <button class="btn btn-info" data-bs-toggle="modal" data-bs-target="#passbookModal">Passbook</button>
        <button class="btn btn-warning" " data-bs-toggle="modal" data-bs-target="#userInfoModal">Account Information</button>
        <button class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#loanModal">Loan</button>
        <button class="btn btn-dark" " data-bs-toggle="modal" data-bs-target="#insuranceModal">Insurance</button>
        <button class="btn btn-outline-primary" " data-bs-toggle="modal" data-bs-target="#atmCardModal">ATM Card</button>
        <button class="btn btn-outline-danger" " data-bs-toggle="modal" data-bs-target="#contactModal">Contact Us</button>
        <a href="index.jsp" class="btn btn-outline-secondary">Logout</a>
    </div>
</div>

</div>


<h4>Transaction History</h4>

<!-- Scrollable container for the table -->
<div style="max-height: 300px; overflow-y: auto;">
    <table class="table table-bordered table-striped mt-3">
        <thead class="table-dark">
            <tr>
                <th>Date</th>
                <th>Debit</th>
                <th>Credit</th>
                <th>Total</th>
            </tr>
        </thead>
        <tbody>
            <%
                try {
                    Connection conn = DBConnection.getConnection();
                    PreparedStatement ps = conn.prepareStatement("SELECT * FROM transactions WHERE account_no=? ORDER BY date DESC");
                    ps.setString(1, account_no);
                    ResultSet rs = ps.executeQuery();

                    while (rs.next()) {
                        out.println("<tr>");
                        out.println("<td>" + rs.getTimestamp("date") + "</td>");
                        out.println("<td>" + (rs.getDouble("debit") > 0 ? rs.getDouble("debit") : "-") + "</td>");
                        out.println("<td>" + (rs.getDouble("credit") > 0 ? rs.getDouble("credit") : "-") + "</td>");
                        out.println("<td>" + rs.getDouble("total") + "</td>");
                        out.println("</tr>");
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>
        </tbody>
    </table>
</div>
        <!-- Passbook Modal -->
<div class="modal fade" id="passbookModal" tabindex="-1" aria-labelledby="passbookModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-xl">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Passbook</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>
      <div class="modal-body">
        <p><strong>Name:</strong> <%= name %></p>
        <p><strong>Account Number:</strong> <%= account_no %></p>
        <div class="table-responsive" style="max-height: 300px; overflow-y: auto;">
          <table class="table table-bordered">
            <thead>
              <tr>
                <th>Date</th>
                <th>Debit</th>
                <th>Credit</th>
                <th>Total</th>
              </tr>
            </thead>
            <tbody>
              <%
                try {
                    Connection conn = DBConnection.getConnection();
                    PreparedStatement ps = conn.prepareStatement("SELECT * FROM transactions WHERE account_no=? ORDER BY date DESC");
                    ps.setString(1, account_no);
                    ResultSet rs = ps.executeQuery();
                    while (rs.next()) {
              %>
                <tr>
                  <td><%= rs.getTimestamp("date") %></td>
                  <td><%= rs.getDouble("debit") > 0 ? rs.getDouble("debit") : "-" %></td>
                  <td><%= rs.getDouble("credit") > 0 ? rs.getDouble("credit") : "-" %></td>
                  <td><%= rs.getDouble("total") %></td>
                </tr>
              <% } conn.close(); } catch(Exception e) { e.printStackTrace(); } %>
            </tbody>
          </table>
        </div>
      </div>
      <div class="modal-footer">
        <a href="DownloadPassbookServlet" class="btn btn-primary">Download</a>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<!-- User Info Modal -->
<div class="modal fade" id="userInfoModal" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header"><h5>Account Information</h5><button type="button" class="btn-close" data-bs-dismiss="modal"></button></div>
      <div class="modal-body">
        <p><strong>Name:</strong> <%= name %></p>
        <p><strong>Mobile:</strong> <%= mobile %></p>
        <p><strong>Account No:</strong> <%= account_no %></p>
        <%
          // Fetch email and total from DB
          try {
              Connection conn = DBConnection.getConnection();
              PreparedStatement ps = conn.prepareStatement("SELECT email FROM user_details WHERE account_no=?");
              ps.setString(1, account_no);
              ResultSet rs = ps.executeQuery();
              if (rs.next()) {
        %>
          <p><strong>Email:</strong> <%= rs.getString("email") %></p>
        <%
              }
              ps = conn.prepareStatement("SELECT total FROM transactions WHERE account_no=? ORDER BY date DESC LIMIT 1");
              ps.setString(1, account_no);
              rs = ps.executeQuery();
              if (rs.next()) {
        %>
          <p><strong>Total Amount:</strong> ₹<%= rs.getDouble("total") %></p>
        <%
              }
              conn.close();
          } catch(Exception e) { e.printStackTrace(); }
        %>
      </div>
      <div class="modal-footer"><button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button></div>
    </div>
  </div>
</div>

<!-- Loan Modal -->
<div class="modal fade" id="loanModal" tabindex="-1">
  <div class="modal-dialog modal-lg"> <!-- made it larger for columns -->
    <div class="modal-content">
      <div class="modal-header">
        <h5>Loan Options</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>
      <div class="modal-body">
        <div class="row text-center">
          <!-- Home Loan -->
          <div class="col-md-4 mb-4">
            <img src="images/home.jpg" width="40" class="mb-2" />
            <h6>Home Loan</h6>
            <p>8.5% interest<br>Upto ₹50 Lakhs</p>
          </div>
          <!-- Education Loan -->
          <div class="col-md-4 mb-4">
            <img src="https://cdn-icons-png.flaticon.com/128/3135/3135755.png" width="40" class="mb-2" />
            <h6>Education Loan</h6>
            <p>6.5% interest<br>Upto ₹20 Lakhs</p>
          </div>
          <!-- Personal Loan -->
          <div class="col-md-4 mb-4">
            <img src="https://cdn-icons-png.flaticon.com/128/2550/2550267.png" width="40" class="mb-2" />
            <h6>Personal Loan</h6>
            <p>11.0% interest<br>Upto ₹5 Lakhs</p>
          </div>
        </div>
        <div class="text-center">
          <button class="btn btn-primary" onclick="alert('Please visit our nearest branch with ID proof. Fill loan form and verify documents.')">Get Loan</button>
        </div>
      </div>
    </div>
  </div>
</div>


<!-- Insurance Modal -->
<div class="modal fade" id="insuranceModal" tabindex="-1">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5>Insurance Plans</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>
      <div class="modal-body">
        <div class="row text-center">
          <!-- Life Insurance -->
          <div class="col-md-4 mb-3">
            <img src="https://cdn-icons-png.flaticon.com/512/1077/1077012.png" alt="Life Insurance" width="50" height="50" class="mb-2">
            <p><strong>Life Insurance:</strong><br> Coverage up to ₹1 Cr</p>
          </div>
          <!-- Health Insurance -->
          <div class="col-md-4 mb-3">
            <img src="https://cdn-icons-png.flaticon.com/512/2965/2965567.png" alt="Health Insurance" width="50" height="50" class="mb-2">
            <p><strong>Health Insurance:</strong><br> Upto ₹25 Lakhs for family</p>
          </div>
          <!-- Vehicle Insurance -->
          <div class="col-md-4 mb-3">
            <img src="images/car.jpg" alt="Vehicle Insurance" width="50" height="50" class="mb-2">
            <p><strong>Vehicle Insurance:</strong><br> Third-party & own damage</p>
          </div>
        </div>
        <div class="text-center mt-3">
          <button class="btn btn-primary" onclick="alert('Please visit our branch to apply for insurance. Fill required documents and select plan.')">Get Insurance</button>
        </div>
      </div>
    </div>
  </div>
</div>


<!-- ATM Card Modal -->
<div class="modal fade" id="atmCardModal" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5>ATM Card Details</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>
      <div class="modal-body text-center">
        <!-- 🖼️ Card Image -->
        <img src="images/atm.jpeg" alt="ATM Card" class="mb-3" style="width: 80px;">

        <%-- Java code to generate a 16-digit random card number --%>
        <%
          String cardNumber = "";
          for (int i = 0; i < 4; i++) {
              int segment = (int)(Math.random() * 9000) + 1000;
              cardNumber += segment + (i < 3 ? " " : "");
          }
        %>

        <p><strong>Card Type:</strong> Visa Debit Card</p>
        <p><strong>Card Number:</strong> <%= cardNumber %></p>
        <p><strong>Card Limit:</strong> ₹50,000/day</p>
        <p><strong>Issued By:</strong> Mala Mal Bank</p>
      </div>
    </div>
  </div>
</div>


<!-- Contact Us Modal -->
<div class="modal fade" id="contactModal" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5>Contact Us</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>
      <div class="modal-body">
        <div class="d-flex align-items-center mb-3">
          <img src="https://img.icons8.com/ios/50/000000/phone.png" alt="Phone" class="me-3" style="width: 30px;">
          <p><strong>Toll-Free Number:</strong> 1800-123-4567</p>
        </div>
        <div class="d-flex align-items-center">
          <img src="https://img.icons8.com/ios/50/000000/mail.png" alt="Email" class="me-3" style="width: 30px;">
          <p><strong>Email:</strong> mala_mal_bank@gmail.com</p>
        </div>
      </div>
    </div>
  </div>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>


</body>
</html>

