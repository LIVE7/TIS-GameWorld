<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="member.model.MemberVO"%>
<%
	MemberVO member = (MemberVO)request.getAttribute("member");
	session.setAttribute("member", member);
%>

<script>
	location.href = "${loc}";
</script>