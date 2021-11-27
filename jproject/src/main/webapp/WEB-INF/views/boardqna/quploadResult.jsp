<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../navi.jsp"%>

<c:if test="${qresult == 1 }">
	<script>
		alert("파일은 200KB까지 업로드 가능합니다.");
		history.go(-1);
	</script>
</c:if>

<c:if test="${qresult == 2 }">
	<script>
		alert("첨부파일은 확장자가 jpg, gif, png파일만 업로드 가능합니다.");
		history.go(-1);
	</script>
</c:if>