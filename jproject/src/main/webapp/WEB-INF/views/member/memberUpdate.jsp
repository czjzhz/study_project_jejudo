<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	//우편번호, 주소 Daum API
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
<script src="./js/memberupdate.js"></script>

</head>
<body>
	<div id="join_wrap">
		<h2 class="join_title">회원정보수정</h2>
		<form name="f" method="post" action="MemberUpdateok.do"
			onsubmit="return check()" enctype="multipart/form-data">
			<!-- 이진파일을 업로드 할려면 enctype 속성을 지정 -->
			<input type="hidden" name="id" id="id" value="${edit.id}">

			
			<table id="join_t">
				<tr>
					<th>아이디</th>
					<td>${edit.id}</td>
				</tr>

			<!-- 	<tr>
					<th>비밀번호</th>
					<td><input type="password" name="passwd" id="passwd1"
						size="14" class="input_box" /></td>
				</tr>

				<tr>
					<th>비밀번호 확인</th>
					<td><input type="password" name="passwd2" id="passwd2"
						size="14" class="input_box" /></td>
				</tr>-->
				
				<tr>
					<th>이름</th>
					<td><input type="text" name="name" id="name" value="${edit.name}"></td>
				</tr>
				<!-- <tr>
					<th>닉네임</th>
					<td><input name="nickname" id="nickname" size="14" value="${edit.nickname}	class="input_box" /> 
					<input type="button" value="닉네임 중복체크" class="input_button" onclick="nick_check()" />
						<div id="nickcheck"></div></td>
				</tr> -->
				<tr>
					<th>성별</th>
					<td>
						<c:if test="${edit.gender == '남자'}">
							<input type="radio" name="gender" id="male" value="남자" checked>남자
							<input type="radio" name="gender" id="female" value="여자">여자
						</c:if>
						<c:if test="${edit.gender == '여자'}">
							<input type="radio" name="gender" id="male" value="남자">남자
							<input type="radio" name="gender" id="female" value="여자" checked>여자
						</c:if>
				    </td>
				</tr>
				
				<tr>
					<th>나이</th>
					<td><select name="age" id="age">
							<option value="">선택</option>
							<option value="10" <c:if test="${edit.age == '10'}"> ${'selected'} </c:if>>10대</option>
							<option value="20" <c:if test="${edit.age == '20'}"> ${'selected'} </c:if>>20대</option>
							<option value="30" <c:if test="${edit.age == '30'}"> ${'selected'} </c:if>>30대</option>
							<option value="40" <c:if test="${edit.age == '40'}"> ${'selected'} </c:if>>40대</option>
							<option value="50" <c:if test="${edit.age == '50'}"> ${'selected'} </c:if>>50대이상</option>
					</select></td>
				</tr>
				
				<tr>
					<th>우편번호</th>
					<td><input name="zip" id="zip" size="5" value="${edit.zip}" class="input_box"
						readonly onclick="post_search()" /> 
						<input type="button" value="우편번호검색" class="input_button" onclick="openDaumPostcode()" />
					</td>
				</tr>

				<tr>
					<th>주소</th>
					<td><input name="address1" id="address1" size="50" value="${edit.address1}"
						class="input_box" readonly onclick="post_search()" /></td>
				</tr>

				<tr>
					<th>상세주소</th>
					<td><input name="address2" id="address2" size="37" value="${edit.address2}" 
					    class="input_box" /></td>
				</tr>

				<tr>
					<th>핸드폰번호</th>
					<td><input name="phone1" id="phone1" size="3" maxlength="3" value="${phone1}" class="input_box" />-
						<input name="phone2" id="phone2" size="4" maxlength="4" value="${phone2}" class="input_box" />-
						<input name="phone3" id="phone3" size="4" maxlength="4" value="${phone3}" class="input_box" /></td>
				</tr>
				<!-- <tr>
					<th>이메일</th>
					<td><input name="email" id="email" size="14" class="input_box" /> 
					<input	type="button" value="인증번호 확인" class="input_button"	onclick="send_email()" />
						<div id="emailcheck"></div></td>				
				</tr> -->
				<tr>
					<th>이메일</th>
					<td><input name="mailid" id="mailid" size="10" value="${emailid}" class="input_box" /> @ 
						<input name="maildomain" id="maildomain" size="20" value="${maildomain}" class="input_box" readonly /> 
						<!-- readonly는 단지 쓰기,수정이 불가능하고 읽기만 가능하다  -->
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
					<td><textarea id=intro name=intro cols=50 rows=10>${edit.intro}</textarea></td>
				</tr>

		
			</table>

			<div id="join_menu">
			<input type="submit" value="확인" class="input_button" /> 
			<input type="reset" value="취소" class="input_button" onclick="location='Mypage.do'" />
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			
			
			</div>
		</form>
	</div>
</body>
</html>