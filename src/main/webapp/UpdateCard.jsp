
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="header.jsp"%>
<style>




.con
{
    text-align: center;
border: 2px solid black;


margin: 50px 200px;
}
.success
{
margin-top : 40px;
}



</style>
<body>

<div class="con">
	<form action="UpdateCard" id="update-form" class="form">
		<h2 align="center">Update</h2>
		<div>
			<label for="stock">Enter New Stock</label> <input type="number"
				name="stock" id="stock" value=${card.stock}>
				<input type="hidden" name="name" id="name" value=${card.name}>
		</div>
		<div>
			<button class="success" type="submit">Update</button>
		</div>
	</form>
</div>

<%@ include file="footer.html"%>