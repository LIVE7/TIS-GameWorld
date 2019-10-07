<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String id = (String)request.getAttribute("id");
	request.setAttribute("signup_id", id);
%>

<script>
	alert("${msg}");
	location.href = "${loc}";
</script>