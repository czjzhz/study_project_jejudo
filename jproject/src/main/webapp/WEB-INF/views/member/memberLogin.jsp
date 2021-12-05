<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA게시판 목록</title>

<script>
	function check() {
		if ($.trim($("#id").val()) == "") { // ID 유효성 검사
			alert("로그인 ID를 입력하세요.");
			$("#id").val("").focus();
			return false;
		}
		if ($.trim($("#passwd").val()) == "") { // PW 유효성 검사
			alert("비밀번호를 입력하세요.");
			$("#passwd").val("").focus();
			return false;
		}
	}

	// 비밀번호 찾기 공지창
	function pwdFind() {
		window.open("pwdFind.do", "비밀번호 찾기", "width=100,height=200");
		//자바 스크립트에서 window객체의 open("공지창 경로와 파일명","공지창 이름","공지창 속성")
		//메서드로 새로운 공지창을 만듬.폭이 400,높이가 400인 새로운 공지창을 만듬.단위는 픽셀
	}
</script>
</head>
<body>
	<%@ include file="../navi.jsp"%>

	<!-- Start Sample Area -->
	<section class="sample-text-area">
		<div class="container box_1170">
			<main>
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-4"></div>
						<div class="col-md-4">
							<form role="form" form method="post" action="MemberLoginok.do"
								onsubmit="return check()">


								<div class="form-group">
									<label>아이디</label> <input name="id" id="id"
										class="form-control" />
								</div>
								<div class="form-group">
									<label>비밀번호</label> <input type="password" name="passwd"
										id="passwd" class="form-control" />
								</div>

								<input type="submit" value="로그인"
									class="btn btn-primary col-md-12" /><br>
								<br>
								<center>
									<a href="PwdFind.do" style="color: gray">비밀번호 찾기 </a> &nbsp; |
									<a href="IdFind.do" style="color: gray"> &nbsp; 아이디 찾기 </a>
									&nbsp; | <a href="Agreement.do" style="color: gray"> &nbsp;
										회원가입</a>
								</center>
								<!--   <input type="button" value="비밀번호 찾기" onclick="pwdFind()" />	
						<input type="button" value="아이디 찾기" onclick="idFind()"  /> -->

							</form>
						</div>
						<div class="col-md-4"></div>
					</div>
				</div>
			</main>
		</div>
	</section>
</body>
</html>