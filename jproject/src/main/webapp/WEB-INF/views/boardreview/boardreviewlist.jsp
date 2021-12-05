<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>리뷰 게시판 목록</title>

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
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-12">
						<c:if test="${not empty sessionScope.mb}">
							<button type="button" class="btn btn-md btn-primary"
								onclick="location.href='rboardinsertForm.do'">글작성</button>
						</c:if>
						<table class="table table-hover">
							<input type="hidden" name="id" value="${sessionScope.mb.id } ">
							<input type="hidden" name="nickname"
								value="${sessionScope.mb.nickname }">
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
								<c:if test="${empty rboardlist }">
									<tr>
										<td colspan="5">게시물이 없습니다.</td>
									</tr>
								</c:if>
								<c:if test="${not empty rboardlist }">
									<c:set var="no1" value="${no }"></c:set>
									<c:forEach var="r" items="${rboardlist }">
										<tr>
											<td>${no1}</td>
											<c:if test="${r.rdel =='y' }">
												<td colspan="5">삭제된 글입니다.</td>
											</c:if>
											<c:if test="${r.rdel == 'n' }">
												<td><a
													href="rboardview.do?rno=${r.rno }&pageNum=${pp.currentPage}">${r.rsub }</a></td>
												<td><a href="javascript:void(0);" onclick="message('${r.nickname}')">${r.nickname }</a></td>
												<td><fmt:formatDate value="${r.rreg }"
														pattern="yyyy-MM-dd " /></td>
												<td>${r.rreadcount}</td>
											</c:if>
										</tr>
										<c:set var="no1" value="${no1 - 1}" />
									</c:forEach>
								</c:if>
							</tbody>
						</table>
						<form action="rboardlist.do">
							<input type="hidden" name="pageNum" value="1"> <select
								name="search">
								<option value="rsub"
									<c:if test="${search=='rsub'}">selected="selected" </c:if>>제목</option>
								<option value="rcont"
									<c:if test="${search=='rcont'}">selected="selected" </c:if>>내용</option>
								<option value="nickname"
									<c:if test="${search=='nickname'}">selected="selected" </c:if>>작성자</option>
								<option value="subcon"
									<c:if test="${search=='subcon'}">selected="selected" </c:if>>제목+내용</option>
							</select> <input type="text" name="keyword"> <input type="submit"
								value="확인">
						</form>

						<ul class="pagination">
							<!-- 검색 했을 경우의 페이징 처리 -->
							<c:if test="${not empty keyword}">
								<c:if test="${pp.startPage > pp.pagePerBlk }">
									<li><a
										href="rboardlist.do?pageNum=${pp.startPage - 1}&search=${search}&keyword=${keyword}">이전</a>
									</li>
								</c:if>
								<c:forEach var="i" begin="${pp.startPage}" end="${pp.endPage}">
									<li <c:if test="${pp.currentPage==i}">class="active"</c:if>>
										<a
										href="rboardlist.do?pageNum=${i}&search=${search}&keyword=${keyword}">${i}</a>
									</li>
								</c:forEach>
								<c:if test="${pp.endPage < pp.totalPage}">
									<li><a
										href="$rboardlist.do?pageNum=${pp.endPage + 1}&search=${search}&keyword=${keyword}">다음</a>
									</li>
								</c:if>
							</c:if>

							<!-- 전체 목록의 페이징 처리 -->
							<c:if test="${empty keyword}">
								<c:if test="${pp.startPage > pp.pagePerBlk }">
									<li><a href="rboardlist.do?pageNum=${pp.startPage - 1}">이전</a></li>
								</c:if>
								<c:forEach var="i" begin="${pp.startPage}" end="${pp.endPage}">
									<li <c:if test="${pp.currentPage==i}">class="active"</c:if>>
										<a href="rboardlist.do?pageNum=${i}">${i}</a>
									</li>
								</c:forEach>
								<c:if test="${pp.endPage < pp.totalPage}">
									<li><a href="rboardlist.do?pageNum=${pp.endPage + 1}">다음</a></li>
								</c:if>
							</c:if>

						</ul>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>