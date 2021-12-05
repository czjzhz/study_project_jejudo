<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<html>
<head>
<meta charset="UTF-8">
<title>지도 리스트</title>
</head>
<body>
	<input type="button" value='지도쓰기' onclick="location.href='map_add.do'">
<br>
	<table border=1 align=center>
		<thead>
			<tr>
				<td>연결 번호</td>
				<td>지도 번호</td>
				<td>목적지 수 </td>
				<td>목적지 명</td>
				<td>위도,경도</td>
				<td>수정</td>
			</tr>
		</thead>
		<tbody>
			<c:if test="${empty maplist }">
				<tr>
					<td colspan="5" align=center>저장된 지도가 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${not empty maplist }">
				<c:forEach var="q" items="${maplist}">
					<tr>
						<td><a href="#" onclick="location.href='map_view.do?mloc=${q.mloc}&ano=${q.ano}&pageNum=${pp.currentPage}'">${q.ano}</a></td>
						<td>${q.mapno}</td>
						<td>${q.mloc}</td>
						<td>${q.mmemo}</td>
						<td>${q.mlat}, ${q.mlng}</td>
						<%-- <td><input type="button" value="수정" 
						onclick="location.href='map_update.do?mloc=${q.mloc}&ano=${q.ano}&pageNum=${pp.currentPage}'"></td> --%>
					<c:if test="${q.mapno eq q.mloc}">
						<td><input type="button" value="수정" 
						onclick="location.href='map_update.do?mloc=${q.mloc}&ano=${q.ano}&pageNum=${pp.currentPage}'"></td>
					</c:if>
					<c:if test="${q.mapno ne q.mloc}">
						<td></td>
					</c:if>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
	</table>
<br>
	<div align="center">
		<!-- 페이징 처리 -->
		<c:if test="${pp.startPage > pp.pagePerBlk }">
			<a href="map_list.do?pageNum=${pp.startPage - 1}">이전</a>
		</c:if>

		<c:forEach var="i" begin="${pp.startPage}" end="${pp.endPage}">
			<c:if test="${pp.currentPage==i}"></c:if>
			<a href="map_list.do?pageNum=${i}">${i}</a>
		</c:forEach>

		<c:if test="${pp.endPage < pp.totalPage}">
			<a href="$map_list.do?pageNum=${pp.endPage + 1}">다음</a>
		</c:if>
	</div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7ca06a496d8c916cc2f7a4467704f49e"></script>	
    <script> 
        // 지도표시
        var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
        mapOption = {
            center : new kakao.maps.LatLng(33.37924097064395, 126.53121796470002), // 지도의 중심좌표
        level : 10
        // 지도의 확대 레벨
        };

        var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

            
        // 지도를 클릭한 위치에 표출할 마커입니다
        var marker = new kakao.maps.Marker({
            // 지도 중심좌표에 마커를 생성합니다 
            position : map.getCenter()
        });

        marker.setMap(map); // 지도에 마커를 표시합니다
        marker.setDraggable(true); // 마커가 드래그 가능하도록 설정합니다 
            
        var latlng;
        // 지도에 클릭 이벤트를 등록합니다. 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
        kakao.maps.event.addListener(map, 'click', function(mouseEvent) {

            // 클릭한 위도, 경도 정보를 가져옵니다 
            latlng = mouseEvent.latLng;
                
            // 마커 위치를 클릭한 위치로 옮깁니다
            marker.setPosition(latlng);

            var mapLatlng = document.getElementById('latlng');
            mapLatlng.innerText = latlng;          
        
        }); 
    </script>
    
</body>
</html>