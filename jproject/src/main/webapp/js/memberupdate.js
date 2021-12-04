/** 유효성 체크 및 Ajax 아이디 체크 * */


	// 이름 중복체크 끝
function validate_name(name) {
	var pattern = new RegExp(/^[a-z가-힣]+$/)
	// 영문 소문자,한글 가능 정규표현식
	return pattern.test(name);
}

//var idYN = 'N';

// 아이디 중복체크
function check() {
//	if ($.trim($("#id").val()) == "") {
//		alert("ID를 입력하세요.");
//		$("#id").val("").focus();
//		return false;
//	}



	if ($.trim($("#name").val()) == "") {
		alert("이름을 입력하세요.");		
		$("#name").val("").focus();
		return false;
	}
	
		
	// 이름 중복 검사
	//1. 이름 입력글자 길이 체크 (유효성 검사)
	if($.trim($("#name").val()).length < 2) {
		alert("2자 이상 입력하세요.");            
		$("#name").val("").focus();
		return false;
	}

	if ($.trim($("#name").val()).length > 6) {
		alert("6자 이하의 글자를 입력하세요.");            
		$("#name").val("").focus();
		return false;
	}

	// 입력 이름 유효성 검사 (정규 표현식 검사)
	if (!(validate_name($("#name").val()))) {
		alert("영문과 한글만 입력하세요.");            
		$("#name").val("").focus();
		return false;
	}	
	
	if ($("#male").is(":checked") == false
			&& $("#female").is(":checked") == false) {
		alert("성별을 입력하세요.");
		return false;
	}
	if ($.trim($("#age").val()) == "") {
		alert("나이를 입력하세요.");
		return false;
	}
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
		$("#phone1").val("").focus();
		return false;
	}
	if (isNaN($("#phone1").val())) {
		alert("숫자만 입력하세요.");
		$("#phone1").val("").focus();
		return false;
	}
	if ($.trim($("#phone2").val()) == "") {
		alert("휴대폰 중간번호 4자리를 입력하세요.");
		$("#phone2").val("").focus();
		return false;
	}
	if (isNaN($("#phone2").val())) {
		alert("숫자만 입력하세요.");
		$("#phone2").val("").focus();
		return false;
	}
	if ($.trim($("#phone3").val()) == "") {
		alert("휴대폰 끝번호 4자리를 입력하세요.");
		$("#phone3").val("").focus();
		return false;
	}
	if (isNaN($("#phone3").val())) {
		alert("숫자만 입력하세요.");
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
	/*if ($.trim($("#intro").val()) == "") {               // 필요시 온오프 가능
	alert("자기소개를 입력하세요.");
	$("#intro").val("").focus();
	return false;
}
*/
//if(idYN == 'N'){
//	alert('ID 중복검사를 체크해주세요.');
//	return false;
//}

}

function post_search() {
	alert("우편번호 검색 버튼을 클릭하세요.");
}

function post_check() {
	window.open("zipcodeFind.do", "우편번호검색",
			"width=200,height=100,scrollbars=yes");
	// 폭이 200이고 높이가 100, 스크롤바가 생성되는 새로운 공지창을 만듬
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
	//@뒤의 도메인입력란을 빈공간으로 만듬
	f.maildomain.readOnly = false;
	//@뒤의 도메인입력란을 쓰기 가능
	f.maildomain.focus();
	//도메인입력란으로 입력대기상태
}else {
	//리스트목록을 선택했을때

	f.maildomain.value = f.mail_list.options[num].value;
	/*num변수에는 해당리스트 목록번호가 저장되어있다.
	 * 해당리스트 번호의 option value값이 도메인입력란에 선택된다.
	 * options속성은 select객체의 속성으로서 해당리스트번호의 value값을 가져온다
	 */
	f.maildomain.readOnly = true;
}

}	