<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="path" value="${pageContext.request.contextPath }" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link href="${path}/css/main.82cfd66e.css" rel="stylesheet">

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
					<!-- 세션 연결이 없을 때 -->
					<c:if test="${empty sessionScope.mb}">
					<%-- <c:if test="${sessionScope.id == null }"> 위에 것과 같은 의미--%>
						<a href="./MemberLogin.do"><i class="fa fa-lock"></i>로그인</a>
						<a href="./Agreement.do"><i class="fa fa-user"></i>회원가입</a>
					</c:if>
					<!-- 세션 연결이 있을 때 -->
					<c:if test="${not empty sessionScope.mb}">
					<%-- <c:if test="${sessionScope.id != null }"> 위에 것과 같은 의미--%>
						<a href="MemberLogout.do"><i class="fa fa-unlock"></i>로그아웃</a>
						<a href=""><i class="fa fa-info"></i>마이페이지</a>
					</c:if> 
				</div>
				<br>
				<ul class="nav">
					<li><a href="" title=""><i class="fa fa-user-plus"></i> 동행찾기</a></li>
					<li><a href="" title=""><i class="fa fa-pencil"></i> 여행리뷰</a></li>
					<li><a href="" title=""><i class="fa fa-tree"></i> 여행추천장소</a></li>
					<li><a href="qboardlist.do" title=""><i class="fa fa-question-circle"></i> Q&A</a></li>
					<li><a href="" title=""><i class="fa fa-bullhorn"></i> 공지사항</a></li>
					<li><a href="calendargo.do" title=""><i class="fa fa-calendar-check-o"></i> 여행일정</a></li>

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