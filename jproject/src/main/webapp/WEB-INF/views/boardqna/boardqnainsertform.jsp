<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../navi.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>QnA 게시판 글작성</title>
</head>
<body>
<%@ include file="../navi.jsp"%>

	<main class="" id="main-collapse">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12">
					<h3>Q & A 글쓰기</h3>
					<br>
					<form action="qboardinsert.do" method="post" enctype="multipart/form-data">
					<input type="hidden" name="id" value="${sessionScope.mb.id }"  >  <!-- 세션 id값 -->
                    <input type="hidden" name="nickname" value="${sessionScope.mb.nickname }" > <!-- 세션 nick값 -->
						<table class="table table-hover" >
							<tr>
								<td>제목</td>
								<td><input type="text" name="qsub" required="required"></td>
							</tr>
							<tr>
								<td>내용</td>
								<td><textarea rows="5" cols="30" name="qcont" required="required"></textarea></td>
							</tr>
							<tr>
								<td>파일첨부</td>
								<td>
									<input name="boardqnafile" type="file"/>
								</td>
							</tr>
							<tr>
								<td colspan="2" align="center">
									<input type="submit" value="글작성" class="btn btn-md btn-warning" style="background-color: #FF8000;">
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