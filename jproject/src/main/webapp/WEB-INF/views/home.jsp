<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./navi.jsp"%>

<html>
<head>
<title>Home</title>

</head>
<body>
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
				<table border="1">
				<div
					class="col-xs-12 col-md-5 col-md-offset-1 section-container-spacer"
					style="border: 1px solid red">
					<img class="img-responsive" alt="" src="./assets/images/img-14.jpg">
					<h4>제주 여행 Q&A</h4>
					<p>
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
											</c:if>
									</tr>
								<c:set var="no1" value="${no1 - 1}"/>
								</c:forEach>
							</c:if>
					</p>
				</div>
				</table>
				
			</div>
		</div>
	</main>

</body>
</html>
