<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="member.model.MemberVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	MemberVO member = (MemberVO)session.getAttribute("member");
%>
<link rel="stylesheet" type="text/css" href="./css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="./css/style.css">
    <script src="./js/jquery-3.4.1.min.js"></script>
    <script src="./js/game.js"></script>
<jsp:include page="/top.jsp"/>
<% 
        	if(member == null) 
{%>
<h1 class="text-center">1 TO 50을 이용하시려면</h1>
<h1 class="text-center">로그인을 해주세요</h1>
<%
        	} else {
%>
<div class="container">

<iframe src="./1to50/index.html" width="1150" height="960" scrolling="no" frameborder="0"></iframe>
<!--         <div class="header">
            <h1 class="title">1 to 50</h1>
            <div class="timer">0.000</div>
        </div>
        <div class="controller">
            <button class="btn btn-primary">Restart</button>
        </div>
        <div class="game" id="game">Game Start</div>
    </div> -->
    <%
	}
%>
<jsp:include page="/foot.jsp"/>