<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:if test="${result == 1}">
	<script>
		alert("등록되지 않는 회원입니다.");
		history.go(-1);
	</script>
</c:if>   

<c:if test="${result == 2}">
	<script>
		alert("아이디 또는 비밀번호가 잘못 입력 되었습니다.                             아이디와 비밀번호를 정확히 입력해 주세요.");
		history.go(-1);
	</script>
</c:if>  