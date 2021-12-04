<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="${pageContext.request.contextPath}/css/main.82cfd66e.css"
	rel="stylesheet">
<title>회원가입 폼</title>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	// 우편번호, 주소 Daum API
	function openDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
				// 우편번호와 주소 정보를 해당 필드에 넣고, 커서를 상세주소 필드로 이동한다.
				document.getElementById('zip').value = data.zonecode;
				document.getElementById('address1').value = data.address;
			}
		}).open();
	}
</script>

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="./js/member.js"></script>

</head>

<body>

	<div id="join_wrap">
		<form name="f" method="post" action="MemberJoinok.do"
			onsubmit="return check()" enctype="multipart/form-data">
			<!-- 이진파일을 업로드 할려면 enctype 속성을 지정 -->
			<table id="join_table" align=center border=0>
			<tr>
		<td height="70%" align="center" colspan="2">
       	<br>
    	<center><a href="home.do" style="color: #FF8000;"><h1>JEJU FRIEND 회원가입</h1></a></center>
		<br>
		</td>
		</tr>
				<tr>
					<th>아이디</th>
					<td><input name="id" id="id" size="14" class="input_box" /> <input
						type="button" value="아이디 중복확인" class="input_button"
						onclick="id_check()" />
						<div id="idcheck"></div></td>
				</tr>

				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="passwd" id="passwd1"
						size="14" class="input_box" /></td>
				</tr>

				<tr>
					<th>비밀번호 확인</th>
					<td><input type="password" name="passwd2" id="passwd2"
						size="14" class="input_box" /></td>
				</tr>

				<tr>
					<th>이름</th>
					<td><input name="name" id="name" size="14" class="input_box" />
					</td>
				</tr>

				<tr>
					<th>닉네임</th>
					<td><input name="nickname" id="nickname" size="14"
						class="input_box" /> <input type="button" value="닉네임 중복확인"
						class="input_button" onclick="nick_check()" />
						<div id="nickcheck"></div></td>
				</tr>

				<tr>
					<th>성별</th>
					<td><label><input type="radio" name="gender" id="male"
							value="남자" />남자</label> <label><input type="radio" name="gender"
							id="female" value="여자" />여자</label></td>
				</tr>

				<tr>
					<th>나이</th>
					<td><select name="age" id="age" >
							<option value="">선택</option>
							<option value="10">10대</option>
							<option value="20">20대</option>
							<option value="30">30대</option>
							<option value="40">40대</option>
							<option value="50">50대이상</option>
					</select></td>
				</tr>

				<tr>
					<th>우편번호</th>
					<td><input name="zip" id="zip" size="5" class="input_box"
						readonly onclick="post_search()" /> <input type="button"
						value="우편번호검색" class="input_button" onclick="openDaumPostcode()" />
					</td>
				</tr>

				<tr>
					<th>주소</th>
					<td><input name="address1" id="address1" size="50"
						class="input_box" readonly onclick="post_search()" /></td>
				</tr>

				<tr>
					<th>상세주소</th>
					<td><input name="address2" id="address2" size="37"
						class="input_box" /></td>
				</tr>

				<tr>
					<th>핸드폰번호</th>
					<td><input name="phone1" id="phone1" size="3" maxlength="3"
						class="input_box" />-<input name="phone2" id="phone2" size="4"
						maxlength="4" class="input_box" />-<input name="phone3"
						id="phone3" size="4" maxlength="4" class="input_box" /></td>
				</tr>
				<!-- <tr>
					<th>이메일</th>
					<td><input name="email" id="email" size="14" class="input_box" /> 
					<input	type="button" value="인증번호 확인" class="input_button"	onclick="send_email()" />
						<div id="emailcheck"></div></td>				
				</tr> -->
				<tr>
					<th>이메일</th>
					<td><input name="mailid" id="mailid" size="10"
						class="input_box" /> @ <input name="maildomain"
						id="maildomain" size="20" class="input_box" readonly /> <!-- readonly는 단지 쓰기,수정이 불가능하고 읽기만 가능하다  -->
						<select name="mail_list" onchange="domain_list()">
							<option value="">이메일선택</option>
							<option value="naver.com">naver.com</option>
							<option value="daum.net">daum.net</option>
							<option value="icloud.com">icloud.com</option>
							<option value="gmail.com">gmail.com</option>
							<option value="0">직접입력</option>
					</select></td>
				</tr>

				<tr>
					<th>프로필 사진</th>
					<td><input type="file" name="profilepic" /></td>
				</tr>

				<tr>
					<th>자기소개</th>
					<td><textarea id=intro name=intro cols=50
							rows=10></textarea></td>
				</tr>
				<tr>
				<td colspan="2" align="center" valign="top">
				<input type="button" value="취소" class="btn btn-primary" id="join_button" style="background-color: gray; border-style:none;"
					   onclick="location.href='<%=request.getContextPath()%>/home.do'">
				<input type="submit" value="회원가입" class="btn btn-primary" id="join_button" style="background-color: #FF8000; border-style:none;" />
				</td>
				</tr>
			</table>

		</form>
	</div>
</body>
</html>