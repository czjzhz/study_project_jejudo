<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:If test="${result > 0 }">
	<script>
	alert("닉네임 정보가 수정되었습니다.");
	location.href="Mypage.do"; 
	</script>
</c:If>


</body>
</html>