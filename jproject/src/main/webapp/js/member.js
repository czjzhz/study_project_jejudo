/** 유효성 체크 및 Ajax 아이디 체크 **/

function check() {
	if ($.trim($("#id").val()) == "") {
		alert("아이디를 입력하세요.");
		$("#id").val("").focus();
		return false;
	}
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
	if ($.trim($("#passwd1").val()) != $.trim($("#passwd2").val())) {
		// !=같지않다 연산. 비밀번호가 다를 경우
		alert("비밀번호가 다릅니다. 다시 입력해주세요.");
		$("#passwd1").val("");
		$("#passwd2").val("");
		$("#passwd1").focus();
		return false;
	}
	if ($.trim($("#name").val()) == "") {
		alert("이름을 입력하세요.");
		$("#name").val("").focus();
		return false;
	}
	
	if ($.trim($("#nickname").val()) == "") {
		alert("닉네임을 입력하세요.");
		$("#nickname").val("").focus();
		return false;
	}
	
	if ($.trim($("#age").val()) == "") {
		alert("나이를 설정하세요.");
		$("#age").val("").focus();
		return false;
	}
	
	if ($.trim($("#gender").val()) == "") {
		alert("성별을 설정하세요.");
		$("#gender").val("").focus();
		return false;
	}
	
	if ($.trim($("#address1").val()) == "") {
		alert("주소를 입력하세요.");
		$("#address1").val("").focus();
		return false;
	}
	if ($.trim($("#address2").val()) == "") {
		alert("상세 주소를 입력하세요.");
		$("#address2").val("").focus();
		return false;
	}
	if ($.trim($("#phone").val()) == "") {
		alert("휴대폰 번호를 입력하세요.");
		$("#phone").val("").focus();
		return false;
	}
	if ($.trim($("#email").val()) == "") {
		alert("이메일을 입력하세요.");
		$("#email").val("").focus();
		return false;
	}
}

function post_search() {
	alert("우편번호 검색 버튼을 클릭하세요.");
}

function post_check() {
	window.open("zipcodeFind.do", "우편번호검색",
			"width=200,height=100,scrollbars=yes");
	// 폭이 200이고 높이가 100, 스크롤바가 생성되는 새로운 공지창을 만듬
}


/* 아이디 중복 체크 */
function idCheck() {
	$("#idcheck").hide();// idcheck span 아이디 영역을 숨긴다.
	var mid = $("#Id").val();

	// ID 입력글자 길이 체크
	if ($.trim($("#Id").val()).length < 4) {
		var newtext = '<font color="red">아이디는 4자 이상이어야 합니다.</font>';
		$("#idcheck").text('');
		$("#idcheck").show();
		$("#idcheck").append(newtext);// span 아이디 영역에 경고문자 추가
		$("#Id").val("").focus();
		return false;
	}
	;
	
	if ($.trim($("#Id").val()).length > 12) {
		var newtext = '<font color="red">아이디는 12자 이하이어야 합니다.</font>';
		$("#idcheck").text('');
		$("#idcheck").show();
		$("#idcheck").append(newtext);  // span 아이디 영역에 경고문자 추가
		$("#Id").val("").focus();
		return false;
	}
	;
	
	// 입력아이디 유효성 검사
	if (!(validateid(mid))) {
		var newtext = '<font color="red">아이디는 영문 소문자,숫자,_ 조합만 가능합니다.</font>';
		$("#idcheck").text('');         // 문자 초기화
		$("#idcheck").show();           // span 아이디 영역을 보이게 한다.
		$("#idcheck").append(newtext);
		$("#Id").val("").focus();
		return false;
	}
	;

	// 아이디 중복확인
	$.ajax({
		type : "POST",
		url : "memberIdc.do",
		data : {
			"mid" : mid
		},
		success : function(data) {
			alert("return success=" + data);
			if (data == 1) { 	// 중복 ID
				var newtext = '<font color="red">중복 아이디입니다.</font>';
				$("#idcheck").text('');
				$("#idcheck").show();
				$("#idcheck").append(newtext);
				$("#Id").val('').focus();
				return false;

			} else { // 사용 가능한 ID
				var newtext = '<font color="blue">사용가능한 아이디입니다.</font>';
				$("#idcheck").text('');
				$("#idcheck").show();
				$("#idcheck").append(newtext);
				$("#join_pwd1").focus();
			}
		},
		error : function(e) {
			alert("data error" + e);
		}
	});	// $.ajax
};

/* 아이디 중복 체크 끝 */

function validate_Id(mid) {
	var pattern = new RegExp(/^[a-z0-9_]+$/);
	// 영문 소문자,숫자 ,_가능,정규표현식
	return pattern.test(mid);
};

function domain_list() {
	var num = f.email_list.selectedIndex;
	/*
	 * selectedIndex속성은 select객체하위의 속성으로서 해당리스트 목록번호를 반환
	 */
	if (num == -1) {
		// num==-1은 해당 리스트목록이 없다
		return true;
	}
	if (f.email_list.value == "0") // 직접입력
	{
		/* 리스트에서 직접입력을 선택했을때 */
		f.join_maildomain.value = "";
		// @뒤의 도메인입력란을 빈공간시켜라.
		f.join_maildomain.readOnly = false;
		// @뒤의 도메인입력란을 쓰기 가능
		f.join_maildomain.focus();
		// 도메인입력란으로 입력대기상태
	}

	else {
		// 리스트목록을 선택했을때

		f.join_maildomain.value = f.mail_list.options[num].value;
		/*
		 * num변수에는 해당리스트 목록번호가 저장되어있다.해당리스트 번호의 option value값이 도메인입력란에
		 * 선택된다.options속성은 select객체의 속성으로서 해당리스트번호의 value값을 가져온다
		 */
		f.join_maildomain.readOnly = true;
	}
}

/* 회원정보 수정 경고창 */
function edit_check() {
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
	if ($.trim($("#passwd1").val()) != $.trim($("#join_pwd2").val())) {
		// !=같지않다 연산. 비번이 다를 경우
		alert("비빌번호가 다릅니다!");
		$("#passwd1").val("");
		$("#passwd1").val("");
		$("#passwd1").focus();
		return false;
	}
	if ($.trim($("#name").val()) == "") {
		alert("이름을 입력하세요.");
		$("#name").val("").focus();
		return false;
	}
	if ($.trim($("#nickname").val()) == "") {
		alert("닉네임을 입력하세요.");
		$("#nickname").val("").focus();
		return false;
	}
	if ($.trim($("#age").val()) == "") {
		alert("나이를 설정하세요.");
		$("#age").val("").focus();
		return false;
	}
	if ($.trim($("#gender").val()) == "") {
		alert("성별을 설정하세요.");
		$("#gender").val("").focus();
		return false;
	}
	if ($.trim($("#address1").val()) == "") {
		alert("주소를 입력하세요.");
		$("#address1").val("").focus();
		return false;
	}
	if ($.trim($("#address2").val()) == "") {
		alert("상세 주소를 입력하세요.");
		$("address2").val("").focus();
		return false;
	}
	if ($.trim($("#phone").val()) == "") {
		alert("휴대폰 번호를 입력하세요.");
		$("#phone").val("").focus();
		return false;
	}
	if ($.trim($("#email").val()) == "") {
		alert("이메일을 입력하세요.");
		$("#email").val("").focus();
		return false;
	}
}
	