<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>

<script>
function check(){
	 if($.trim($("#id").val())==""){
		 alert("비밀번호를 찾고자 하는 아이디를 입력해 주세요.");
		 $("#id").val("").focus();
		 return false;
	 }
	 if($.trim($("#name").val())==""){
		 alert("회원정보에 등록한 이름을 입력하세요.");
		 $("#name").val("").focus();
		 return false;
	 }

</script>
<script src="./js/jquery.js"></script>
</head>
<body>
<div id="pwd_wrap">
 
 <c:if test="${empty pwdok}"> 
  <h2 class="pwd_title">등록된 회원정보로 비밀번호 찾기</h2>
  <form method="post" action="PwdFindok.do" onsubmit="return check()">  
   <table id="pwd_t" border="1">

    <tr>
     <th>아이디</th>
     <td><input name="id" id="id" size="14" class="input_box" /></td>
    </tr>
    
    <tr>
     <th>이름</th>
     <td><input name="name" id="name" size="14" class="input_box" /></td>
    </tr>
   </table>
   
   <div id="pwd_menu"><br>
    <input type="submit" value="비밀번호 찾기" class="input_button" />
    <input type="reset" value="취소" class="input_button" onclick="location.href='MemberLogin.do'" />
   </div>
  </form>
  </c:if>
  
  
  <c:if test="${!empty pwdok}">
    <h2 class="pwd_title2">비밀번호 찾기 결과</h2>
    <table id="pwd_t2" >
     <tr>
      <td><b>JEJU FRIEND의 회원이시군요!</b></td>
      </tr>
      <tr>
      <td>${pwdok}</td>
     </tr>
    </table>
    <div id="pwd_close2">
    <br>
    <input type="button" value="확인" class="input_button" onclick="location.href='MemberLogin.do'" />
    </div>
  </c:if> 
  
 </div>
</body>
</html>