<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA 상세 페이지</title>
<script type="text/javascript">
	$(function() {
		$('#boardqnalist').load('qboardlist.do?pageNum=${pageNum}');
	});
</script>
</head>
<body>
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
					<li><a href="" title=""><iclass ="fafa-user-plus"></i> 동행 찾기</a></li>
					<li><a href="" title=""><i class="fa fa-pencil"></i>여행 리뷰</a></li>
					<li><a href="" title=""><i class="fa fa-tree"></i> 여행 추천 장소</a></li>
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
					<h3>Q & A 상세페이지</h3>
					<table class="table table-bordered">
						<tr>
							<td width="150px;">제목</td>
							<td>${boardqna.qsub}</td>
						</tr>
						<tr>
							<td>내용</td>
							<td><pre>${boardqna.cont}</pre></td>
						</tr>
						<tr>
							<td>첨부 파일</td>
							<td>
								<!-- 첨부파일이 있을때만 첨부파일 출력 --> 
								<c:if test="${boardqna.qfile != null}">
									<a href="./board/file_down.jsp?file_name=${boardqna.qfile}">
										${boardqna.qfile} 
									</a>
								</c:if>

							</td>
						</tr>
					</table>
					<textarea class="form-control" id="exampleFormControlTextarea1"
						rows="3"></textarea>
					<button type="button" class="btn btn-md btn-warning"
						style="background-color: #FF8000;">댓글 작성</button>
				</div>
			</div>
			<div id="boardqnalist"></div>
		</div>
	</main>

</body>
</html>