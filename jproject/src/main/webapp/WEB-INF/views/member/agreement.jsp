<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원약관</title>
</head>
<body>

	<div id="Agree">
		<h1>
			<a href="home.do" class="jejulogo">JEJU FRIEND</a>
		</h1>
		<div>
				<form action="" id="Agree">
		<class="join_box">
			<class="checkBox check01">
				<class="clearfix">
					전체약관에 동의합니다.
					<class="checkAllBtn"><input type="checkbox" name="chkAll"
						id="chk" class="chkAll">
			<class="checkBox check02">
				<class="clearfix">
					이용약관 동의(필수)
					<class="checkBtn"><input type="checkbox" name="chk">
					<textarea name="" id="">여러분을 환영합니다.
JEJU FRIEND의 서비스를 이용해 주셔서 감사합니다. 본 약관은 다양한 JEJU FRIEND의 서비스의 이용과 관련하여 JEJU FRIEND의 서비스를 제공하는 TEAM3 주식회사(이하 ‘TEAM3’)와 이를 이용하는 JEJU FRIEND 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 JEJU FRIEND의 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
       </textarea>
	
			<class="checkBox check03">
				<class="clearfix">
					개인정보 수집 및 이용에 대한 안내(필수)
					<class="checkBtn"><input type="checkbox" name="chk">
				    <textarea name="" id="">여러분을 환영합니다.
JEJU FRIEND의 서비스를 이용해 주셔서 감사합니다. 본 약관은 다양한 JEJU FRIEND의 서비스의 이용과 관련하여 JEJU FRIEND의 서비스를 제공하는 TEAM3 주식회사(이하 ‘TEAM3’)와 이를 이용하는 JEJU FRIEND 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 전반적인 서비스 이용에 도움이 될 수 있는 정보를 포함하고 있습니다.
      </textarea>
			<class="checkBox check03">
				<class="clearfix">
					위치정보 이용약관 동의(선택)
					<class="checkBtn"><input type="checkbox" name="chk">
				<textarea name="" id="">여러분을 환영합니다.
JEJU FRIEND의 서비스를 이용해 주셔서 감사합니다. 본 약관은 다양한 JEJU FRIEND의 서비스의 이용과 관련하여 JEJU FRIEND의 서비스를 제공하는 TEAM3 주식회사(이하 ‘TEAM3’)와 이를 이용하는 JEJU FRIEND 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 전반적인 서비스 이용에 도움이 될 수 있는 정보를 포함하고 있습니다.
        </textarea>
			<class="checkBox check04">
				<class="clearfix">
					이벤트 등 프로모션 알림 메일 수신(선택)
					<class="checkBtn"><input type="checkbox" name="chk">
				
		<class="footBtwrap clearfix">
<!--  			<button class="yesagree" >동의</button> -->
<!--  			<button class="noagree">비동의</button> -->

			<a href="memberJoin.do" onclick="MemberJoin(); return false;"
							class="agreeyes"><span class="blind">동의함</span></a> 
			<a href="home.do" class="noagree"><span
							class="blind">비동의함</span></a>

				</form>
		</div>
	</div>


 </body>
</html>





	<!-- 	
	<form action="" id="Agree">
		<class="join_box">
			<class="checkBox check01">
				<class="clearfix">
					이용약관, 개인정보 수집 및 이용, 위치정보 이용약관(선택), 프로모션 안내 메일 수신(선택)에 모두
						동의합니다.
					<class="checkAllBtn"><input type="checkbox" name="chkAll"
						id="chk" class="chkAll">
		</h3>
	</div>
</div>
			<class="checkBox check02">
				<class="clearfix">
					이용약관 동의(필수)
					<class="checkBtn"><input type="checkbox" name="chk">
					<textarea name="" id="">여러분을 환영합니다.
JEJU FRIEND의 서비스를 이용해 주셔서 감사합니다. 본 약관은 다양한 JEJU FRIEND의 서비스의 이용과 관련하여 JEJU FRIEND의 서비스를 제공하는 TEAM3 주식회사(이하 ‘TEAM3’)와 이를 이용하는 JEJU FRIEND 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 JEJU FRIEND의 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
       </textarea>
	
			<class="checkBox check03">
				<class="clearfix">
					개인정보 수집 및 이용에 대한 안내(필수)
					<class="checkBtn"><input type="checkbox" name="chk">
				    <textarea name="" id="">여러분을 환영합니다.
JEJU FRIEND의 서비스를 이용해 주셔서 감사합니다. 본 약관은 다양한 JEJU FRIEND의 서비스의 이용과 관련하여 JEJU FRIEND의 서비스를 제공하는 TEAM3 주식회사(이하 ‘TEAM3’)와 이를 이용하는 JEJU FRIEND 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 전반적인 서비스 이용에 도움이 될 수 있는 정보를 포함하고 있습니다.
      </textarea>
			<class="checkBox check03">
				<class="clearfix">
					위치정보 이용약관 동의(선택)
					<class="checkBtn"><input type="checkbox" name="chk">
				<textarea name="" id="">여러분을 환영합니다.
JEJU FRIEND의 서비스를 이용해 주셔서 감사합니다. 본 약관은 다양한 JEJU FRIEND의 서비스의 이용과 관련하여 JEJU FRIEND의 서비스를 제공하는 TEAM3 주식회사(이하 ‘TEAM3’)와 이를 이용하는 JEJU FRIEND 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 전반적인 서비스 이용에 도움이 될 수 있는 정보를 포함하고 있습니다.
        </textarea>
			<class="checkBox check04">
				<class="clearfix">
					이벤트 등 프로모션 알림 메일 수신(선택)
					<class="checkBtn"><input type="checkbox" name="chk">
				
		<class="footBtwrap clearfix">
			<button class="agreeyes">동의</button>
			<button class="agreeno">비동의</button>
			
			<label for="agree_all">
  <input type="checkbox" name="agree_all" id="agree_all">
  <span>모두 동의합니다</span>
</label>
<label for="agree">
  <input type="checkbox" name="agree" value="1">
  <span>이용약관 동의<strong>(필수)</strong></span>
</label>
<label for="agree">
  <input type="checkbox" name="agree" value="2">
  <span>개인정보 수집, 이용 동의<strong>(필수)</strong></span>
</label>
<label for="agree">
  <input type="checkbox" name="agree" value="3">
  <span>개인정보 이용 동의<strong>(필수)</strong></span>
</label>
<label for="agree">
  <input type="checkbox" name="agree" value="4">
  <span>이벤트, 혜택정보 수신동의<strong class="select_disable">(선택)</strong></span>
</label> -->

