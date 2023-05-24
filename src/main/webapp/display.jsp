<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
  pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="jakarta.servlet.*"%>
<%@ page import="jakarta.servlet.http.*"%>
 <%@ include file="header.jsp"%>
 <%
boolean username = false;
String userType = null;
cks = request.getCookies();
if (cks != null) {
	String cookieName1 = "userType";
	String cookieName2 = "username";
	for (int i = 0; i < cks.length; i++) {
		ck = cks[i];
		if (ck.getName().equals(cookieName1)) {
	userType = ck.getValue();
		} else if (ck.getName().equals(cookieName2)) {
	username = true;
		}
	}
}%>
<style>
*{
box-sizing:border-box;
}
.container
{

display:flex;
justify-content:space-evenly;
align-items:center;

flex-wrap:wrap;
font-family: 'Ubuntu', sans-serif;	
font-weight : bold;
font-size: 18px;

}
.card-modify
{
display: flex;
justify-content: space-between;
margin-top: 30px;}

.card-container
{
border : 1px solid black;
display:inline-block;
margin : 15px;
padding : 15px;
box-shadow : 1px 1px 2px 2px;

}
img
{
height :250px;
width : 300px;
}
.info
{
   text-align : center;

}
#noOfItems
{
margin: 50px 20px;
}
label 
{
margin-left : 50px;}


.info div
{
margin:3px;
padding:3px;

}
section
{
width : 75%;
}
.pagination
{
  display : flex;
  justify-content : space-around;
  margin: 20px 0;
}
</style>
<body>
<%
String error = request.getParameter("error");
if (error != null && !error.equals("null")) {
%>
<h2  align="center">
	<%
	out.println(error);
	%>
</h2>
<%}else{
	%>
<form action="ProductServlet" method="post">
	<div>
		<label for="noOfItems">Enter Number of Items to Display :</label> 
		<input type="number" name ="noOfItems" id="noOfItems" value="10">
		<button class="success" type="submit">Enter</button>
	</div>
</form>
<div class="container">
<c:forEach var="i" items ="${CardList}">
	 <div class="card-container">
			<div class="image">
				<img src="${i.img}" alt="no image found" >
			</div>
			<div class="info">
			<div class="title">${i.name}</div>
			<div class="quantity">1kg</div>
			<div class="price">Rs.${i.price}</div>
			<div class="instock">Left Stock :${i.stock}kg</div>
			</div>
			<div class="card-modify">
				<%
				if (username && userType.equals("shopkeeper")) {
				%>
				<form action="sendCard">
				<input type="hidden" name="name" value=${i.name }>
					<button class="primary">Update Stock</button>
				</form>
				<form action="CardDelete">
				<input type="hidden" name="name" value=${i.name }>
					<button class="danger">Delete Item</button>
				</form>
				<%
				}else {
				%>
				<div class="card-details">
				<form action="AddToCart" method="post" id="cart-form">
					    <input type="text" name="qty" value="0" id="number" /> 
					    <input type="button" onclick="decrementValue()" value="-" /> 
						<input type="button" onclick="incrementValue()" value="+" /> 
					<button type="submit">Add To Cart</button>
						<input type="hidden" name="name" value=${i.name}>
						<input type="hidden" name="price" value=${i.price} />
						<input type="hidden" name="image" value=${i.img} />
						<input type="hidden" name="Category" value=${i.category} />
						
						
				</form>
			</div>
			<%} %>
			</div>
		</div>
	</c:forEach>
</div>
 <div class=pagination>
 <c:if test="${currentPage > 1}">

		<td><a href="ProductServlet?page=${currentPage - 1}">Previous</a></td>

	</c:if>
	<table border="1">
	<tr>
	<c:forEach begin="1" end="${noOfPages}" var="i">

				<c:choose>

					<c:when test="${currentPage eq i}">

						<td>${i}</td>

					</c:when>

					<c:otherwise>

						<td><a href="ProductServlet?page=${i}">${i}</a></td>

					</c:otherwise>

				</c:choose>

			</c:forEach>
		</tr>
	</table>
	<c:if test="${currentPage lt noOfPages}">

		<td><a href="ProductServlet?page=${currentPage + 1}">Next</a></td>

	</c:if>
 </div>
 <%} %>
 <%@ include file="footer.html"%>
 
 
      
  
     
  
 