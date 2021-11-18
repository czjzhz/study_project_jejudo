<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>QnA게시판 목록</title>
</head>
<body>
	<!-- Add your content of header -->
	<header class="">
		<div class="navbar navbar-default visible-xs">
			<button type="button" class="navbar-toggle collapsed">
				<span class="sr-only">JEJU FRIEND</span> <span class="icon-bar"></span>
				<span class="icon-bar"></span> <span class="icon-bar"></span>
			</button>
			<a href="home.do" class="navbar-brand">JEJU FRIEND</a>
		</div>

		<nav class="sidebar">
			<div class="navbar-collapse" id="navbar-collapse">
				<div class="site-header hidden-xs">
					<a class="site-brand" href="home.do" title=""> 
						JEJU<br>
						FRIEND
					</a>
					<p>
						<i>함께 떠나는 제주도 여행!</i>
					</p>
				</div>
				<div class="nav-login">
					<c:if test="${sessionScope.id == null }">
						<a href=""><i class="fa fa-lock"></i>로그인</a>
						<a href=""><i class="fa fa-user"></i>회원가입</a>
					</c:if>
					<c:if test="${sessionScope.id != null }">
						<a href=""><i class="fa fa-unlock"></i>로그아웃</a>
						<a href=""><i class="fa fa-info"></i>마이페이지</a>
					</c:if>
				</div>
				<br>
				<ul class="nav">
					<li><a href="" title=""><i class="fa fa-user-plus"></i>동행 찾기</a></li>
					<li><a href="" title=""><i class="fa fa-pencil"></i>여행 리뷰</a></li>
					<li><a href="" title=""><i class="fa fa-tree"></i>여행 추천 장소</a></li>
					<li><a href="qboardlist.do" title=""><i class="fa fa-question-circle"></i>Q&A</a></li>
					<li><a href="" title=""><i class="fa fa-bullhorn"></i>공지사항</a></li>

				</ul>

				<nav class="nav-footer">
					<p class="nav-footer-social-buttons">
						<a class="fa-icon" href="https://www.instagram.com/" title="">
							<i class="fa fa-instagram"></i>
						</a> 
						<a class="fa-icon" href="https://dribbble.com/" title=""> 
							<i class="fa fa-dribbble"></i>
						</a> 
						<a class="fa-icon" href="https://twitter.com/" title=""> 
							<i class="fa fa-twitter"></i>
						</a>
					</p>
					<p>
						© Untitled | Website created with <a
							href="http://www.mashup-template.com/"
							title="Create website with free html template">Mashup
							Template</a>/<a href="https://www.unsplash.com/"
							title="Beautiful Free Images">Unsplash</a>
					</p>
				</nav>
			</div>
		</nav>
	</header>
	<main class="" id="main-collapse">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12">
					<h3>Q & A 게시판</h3>
					<button type="button" class="btn btn-md btn-warning"
						style="background-color: #FF8000;"
						onclick="location.href='qboardinsertForm.do'">글작성</button>
					<table class="table table-hover">
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
												<td><a href="boardqnaview.do">${q.qsub }</a></td>
												<td>${q.nickname }</td>
												<td><fmt:formatDate value="${q.qreg }" pattern="yyyy-MM-dd " /></td>
												<td>${q.qreadcount}</td>
											</c:if>
									</tr>
								<c:set var="no1" value="${no1 - 1}"/>
								</c:forEach>
							</c:if>
						</tbody>
					</table>
					<form action="/qboardlist.do" >
						<input type="hidden" name="pageNum" value="1"> 
						<select name="search">
							<option value="subject" <c:if test="${search=='subject'}">selected="selected" </c:if>>제목</option>
							<option value="content" <c:if test="${search=='content'}">selected="selected" </c:if>>내용</option>
							<option value="writer" <c:if test="${search=='writer'}">selected="selected" </c:if>>작성자</option>
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
	</main>
</body>
</html>