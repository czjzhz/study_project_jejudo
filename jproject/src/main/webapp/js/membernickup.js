/** 유효성 체크 및 Ajax 아이디 체크 * */

	// 닉네임 중복 체크 끝
function validate_nickname(nickname) {
	var pattern = new RegExp(/^[a-z0-9가-힣]+$/)
	// 영문 소문자,숫자,한글 가능 정규표현식
	return pattern.test(nickname);
}



	
//
//	if ($.trim($("#nickname").val()) == "") {
//		alert("닉네임을 입력하세요.");
//		$("#nickname").val("").focus();                    // 닉네임 유효성 검사 따로 체크
//		return false;
//	}

var nickYN = 'N';












//닉네임 중복 체크 
function nick_check() {
	//	alert("nick");
	$("#nickcheck").hide();// nick check span 아이디 영역을 숨긴다.
	var nickname = $("#nickname").val();

	// 1. 닉네임 입력글자 길이 체크 (유효성 검사)
	if ($.trim($("#nickname").val()).length < 2) {
		var newtext = '<font color="red">닉네임은 2자 이상 가능합니다.</font>';
		$("#nickcheck").text('');
		$("#nickcheck").show();
		$("#nickcheck").append(newtext);// span 닉네임 영역에 경고문자 추가
		$("#nickname").val("").focus();
		return false;
	}
	

	if ($.trim($("#nickname").val()).length > 6) {
		var newtext = '<font color="red">닉네임은 6자 이하 가능합니다.</font>';
		$("#nickcheck").text('');
		$("#nickcheck").show();
		$("#nickcheck").append(newtext); // span 닉네임 영역에 경고문자 추가
		$("#nickname").val("").focus();
		return false;
	}
	
	// 입력 닉네임 유효성 검사 (정규 표현식 검사)
	if (!(validate_nickname(nickname))) {
		var newtext = '<font color="red">닉네임은 6글자 이하의 한글, 영문, 숫자만 사용할 수 있습니다.</font>';
		$("#nickcheck").text(''); // 문자 초기화
		$("#nickcheck").show(); // span 닉네임 영역을 보이게 한다.
		$("#nickcheck").append(newtext);
		$("#nickname").val("").focus();
		return false;
	}
	

	// 닉네임 중복확인 (ajax로 요청)
	$.ajax({
		type : "POST",
		url : "Membernickcheck.do",
		data : {
			"nickname" : nickname
		},
		success : function(data) {
			//			alert("return success=" + data);
			if (data == 1) { // 중복 닉네임
				var newtext = '<font color="red">중복된 닉네임 입니다.</font>';
				$("#nickcheck").text('');
				$("#nickcheck").show();
				$("#nickcheck").append(newtext);
//				$("#nickname").val('').focus();
				return false;

			} else { // 사용 가능한 닉네임
				var newtext = '<font color="blue">사용가능한 닉네임 입니다.</font>';
				$("#nickcheck").text('');
				$("#nickcheck").show();
				$("#nickcheck").append(newtext);
				$("#passwd").focus();
				
//				nickYN = 'Y';
			}
		},
		error : function(e) {
			alert("data error" + e);
		}
	}); // $.ajax
}