<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }" />

<html>
<head>
<meta charset="utf-8">
<title>지도 상세페이지</title>

</head>
<body>

	<div id="map" style="width: 100%; height: 350px;" align=center></div>
	<table align="center">
		<tr>
			<td colspan=3 align=center>	게시글 번호 : <input type=text id="ano" name="ano" value="${ano}" size=3 readonly='readonly' />
										목적지 수 : <input type=text id="mloc" name="mloc" value="${mloc}" size=3 readonly='readonly' /> </td></tr>
		<tr>
			<th>번호</th>
			<th>목적지</th>
			<th>주소,위도,경도</th>
			<th>길찾기</th>
		</tr>
		<c:forEach var="q" items="${maplist}">
		<tr>
			<td align=center>${q.mapno}</td>
			<td><input type=text placeholder='이름' name='memo' id='mapMemo${q.mapno}' size='15' value=${q.mmemo } /></td>
			<td><input type=text placeholder='주소' name='mapAddress' id='mapAddress${q.mapno}' size='40' readonly='readonly' />
				<input type=text placeholder='위도(lat)' name='lat' id='mapLat${q.mapno}' size='10' readonly='readonly' value=${q.mlat } />
				<input type=text placeholder='경도(lng))' name='lng' id='mapLng${q.mapno}' size='10' readonly='readonly' value=${q.mlng } /></td>
			<td><input type=button onclick="location.href='http://map.kakao.com/link/to/${q.mmemo},${q.mlat},${q.mlng}'" value="GO"></td>
		</tr>
		</c:forEach>
	</table>

	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7ca06a496d8c916cc2f7a4467704f49e&libraries=services"></script>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script>
	
 		/* jstl로 maplist 변수 받기 */
		// 배열 만들어 넣기 
 		var mloc = ${mloc};
		let mapnolist = [];
		let memolist = [];
		let latlist = [];
		let lnglist = [];
		// jstl로 값 넣기 
		<c:forEach var="m" items="${maplist}" varStatus="status">
			mapnolist.push("${m.mapno}");
			memolist.push("${m.mmemo}");
			latlist.push("${m.mlat}");
			lnglist.push("${m.mlng}");
		</c:forEach>
		// 확인
		console.log(mapnolist[0]);
		console.log(memolist[0]);
		console.log(latlist[0]);
		console.log(lnglist[0]);
		
		/* 지도 표시 */
		var mapContainer = document.getElementById('map'), 
        mapOption = { center : new kakao.maps.LatLng(33.37924097064395, 126.53121796470002), 
       				  level : 10 }; // 지도초기값 
		
		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도생성 
		var geocoder = new kakao.maps.services.Geocoder(); // 서비스 라이브러리 - 주소 
		
		/* 마커 생성 */
		var positions = [];
		for (var i=0;i<mloc;i++){
			positions.push({content: "<div>"+mapnolist[i]+". "+memolist[i]+"</div>", 
		     latlng: new kakao.maps.LatLng(latlist[i], lnglist[i])})
		};
		
		var bounds = new kakao.maps.LatLngBounds();  // map위치정렬을 위한 bounds
		
		for (var i = 0; i < positions.length; i++) {
			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
				map : map, // 마커를 표시할 지도
				position : positions[i].latlng
			// 마커의 위치
			});

		    bounds.extend(positions[i].latlng); // 좌표추가

		    // 마커에 표시할 인포윈도우를 생성합니다 
			var infowindow = new kakao.maps.InfoWindow({
				content : positions[i].content
			// 인포윈도우에 표시할 내용
			});
			
			infowindow.open(map, marker); // 인포윈도우 열기
		    map.setBounds(bounds); // map 좌표이동 
		}
				
		// 주소 가져오기 // 왜그런진 모르겠는데 for문 다돌고 callback이 돌아와서 마지막값만 입력됨
		let address = [];
		for (var i=0;i<mloc;i++){
			console.log(i); // 확인
			// 콜백 만들고
        	function callback(result, status) {
			    if (status === kakao.maps.services.Status.OK) {
			        console.log('상태 : '+status);
			        address.push(result[0].address.address_name);
			        //address[i] = result[0].address.address_name; // 가져오기
			    } 			
			};
			// 주소 가져와 넣기 
        	geocoder.coord2Address(lnglist[i], latlist[i], callback);
		};
		
		// 주소 넣기 // 아니 0.5초나 늦게 오니까 아오 진짜 이것때문에 하루 다갔네 
		var timeout = setTimeout(go,500);
		function go(){
			for (var i=0;i<mloc;i++){
				var addgo = document.getElementById('mapAddress'+(i+1));
				addgo.value = address[i];
          		console.log('주소 : '+addgo.value);
			}
		};
			
		
	</script>
</body>
</html>