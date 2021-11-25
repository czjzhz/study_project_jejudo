/** 유효성 체크 및 Ajax 아이디 체크 * */

// 아이디 중복체크
function check() {
	if ($.trim($("#id").val()) == "") {
		alert("ID를 입력하세요.");
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

	if ($("#male").is(":checked") == false
			&& $("#female").is(":checked") == false) {
		alert("성별을 입력하세요.");
		return false;
	}

//	if ($.trim($("#age").val()) == "") {
//		alert("나이를 입력하세요.");
//		$("#age").val("").focus();
//		return false;
//	}
	
	if ($.trim($("#zip").val()) == "") {
		alert("우편번호를 입력하세요.");
		$("#zip").val("").focus();
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
	if ($.trim($("#phone1").val()) == "") {
		alert("휴대폰 번호를 입력하세요.");
		$("#phone").val("").focus();
		return false;
	}
	if ($.trim($("#phone2").val()) == "") {
		alert("휴대폰 중간번호 4자리를 입력하세요.");
		$("#phone2").val("").focus();
		return false;
	}
	if ($.trim($("#phone3").val()) == "") {
		alert("휴대폰 끝번호 4자리를 입력하세요.");
		$("#phone3").val("").focus();
		return false;
	}
	if($.trim($("#mailid").val())==""){
		 alert("이메일을 입력하세요.");
		 $("#mailid").val("").focus();
		 return false;
	}
	if($.trim($("#maildomain").val())==""){
		 alert("메일 주소를 입력하세요.");
		 $("#maildomain").val("").focus();
		 return false;
	}
	
//	if ($.trim($("#intro").val()) == "") {               // 필요시 사용 가능
//		alert("자기소개를 입력하세요.");
//		$("#intro").val("").focus();
//		return false;
//	}
	
}

function post_search() {
	alert("우편번호 검색 버튼을 클릭하세요.");
}

function post_check() {
	window.open("zipcodeFind.do", "우편번호검색",
			"width=200,height=100,scrollbars=yes");
	// 폭이 200이고 높이가 100, 스크롤바가 생성되는 새로운 공지창을 만듬
}


/*
 * //아이디 중복 체크 function id_check() { alert("in"); $("#idcheck").hide();//
 * idcheck span 아이디 영역을 숨긴다. var mid = $("#id").val();
 *  // 1. 아이디 입력글자 길이 체크 (유효성 검사) if ($.trim($("#id").val()).length < 4) { var
 * newtext = '<font color="red">아이디는 4자 이상이어야 합니다.</font>';
 * $("#idcheck").text(''); $("#idcheck").show();
 * $("#idcheck").append(newtext);// span 아이디 영역에 경고문자 추가
 * $("#id").val("").focus(); return false; } ;
 * 
 * if ($.trim($("#id").val()).length > 12) { var newtext = '<font
 * color="red">아이디는 12자 이하이어야 합니다.</font>'; $("#idcheck").text('');
 * $("#idcheck").show(); $("#idcheck").append(newtext); // span 아이디 영역에 경고문자 추가
 * $("#id").val("").focus(); return false; } ;
 *  // 입력 아이디 유효성 검사 (정규 표현식 검사) if (!(validate_id(mid))) { var newtext = '<font
 * color="red">아이디는 영문 소문자,숫자,_ 조합만 가능합니다.</font>'; $("#idcheck").text(''); //
 * 문자 초기화 $("#idcheck").show(); // span 아이디 영역을 보이게 한다.
 * $("#idcheck").append(newtext); $("#id").val("").focus(); return false; } ;
 * 
 *  // 아이디 중복확인 (ajax로 요청) $.ajax({ type : "POST", url : "memberidcheck.do",
 * data : {"mid" : mid}, success : function(data) { // alert("return success=" +
 * data); // alert(data); if (data == 1) { // 중복 ID var newtext = '<font
 * color="red">중복된 ID입니다.</font>'; $("#idcheck").text('');
 * $("#idcheck").show(); $("#idcheck").append(newtext);
 * $("#id").val('').focus(); return false;
 *  } else { // 사용 가능한 아이디 var newtext = '<font color="blue">사용가능한 ID입니다.</font>';
 * $("#idcheck").text(''); $("#idcheck").show(); $("#idcheck").append(newtext);
 * $("#passwd").focus(); } }, error : function(e) { alert("data error" + e); }
 * }); // $.ajax };
 * 
 *  // 아이디 중복 체크 끝
 * 
 * function validate_id(mid) { var pattern = new RegExp(/^[a-z0-9_]+$/); // 영문
 * 소문자,숫자 ,_가능,정규표현식 return pattern.test(mid); };
 * 
 * 
 * 
 * 
 * //닉네임 중복 체크 function nick_check() { // alert("nick");
 * $("#nickcheck").hide();// nick check span 아이디 영역을 숨긴다. var nickname =
 * $("#nickname").val();
 *  // 1. 닉네임 입력글자 길이 체크 (유효성 검사) if ($.trim($("#nickname").val()).length < 2) {
 * var newtext = '<font color="red">닉네임은 2자 이상 가능합니다.</font>';
 * $("#nickcheck").text(''); $("#nickcheck").show();
 * $("#nickcheck").append(newtext);// span 닉네임 영역에 경고문자 추가
 * $("#nickname").val("").focus(); return false; } ;
 * 
 * if ($.trim($("#nickname").val()).length > 6) { var newtext = '<font
 * color="red">닉네임은 6자 이하 가능합니다.</font>'; $("#nickcheck").text('');
 * $("#nickcheck").show(); $("#nickcheck").append(newtext); // span 닉네임 영역에 경고문자
 * 추가 $("#nickname").val("").focus(); return false; } ;
 *  // 입력 닉네임 유효성 검사 (정규 표현식 검사) if (!(validate_nickname(nickname))) { var
 * newtext = '<font color="red">닉네임은 6글자 이하의 한글, 영문, 숫자만 사용할 수 있습니다.</font>';
 * $("#nickcheck").text(''); // 문자 초기화 $("#nickcheck").show(); // span 닉네임 영역을
 * 보이게 한다. $("#nickcheck").append(newtext); $("#nickname").val("").focus();
 * return false; } ;
 * 
 *  // 닉네임 중복확인 (ajax로 요청) $.ajax({ type : "POST", url : "membernickcheck.do",
 * data : {"nickname" : nickname}, success : function(data) { // alert("return
 * success=" + data); if (data == 1) { // 중복 닉네임 var newtext = '<font
 * color="red">중복된 닉네임 입니다.</font>'; $("#nickcheck").text('');
 * $("#nickcheck").show(); $("#nickcheck").append(newtext);
 * $("#nickname").val('').focus(); return false;
 *  } else { // 사용 가능한 닉네임 var newtext = '<font color="blue">사용가능한 닉네임 입니다.</font>';
 * $("#nickcheck").text(''); $("#nickcheck").show();
 * $("#nickcheck").append(newtext); $("#passwd").focus(); } }, error :
 * function(e) { alert("data error" + e); } }); // $.ajax };
 * 
 * //닉네임 중복 체크 끝
 * 
 * function validate_nickname(nickname) { var pattern = new
 * RegExp(/^[a-z0-9가-힣]+$/); // 닉네임은 6글자 이하의 한글, 영문, 숫자만 사용할 수 있습니다. return
 * pattern.test(nickname); };
 * 
 * 
 * $(function(){ $("#age_list").change(function(){ // alert("호출");
 * 
 * if($("#age_list").val() == '선택'){ alert("나이를 선택하세요.") return false; }
 * alert($("#age_list").val()); $("#zip").focus(); }); });
 */


//function domain_list() {
//	var num = f.email_list.selectedIndex;
//	/*
//	 * selectedIndex속성은 select객체하위의 속성으로서 해당리스트 목록번호를 반환
//	 */
//	if (num == -1) {
//		// num==-1은 해당 리스트목록이 없다
//		return true;
//	}
//	if (f.email_list.value == "0") // 직접입력
//	{
//		/* 리스트에서 직접입력을 선택했을때 */
//		f.join_maildomain.value = "";
//		// @뒤의 도메인 입력란을 빈공간으로
//		f.join_maildomain.readOnly = false;
//		// @뒤의 도메인 입력란을 쓰기 가능
//		f.join_maildomain.focus();
//		// 도메인 입력란으로 입력대기상태
//	}
//
//	else {
//		// 리스트목록을 선택했을때
//
//		f.join_maildomain.value = f.mail_list.options[num].value;
//		/*
//		 * num변수에는 해당리스트 목록번호가 저장되어있다.해당리스트 번호의 option value값이 도메인입력란에
//		 * 선택된다.options속성은 select객체의 속성으로서 해당리스트번호의 value값을 가져온다
//		 */
//		f.join_maildomain.readOnly = true;
//	}
//}

// 전화번호 유효성 체크
// var regExp = /^([0-9]{3,4})?([0-9]{3,4})?([0-9]{4})$/;
// if (!regExp.test( $(#phone1,#phone2,#phone3).val() ) ) {
// alert("잘못된 휴대폰 번호입니다. 숫자만 입력하세요.");
// return false
// }

// 이메일 유효성 체크
// var regExp =
// /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;

//// 회원정보 수정 경고창
//function edit_check() {
//	if ($.trim($("#passwd1").val()) == "") {
//		alert("비밀번호를 입력하세요.");
//		$("#passwd1").val("").focus();
//		return false;
//	}
//	if ($.trim($("#passwd2").val()) == "") {
//		alert("비밀번호를 한번 더 입력하세요.");
//		$("#passwd2").val("").focus();
//		return false;
//	}
//	if ($.trim($("#passwd1").val()) != $.trim($("#passwd2").val())) {
//		// !=같지않다 연산. 비번이 다를 경우
//		alert("비빌번호가 다릅니다. 다시 입력해주세요.");
//		$("#passwd1").val("");
//		$("#passwd1").val("");
//		$("#passwd1").focus();
//		return false;
//	}
//	if ($.trim($("#name").val()) == "") {
//		alert("이름을 입력하세요.");
//		$("#name").val("").focus();
//		return false;
//	}
//	if ($.trim($("#nickname").val()) == "") {
//		alert("사용할 닉네임을 입력하세요.");
//		$("#nickname").val("").focus();
//		return false;
//	}
//	if ($.trim($("#age").val()) == "") {
//		alert("나이를 설정하세요.");
//		$("#age").val("").focus();
//		return false;
//	}
//	if ($.trim($("#gender").val()) == "") {
//		alert("성별을 설정하세요.");
//		$("#gender").val("").focus();
//		return false;
//	}
//	if ($.trim($("#address1").val()) == "") {
//		alert("주소를 입력하세요.");
//		$("#address1").val("").focus();
//		return false;
//	}
//	if ($.trim($("#address2").val()) == "") {
//		alert("상세 주소를 입력하세요.");
//		$("address2").val("").focus();
//		return false;
//	}
//	if ($.trim($("#phone1").val()) == "") {
//		alert("휴대폰 번호를 입력하세요.");
//		$("#phone").val("").focus();
//		return false;
//	}
//	if ($.trim($("#phone2").val()) == "") {
//		alert("휴대폰 중간번호 4자리를 입력하세요.");
//		$("#phone2").val("").focus();
//		return false;
//	}
//	if ($.trim($("#phone3").val()) == "") {
//		alert("휴대폰 끝번호 4자리를 입력하세요.");
//		$("#phone3").val("").focus();
//		return false;
//	}
//
//	if ($.trim($("#email").val()) == "") {
//		alert("이메일을 입력하세요.");
//		$("#email").val("").focus();
//		return false;
//	}
//	
//	
//		
//	}
//	
//}

// 유효성 검사
function id_check() {
	//	alert("in");
	$("#idcheck").hide();// idcheck span 아이디 영역을 숨긴다.
	var mid = $("#id").val();
	var idYN = 'N';

	// 1. 아이디 입력글자 길이 체크 (유효성 검사)
	if ($.trim($("#id").val()).length < 4) {
		var newtext = '<font color="red">아이디는 4자 이상이어야 합니다.</font>';
		$("#idcheck").text('');
		$("#idcheck").show();
		$("#idcheck").append(newtext);// span 아이디 영역에 경고문자 추가
		$("#id").val("").focus();
		return false;
	};

	if ($.trim($("#id").val()).length > 12) {
		var newtext = '<font color="red">아이디는 12자 이하이어야 합니다.</font>';
		$("#idcheck").text('');
		$("#idcheck").show();
		$("#idcheck").append(newtext); // span 아이디 영역에 경고문자 추가
		$("#id").val("").focus();
		return false;
	}
	;

	// 입력 아이디 유효성 검사 (정규 표현식 검사)
	if (!(validate_id(mid))) {
		var newtext = '<font color="red">아이디는 영문 소문자,숫자,_ 조합만 가능합니다.</font>';
		$("#idcheck").text(''); // 문자 초기화
		$("#idcheck").show(); // span 아이디 영역을 보이게 한다.
		$("#idcheck").append(newtext);
		$("#id").val("").focus();
		return false;
	}
	;

	// 아이디 중복확인 (ajax로 요청)
	$.ajax({
		type : "POST",
		url : "Memberidcheck.do",
		data : {
			"mid" : mid
		},
		success : function(data) {
			//			alert("return success=" + data);
			//			alert(data);
			if (data == 1) { // 중복 ID
				var newtext = '<font color="red">중복된 ID입니다.</font>';
				$("#idcheck").text('');
				$("#idcheck").show();
				$("#idcheck").append(newtext);
				$("#id").val('').focus();
			
				return false;

			} else { // 사용 가능한 아이디
				var newtext = '<font color="blue">사용가능한 ID입니다.</font>';
				$("#idcheck").text('');
				$("#idcheck").show();
				$("#idcheck").append(newtext);
				$("#passwd").focus();
				var idYN = 'Y';
			}
		},
		error : function(e) {
			alert("data error" + e);
		}
	}); // $.ajax
}

// 아이디 중복 체크 끝

function validate_id(mid) {
	var pattern = new RegExp(/^[a-z0-9_]+$/);
	// 영문 소문자,숫자 ,_가능,정규표현식
	return pattern.test(mid);
}

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
	;

	if ($.trim($("#nickname").val()).length > 6) {
		var newtext = '<font color="red">닉네임은 6자 이하 가능합니다.</font>';
		$("#nickcheck").text('');
		$("#nickcheck").show();
		$("#nickcheck").append(newtext); // span 닉네임 영역에 경고문자 추가
		$("#nickname").val("").focus();
		return false;
	}
	;

	// 입력 닉네임 유효성 검사 (정규 표현식 검사)
	if (!(validate_nickname(nickname))) {
		var newtext = '<font color="red">닉네임은 6글자 이하의 한글, 영문, 숫자만 사용할 수 있습니다.</font>';
		$("#nickcheck").text(''); // 문자 초기화
		$("#nickcheck").show(); // span 닉네임 영역을 보이게 한다.
		$("#nickcheck").append(newtext);
		$("#nickname").val("").focus();
		return false;
	}
	;

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
				$("#nickname").val('').focus();
				return false;

			} else { // 사용 가능한 닉네임
				var newtext = '<font color="blue">사용가능한 닉네임 입니다.</font>';
				$("#nickcheck").text('');
				$("#nickcheck").show();
				$("#nickcheck").append(newtext);
				$("#passwd").focus();
			}
		},
		error : function(e) {
			alert("data error" + e);
		}
	}); // $.ajax
}

