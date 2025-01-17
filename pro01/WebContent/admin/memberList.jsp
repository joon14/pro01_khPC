<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path0" value="<%=request.getContextPath() %>" />     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${title }</title>
<%@ include file="/head.jsp" %>
<style>
	.container { width:1400px }
	.page { clear:both; height:100vh }
	#page1 { background-color:#95f5ba }
	#page2 { background-color:#5d97f5 }
	#page3 { background-color:#f5f295 }
	#page4 { background-color:#f5c573 }
	.page_title { font-size:36px; padding-top:2em; text-align:center; }
</style>
</head>
<body>
<div id="header">
	<%@ include file="/header.jsp" %>
</div>
<div id="contents">
	<div class="row">
		<aside id="lnb" class="col-3">
			<nav>
				<ul>
					<li><a href="${path0 }/MemberList.do">회원목록</a></li>
					<li><a href="${path0 }/NoticeList.do">게시판 관리</a></li>
				</ul>
			</nav>
		</aside>
		<section class="page col-9" id="page1">
			<div style="width:100%; margin:0 auto;">
				<h3 class="page_title">회원 목록</h3>
				<div>
					<table class="table table-striped">
						<thead>
							<tr>
								<th class="item1">번호</th>
								<th class="item2">아이디</th>
								<th class="item3">비밀번호</th>
								<th class="item4">이름</th>
								<th class="item5">생년월일</th>
								<th class="item6">이메일</th>
								<th class="item7">연락처</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${not empty memberList }">
								<c:forEach var="dto" items="${memberList }" varStatus="status">
								<tr>
									<td>
										<input type="checkbox" name="id" id="id${status.count }" value="${dto.id }">
										${status.count }
									</td>
									<td>${dto.id }</td>
									<td>${dto.pw }</td>
									<td>${dto.name }</td>
									<td>${dto.birth }</td>
									<td>${dto.email }</td>
									<td>${dto.tel }</td>
								</tr>
								</c:forEach>
							</c:if>
							<c:if test="${empty memberList }">
								<tr>
									<td colspan="7"><strong>회원이 존재하지 않습니다.</strong></td>
								</tr>
							</c:if>
						</tbody>
					</table>
					<hr>
				</div>
			</div>
		</section>
	</div>		
</div>
<div id="footer">
	<%@ include file="/footer.jsp" %>
</div>
</body>
</html>