<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>리뷰 게시판 글수정</title>
</head>
<body>
<%@ include file="../navi.jsp"%>
	<!-- breadcrumb start-->
	<section class="breadcrumb review_bg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb_iner">
						<div class="breadcrumb_iner_item text-center">
							<h2>여행리뷰</h2>
							<p>제주의 아름다움을 남기기!</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- breadcrumb start-->
	<section class="sample-text-area">
		<div class="container box_1170">
	<main class="" id="main-collapse">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12">
					<br>
					<form action="rboardupdate.do" method="post" enctype="multipart/form-data">
						<input type="hidden" name="rno" value="${boardreview.rno }">
						<input type="hidden" name="pageNum" value="${pageNum }">	
						<h3 class="text-primary">글 수정하기</h3>	
						<table class="table">
							<tr>
								<td>제목</td>
								<td>
									<input size="97" type="text" name="rsub" required="required"
											value="${boardreview.rsub }">
								</td>
							</tr>
							<tr>
								<td>내용</td>
								<td>
								<textarea rows="15" cols="100" name="rcont" required="required">${boardqna.qcont }</textarea>
								</td>
							</tr>
							<tr>
								<td>파일첨부</td>
								<td>
									<c:if test="${boardreview.rfile != null}">
									<img src="<%=request.getContextPath() %>/upload/${boardreview.rfile}" height="500" width="500" />
										<br>
										${boardreview.rfile}
										<br>
									</c:if>
									<input name="boardreviewfile" type="file"/> 
								</td>
							</tr>
							<tr>
								<td colspan="2" align="center">
									<input type="submit" value="수정" class="btn btn-md btn-primary">
									<input type="button" value="취소" onclick="location.href='rboardview.do?rno=${boardreview.rno }&pageNum=${pageNum}'"
										class="btn btn-md btn-primary">
								</td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
	</main>
	</div>
	</section>
</body>
</html>