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
margin-right: 339px;
border: 3px solid black;
<%
if (request.getParameter("userType")!= null && request.getParameter("userType").equals("shopkeeper")) {
%>
 margin-right:140px;
<%}
%>
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
  margin-top: 10px;
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
font-size: 23px;
margin-left: 94px;
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
background-color:cyan;
}
.flexform
{
display : flex;
margin-top : 30px;
justify-content : space-around;

}
.form
{
 display : flex;
}
.form div
{
 margin:5px;
}







   </style>
   <%
if (request.getParameter("userType")!= null && request.getParameter("userType").equals("shopkeeper")) {
%>
<div class=flexform>
<form action="reports" method="post" id="query-form" class="form">
	<div>
		<label for="start-date">Orders between Dates</label> <input type="date"
			name="start-date" id="start-date" />
	</div>
	<div>
		<label for="end-date"> and </label> <input type="date"
			name="end-date" id="end-date" />
	</div>
	<div>
		<button class="success" type="submit">Enter</button>
	</div>
</form>
<form action="userreport" method="post" id="user-form" class ="form1">
      <div>
		<label for="username">Enter UserName to get his purchases :</label> 
		<input type="text"
			name="username" id="username" />
	</div>
 
</form></div>
  
<%}
%>

   
  	
    <h1 class="success-para" align="center">
		<%
		String msg = request.getParameter("msg");
		if (msg != null && !msg.equals("null")) {
			out.println(msg);
		}else {
			out.println("Orders");
		}
		%>
	</h1>
   <table>
   <tr class="title">
 
             <td style = "margin-top:40px;height:40px;width: 196px; font-weight : bold; font-size:20px; padding-left: 81px;">Image</td>
            
             <td style = "margin-top:40px;height:40px;width: 196px;font-weight : bold; font-size:20px ;margin-left:-60px">ItemName</td>
              <%
					if (request.getParameter("userType")!= null && request.getParameter("userType").equals("shopkeeper")) {
					%>
					 <td style = "margin-top:40px;height:40px;width: 196px;font-weight : bold; font-size:20px">UserName</td>
					<%
					}
					%>
             <td style = "margin-top:40px;height:40px;width: 196px;font-weight : bold; font-size:20px">Category</td>
             <td style = "margin-top:40px;height:40px;width: 196px;margin-right: -16px;
margin-left: -32px;font-weight : bold; font-size:20px">ItemPrice</td>
             <td style = "margin-top:40px;height:40px;width: 196px;font-weight : bold; font-size:20px">Quantity</td>
             <td style = "margin-top:40px;height:40px;width: 196px;font-weight : bold; font-size:20px">TotalPrice</td>
             <td style = "margin-top:40px;height:40px;width: 196px;font-weight : bold; font-size:20px;margin-right: 27px;">Ordered Date</td>
 </tr>
 </tr>
</table>    
<div class="container" style="margin-top: 10px;
border: 1px solid black;
margin-left: 271px;
display : contents">
 
  <div class="cartcon" ">
 
	
 <c:forEach var="i" items="${resultList}">
       <div class="con" >
           
            <div class = info>
                   
                
                <div class="name">${i.getQuestion()}</div>
                <div class="category">${i.getoption()}</div>
                <div class="price">${i.getItemPrice()}</div>
                <div class="qtycss">${i.getItemQuantity()}</div>
			    <div class="total">Rs.${i.getTotalPrice()}</div>
			    <div >${i.getordered_date()}</div>
	       </div> 
       </div>
 </c:forEach>
 </div>
 <c:set var="totalCost" value="0" scope="request" />
<c:set var="totalQty" value="0" scope="request" />
<c:forEach var="i" items="${ordersList}">
 <c:set var="Total" value="${Total + i.getTotalPrice()}" /> 
 <c:set var="TotalQ" value="${TotalQ + i.getItemQuantity()}" />  
</c:forEach>
<div class="flex">
<div class="center">Total Quantity : ${TotalQ}</div>
<div class="center">Total Price  : ${Total}</div>
</div>


<%@ include file="footer.html"%>