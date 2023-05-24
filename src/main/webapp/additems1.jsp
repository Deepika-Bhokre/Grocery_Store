<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html lang="en-us">
<head>
<meta charset="UTF-8">
<title>Shopkeeper Register</title>
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

input[type=text], input[type=url],input[type=number],select{
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
.form-container
{
margin-left : 600px;

}
.row
{
 margin:10px;
 padding : 10px;
}
.form-error
{
   font-size : 18px;
   color : red;
}




</style>

<body>
	<h1>Add Item</h1>
	<div class="form-container">
		<form method="post" action="AddNewItem" onsubmit="return validateAddItemForm()" id="add-form" class="add">
			<div class="row">
				<div class="col-10">
					<label for="item_name"> Name:</label>
				</div>
				<div class="col-90">
					<input type="text" id="item_name" name="item_name"
						placeholder="Enter Item Name">
				</div>
			</div>
			<div class=row>
			 <div class="col-10">
			  <label for="item_category">Category</label>
			  </div>
               <div class="col-90">
                <select name="item_category" id="Category">
                 <option value="vegetable">Vegetable</option>
                    <option value="fruit">Fruit</option>
                    <option value="dairy">Dairy</option>
                    <option value="Pulses&cereals">Pulses and Cereals</option>
                    <option value="flours">Flours</option>
                </select>
               </div>
            </div>
			<div class="row">
				<div class="col-10">
					<label for="item_price">Price:</label>
				</div>
				<div class="col-90">
					<input type="number" id="item_price" name="item_price">
				</div>
			</div>
			<div class="row">
				<div class="col-10">
					<label for="item_img">Image :</label>
				</div>
				<div class="col-90">
					<input type="url" id="item_img" name="item_img">
				</div>
			</div>
			<div class="row">
				<div class="col-10">
					<label for="stock">Stock :</label>
				</div>
				<div class="col-90">
					<input type="number" id="stock" name="stock">
				</div>
			</div>
			<div class="row">
			<p class="form-error" id="error-para"></p>
				<input type="submit" value="Add" onsubmit="return validateAddItemForm()">
			</div>
		</form>
	</div>
</body>
<%@ include file="footer.html" %>
</html>