<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="member.model.MemberVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	MemberVO member = (MemberVO)session.getAttribute("member");
%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
     <link rel="icon" href="./images/gameworldicon.png" type="./image/png">
    <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
    <script type="text/javascript" src="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <link href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="./css/style.css" rel="stylesheet" type="text/css">
    <style type="text/css">
	    body, body > .container > .navbar {
			color: #636363;
			background: #f5f5f5;
			font-family: 'Roboto', sans-serif;
		}
		ul.navbar-right {
			margin-right: 0;
		}
	
		ul.nav li {
			font-size: 18px;
			font-weight: bold;
		}
    </style>
</head>

<body onselectstart="return false" ondragstart="return false">
    <div class="container">
        <div class="navbar navbar-default navbar-static-top">
            <div class="logo" style="display: block; text-align: center; margin-top: 5px;">
                <a href="${pageContext.request.contextPath}/main.do">
                    <img style="width: 200px" src="./images/tisgameworldlogo.gif" />
                </a>
            </div>
            <div></div>
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-ex-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div>
            <div class="collapse navbar-collapse" id="navbar-ex-collapse">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="${pageContext.request.contextPath}/main.do">Home</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/about.do">About</a>
                    </li>
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Board
                            <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="${pageContext.request.contextPath}/noticeList.do">Notice</a></li>
                            <li><a href="${pageContext.request.contextPath}/boardList.do">Free Board</a></li>
                            <li><a href="${pageContext.request.contextPath}/totalRanking.do">TOTAL RANKING</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Game
                            <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="${pageContext.request.contextPath}/1to50.do">1 to 50</a></li>
                            <li><a href="${pageContext.request.contextPath}/jellyfish.do">Flap Jellyfish</a></li>
                            <li><a href="${pageContext.request.contextPath}/hcjam.do">HC Jam</a></li>
                        </ul>
                    </li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                	<!-- logout state -->
                	<%
                	if(member == null) {
                	%>
                    <li>
                        <a href="${pageContext.request.contextPath}/join.do"><i class="fa fa-user-plus"></i> Sign Up</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/login.do"><i class="fa fa-sign-in"></i> Login</a>
                    </li>
                    <%
                	} else {
                    %>
                    <!-- login state -->
                    <li>
                        <a href="#"><i class="fa fa-user"></i> <%=member.getMember_name()%></a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/logout.do">Logout <i class="fa fa-sign-out"></i></a>
                    </li>
                    <%
                	}
                    %>
                </ul>
            </div>
        </div>