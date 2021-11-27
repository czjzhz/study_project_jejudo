<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="${pageContext.request.contextPath}/css/main.82cfd66e.css"
	rel="stylesheet">
<title>회원 로그인 폼</title>
</head>

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

<body>
<%@ include file="../navi.jsp" %>
<main>
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-3">
					<form role="form" form method="post" action="MemberLoginok.do" onsubmit="return check()">
						
						<div class="form-group">
							<label>아이디</label> <input name="id" id="id" class="form-control" />
						</div>
						<div class="form-group">
							<label>비밀번호</label> <input type="password" name="passwd" id="passwd"
								class="form-control" />
						</div>
					  	
						<input type="submit" value="로그인" class="btn btn-primary col-md-12"
							   style="background-color: #FF8000;" /><br><br>
		
						<a href="PwdFind.do" style="color:gray"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 비밀번호 찾기 </a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
						<a href="IdFind.do" style="color:gray"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 아이디 찾기 </a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |           
						<a href="Agreement.do" style="color:gray"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 회원가입</a>
						
					  <!--   <input type="button" value="비밀번호 찾기" onclick="pwdFind()" />	
						<input type="button" value="아이디 찾기" onclick="idFind()"  /> -->
						
					</form>
				</div>
			</div>
		</div>
	</main>



	 <!-- 	<div id="login_wrap">
		<h2 class="login_title">로그인</h2>
		<form method="post" action="MemberLoginok.do"
	          onsubmit="return check()">
			<table id="login_table">
				<tr>
					<th>ID</th>
					<td><input name="id" id="id" size="20" class="input_box" /></td>
				</tr>

				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="passwd" id="passwd" size="20"
						class="input_box" /></td>
				</tr>
			</table>
			<div id="login_menu">
				<input type="submit" value="로그인" class="input_button"
							style="background-color: #FF8000;" />
				<input type="button" value="비밀번호 찾기" class="input_button" onclick="pwdFind()" />
				<input type="button" value="아이디 찾기" class="input_button" onclick="idFind()" />
				<input type="button" value="회원가입" class="input_button" onclick="location='Agreement.do'" />
			</div>
		</form>
	</div>  -->
	
	
	
</body>
</html>