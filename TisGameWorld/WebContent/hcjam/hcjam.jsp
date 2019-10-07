<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="member.model.MemberVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	MemberVO member = (MemberVO)session.getAttribute("member");
%>


<jsp:include page="/top.jsp"/>
<% 
        	if(member == null) 
{%>
<h1 class="text-center">HC JAM을 이용하시려면</h1>
<h1 class="text-center">로그인을 해주세요</h1>
<%
        	} else {
%>
<div class="container">
<iframe src="http://hcrhythmgame-env.cisikmyfpy.ap-northeast-2.elasticbeanstalk.com/" width="1150" height="960" scrolling="no" frameborder="0"></iframe>
</div>
<%
	}
%>
<jsp:include page="/foot.jsp"/>