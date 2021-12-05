<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA 상세 페이지</title>
<script type="text/javascript">
	// 글목록
	$(function() {
		$('#boardqnalist').load('qboardlist.do?pageNum=${pageNum}');
	});

	// 댓글 목록
	$(function() {
		$('#boardqnareply').load('./boardqnareply.do?qno=${boardqna.qno}');
		$('#qrinsert').click(function() {
			if (!frm.qrcont.value) {
				alert('댓글을 입력하세요');
				frm.qrcont.focus();
				return false;
			}
			var frmData = $('form').serialize();
			$.post('qrinsert.do', frmData, function(data) {
				$('#boardqnareply').html(data);
				frm.qrcont.value = '';
			});
		});
	});
</script>
</head>
<body>
	<%@ include file="../navi.jsp"%>
	
	<!-- breadcrumb start-->
    <section class="breadcrumb breadcrumb_bg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb_iner">
                        <div class="breadcrumb_iner_item text-center">
                            <h2>Q & A</h2>
                            <p>제주에 대한 무엇이든 물어보자!</p>
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
							<button type="button" class="btn btn-md btn-primary"
								onclick="location.href='qboardupdateform.do?qno=${boardqna.qno }&pageNum=${pageNum}'">수정</button>
							<button type="button" class="btn btn-md btn-primary"
								onclick="location.href='qboarddelete.do?qno=${boardqna.qno }&pageNum=${pageNum}'">삭제</button>
							<button type="button" class="btn btn-md btn-primary"
								onclick="location.href='qboardlist.do'">목록</button>
							<table class="table table-bordered">
								<input type="hidden" name="qno" value="${boardqna.qno }">
								<input type="hidden" name="pageNum" value="${pageNum }">
								<input type="hidden" name="id" value="">
								<input type="hidden" name="nickname" value="">

								<tr>
									<td width="150px;">작성자</td>
									<td>${nickname}</td>
								</tr>
								<tr>
									<td width="150px;">제목</td>
									<td>${boardqna.qsub}</td>
								</tr>
								<tr>
									<td>내용</td>
									<td>${boardqna.qcont}</td>
								</tr>
								<tr>
									<td>첨부 파일</td>
									<td>
										<!-- 첨부파일이 있을때만 첨부파일 출력 --> <c:if
											test="${boardqna.qfile != null}">
											<img
												src="<%=request.getContextPath() %>/upload/${boardqna.qfile}"
												height="500" width="500" />
											<br>
									다운로드:
									<a href="filedown.do?boardqnafile=${boardqna.qfile}">
												${boardqna.qfile} </a>
										</c:if>

									</td>
								</tr>
							</table>
							<p>
							<form name="frm" id="frm">
								<input type="hidden" name="qno" value="${boardqna.qno }">
								<input type="hidden" name="qrnickname"
									value="${member.nickname }">
								<textarea class="form-control" id="qrcont" name="qrcont"
									rows="3"></textarea>
								<input type="button" value="댓글 작성" name="qrinsert" id="qrinsert"
									class="btn btn-md btn-primary">
							</form>
							<div id="boardqnareply"></div>
							</p>
						</div>
					</div>
				</div>
			</main>
		</div>
	</section>

</body>
</html>