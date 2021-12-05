<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴 폼</title>

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="./js/member.js"></script>

<script>
	function check() {
		if ($.trim($("#passwd").val()) == "") {
			alert("비밀번호를 입력하세요.");
			$("#passwd").val("").focus();
			return false;
		}
		if ($.trim($("#delcont").val()) == "") {
			alert("탈퇴사유를 입력하세요.");
			$("#delcont").val("").focus();
			return false;
		}
		if ($("#dbpasswd").val() != $("#passwd").val()) {
			alert("비번이 일치하지 않습니다.");
			$("#passwd").val("").focus();
			return false;
		}

	}
</script>
</head>
<body>

	<%@ include file="../navi.jsp"%>

	<!-- Start Sample Area -->
	<section class="sample-text-area">
		<div class="container box_1170">
			<div id="del_wrap">
				<div class="row">
					<div class="col-md-3"></div>
					<div class="col-md-6">
						<h2 class="text-primary">회원탈퇴</h2>
						<form method="post" action="MemberDelok.do"
							onsubmit="return check()">
							<input type="hidden" name="id" value="${del.id}"> <input
								type="hidden" name="dbpasswd" value="${del.passwd}"
								id="dbpasswd">
							<table id="del_t" class="table">
								<tr>
									<%--   <th>회원 아이디</th>
       <td>
       ${del.id}
       </td>
      </tr>
      
      <tr>
       <th>회원이름</th>
       <td>${del.name}</td>
      </tr> --%>
								<tr>
									<th>비밀번호</th>
									<td><input type="password" name="passwd" id="passwd"
										size="14" class="input_box" /></td>
								</tr>

								<tr>
									<th>탈퇴사유</th>
									<td><textarea name="delcont" id="delcont" rows="7"
											cols="30" class="input_box"></textarea></td>
								</tr>
							</table>

							<div id="del_menu">
								<input type="submit" value="탈퇴" class="input_button" /> <input
									type="reset" value="취소" class="input_button"
									onclick="location.href='Mypage.do'" />
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>