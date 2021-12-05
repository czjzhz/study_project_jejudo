<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../navi.jsp"%>

<c:if test="${result > 0 }">
	<script>
		alert("리뷰 작성 성공");
		location.href = "rboardlist.do";
	</script>
</c:if>

<c:if test="${result <= 0 }">
	<script>
		alert("리뷰 작성 실패");
		history.go(-1);
	</script>
</c:if>