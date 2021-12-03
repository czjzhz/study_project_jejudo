<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
					<c:if test="${sessionScope.mb == null }">
						<a href="./login.do"><i class="fa fa-lock"></i>로그인</a>
						<a href="./join.do"><i class="fa fa-user"></i>회원가입</a>
					</c:if>
					<c:if test="${sessionScope.mb != null }">
						<a href=""><i class="fa fa-unlock"></i>로그아웃</a>
						<a href=""><i class="fa fa-info"></i>마이페이지</a>
					</c:if>
				</div>
				<br>
				<ul class="nav">
					<li><a href="" title=""><i class="fa fa-user-plus"></i>동행 찾기</a></li>
					<li><a href="" title=""><i class="fa fa-pencil"></i>여행 리뷰</a></li>
					<li><a href="" title=""><i class="fa fa-tree"></i> 여행 추천 장소</a></li>
					<li><a href="qboardlist.do" title=""><i class="fa fa-question-circle"></i> Q&A</a></li>
					<li><a href="" title=""><i class="fa fa-bullhorn"></i>공지사항</a></li>
					<li><a href="calendargo.do" title=""><i class="fa fa-bullhorn"></i>달력</a></li>

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
</body>
</html>