<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>

<!-- 전체 이용약관 선택하면 회원가입 폼으로 이동 -->
<script type="text/javascript">
	function check() {
		var checkall = document.form.checkall.checked;
		var num = 0;
		if (checkall == true) {
			num = 1;
		}
		if (num == 1) {
			document.form.submit();
		} else {
			alert("JEJU FRIEND 이용약관과 개인정보 수집 및 이용에 대한 안내 모두 동의해주세요.");
		}
	}

	function nocheck() {
		alert("메인페이지로 돌아갑니다");
		location.href = "./home.do";
	}
</script>

<!-- 전체 체크박스 선택-->
<script>
	$(document).ready(function() {
		$("#checkall").click(function() {

			/** if($("#checkall").prop("checked")){    //클릭되었으면
			    //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
			    $("input[name=chk]").prop("checked",true);
			}else{       //클릭이 안되있으면
			    //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
			    $("input[name=chk]").prop("checked",false);
			} */
			var check = $("#checkall").prop("checked");
			$("input[name=chk]").prop("checked", check);

		});
	})
</script>

</head>
<body>
		<tr>
		<td height="70%" align="center">
       	<br>
    	<p align="left"></p>
    	<span style="padding-left: 160px">
    	<a href="home.do">JEJU FRIEND</a></span>
		<br><br>
		</tr>
		
		<tr>
			<td><input type="checkbox" id="checkall" /></td>
			<td><b>JEJU FRIEND 모든 이용약관에 동의합니다.</b></td>
		</tr><br><br><br>
		<tr>
			
			<textarea name="" id="" cols=50 rows=4>여러분을 환영합니다.
			JEJU FRIEND의 서비스를 이용해 주셔서 감사합니다. 본 약관은 다양한 JEJU FRIEND의 서비스의 이용과 관련하여 JEJU FRIEND의 서비스를 제공하는 TEAM3 주식회사(이하 ‘TEAM3’)와 이를 이용하는 JEJU FRIEND 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 JEJU FRIEND의 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
       		</textarea><br>	
       		<td><input type="checkbox" name="chk" /></td>
			<td>이용약관 동의</td>
       		<br><br>
		</tr>
		<tr>
			
			<textarea name="" id="" cols=50 rows=4>여러분을 환영합니다.
			JEJU FRIEND의 서비스를 이용해 주셔서 감사합니다. 본 약관은 다양한 JEJU FRIEND의 서비스의 이용과 관련하여 JEJU FRIEND의 서비스를 제공하는 TEAM3 주식회사(이하 ‘TEAM3’)와 이를 이용하는 JEJU FRIEND 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 JEJU FRIEND의 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
      		 </textarea><br>
      		 <td><input type="checkbox" name="chk" /></td>
			<td>개인정보 수집 및 이용에 대한 안내 동의</td>
			<br><br>
		</tr>
		<tr>
			
			<textarea name="" id="" cols=50 rows=4>여러분을 환영합니다.
			JEJU FRIEND의 서비스를 이용해 주셔서 감사합니다. 본 약관은 다양한 JEJU FRIEND의 서비스의 이용과 관련하여 JEJU FRIEND의 서비스를 제공하는 TEAM3 주식회사(이하 ‘TEAM3’)와 이를 이용하는 JEJU FRIEND 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 JEJU FRIEND의 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
      		 </textarea><br>
      		 <td><input type="checkbox" name="chk" /></td>
			<td>위치정보 이용약관 동의</td>
			<br><br>
		</tr>
		<tr>
			<textarea name="" id="" cols=50 rows=4>여러분을 환영합니다.
			JEJU FRIEND의 서비스를 이용해 주셔서 감사합니다. 본 약관은 다양한 JEJU FRIEND의 서비스의 이용과 관련하여 JEJU FRIEND의 서비스를 제공하는 TEAM3 주식회사(이하 ‘TEAM3’)와 이를 이용하는 JEJU FRIEND 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 JEJU FRIEND의 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
      		 </textarea><br>
      		 <td><input type="checkbox" name="chk" /></td>
			<td>이벤트 등 프로모션 알림 메일 수신 동의</td>
			<br>
		</tr>

	<br>
	<tr>
		<td align="center" valign="top"><input type="button" value="취소"
			onclick="nocheck()" />&nbsp;&nbsp;&nbsp; <input type="button"
			value="확인" onclick="check()" /></td>
	</tr>

</body>
</html>