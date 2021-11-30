<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    

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
</head>
<body>
<div id="pwd_wrap">
 
 <c:if test="${empty pwdok}"> 
  <h2 class="pwd_title">비밀번호 찾기</h2>
  <form method="post" action="PwdFindok.do"
  		onsubmit="return check()">  
   <table id="pwd_t">
    <tr>
     <th>ID</th>
     <td><input name="id" id="id" size="14" class="input_box" /></td>
    </tr>
    
    <tr>
     <th>이름</th>
     <td><input name="name" id="name" size="14" class="input_box" /></td>
    </tr>
    
    
   </table>
   <div id="pwd_menu">
    <input type="submit" value="비밀번호 찾기" class="input_button" />
    <input type="reset" value="취소" class="input_button" 
    onclick="location.href='<%=request.getContextPath()%>/MemberLogin.do'">
   </div>
  </form>
  </c:if>
  
  
  <c:if test="${!empty pwdok}">
    <h2 class="pwd_title2">비번찾기 결과</h2>
    <table id="pwd_t2">
     <tr>
      <th>검색한 비밀번호</th>
      <td>${pwdok}</td>
     </tr>
    </table>
    <div id="pwd_close2">
    <input type="button" value="닫기" class="input_button"
    onclick="self.close();" />
    <!-- close()메서드로 공지창을 닫는다. self.close()는 자바스크립트이다. -->
    </div>
  </c:if> 
  
 </div>
</body>
</html>