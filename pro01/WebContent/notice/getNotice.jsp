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
	#page1 { background-color:#defcd2 }
	#page2 { background-color:#5d97f5 }
	#page3 { background-color:#f5f295 }
	#page4 { background-color:#f5c573 }
	.page_title { font-size:36px; padding-top:2em; text-align:center; }
	th.item1 { width:8% }
	th.item2 { width:60% }
	th.item3 { width:20% }
</style>
</head>
<body>
<div id="header">
	<%@ include file="/header.jsp" %>
</div>
<div id="contents">
	<section class="page" id="page1">
		<div style="width:1400px; margin:0 auto;">
			<h3 class="page_title">공지사항 상세보기</h3>
			<div>
				<table class="table table-striped">
					<tbody>
						<tr>
							<th>번호</th>
							<td>${notice.no }</td>
						</tr>
						<tr>
							<th>제목</th>
							<td>${notice.title }</td>
						</tr>
						<tr>
							<th>내용</th>
							<td>${notice.content }</td>
						</tr>
						<tr>
							<th>작성 일시</th>
							<td>${notice.resdate }</td>
						</tr>
						<tr>
							<th>조회 수</th>
							<td>${notice.visited }</td>
						</tr>
							
					</tbody>
				</table>
				<hr>
				<div class="btn-group">
					<a href="${path0 }/notice/notice_ins.jsp" class="btn btn-secondary">글 등록</a>
					<a href="${path0 }/EditNotice.do?no=${notice.no }" class="btn btn-secondary">글 수정</a>
					<a href="${path0 }/DelNotice.do?no=${notice.no }" class="btn btn-secondary">글 삭제</a>
					<a href="${path0 }/NoticeList.do" class="btn btn-secondary">글 목록</a>
				</div>
				<hr>
			</div>
		</div>
	</section>
	<section class="page" id="page2">
		<div style="width:1400px; margin:0 auto;">
			<h3 class="page_title"></h3>
		</div>
	</section>
</div>
<div id="footer">
	<%@ include file="/footer.jsp" %>
</div>
</body>
</html>