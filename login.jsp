<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Weather Prediction System</title>
  <link rel="stylesheet" href="style.css"/>
  <link rel="stylesheet" href="stylep.css"/>
  <style>
  
  * {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: 'Segoe UI', sans-serif;
}

body {
  height: 100vh;
  /*background: linear-gradient(135deg, #667eea, #764ba2);*/
  background: url("images/bg6.jpg");
  background-size:cover;
  display: flex;
  align-items: center;
  justify-content: center;
}

.container {
  width: 90%;
  max-width: 600px;
  background: rgba(128,128,128,0.2);
  border-radius: 15px;
  box-shadow: 0 0 20px rgba(0,0,0,0.2);
  overflow: hidden;
}

.form-box {
  padding: 70px;
}

.toggle-buttons {
  display: flex;
  justify-content: space-around;
  margin-bottom: 20px;
}

.toggle-buttons button {
  padding: 10px 30px;
  border: none;
  background: #eee;
  font-weight: bold;
  cursor: pointer;
  transition: 0.3s ease;
  border-radius: 20px;
}

.toggle-buttons button.active {
  background: #667eea;
  color: white;
}

.form {
  display: none;
  flex-direction: column;
}

.form.active {
  display: flex;
  animation: fadeIn 0.5s ease-in-out;
}

.form h2 {
  text-align: center;
  margin-bottom: 20px;
  color: orange;
}

.form input {
  padding: 12px;
  margin-bottom: 15px;
  border: 1px solid #ccc;
  border-radius: 10px;
  font-size: 14px;
}

.form button {
  padding: 12px;
  background: #667eea;
  border: none;
  color: white;
  font-weight: bold;
  border-radius: 10px;
  cursor: pointer;
  transition: background 0.3s ease;
}

.form button:hover {
  background: #5a67d8;
}

@keyframes fadeIn {
  from { opacity: 0; transform: translateY(-10px); }
  to { opacity: 1; transform: translateY(0); }
}

@media screen and (max-width: 480px) {
  .form-box {
    padding: 20px;
  }

  .toggle-buttons button {
    font-size: 14px;
    padding: 8px 20px;
  }
}
  
  </style>
</head>
<body>
<nav class="navbar1">
    <a class="brand" href="index.html">Weather Prediction System</a>
    <ul>
      <li><a href="index.html">Home</a></li>
      <li><a href="indexG.html" target="blank">Gallery</a></li>
      
    </ul>
  </nav><br><br><br><br><br>
  <div class="container">
    <div class="form-box">
      <div class="toggle-buttons">
        <button id="loginBtn" class="active">Login</button>
        <button id="registerBtn">Register</button>
      </div>

      <form id="loginForm" class="form active" action="LoginServlet" method="post">
        <h2>Login</h2>
        <input type="text" placeholder="Username" id="username" name="password" required />
        <input type="password" placeholder="Password" id="password" name="password" required />
        <button type="submit">Login</button>
      </form>
      
           <%-- Display error message if login fails --%>
        <% String error = request.getParameter("error");
            if (error != null && error.equals("1")) { %>
                <p style="color: red;">Invalid username or password. Please try again.</p>
        <% } %>
      

      <form id="registerForm" class="form" action="RegisterServlet" method="post">
        <h2>Register</h2>
        <input type="text" placeholder="Username" id="username" name="password" required />
        <input type="email" placeholder="Email" id="email" name="email" required />
        <input type="password" placeholder="Password" id="password" name="password" required />
        <button type="submit">Register</button>
      </form>
    </div>
        
         <%-- Display error message if Register Successful --%>
        <% String rs = request.getParameter("registration");
            if (rs != null && rs.equals("success")) { %>
                <p style="color: green;">Your Registration is Successful. Please Login.</p>
        <% } %>
  </div>

  <script>
    const loginBtn = document.getElementById("loginBtn");
    const registerBtn = document.getElementById("registerBtn");
    const loginForm = document.getElementById("loginForm");
    const registerForm = document.getElementById("registerForm");

    loginBtn.addEventListener("click", () => {
      loginForm.classList.add("active");
      registerForm.classList.remove("active");
      loginBtn.classList.add("active");
      registerBtn.classList.remove("active");
    });

    registerBtn.addEventListener("click", () => {
      registerForm.classList.add("active");
      loginForm.classList.remove("active");
      registerBtn.classList.add("active");
      loginBtn.classList.remove("active");
    });
  </script>
</body>
</html>
