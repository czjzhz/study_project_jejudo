<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }" />


<%@ page session="false"%>
<html>
<head>
<title>Home</title>
<link href="${path}/css/main.82cfd66e.css" rel="stylesheet">

</head>
<body>

	<!-- Add your content of header -->
	<header class="">
		<div class="navbar navbar-default visible-xs">
			<button type="button" class="navbar-toggle collapsed">
				<span class="sr-only">JEJU FRIEND</span> <span class="icon-bar"></span>
				<span class="icon-bar"></span> <span class="icon-bar"></span>
			</button>
			<a href="./index.html" class="navbar-brand">JEJU FRIEND</a>
		</div>

		<nav class="sidebar">
			<div class="navbar-collapse" id="navbar-collapse">
				<div class="site-header hidden-xs">
					<a class="site-brand" href="./main.do" title=""> JEJU<br>
						FRIEND
					</a>
					<p>
						<i>함께 떠나는 제주도 여행!</i>
					</p>
				</div>
				<div class="nav-login">
					<c:if test="${sessionScope.id == null }">
						<a href="./MemberLogin.do"><i class="fa fa-lock"></i>로그인</a>
						<a href="./Agreement.do"><i class="fa fa-user"></i>회원가입</a>
					</c:if>
					<c:if test="${sessionScope.id != null }">
						<a href=""><i class="fa fa-unlock"></i>로그아웃</a>
						<a href=""><i class="fa fa-info"></i>마이페이지</a>
					</c:if>
				</div>
				<br>
				<ul class="nav">
					<li><a href="" title=""><i class="fa fa-user-plus"></i> 여행 동행찾기</a></li>
					<li><a href="" title=""><i class="fa fa-pencil"></i> 여행 리뷰</a></li>
					<li><a href="" title=""><i class="fa fa-tree"></i> 여행 추천
							장소</a></li>
					<li><a href="qboardlist.do" title=""><i
							class="fa fa-question-circle"></i> 여행 Q&A</a></li>
					<li><a href="" title=""><i class="fa fa-bullhorn"></i>
							공지사항</a></li>
					<li><a href="calendargo.do" title=""><i
							class="fa fa-bullhorn"></i> 여행 일정</a></li>

				</ul>

				<nav class="nav-footer">
					<p class="nav-footer-social-buttons">
						<a class="fa-icon" href="https://www.instagram.com/" title="">
							<i class="fa fa-instagram"></i>
						</a> <a class="fa-icon" href="https://dribbble.com/" title=""> <i
							class="fa fa-dribbble"></i>
						</a> <a class="fa-icon" href="https://twitter.com/" title=""> <i
							class="fa fa-twitter"></i>
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

		<div class="container">
			<div class="row">
				<div class="col-xs-12 col-md-5 section-container-spacer"
					style="border: 1px solid red">
					<h4>제주 여행 동행 찾기</h4>
					<p>
						Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do
						eiusmod tempor incididunt ut labore et dolore magna aliqua. <br>Ut
						enim ad minim veniam, quis nostrud exercitation ullamco laboris
						nisi ut aliquip ex ea commodo consequat. <br>Ut enim ad minim
						veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip
						ex ea commodo consequat. <br>Ut enim ad minim veniam, quis
						nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
						consequat. <br>Ut enim ad minim veniam, quis nostrud
						exercitation ullamco laboris nisi ut aliquip ex ea commodo
						consequat.
					</p>
				</div>

				<div
					class="col-xs-12 col-md-5 col-md-offset-1 section-container-spacer"
					style="border: 1px solid red">
					<img class="img-responsive" alt="" src="./assets/images/img-12.jpg">
					<h4>제주 여행 리뷰</h4>
					<p>
						Lorem ipsum dolor sit amet, consectetur adipiscing elit.Lorem
						ipsum dolor sit amet, consectetur adipiscing elit. <br>Ut
						enim ad minim veniam, quis nostrud exercitation ullamco laboris
						nisi ut aliquip ex ea commodo consequat. <br>Ut enim ad minim
						veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip
						ex ea commodo consequat. <br>Ut enim ad minim veniam, quis
						nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
						consequat. <br>Ut enim ad minim veniam, quis nostrud
						exercitation ullamco laboris nisi ut aliquip ex ea commodo
						consequat. <br>Ut enim ad minim veniam, quis nostrud
						exercitation ullamco laboris nisi ut aliquip ex ea commodo
						consequat. <br>Ut enim ad minim veniam, quis nostrud
						exercitation ullamco laboris nisi ut aliquip ex ea commodo
						consequat. <br>Ut enim ad minim veniam, quis nostrud
						exercitation ullamco laboris nisi ut aliquip ex ea commodo
						consequat.
					</p>
				</div>

				<div class="col-xs-12 col-md-5 section-container-spacer"
					style="border: 1px solid red">
					<img class="img-responsive" alt="" src="./assets/images/img-13.jpg">
					<h4>제주 여행 추천 장소</h4>
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing
						elit.Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
				</div>

				<div
					class="col-xs-12 col-md-5 col-md-offset-1 section-container-spacer"
					style="border: 1px solid red">
					<img class="img-responsive" alt="" src="./assets/images/img-14.jpg">
					<h4>제주 여행 Q&A</h4>
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing
						elit.Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
				</div>

			</div>
		</div>
	</main>


</body>
</html>
