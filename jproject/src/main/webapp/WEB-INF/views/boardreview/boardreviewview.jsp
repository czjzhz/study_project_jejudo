<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 상세 페이지</title>
<script type="text/javascript">
	// 글목록
	$(function() {
		$('#boardreviewlist').load('rboardlist.do?pageNum=${pageNum}');
	});

	// 댓글 목록
	$(function() {
		$('#boardreviewreply').load(
				'./boardreviewreply.do?rno=${boardreview.rno}');
		$('#rrinsert').click(function() {
			if (!frm.rrcont.value) {
				alert('댓글을 입력하세요');
				frm.rrcont.focus();
				return false;
			}
			var frmData = $('form').serialize();
			$.post('rrinsert.do', frmData, function(data) {
				$('#boardreviewreply').html(data);
				frm.rrcont.value = '';
			});
		});
	});
</script>
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
						<div class="col-md-12">
						<button type="button" class="btn btn-md btn-primary"
								onclick="location.href='rboardlist.do'">목록</button>
							<c:if test="${boardreview.id == sessionScope.mb.id }">
								<button type="button" class="btn btn-md btn-primary"
									onclick="location.href='rboardupdateform.do?rno=${boardreview.rno }&pageNum=${pageNum}'">수정</button>
								<button type="button" class="btn btn-md btn-primary"
									onclick="location.href='rboarddelete.do?rno=${boardreview.rno }&pageNum=${pageNum}'">삭제</button>
							</c:if>
							<table class="table table-bordered">
								<input type="hidden" name="rno" value="${boardreview.rno }">
								<input type="hidden" name="pageNum" value="${pageNum }">
								<input type="hidden" name="id" value="${sessionScope.mb.id }">
								<input type="hidden" name="nickname"
									value="${sessionScope.mb.nickname }">

								<tr>
									<td width="150px;">제목</td>
									<td>${boardreview.rsub}</td>
								</tr>
								<tr>
									<td>내용</td>
									<td><pre>${boardreview.rcont}</pre></td>
								</tr>
								<tr>
									<td>첨부 파일</td>
									<td>
										<!-- 첨부파일이 있을때만 첨부파일 출력 --> <c:if
											test="${boardreview.rfile != null}">
											<img
												src="<%=request.getContextPath() %>/upload/${boardreview.rfile}"
												height="500" width="500" />
											<br>
									다운로드:
									<a href="rfiledown.do?boardreviewfile=${boardreview.rfile}">
												${boardreview.rfile} </a>
										</c:if>

									</td>
								</tr>
							</table>
							<p>
								<c:if test="${not empty sessionScope.mb}">
									<form name="frm" id="frm">
										<input type="hidden" name="rno" value="${boardreview.rno }">
										<input type="hidden" name="rrnickname"
											value="${sessionScope.mb.nickname } ">
										<textarea class="form-control" id="rrcont" name="rrcont"
											rows="3"></textarea>
										<input type="button" value="댓글 작성" name="rrinsert"
											id="rrinsert" class="btn btn-md btn-primary">
									</form>
								</c:if>
							<div id="boardreviewreply"></div>

							</p>
						</div>
					</div>
				</div>
			</main>
		</div>
	</section>
</body>
</html>