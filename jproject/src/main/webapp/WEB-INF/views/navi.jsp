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
	<!--::header part start::-->
	<header class="main_menu">
		<div class="sub_menu">
			<div class="container">
				<div class="row">
					<div class="col-lg-6 col-sm-12 col-md-6">
						<div class="sub_menu_right_content"></div>
					</div>
					<div class="col-lg-6 col-sm-12 col-md-6">
						<div class="sub_menu_social_icon">
					<c:if test="${sessionScope.mb == null }">
						<a href="./MemberLogin.do"><i class="fa fa-lock"></i>로그인</a>
						<a href="./Agreement.do"><i class="fa fa-user"></i>회원가입</a>
					</c:if>
					<c:if test="${sessionScope.mb != null }">
						<a href="MemberLogout.do"><i class="fa fa-unlock"></i>로그아웃</a>
						<a href="Mypage.do"><i class="fa fa-info"></i>마이페이지</a>
						<a href="rcvlist.do"><i class="fa fa-envelope"></i>받은쪽지함</a>
					</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="main_menu_iner">
			<div class="container">
				<div class="row align-items-center ">
					<div class="col-lg-12">
						<nav
							class="navbar navbar-expand-lg navbar-light justify-content-between">
							<a class="navbar-brand" href="home.do"><b>JEJUFRIEND</b>
							</a>
							<button class="navbar-toggler" type="button"
								data-toggle="collapse" data-target="#navbarSupportedContent"
								aria-controls="navbarSupportedContent" aria-expanded="false"
								aria-label="Toggle navigation">
								<span class="navbar-toggler-icon"></span>
							</button>

							<div
								class="collapse navbar-collapse main-menu-item justify-content-center"
								id="navbarSupportedContent">
								<ul class="navbar-nav">
									<li class="nav-item"><a class="nav-link" href="#">동행찾기</a>
									</li>
									<li class="nav-item"><a class="nav-link" href="rboardlist.do">여행리뷰</a>
									</li>
									<li class="nav-item"><a class="nav-link"
										href="#">추천장소</a></li>
									<li class="nav-item"><a class="nav-link"
										href="qboardlist.do">Q & A</a></li>
									<li class="nav-item"><a class="nav-link"
										href="#">공지사항</a></li>
									<li class="nav-item"><a class="nav-link"
										href="#">여행일정</a></li>
								</ul>
							</div>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</header>
	<!-- Header part end-->
</body>
</html>