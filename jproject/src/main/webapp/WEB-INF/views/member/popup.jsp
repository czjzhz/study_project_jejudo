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
		alert("JEJU FRIEND의 멤버가 되신 것을 환영합니다!");
		location.href="home.do";
	</script>
</c:If>

<%-- <c:If test="${result <= 0 }">
	<script>
		alert("회원 가입 실패");
		location.href="MemberJoin.do";
	</script>
</c:If> --%>
	
</body>
</html>