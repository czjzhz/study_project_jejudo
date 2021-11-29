<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../navi.jsp"%>

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
	$(function(){
		$('#boardqnareply').load('./boardqnareply.do?qno=${boardqna.qno}');
		$('#qrinsert').click(function(){
			if(!frm.qrcont.value){
				alert('댓글을 입력하세요');
				frm.qrcont.focus();
				return false;
			}
			var frmData = $('form').serialize();
			$.post('qrinsert.do', frmData, function(data){
				$('#boardqnareply').html(data);
				frm.qrcont.value = '';
			});
		});
	});
	
</script>
</head>
<body>
<%@ include file="../navi.jsp"%>
	

	<main class="" id="main-collapse">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12">
					<h3>Q & A 상세페이지</h3>
					<c:if test="${boardqna.id == sessionScope.mb.id }">
					<button type="button" class="btn btn-md btn-warning"
							style="background-color: #FF8000;"
							onclick="location.href='qboardupdateform.do?qno=${boardqna.qno }&pageNum=${pageNum}'">수정</button>
					<button type="button" class="btn btn-md btn-warning"
							style="background-color: #FF8000;"
							onclick="location.href='qboarddelete.do?qno=${boardqna.qno }&pageNum=${pageNum}'">삭제</button>
					</c:if>
					<table class="table table-bordered">
					<input type="hidden" name="qno" value="${boardqna.qno }">
					<input type="hidden" name="pageNum" value="${pageNum }">
					<input type="hidden" name="id" value="${sessionScope.mb.id }" >
					<input type="hidden" name="nickname" value="${sessionScope.mb.nickname }" >
							
						<tr>
							<td width="150px;">제목</td>
							<td>${boardqna.qsub}</td>
						</tr>
						<tr>
							<td>내용</td>
							<td><pre>${boardqna.qcont}</pre></td>
						</tr>
						<tr>
							<td>첨부 파일</td>
							<td>
								<!-- 첨부파일이 있을때만 첨부파일 출력 --> 
								<c:if test="${boardqna.qfile != null}">
									<img src="<%=request.getContextPath() %>/upload/${boardqna.qfile}" height="500" width="500" />
									<br>
									다운로드:
									<a href="filedown.do?boardqnafile=${boardqna.qfile}">
										  ${boardqna.qfile} 
									</a>
								</c:if>

							</td>
						</tr>
					</table>
					<p>
					<c:if test="${not empty sessionScope.mb}">
					<form name="frm" id="frm">
						<input type="hidden" name="qno" value="${boardqna.qno }">
						<input type="hidden" name="qrnickname" value="${sessionScope.mb.nickname } ">
						<textarea class="form-control" id="qrcont" name="qrcont" rows="3"></textarea>
						<input type="button" value="댓글 작성" name="qrinsert" id="qrinsert" class="btn btn-md btn-warning" style="background-color: #FF8000;">
					</form>
					</c:if>
	<div id="boardqnareply"></div>
	
					</p>
				</div>
			</div>
		</div>
	</main>

	<div id="boardqnalist"></div>
	
</body>
</html>