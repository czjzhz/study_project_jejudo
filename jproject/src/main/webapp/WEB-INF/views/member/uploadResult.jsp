<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:if test="${presult == 1 }">
	<script>
		alert("첨부파일은 200KB미만의 파일만 업로드가 가능합니다.");
		history.go(-1);
	</script>
</c:if>

<c:if test="${presult == 2 }">
	<script>
		alert("첨부파일은 jpg, gif, png파일만 업로드가 가능합니다.");
		history.go(-1);
	</script>
</c:if>