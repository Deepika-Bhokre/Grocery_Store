<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html lang="en-us">
<head>
<meta charset="UTF-8">
<title>Customer Register</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Ubuntu&display=swap"
	rel="stylesheet">
</head>
<style>
* {
	box-sizing: border-box;
}

body {
	font-family: 'Ubuntu', sans-serif;
}

input[type=text], input[type=email], input[type=number], input[type=password],
	input[type=tel] {
	width: 45%;
	padding: 12px;
	border: 1px solid rgb(168, 166, 166);
	border-radius: 4px;
	resize: vertical;
}

textarea {
	width: 45%;
	padding: 12px;
	border: 1px solid rgb(168, 166, 166);
	border-radius: 4px;
	resize: vertical;
}

h1 {
	font-size: 40px;
	font-style: normal;
	font-weight: bold;
	text-align: center;
}

label {
	padding: 12px 12px 12px 0;
	display: inline-block;
}

input[type=submit] {
	background-color: #4CAF50;
	color: white;
	padding: 12px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	float: left;
	margin-top: 50px;
}

input[type=submit]:hover {
	background-color: #32a336;
}

.container {
	border-radius: 5px;
	margin-left: 550px;
	margin-top: 50px;
	padding: 20px;
	font-family: 'Ubuntu', sans-serif;
}

.col-10 {
	float: left;
	width: 10%;
	margin-top: 6px;
}

.col-90 {
	float: left;
	width: 90%;
	margin-top: 10px;
}

.row:after {
	content: "";
	display: table;
	clear: both;
}

.last {
	margin-top: 20px;
}
.form-error
{
  font-size : 18px;
  color : red;
}

</style>

<body>
	<h1>Customer Register</h1>
	<div class="container">
		<form method="post" action="AddCustomerRegister" onsubmit="return validateCustomerRegister()" id="customer-register-form">
			<div class="row">
				<div class="col-10">
					<label for="name"> Name:</label>
				</div>
				<div class="col-90">
					<input type="text" id="name" name="name"
						placeholder="Enter your Name">
				</div>
			</div>
			<div class="row">
				<div class="col-10">
					<label for="email">Email:</label>
				</div>
				<div class="col-90">
					<input type="email" id="email" name="email"
						placeholder="It should contain @,.">
				</div>
			</div>
			<div class="row">
				<div class="col-10">
					<label for="password">Password:</label>
				</div>
				<div class="col-90">
					<input type="password" id="password" name="password">
				</div>
			</div>
			<div class="row">
				<div class="col-10">
					<label for="mobile">Mobile:</label>
				</div>
				<div class="col-90">
					<input type="text" id="mobile" name="mobile">
				</div>
			</div>

			<div class="row">
				<div class="col-10">
					<label for="address">Address:</label>
				</div>
				<div class="col-90">
					<textarea name="address" id="address" cols="30" rows="10"></textarea>
				</div>
			</div>

			<div class="row">
				<div class="col-10">
					<label for="pin">Area PIN:</label>
				</div>
				<div class="col-90">
					<input type="number" id="pin" name="pin" maxlength=6>
				</div>
			</div>
			<div class="row">
			<p class="form-error" id="error-para"></p>
			
				<input type="submit" value="Register" onsubmit = "return validateCustomerRegister()">
			</div>
		</form>
		<div class="last">
			Already Registered <a href="Customer_Login.jsp">Login</a>
		</div>
	</div>

</body>
</html>
<%@ include file="footer.html"%>