<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>JEJU FRIEND</title>
<link rel="icon" href="img/favicon.png">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<!-- animate CSS -->
<link rel="stylesheet" href="css/animate.css">
<!-- owl carousel CSS -->
<link rel="stylesheet" href="css/owl.carousel.min.css">
<!-- themify CSS -->
<link rel="stylesheet" href="css/themify-icons.css">
<!-- fontawesome CSS -->
<link rel="stylesheet" href="fontawesome/css/all.min.css">
<!-- magnific CSS -->
<link rel="stylesheet" href="css/magnific-popup.css">
<link rel="stylesheet" href="css/gijgo.min.css">
<!-- niceselect CSS -->
<link rel="stylesheet" href="css/nice-select.css">
<!-- slick CSS -->
<link rel="stylesheet" href="css/slick.css">
<!-- style CSS -->
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/style2.css">
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
							<a class="navbar-brand" href="index.html"><b>JEJUFRIEND</b>
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
									<li class="nav-item"><a class="nav-link" href="index.html">동행찾기</a>
									</li>
									<li class="nav-item"><a class="nav-link" href="rboardlist.do">여행리뷰</a>
									</li>
									<li class="nav-item"><a class="nav-link"
										href="packages.html">추천장소</a></li>
									<li class="nav-item"><a class="nav-link"
										href="qboardlist.do">Q & A</a></li>
									<li class="nav-item"><a class="nav-link"
										href="packages.html">공지사항</a></li>
									<li class="nav-item"><a class="nav-link"
										href="packages.html">여행일정</a></li>
								</ul>
							</div>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</header>
	<!-- Header part end-->

	<!-- banner part start-->
	<section class="banner_part">
		<div class="container">
			<div class="row align-items-center justify-content-center">
				<div class="col-lg-10">
					<div class="banner_text text-center">
						<div class="banner_text_iner">
							<h1>JEJU FRIEND</h1>
							<p>
								<i>함께 떠나는 제주도 여행!</i>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- banner part start-->

	<!--top place start-->
	<section class="top_place section_padding">
		<div class="container">
			<div class="site-section">
				<div class="container">

					<div class="row align-items-stretch retro-layout">

						<div class="col-md-5">
							<a href="single.html" class="hentry img-1 h-100 gradient"
								style="background-image: url('img/together.jpg');">
								<span class="post-category text-white bg-danger">함께 할 사람
									여기로!</span>
								<div class="text">
									<h2>동행찾기</h2>
								</div>
							</a>
						</div>

						<div class="col-md-7">

							<a href="single.html" class="hentry img-2 v-height mb30 gradient"
								style="background-image: url('img/review.jpg');"> <span
								class="post-category text-white bg-success">제주의 아름다움을 남기기!</span>
								<div class="text text-sm">
									<h2>여행리뷰</h2>
								</div>
							</a>

							<div class="two-col d-block d-md-flex">
								<a href="single.html" class="hentry v-height img-2 gradient"
									style="background-image: url('img/best.jpg');"> <span
									class="post-category text-white bg-primary">에디터가 PICK한 추천장소!</span>
									<div class="text text-sm">
										<h2>추천장소</h2>
									</div>
								</a> <a href="single.html"
									class="hentry v-height img-2 ml-auto gradient"
									style="background-image: url('img/qna.jpg');"> <span
									class="post-category text-white bg-warning">제주에 대한 무엇이든 물어보자!</span>
									<div class="text text-sm">
										<h2>Q&A</h2>
									</div>
								</a>
							</div>

						</div>
					</div>

				</div>
			</div>

			<div class="site-section">
				<div class="container">
					<div class="row">
						<div class="col-lg-4 mb-5 mb-lg-0">
							<div class="section-heading mb-5 d-flex align-items-center">
								<h2>등산</h2>
								<div class="ml-auto">
									<a href="#" class="view-all-btn">모두 보기</a>
								</div>
							</div>
							<div class="entry2 mb-5">
								<a href="single.html"><img src="img/hiking.jpg"
									alt="Image" class="img-fluid rounded"></a>
							</div>

							<div class="entry4 d-block d-sm-flex">
								<div class="text mr-4 order-1">
									<span class="post-category text-white bg-primary mb-3">등산</span>
									<h2>
										<a href="single.html">ㅇ월 ㅇ일 제주도 등산갈사람 구합니다!!</a>
									</h2>
									<span class="post-meta mb-3 d-block">등록일: 0000-00-00</span>
								</div>
							</div>

							<div class="entry4 d-block d-sm-flex">
								<div class="text mr-4 order-1">
									<span class="post-category text-white bg-primary mb-3">등산</span>
									<h2>
										<a href="single.html">ㅇ월 ㅇ일 제주도 등산갈사람 구합니다!!</a>
									</h2>
									<span class="post-meta mb-3 d-block">등록일: 0000-00-00</span>
								</div>
							</div>

							<div class="entry4 d-block d-sm-flex">
								<div class="text mr-4 order-1">
									<span class="post-category text-white bg-primary mb-3">등산</span>
									<h2>
										<a href="single.html">ㅇ월 ㅇ일 제주도 등산갈사람 구합니다!!</a>
									</h2>
									<span class="post-meta mb-3 d-block">등록일: 0000-00-00</span>
								</div>
							</div>

							<div class="entry4 d-block d-sm-flex">
								<div class="text mr-4 order-1">
									<span class="post-category text-white bg-primary mb-3">등산</span>
									<h2>
										<a href="single.html">ㅇ월 ㅇ일 제주도 등산갈사람 구합니다!!</a>
									</h2>
									<span class="post-meta mb-3 d-block">등록일: 0000-00-00</span>
								</div>
							</div>

							<div class="entry4 d-block d-sm-flex">
								<div class="text mr-4 order-1">
									<span class="post-category text-white bg-primary mb-3">등산</span>
									<h2>
										<a href="single.html">ㅇ월 ㅇ일 제주도 등산갈사람 구합니다!!</a>
									</h2>
									<span class="post-meta mb-3 d-block">등록일: 0000-00-00</span>
								</div>
							</div>
						</div>

						<div class="col-lg-4 mb-5 mb-lg-0">
							<div class="section-heading mb-5 d-flex align-items-center">
								<h2>음식</h2>
								<div class="ml-auto">
									<a href="#" class="view-all-btn">모두 보기</a>
								</div>
							</div>
							<div class="entry2 mb-5">
								<img src="img/food.jpg" alt="Image"
									class="img-fluid rounded">
							</div>


							<div class="entry4 d-block d-sm-flex">
								<div class="text mr-4 order-1">
									<span class="post-category text-white bg-danger mb-3">등산</span>
									<h2>
										<a href="single.html">맛집투어 가실분~~~~</a>
									</h2>
									<span class="post-meta mb-3 d-block">등록일: 0000-00-00</span>
								</div>
							</div>

							<div class="entry4 d-block d-sm-flex">
								<div class="text mr-4 order-1">
									<span class="post-category text-white bg-danger mb-3">등산</span>
									<h2>
										<a href="single.html">맛집투어 가실분~~~~</a>
									</h2>
									<span class="post-meta mb-3 d-block">등록일: 0000-00-00</span>
								</div>
							</div>

							<div class="entry4 d-block d-sm-flex">
								<div class="text mr-4 order-1">
									<span class="post-category text-white bg-danger mb-3">등산</span>
									<h2>
										<a href="single.html">맛집투어 가실분~~~~</a>
									</h2>
									<span class="post-meta mb-3 d-block">등록일: 0000-00-00</span>
								</div>
							</div>

							<div class="entry4 d-block d-sm-flex">
								<div class="text mr-4 order-1">
									<span class="post-category text-white bg-danger mb-3">등산</span>
									<h2>
										<a href="single.html">맛집투어 가실분~~~~</a>
									</h2>
									<span class="post-meta mb-3 d-block">등록일: 0000-00-00</span>
								</div>
							</div>

							<div class="entry4 d-block d-sm-flex">
								<div class="text mr-4 order-1">
									<span class="post-category text-white bg-danger mb-3">등산</span>
									<h2>
										<a href="single.html">맛집투어 가실분~~~~</a>
									</h2>
									<span class="post-meta mb-3 d-block">등록일: 0000-00-00</span>
								</div>
							</div>


						</div>

						<div class="col-lg-4 mb-5 mb-lg-0">
							<div class="section-heading mb-5 d-flex align-items-center">
								<h2>현지체험</h2>
								<div class="ml-auto">
									<a href="#" class="view-all-btn">모두 보기</a>
								</div>
							</div>
							<div class="entry2 mb-5">
								<img src="img/spot.jpg" alt="Image"
									class="img-fluid rounded">
							</div>

							<div class="entry4 d-block d-sm-flex">
								<div class="text mr-4 order-1">
									<span class="post-category text-white bg-warning mb-3">등산</span>
									<h2>
										<a href="single.html">해녀체험 하고싶어요!</a>
									</h2>
									<span class="post-meta mb-3 d-block">등록일: 0000-00-00</span>
								</div>
							</div>
							
							<div class="entry4 d-block d-sm-flex">
								<div class="text mr-4 order-1">
									<span class="post-category text-white bg-warning mb-3">등산</span>
									<h2>
										<a href="single.html">해녀체험 하고싶어요!</a>
									</h2>
									<span class="post-meta mb-3 d-block">등록일: 0000-00-00</span>
								</div>
							</div>
							
							<div class="entry4 d-block d-sm-flex">
								<div class="text mr-4 order-1">
									<span class="post-category text-white bg-warning mb-3">등산</span>
									<h2>
										<a href="single.html">해녀체험 하고싶어요!</a>
									</h2>
									<span class="post-meta mb-3 d-block">등록일: 0000-00-00</span>
								</div>
							</div>
							
							<div class="entry4 d-block d-sm-flex">
								<div class="text mr-4 order-1">
									<span class="post-category text-white bg-warning mb-3">등산</span>
									<h2>
										<a href="single.html">해녀체험 하고싶어요!</a>
									</h2>
									<span class="post-meta mb-3 d-block">등록일: 0000-00-00</span>
								</div>
							</div>
							
							<div class="entry4 d-block d-sm-flex">
								<div class="text mr-4 order-1">
									<span class="post-category text-white bg-warning mb-3">등산</span>
									<h2>
										<a href="single.html">해녀체험 하고싶어요!</a>
									</h2>
									<span class="post-meta mb-3 d-block">등록일: 0000-00-00</span>
								</div>
							</div>


						</div>
					</div>
				</div>

	</section>
	<!--top place end-->

	<!--top place start-->
	<section class="event_part section_padding">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="event_slider owl-carousel">
						 <div class="single_event_slider">
							 <div class="row justify-content-end">
								<div class="col-lg-6 col-md-6">
									<div class="event_slider_content">
									</div>
								</div>
							</div>
						</div>
					</div> 
				</div>
			</div>
		</div>
	</section>
	<!--top place end-->

	<!--top place start-->
	<section class="client_review section_padding">
		<div class="container">
			<div class="row ">
				<div class="col-xl-6">
					<div class="section_tittle">
						<h2>여행 리뷰</h2>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="client_review_slider owl-carousel">
						<div class="single_review_slider">
							<div class="place_review">
								<a href="#"><i class="fas fa-star"></i></a> <a href="#"><i
									class="fas fa-star"></i></a> <a href="#"><i class="fas fa-star"></i></a>
								<a href="#"><i class="fas fa-star"></i></a> <a href="#"><i
									class="fas fa-star"></i></a>
							</div>
							<p>Waters make fish every without firmament saw had. Morning
								air subdue. Our Air very one whales grass is fish whales winged
								night yielding land creeping that seed</p>
							<h5>- Allen Miller</h5>
						</div>
						<div class="single_review_slider">
							<div class="place_review">
								<a href="#"><i class="fas fa-star"></i></a> <a href="#"><i
									class="fas fa-star"></i></a> <a href="#"><i class="fas fa-star"></i></a>
								<a href="#"><i class="fas fa-star"></i></a> <a href="#"><i
									class="fas fa-star"></i></a>
							</div>
							<p>Waters make fish every without firmament saw had. Morning
								air subdue. Our Air very one whales grass is fish whales winged
								night yielding land creeping that seed</p>
							<h5>- Allen Miller</h5>
						</div>
						<div class="single_review_slider">
							<div class="place_review">
								<a href="#"><i class="fas fa-star"></i></a> <a href="#"><i
									class="fas fa-star"></i></a> <a href="#"><i class="fas fa-star"></i></a>
								<a href="#"><i class="fas fa-star"></i></a> <a href="#"><i
									class="fas fa-star"></i></a>
							</div>
							<p>Waters make fish every without firmament saw had. Morning
								air subdue. Our Air very one whales grass is fish whales winged
								night yielding land creeping that seed</p>
							<h5>- Allen Miller</h5>
						</div>
						<div class="single_review_slider">
							<div class="place_review">
								<a href="#"><i class="fas fa-star"></i></a> <a href="#"><i
									class="fas fa-star"></i></a> <a href="#"><i class="fas fa-star"></i></a>
								<a href="#"><i class="fas fa-star"></i></a> <a href="#"><i
									class="fas fa-star"></i></a>
							</div>
							<p>Waters make fish every without firmament saw had. Morning
								air subdue. Our Air very one whales grass is fish whales winged
								night yielding land creeping that seed</p>
							<h5>- Allen Miller</h5>
						</div>
						<div class="single_review_slider">
							<div class="place_review">
								<a href="#"><i class="fas fa-star"></i></a> <a href="#"><i
									class="fas fa-star"></i></a> <a href="#"><i class="fas fa-star"></i></a>
								<a href="#"><i class="fas fa-star"></i></a> <a href="#"><i
									class="fas fa-star"></i></a>
							</div>
							<p>Waters make fish every without firmament saw had. Morning
								air subdue. Our Air very one whales grass is fish whales winged
								night yielding land creeping that seed</p>
							<h5>- Allen Miller</h5>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--top place end-->

	<!--::industries start::-->
	<section class="best_services section_padding">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-xl-6">
					<div class="section_tittle text-center">
						<h2>추천 장소</h2>
						<p>에디터가 직접 PICK!한 여행 추천 여행 장소 입니다.</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-3 col-sm-6">
					<div class="single_ihotel_list">
						<img
							src="https://blog.kakaocdn.net/dn/o1KIw/btqu9mflPY6/rGk1mM3iugV1c6jj9Z3E80/img.jpg"
							alt="">
						<h3>
							<a href="#"> Transportation</a>
						</h3>
						<p>All transportation cost we bear</p>
					</div>
				</div>
				<div class="col-lg-3 col-sm-6">
					<div class="single_ihotel_list">
						<img
							src="https://blog.kakaocdn.net/dn/o1KIw/btqu9mflPY6/rGk1mM3iugV1c6jj9Z3E80/img.jpg"
							alt="">
						<h3>
							<a href="#"> Guidence</a>
						</h3>
						<p>We offer the best guidence for you</p>
					</div>
				</div>
				<div class="col-lg-3 col-sm-6">
					<div class="single_ihotel_list">
						<img
							src="https://blog.kakaocdn.net/dn/o1KIw/btqu9mflPY6/rGk1mM3iugV1c6jj9Z3E80/img.jpg"
							alt="">
						<h3>
							<a href="#"> Accomodation</a>
						</h3>
						<p>Luxarious and comfortable</p>
					</div>
				</div>
				<div class="col-lg-3 col-sm-6">
					<div class="single_ihotel_list">
						<img
							src="https://blog.kakaocdn.net/dn/o1KIw/btqu9mflPY6/rGk1mM3iugV1c6jj9Z3E80/img.jpg"
							alt="">
						<h3>
							<a href="#"> Discover world</a>
						</h3>
						<p>Best tour plan for your next tour</p>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--::industries end::-->

	<!-- footer part start-->
	<footer class="footer-area">
		<div class="container">
			<div class="row justify-content-between">
				<div class="col-sm-6 col-md-5">
					<div class="single-footer-widget">
						<h4>사이트 맵</h4>
						<ul>
							<li><a href="#">동행찾기</a></li>
							<li><a href="#">여행리뷰</a></li>
							<li><a href="#">추천장소</a></li>
							<li><a href="#">Q & A</a></li>
							<li><a href="#">공지사항</a></li>
							<li><a href="#">여행일정</a></li>
							<li><a href="#">마이페이지</a></li>
							<li><a href="#">받은쪽지함</a></li>
							<li><a href="#">보낸쪽지함</a></li>
						</ul>

					</div>
				</div>
				<div class="col-sm-6 col-md-4">
				<!-- 	<div class="single-footer-widget">
						<h4>Subscribe Newsletter</h4>
						<div class="form-wrap" id="mc_embed_signup">
							<form target="_blank"
								action="https://spondonit.us12.list-manage.com/subscribe/post?u=1462626880ade1ac87bd9c93a&amp;id=92a4423d01"
								method="get" class="form-inline">
								<input class="form-control" name="EMAIL"
									placeholder="Your Email Address"
									onfocus="this.placeholder = ''"
									onblur="this.placeholder = 'Your Email Address '" required=""
									type="email">
								<button class="click-btn btn btn-default text-uppercase">
									<i class="far fa-paper-plane"></i>
								</button>
								<div style="position: absolute; left: -5000px;">
									<input name="b_36c4fd991d266f23781ded980_aefe40901a"
										tabindex="-1" value="" type="text">
								</div>

								<div class="info"></div>
							</form>
						</div>
						<p>Subscribe our newsletter to get update news and offers</p>
					</div> -->
				</div>
				<div class="col-sm-6 col-md-3">
					<div class="single-footer-widget footer_icon">
						<h4>Contact Us</h4>
						<p>박동인&nbsp;<span>이메일@이메일</span></p>
						<p>최재호&nbsp;<span>이메일@이메일</span></p>
						<p>이동하&nbsp;<span>이메일@이메일</span></p>
						<p>김하은&nbsp;<span>이메일@이메일</span></p>
						
						<div class="social-icons">
							<a href="#"><i class="ti-facebook"></i></a> <a href="#"><i
								class="ti-twitter-alt"></i></a> <a href="#"><i
								class="ti-pinterest"></i></a> <a href="#"><i
								class="ti-instagram"></i></a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="container-fluid">
			<div class="row justify-content-center">
				<div class="col-lg-12">
					<div class="copyright_part_text text-center">
						<p class="footer-text m-0">
							<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
							Copyright &copy;
							<script>
								document.write(new Date().getFullYear());
							</script>
							All rights reserved | This template is made with <i
								class="ti-heart" aria-hidden="true"></i> by <a
								href="https://colorlib.com" target="_blank">Colorlib</a>
							<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						</p>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!-- footer part end-->

	<!-- jquery plugins here-->
	<script src="js/jquery-1.12.1.min.js"></script>
	<!-- popper js -->
	<script src="js/popper.min.js"></script>
	<!-- bootstrap js -->
	<script src="js/bootstrap.min.js"></script>
	<!-- magnific js -->
	<script src="js/jquery.magnific-popup.js"></script>
	<!-- swiper js -->
	<script src="js/owl.carousel.min.js"></script>
	<!-- masonry js -->
	<script src="js/masonry.pkgd.js"></script>
	<!-- masonry js -->
	<script src="js/jquery.nice-select.min.js"></script>
	<script src="js/gijgo.min.js"></script>
	<!-- contact js -->
	<script src="js/jquery.ajaxchimp.min.js"></script>
	<script src="js/jquery.form.js"></script>
	<script src="js/jquery.validate.min.js"></script>
	<script src="js/mail-script.js"></script>
	<script src="js/contact.js"></script>
	<!-- custom js -->
	<script src="js/custom.js"></script>
</body>

</html>