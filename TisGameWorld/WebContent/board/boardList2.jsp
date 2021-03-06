<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="member.model.MemberVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%
	MemberVO member = (MemberVO)session.getAttribute("member");
%>

<c:import url="/top.jsp" />
<%
	String ctx = request.getContextPath();
%>
<script type="text/javascript">
	var check = function() {
		if (!sf.findType.value) {
			alert('검색 유형을 선택하세요');
			sf.findType.focus();
			return false;
		}

		if (!sf.findKeyword.value) {
			alert('검색어를 입력하세요');
			sf.findKeyword.focus();
			return false;
		}
		sf.submit();
	}
</script>

<% 
        	if(member == null) 
{%>
<h1 class="text-center">TIS GAME WORLD를 이용하시려면</h1>
<h1 class="text-center">로그인을 해주세요</h1>
<%
        	} else {
%>
<div class="section">
	<div class="row">
		<div align="center" id="bbs" class="col-md-10 col-md-offset-1">
			<!-- <h1>Spring Board</h1> -->
			<!-- <a><img src="./images/mvcboardlist.png"></a> -->
			<h1>FREE BOARD</h1>
			<p>
			<!-- ${boardArr} -->
			<p>
				<a href="<%=ctx%>/boardForm.do">글쓰기</a> | <a
					href="<%=ctx%>/boardList.do">글목록</a>
			<p>
			
			<table class="table table-condensed table-striped">
				<tr>
					<th>글번호</th>
					<th>제목</th>
					<th>글쓴이</th>
					<th>날짜</th>
					<th>조회수</th>
				</tr>
				<!-- ---------------------------- -->
				<c:if test="${boardArr==null or empty boardArr}">
					<tr>
						<td colspan="5"><b>게시글이 없습니다.</b></td>
					</tr>
				</c:if>
				<c:if test="${boardArr !=null and not empty boardArr}">
					<c:forEach var="board" items="${boardArr}">
						<tr>
							<td><c:out value="${board.idx}" /></td>
							<td align="left"><a href="boardView.do?idx=${board.idx}">
									<c:out value="${board.subject}" />
									<c:if test="${board.replyCount>0}">
									<span class="badge">
										<c:out value="${board.replyCount}"/>
									</span>
									</c:if>
									<!-- &nbsp -->
									<c:if test="${board.filesize>0}">
									<img src="./images/skin3.gif">
									</c:if>
									<!-- &nbsp -->
									<c:if test="${board.readnum>=10}">
									<img src="./images/hot2.gif">
									</c:if>
							</a></td>
							<td><c:out value="${board.name}" /></td>
							<td><c:out value="${board.wdate}" /></td>
							<td><c:out value="${board.readnum}" /></td>
						</tr>
						
					</c:forEach>
				</c:if>
				<!-- ----------------------------- -->
				<tr>
					<td colspan="3" class="text-center">
					<c:set var="qstr" value="&findType=${findType}&findKeyword=${findKeyword}"/><!-- -문자열 생성한 변수를 선언하고 싶을때 set  -->
						<ul class="pagination">
							<c:if test="${prevBlock>0}">
								<li><a href="boardList.do?cpage=${firstCount}${qstr}">맨 앞으로</a></li>
								<li><a href="boardList.do?cpage=${prevBlock}${qstr}">이전</a></li>
							</c:if>
							<c:forEach var="i" begin="${prevBlock+1}" end="${nextBlock-1}">
							<c:if test="${i<=pageCount}">

								<li
									<c:if test="${cpage eq i}">
							class='active'
						</c:if>><a
									href="boardList.do?cpage=${i}${qstr}">${i}</a></li>
							</c:if>		
									
							</c:forEach>
							<c:if test="${nextBlock<=pageCount}">
								<li><a href="boardList.do?cpage=${nextBlock}${qstr}">다음</a></li>
								<li><a href="boardList.do?cpage=${lastCount}${qstr}">맨 뒤로</a></li>
							</c:if>
						</ul>
					</td>
					<td colspan="2">총게시물수: <span class="text-danger"
						style="font-weight: bold">${totalCount} 개</span> <br> <span
						class="text-danger" style="font-weight: bold">${cpage }</span> /
						${pageCount} pages
					</td>
				</tr>

			</table>
			<div class="section">
				<div class="row">
					<!-- 검색 폼 시작--------------------- -->
					<form name="sf" action="boardList.do" onsubmit="return check()">
					<!-- hidden data---------------------------------------- -->
					<input type="hidden" name="cpage" value="${cpage}">
					<!-- --------------------------------------------------- -->
						<div class="col-md-2">
							<select name="findType" class="form-control">
								<option value="">::검색 유형::</option>
								<option value="1">글제목</option>
								<option value="2">작성자</option>
								<option value="3">글내용</option>
							</select>
						</div>
						<div class="col-md-7">
							<input type="text" name="findKeyword" class="form-control"
								placeholder="검색어를 입력하세요">
						</div>
						<div class="col-md-1">
							<button type="button" onclick="check()" class="btn btn-warning">검색</button>
						</div>
					</form>
					<!-- 검색 폼 끝---------------------- -->
					
					<!-- 페이지 사이즈 폼 시작-------------- -->
					<form name="pf" id="pf" action="boardList.do">
						<input type="hidden" name="cpage" value="${cpage}">
						<input type="hidden" name="findType" value="${findType}">
						<input type="hidden" name="findKeyword" value="${findKeyword}">
						
						<div class="col-md-2">
							<select name="pageSize" class="form-control" onchange="submit()">
								<option value="">:::페이지 사이즈:::</option>
								<c:forEach var="ps" begin="5" end="50" step="5">
									<option value="${ps}">페이지 사이즈 ${ps}</option>
								</c:forEach>
							</select>
						</div>
					</form>
				</div>
			</div>
			
		</div>
	</div>
	</div>
		<%
	}
%>
	<c:import url="/foot.jsp" />