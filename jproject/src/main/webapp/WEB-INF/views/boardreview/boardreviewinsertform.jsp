<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>리뷰 게시판 글작성</title>
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

	<!-- Start Sample Area -->
	<section class="sample-text-area">
		<div class="container box_1170">
			<main class="" id="main-collapse">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-1"></div>
						<div class="col-md-10">
							<br>
							<form action="rboardinsert.do" method="post"
								enctype="multipart/form-data">
								<input type="hidden" name="id" value="${sessionScope.mb.id }">
								<input type="hidden" name="nickname"
									value="${sessionScope.mb.nickname }">
								<table class="table">

									<tr>
										<td>제목</td>
										<td><input type="text" size="97" name="rsub" required="required"></td>
									</tr>
									<tr>
										<td>내용</td>
										<td><textarea rows="15" cols="100" name="rcont"
												required="required"></textarea></td>
									</tr>
									<tr>
										<td>파일첨부</td>
										<td><input name="boardreviewfile" type="file" /></td>
									</tr>
									<tr>
										<td colspan="2" align="center"><input type="submit"
											value="글작성" class="btn btn-md btn-primary"></td>
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
