<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>QnA 게시판 글수정</title>
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
					<form action="qboardupdate.do" method="post" enctype="multipart/form-data">
						<input type="hidden" name="qno" value="${boardqna.qno }">
						<input type="hidden" name="pageNum" value="${pageNum }">		
<!-- 						<input type="hidden" name="id" value="bbb">
						<input type="hidden" name="nickname" value="닉네임"> 
 -->						<table class="table table-hover">
							<tr>
								<td>제목</td>
								<td>
									<input size="97" type="text" name="qsub" required="required"
											value="${boardqna.qsub }">
								</td>
							</tr>
							<tr>
								<td>내용</td>
								<td>
								<textarea rows="15" cols="100" name="qcont" required="required">${boardqna.qcont }</textarea>
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
									<input type="submit" value="수정" class="btn btn-md btn-primary">
									<input type="button" value="취소" onclick="location.href='qboardview.do?qno=${boardqna.qno }&pageNum=${pageNum}'"
										class="btn btn-md btn-primary">
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