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
</style>
</head>
<body>
<div id="header">
	<%@ include file="/header.jsp" %>
</div>
<div id="contents">
	<section class="page" id="page1">
		<c:if test="${not empty message }">
		<div style="width:1400px; margin:0 auto;">${message }</div>
		</c:if>
		<div style="width:1400px; margin:0 auto;">
			<h3 class="page_title">회원가입</h3>
			<form action="${path0 }/JoinPro.do" method="post" onsubmit="return joinCheck(this)">
				<table class="table table-striped">
					<tbody>
						<tr>
							<th><label for="id">아이디</label></th>
							<td>
								<input type="text" name="id" id="id" class="form-control" required>
								<button type="button" onclick="checkId()" class="btn btn-secondary">아이디 중복확인</button>
								<input type="hidden" id="idCheck" name="idCheck" value="false">
								<div id="idMessage"></div>
							</td>
						</tr>
						<tr>
							<th><label for="pw">비밀번호</label></th>
							<td>
								<input type="password" name="pw" id="pw" class="form-control" required>
							</td>
						</tr>
						<tr>
							<th><label for="pw2">비밀번호 확인</label></th>
							<td>
								<input type="password" name="pw2" id="pw2" class="form-control" required>
							</td>
						</tr>
						<tr>
							<th><label for="name">이름</label></th>
							<td>
								<input type="text" name="name" id="name" class="form-control" required>
							</td>
						</tr>
						<tr>
							<th><label for="birth">생년월일</label></th>
							<td>
								<input type="date" name="birth" id="birth" class="form-control" required>
							</td>
						</tr>
						<tr>
							<th><label for="email">이메일</label></th>
							<td>
								<input type="email" name="email" id="email" class="form-control" required>
							</td>
						</tr>
						<tr>
							<th><label for="tel">연락처</label></th>
							<td>
								<input type="tel" name="tel" id="tel" class="form-control" required>
							</td>
						</tr>
					</tbody>
				</table>
				<hr>
				<div class="btn-group">
					<button type="submit" class="btn btn-secondary">회원가입</button>
					<button type="reset" class="btn btn-secondary">취소</button>
				</div>
			</form>
			<script>
			function joinCheck(f) {
				if(f.pw.value!=f.pw2.value) {
					alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
					f.pw.focus();
					return false;
				}
				if(f.idCheck.value!="true") {
					alert("아이디 중복 확인을 하지 않으셨습니다.");
					return false;
				}
				if(f.pw.value==f.pw2.value && f.idCheck.value!="false") {
					alert("환영합니다! 회원가입이 완료되었습니다!");
				}
			}
			function checkId() {
				if($("#id").val()=="") {
					alert("아이디를 입력하지 않으셨습니다.");
					$("#id").focus();
					return false;
				}
				
				var params = { id:$("#id").val() };
				
				$.ajax({
					url:"${path0 }/IdCheck.do",
					type:"post",
					dataType:"json",
					data:params,
					success:function(data) {
						var checkId = data.result;
						if(checkId==false) {
							$("#idCheck").val("true");
							$("#idMessage").html("<strong style='color:blue'> 사용 가능한 아이디입니다.</strong>");
						}
						else {
							$("#idCheck").val("false");
							$("#idMessage").html("<strong style='color:red'> 중복된 아이디입니다!</strong>");
						}
					}
				});
			}
			</script>
		</div>
	</section>
</div>
<div id="footer">
	<%@ include file="/footer.jsp" %>
</div>
</body>
</html>