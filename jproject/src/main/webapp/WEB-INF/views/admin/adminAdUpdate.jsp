<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }" /> 
<html>
<head>
<meta charset="UTF-8">
<title>관리자 - 광고수정</title>
</head>
<body>

	<!-- ckEditor --> 
	<script src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
	<!-- 왼쪽 네비게이 -->
	<%-- <%@ include file="adminnavi.jsp"%> --%>

	<input type="button" onclick="location.href='./admin_notice.do'" value="공지관리">
	<input type="button" onclick="location.href='./admin_ad.do'" value="광고관리">
	&ensp;|&ensp;&nbsp;<input type="button" onclick="location.href='./admin_member.do'" value="회원관리">
	&ensp;|&ensp;&nbsp;<input type="button" onclick="location.href='./admin_with.do'" value="동행관리">
	<input type="button" onclick="location.href='./admin_review.do'" value="리뷰관리">
	<input type="button" onclick="location.href='./admin_qna.do'" value="Q&A관리">
	&ensp;|&ensp;&nbsp;<input type="button" onclick="location.href='./admin_logout.do'" value="로그아웃">
	<hr/>
	<h2 align=center>광고 수정</h2>
	<form method="post" action="admin_ad_update_action.do">
		<input type="hidden" name="adno" value='${adno}' >
		<table align=center border=1>
			<tr>
				<td>광고제목 </td>
				<td><textarea id="adsubject" name="adsubject"  rows="1" cols="50">${list.adsubject}</textarea></td>
			</tr>	
			<tr>
				<td>광고내용 </td>
				<td><textarea id="adcontent" name="adcontent" rows="20" cols="50">${list.adcontent}</textarea>
					<script>	// 글쓰기 editor 및 사진 업로드 기능
						CKEDITOR.replace('adcontent',
						{filebrowserUploadUrl:'./admin_image.do'
						});
					</script></td>
			</tr>	
			<tr>
				<td colspan=2 align=center> <input type="submit" value="작성완료"> </td>
			</tr>	
		</table>
	</form>
	
	
	
</body>
</html>