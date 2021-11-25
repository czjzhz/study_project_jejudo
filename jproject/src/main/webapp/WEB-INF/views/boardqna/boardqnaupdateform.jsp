<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<<%-- %@ include file="../header.jsp"%> --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>QnA 게시판 글수정</title>
</head>
<body>
<%@ include file="../navi.jsp"%>

	<main class="" id="main-collapse">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12">
					<h3>Q & A 수정</h3>
					<br>
					<form action="qboardupdate.do" method="post" enctype="multipart/form-data">
						<input type="hidden" name="qno" value="${boardqna.qno }">
						<input type="hidden" name="pageNum" value="${pageNum }">		
<!-- 						<input type="hidden" name="id" value="bbb">
						<input type="hidden" name="nickname" value="닉네임"> 
 -->						<table class="table table-hover">
							<tr>
								<td>제목</td>
								<td>
									<input type="text" name="qsub" required="required"
											value="${boardqna.qsub }">
								</td>
							</tr>
							<tr>
								<td>내용</td>
								<td>
								<textarea rows="5" cols="30" name="qcont" required="required">${boardqna.qcont }</textarea>
								</td>
							</tr>
							<tr>
								<td>파일첨부</td>
								<td>
									<c:if test="${boardqna.qfile != null}">
									<img src="<%=request.getContextPath() %>/upload/${boardqna.qfile}" height="500" width="500" />
										<br>
										${boardqna.qfile}
										<br>
									</c:if>
									<input name="boardqnafile" type="file"/> 
									<%-- <c:if test="${boardqna.qfile != null}">
										${boardqna.qfile} 
									</c:if> --%>
								</td>
							</tr>
							<tr>
								<td colspan="2" align="center">
									<input type="submit" value="수정" class="btn btn-md btn-warning" style="background-color: #FF8000;">
									<input type="button" value="취소" onclick="location.href='qboardview.do?qno=${boardqna.qno }&pageNum=${pageNum}'"
										class="btn btn-md btn-warning" style="background-color: #FF8000;">
								</td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
	</main>
</body>
</html>