function validate_nickname(nickname) {
	var pattern = new RegExp(/^[a-z0-9가-힣]+$/);
	// 영문 소문자,숫자 ,_가능,정규표현식
	return pattern.test(nickname);
}

//도메인값 저장
function domain_list() {
	var num = f.mail_list.selectedIndex;
	/*selectedIndex속성은 select객체하위의 속성으로서 해당리스트 목록번호를 반환
	 */
	if (num == -1) {
		//num==-1은 해당 리스트목록이 없다
		return true;
	}
	if (f.mail_list.value == "0") // 직접입력
	{
		/*리스트에서 직접입력을 선택했을때*/
		f.maildomain.value = "";
		//@뒤의 도메인입력란을 빈공간시켜라.
		f.maildomain.readOnly = false;
		//@뒤의 도메인입력란을 쓰기 가능
		f.maildomain.focus();
		//도메인입력란으로 입력대기상태
	}

	else {
		//리스트목록을 선택했을때

		f.maildomain.value = f.mail_list.options[num].value;
		/*num변수에는 해당리스트 목록번호가 저장되어있다.해당리스트 번호의 option value값이 도메인입력란에 선택된다.options속성은 select객체의 속성으로서 해당리스트번호의 value값을 가져온다
		 */
		f.maildomain.readOnly = true;
	}
}