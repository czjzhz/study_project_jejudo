/** 유효성 체크 및 Ajax 아이디 체크 * */

	if ($.trim($("#passwd1").val()) == "") {
		alert("비밀번호를 입력하세요.");
		$("#passwd1").val("").focus();
		return false;
	}
	if ($.trim($("#passwd2").val()) == "") {
		alert("비밀번호를 한번 더 입력하세요.");
		$("#passwd2").val("").focus();
		return false;
	}
	
	
// 비밀번호 중복체크
	
	if ($.trim($("#passwd1").val()) != $.trim($("#passwd2").val())) {
		// !=같지 않다 연산. 비밀번호가 다를 경우
		alert("비밀번호가 다릅니다. 다시 입력해주세요.");
		$("#passwd1").val("");
		$("#passwd2").val("");
		$("#passwd1").focus();
		return false;
	}