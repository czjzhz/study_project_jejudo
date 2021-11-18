<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>QnA 게시판 글작성</title>
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
					<li><a href="" title=""><iclass="fa fa-user-plus"></i> 동행 찾기</a></li>
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
					<h3>Q & A 글쓰기</h3>
					<br>
					<form action="boardqnainsert.do" method="post">
						<table class="table table-hover" >
							<tr>
								<td>제목</td>
								<td><input type="text" name="subject" required="required"></td>
							</tr>
							<tr>
								<td>내용</td>
								<td><textarea rows="5" cols="30" name="content"
										required="required"></textarea></td>
							</tr>
							<tr>
								<td>파일첨부</td>
								<td><input name="" type="file"/></td>
							</tr>
							<tr>
								<td colspan="2" align="center"><input type="submit"
									value="글작성" class="btn btn-md btn-warning"
							style="background-color: #FF8000;"></td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
	</main>
</body>
</html>