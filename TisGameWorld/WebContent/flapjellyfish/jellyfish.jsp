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
<h1 class="text-center">FLAP JELLYFISH를 이용하시려면</h1>
<h1 class="text-center">로그인을 해주세요</h1>
<%
        	} else {
%>
<h1 class="text-center">FLAP JELLYFISH</h1>
<div>
        <div class="row">
        
          <div class="col-md-6">
          	<canvas id="game" width="540" height="960"></canvas>
          	<script src="./flapjellyfish/game.js"></script>
          </div>
          <div class="col-md-6">
            <img src="./flapjellyfish/img/how.png" class="img-responsive">
            <h3 class="text-center">RANKING</h3>
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
            
            </div>
</div>
            <!-- -------------------------------------------- -->
            <div align="center">
		<h3>댓글 남기기</h3>
		<table class="table table-striped text-center">
			<tr>
				<th style="text-align: center" width="20%">글번호</th>
				<th style="text-align: center" width="50%">메모내용</th>
				<th style="text-align: center" width="10%">작성자</th>
				<th style="text-align: center" width="20%">	</th>
			</tr>
			<!-- ----------------------------- -->
			<c:if test="${memoArr==null||empty memoArr}">
				<%-- memoArr.size() == 0 과 동일 --%>
				<tr>
					<td colspan="4"><b>데이터가 없읍니다... :()</b></td>
				</tr>
			</c:if>

			<c:if test="${memoArr!=null&&not empty memoArr}">
				<c:forEach var="jellyfish_memo" items="${memoArr}">
					<%-- -memoArr만큼 돌아서 memo에 참조된다 --%>
					<tr>
						<td colspan="1">${jellyfish_memo.idx}</td>
						<%--memo.getIdx() --%>
						<td colspan="1">${jellyfish_memo.msg}</td>
						<td colspan="1">${jellyfish_memo.name}</td>
						<%
                		if(member.getMember_id().equals("admin")) {
                		%>
						<td colspan="1"><a href="memoDel.do?idx=${jellyfish_memo.idx}">삭제</a></td>
						
                    	<%
                		} else {
                    	%>
                    	<td colspan="1"></td>
                    	<%
                		}
                    	%>
					</tr>
				</c:forEach>
			</c:if>
			<!-- ----------------------------- -->
			<tr>
				<td colspan="1" align="center">
				<h4 class="text-center">${totalCount}개의 댓글이 있습니다.</h4>
				</td>
				<td colspan="2">
					<form name="f" action="memoAdd.do" method="post">
						<input type="hidden" name="name" placeholder="User Name" class="form-control" value="<%=member.getMember_name()%>">
						<input type="text" name="msg" placeholder="Message" class="form-control" maxlength="50">
				</td>
				<td colspan="1" align="right">
					<button type="button" onclick="check()" class="btn btn-primary">
							메모 남기기
							</button>
							<button type="reset" class="btn btn-warning">
							다시쓰기
							</button>
	
	
					</form>
				</td>
			</tr>
			<tr>
				<td colspan="4">
					<ul class="pagination">
				<!-- 
					begin: 시작값
					end: 끝값
					step: 증가치
					items: 자료구조
				 -->
				<c:forEach var="i" begin="1" end="${pageCount}" step="1"><!-- -var:페이지 시작속성값(begin):1 끝 속성값은 pageCount 증가치(step) -->
					<li><a href="jellyfish.do?cpage=${i}">${i}</a></li>
				</c:forEach>
				</ul>
				</td>
				
			</tr>
		</table>
		<form name="rankform" id="rankform" action="rankingInsert.do" method="post">
			<input type="hidden" name="GAME2_RANK_SCORE" id="GAME2_RANK_SCORE" class="form-control" value="0">
			<input type="hidden" name="MEMBER_ID" id="MEMBER_ID" class="form-control" value="<%=member.getMember_id()%>">
		</form>
</div>
<%
	}
%>



<script type="text/javascript">
		var check=function(){
			if (!f.name.value) {
				alert('작성자를 입력하세요');
				f.name.focus();
				return;
			}
			if (!f.msg.value) {
				alert('메모내용을 입력하세요');
				f.msg.focus();
				return;
			}
			f.submit();//서버로 전송
		}
		
		var insertRank =function(){
			//alert('게임끝');
			rankform.submit();
		}
</script>
<jsp:include page="/foot.jsp"/>