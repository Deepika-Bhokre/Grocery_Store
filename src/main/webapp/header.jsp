
<%@ page import="java.io.*"%>
<%@ page import="jakarta.servlet.*"%>
<%@ page import="jakarta.servlet.http.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Ubuntu&display=swap" rel="stylesheet">
<title>EMart Grocery Store</title>
</head>
<style>
body
{

font-family: 'Ubuntu', sans-serif;	
}
.navigation 
{
border:1px solid rgb(21, 12, 12);
box-shadow:2px 2px 4px 4px;
height:70x;
display : flex;
width:100%;	
border-radius:8px;
margin:auto;
background-color: white;
}

.navigation img
{
padding-left:2rem;
height:60px;
width : 110px;
}

.navigation ul
{
 display : flex;
 align-items:center;
 justify-content:center;
 margin-left : 157px;	
}
.navigation ul li
{
margin: 0 14px;
padding :0 19px;
list-style:none;
color : violet;

}
.navigation ul li:hover
{
cursor:pointer;
}
a
{
text-decoration:none;
}

.dropdown .dropbtn {
  font-size: 16px;
  border: none;
  outline: none;
  color: black;
  padding: 14px 16px;
  background-color:inherit;
  font-family: inherit; 
  margin: 0; 
}

.dropdown:hover .dropbtn {
  background-color: #f0f0f0;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f9f9f9;
  min-width: 160px;
}
.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
 
}

.dropdown-content a:hover {
  background-color: #ddd;
}
.dropdown:hover .dropdown-content {
  display: block;
}
.searchclass
{
 margin-left:20px;
}

</style>
<body>
<%Cookie[] cks = null;
	Cookie ck = null;
	cks = request.getCookies();
	if (cks != null) {
		String cookieName1 = "userType";
		String cookieName2 = "username";
		boolean username = false;
		String userType = null;
		for (int i = 0; i < cks.length; i++) {
			ck  = cks[i];
			if (ck.getName().equals(cookieName1)) {
		userType = ck.getValue();
			} else if (ck.getName().equals(cookieName2)) {
		username = true;
			}
		}%>
<nav class=navigation>
<img alt="Error image Not found" src="https://i.pinimg.com/280x280_RS/82/63/20/82632045139ecc9670b007e109d39181.jpg">
<ul>
<li><a href="home.jsp">Home</a></li>
<li class="pro"><a href="ProductServlet">Products</a></li>

<li>
<%
if (userType != null && userType.equals("shopkeeper")) {
%>
	<li><a href="additems1.jsp">Add Item</a></li>
<%
}	
%>
       <%
          if (!username && userType == null) {
       %>
       <li>
<div class="dropdown">
    <button class="dropbtn">User Login
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
      <a href="Customer_Login.jsp">Buyer</a>
      <a href="ShopkeeperLogin.jsp">Shopkeeper</a>
    </div>
  </div>
</li>
<li>
<div class="dropdown">
    <button class="dropbtn">User Register
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
      <a href="Customer_Register.jsp">Buyer</a>
      <a href="ShopkeeperRegister.jsp">Shopkeeper</a>
    </div>
  </div>
</li>
       <%
        } 
      else {
       %>
	<li><a href="logout">Logout</a></li>
<%
     }
} 
else {
	
%>
<li>
<div class="dropdown">
    <button class="dropbtn">User Login
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
      <a href="Customer_Login.jsp">Buyer</a>
      <a href="ShopkeeperLogin.jsp">Shopkeeper</a>
    </div>
  </div>
</li>
       <li>
<div class="dropdown">
    <button class="dropbtn">User Login
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
      <a href="Customer_Login.jsp">Buyer</a>
      <a href="ShopkeeperLogin.jsp">Shopkeeper</a>
    </div>
  </div>
</li>

<%
			}
			%>	
			
	
<li><a href="BuyNoworders">Orders</a></li>				
<li><a href="about.jsp">About Us</a></li>
<li class="searchclass" style="margin-left: 310px;">
<form action="SearchProducts" method="post" id="search-form">
	<input type="text" name="search" id="search"
		placeholder="Search Products here">
	<button type="submit">
		search
	</button>
</form>
</li>
<li class="cart" style="margin-left: 35px;
margin-right: 13px;"><a href="cartDisplay">Cart</a></li>
</ul>
</nav>



</body>

</html>