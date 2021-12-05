<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA게시판 목록</title>

<script>
	function message(nickname) {
//		alert(nickname);
		var ref = './messageform.do?nickname='+nickname
		window.open(ref, "mywin", "width=500, height=400, left=800, top=200");
	}
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

	<!-- Start Sample Area -->
	<section class="sample-text-area">
		<div class="container box_1170">
			<div class="container-fluid">
			<div class="row">
				<div class="col-md-12">
					<button type="button" class="btn btn-md btn-primary"
						onclick="location.href='qboardinsertForm.do'">글작성</button>
					<table class="table table-hover">
						<input type="hidden" name="id" value="" >
						<input type="hidden" name="nickname" value="" >
						<thead>
							<tr>
								<th>번호</th>
								<th width=70%>제목</th>
								<th>작성자</th>
								<th>작성일</th>
								<th>조회수</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${empty qboardlist }">
								<tr>
									<td colspan="5">게시물이 없습니다.</td>
								</tr>
							</c:if>
							<c:if test="${not empty qboardlist }">
								<c:set var="no1" value="${no }"></c:set>
								<c:forEach var="q" items="${qboardlist }">
									<tr>
										<td>${no1}</td>
											<c:if test="${q.qdel =='y' }">
												<td colspan="5">삭제된 글입니다.</td>
											</c:if>
											<c:if test="${q.qdel == 'n' }">	
												<td><a href="qboardview.do?qno=${q.qno }&pageNum=${pp.currentPage}">${q.qsub }</a></td>
												<td><a href="javascript:void(0);" onclick="message('${q.nickname}')">${q.nickname}</a></td>
												<td><fmt:formatDate value="${q.qreg }" pattern="yyyy-MM-dd " /></td>
												<td>${q.qreadcount}</td>
											</c:if>
									</tr>
								<c:set var="no1" value="${no1 - 1}"/>
								</c:forEach>
							</c:if>
						</tbody>
					</table>
					<form action="qboardlist.do" >
						<input type="hidden" name="pageNum" value="1"> 
						<select name="search">
							<option value="qsub" <c:if test="${search=='qsub'}">selected="selected" </c:if>>제목</option>
							<option value="qcont" <c:if test="${search=='qcont'}">selected="selected" </c:if>>내용</option>
							<option value="nickname" <c:if test="${search=='nickname'}">selected="selected" </c:if>>작성자</option>
							<option value="subcon" <c:if test="${search=='subcon'}">selected="selected" </c:if>>제목+내용</option>
						</select> 
						<input type="text" name="keyword"> 
						<input type="submit" value="확인">
					</form>
					
					<ul class="pagination">
						<!-- 검색 했을 경우의 페이징 처리 -->
						<c:if test="${not empty keyword}">
							<c:if test="${pp.startPage > pp.pagePerBlk }">
								<li>
									<a href="qboardlist.do?pageNum=${pp.startPage - 1}&search=${search}&keyword=${keyword}">이전</a>
								</li>
							</c:if>
							<c:forEach var="i" begin="${pp.startPage}" end="${pp.endPage}">
								<li <c:if test="${pp.currentPage==i}">class="active"</c:if>>
								<a href="qboardlist.do?pageNum=${i}&search=${search}&keyword=${keyword}">${i}</a>
								</li>
							</c:forEach>
							<c:if test="${pp.endPage < pp.totalPage}">
								<li>
									<a href="$qboardlist.do?pageNum=${pp.endPage + 1}&search=${search}&keyword=${keyword}">다음</a>
								</li>
							</c:if>
						</c:if>
						
						<!-- 전체 목록의 페이징 처리 -->
						<c:if test="${empty keyword}">
							<c:if test="${pp.startPage > pp.pagePerBlk }">
								<li><a href="qboardlist.do?pageNum=${pp.startPage - 1}">이전</a></li>
							</c:if>
							<c:forEach var="i" begin="${pp.startPage}" end="${pp.endPage}">
								<li <c:if test="${pp.currentPage==i}">class="active"</c:if>>
									<a href="qboardlist.do?pageNum=${i}">${i}</a></li>
							</c:forEach>
							<c:if test="${pp.endPage < pp.totalPage}">
								<li><a href="qboardlist.do?pageNum=${pp.endPage + 1}">다음</a></li>
							</c:if>
						</c:if>
						
					</ul>
				</div>
			</div>
		</div>
		</div>
	</section>
	<!-- End Sample Area -->
	<main class="" id="main-collapse">
		
	</main>
</body>
</html>