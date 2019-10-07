<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="member.model.MemberVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	MemberVO member = (MemberVO)session.getAttribute("member");
%>


<jsp:include page="/top.jsp"/>
<% 
        	if(member == null) 
{%>
<h1 class="text-center">TIS GAME WORLD를 이용하시려면</h1>
<h1 class="text-center">로그인을 해주세요</h1>
<%
        	} else {
%>
<div class="section">
	<!-- <img alt="about" src="./images/about.png" class="img-responsive"> -->
	<h1>TOTAL RANKING</h1>
	<br>
	<h2 class="text-center">FLAP JELLYFISH TOTAL RANKING</h2>
	<table class="table table-bordered table-hover table-sm">
              <thead>
                <tr>
                  <th>순위</th>
                  <th>닉네임</th>
                  <th>갯수</th>
                </tr>
              </thead>
              <tbody>
              <c:forEach var="rankingArr" items="${rankingArr}" varStatus="status">
                <tr>
                  <td>${rankingArr.rn}</td>
                  <td>${rankingArr.MEMBER_ID}</td>
                  <td>${rankingArr.GAME2_RANK_SCORE}</td>
                </tr>
                </c:forEach>
              </tbody>
            </table>
</div>
	<%
	}
%>
<jsp:include page="/foot.jsp"/>