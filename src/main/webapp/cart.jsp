<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ include file="header.jsp" %>
   <style>
   .con
   {
   display : flex;
   margin-left: 110px;
margin-top: -20px;
   }
 .img 
 {
 height: 82px;
width: 99px;
 }
 .con div
 {
 margin : 30px;
 }
 .info div
 {
   margin-top: 40px;

width: 127px;
 }
 .info
 {
    display : flex;
    font-size :18px;
 }
 .con
 {
  margin-left: 317px;
margin-top: 20px;
margin-right: 338px;
border: 3px solid black;
}
}
.cartcon
{
display : inline-block;
margin-left: 110px;
  margin-top: 40px;
}
.title
{
  display: flex;
  margin-left: 316px;
  margin-top: 40px;
  border : 3px solid black;
  box-shadow : 2px 2px 3px 3px;
  background-color : #f0f0f9;
}
}
td
{
margin-top: 50px;
height: 40px;
width: 196px;	
}
table
{
  margin-bottom : 20px;
}
.red
{
   width: 80px;
height: 30px;

}
.red:hover
{
background-color : #ff6666;
}
.center
{
text-align : center;
font-size : 18px;
}
.flex
{
display: flex;
align-items : center;
margin-top: 50px;

margin: 40px 318px;
}
.flex div
{
   padding: 0 141px;
 }
.order
{width: 100px;
height: 50px;}
.order:hover
{
background-color:cyan;}
   </style>
    <h1 class="success-para" align="center">
		<%
		String msg = request.getParameter("msg");
		if (msg != null && !msg.equals("null")) {
			out.println(msg);
		} 
		%>
	</h1>
   <table>
   <tr class="title">
 
             <td style = "margin-top:40px;height:40px;width: 196px; font-weight : bold; font-size:20px; padding-left: 81px;">Image</td>
             <td style = "margin-top:40px;height:40px;width: 196px;font-weight : bold; font-size:20px ;margin-left:-60px">ItemName</td>
             <td style = "margin-top:40px;height:40px;width: 196px;font-weight : bold; font-size:20px">Category</td>
             <td style = "margin-top:40px;height:40px;width: 196px;margin-right: -16px;
margin-left: -32px;font-weight : bold; font-size:20px">ItemPrice</td>
             <td style = "margin-top:40px;height:40px;width: 196px;font-weight : bold; font-size:20px">Quantity</td>
             <td style = "margin-top:40px;height:40px;width: 196px;font-weight : bold; font-size:20px">TotalPrice</td>
             <td style = "margin-top:40px;height:40px;width: 196px;font-weight : bold; font-size:20px;margin-right: 27px;">Delete</td>
 </tr>
</table>    
<div class="container" style="margin-top: 10px;
border: 1px solid black;
margin-left: 271px;
display : contents">
 
  <div class="cartcon" ">
 
	
 <c:forEach var="i" items="${cartList}">
       <div class="con" >
            <div>
                 <img class="img" src=${i.getImage() } alt="Error No image found">
            </div>
            <div class = info>
                <div class="name">${i.getItemName()}</div>
                <div class="category">${i.getCategory()}</div>
                <div class="price">${i.getItemPrice()}</div>
                <div class="qtycss">${i.getItemQuantity()}</div>
			    <div class="total">Rs.${i.getTotalPrice()}</div>
                <div class="del">
				    <form action="deletecardcart" method="post">
						<input type="hidden" name="name" id="name" value= ${ i.getItemName() }>
						<button type="submit" class="red">Delete</button>
				    </form>
		       </div>
	       </div> 
       </div>
 </c:forEach>
 </div>
 <c:set var="totalCost" value="0" scope="request" />
<c:set var="totalQty" value="0" scope="request" />
<c:forEach var="i" items="${cartList}">
 <c:set var="Total" value="${Total + i.getTotalPrice()}" /> 
 <c:set var="TotalQ" value="${TotalQ + i.getItemQuantity()}" />  
</c:forEach>
<div class="flex">
<div class="center">Total Quantity of all Items : ${TotalQ}</div>
<div class="center">Total Price of all Items : ${Total}</div>
<div>
<%
	if (msg == null) {
	%>
	<form action="ordernow" id="checkout-form">
		<button class="order" type="submit">Checkout</button>
	</form>
	<%
	}
%>
</div>
</div>


<%@ include file="footer.html"%>