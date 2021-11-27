<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../navi.jsp"%>

<c:if test="${result > 0 }">
	<script>
		alert("글이 삭제 되었습니다.");
		location.href="qboardlist.do";
	</script>
</c:if>

<c:if test="${result <= 0 }">
	<script>
		alert("글 삭제에 실패 하였습니다.");
		history.go(-1);
	</script>
</c:if>