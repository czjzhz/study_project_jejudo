<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:if test="${result > 0 }">
	<script>
		alert("쪽지삭제 성공");
		history.go(-2);
	</script>
</c:if>

<c:if test="${result <= 0 }">
	<script>
		alert("삭제 실패");
		history.go(-1);
	</script>
</c:if>

</body>
</html>