<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<style>
	.form-error
	{
	  margin-top : 400px;
	  
	}
	
	</style>
<h2 class="form-error" align="center"><%=request.getAttribute("error")%></h2>
<%@ include file="footer.html"%>