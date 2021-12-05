<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지도 쓰기</title>
</head>
<body>

<form method="post" action="map_update_action.do">
	<!-- 지도,좌표 table -->
	<table align=center width=80% >
		<tr><td align=center><div id="map" style="width:100%;height:400px;"></div> 
		</tr>
		<tr><td width=50% align=center>지도를 클릭해 마커를 옮기고 입력버튼을 눌러 추가하기</td>
		</tr>
	</table>
	<br>
	<!-- 내용입력 table -->
	<table id="mapTable" border=0 align=center>
		<tr>
			<td align=center colspan=4>연결 게시물 번호 : 
				<input type="text" id="ano" name="ano" size="10" value=${ano } />
				<input type=hidden id='mloc' name='mloc' value=${mloc } size='2'/>
				<input type=button onclick='addRow()' value='Row +'/>
				<input type=button onclick='delRow(-1)' value='Row -'/>
				<input type="submit" value="작성완료">
			</td>
		</tr>
		<tr>
			<th>No</th>
			<th>이름</th>
			<th>주소 (위도,경도)</th>
			<th>입력</th>
		</tr>
		<c:forEach var="q" items="${maplist}">
		<tr>
			<td align=center>${q.mapno}</td>
			<td><input type=text placeholder='이름' name='memo' id='mapMemo${q.mapno}' size='15' value=${q.mmemo } /></td>
			<td><input type=text placeholder='주소' name='mapAddress' id='mapAddress${q.mapno}' size='40' readonly='readonly' />
				<input type=text placeholder='위도(lat)' name='lat' id='mapLat${q.mapno}' size='10' readonly='readonly' value=${q.mlat } />
				<input type=text placeholder='경도(lng))' name='lng' id='mapLng${q.mapno}' size='10' readonly='readonly' value=${q.mlng } /></td>
			<td><input type=button id=addupdate${q.mapno} name=addupdate${q.mapno} onclick='addupdate(${q.mapno})' value='입력'></td>
		</tr>
		</c:forEach>
	</table>
</form>
	
	
	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7ca06a496d8c916cc2f7a4467704f49e&libraries=services"></script>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script>
	    
	    var mloc = document.getElementById('mloc');
        var mapNo = ${mloc }+1;
        var address;
        var lng;
        var lat;
        var latlng;
        
        function addRow() {
            // table element 찾고, 행(Row) 추가하기
            var table = document.getElementById('mapTable');
            var newRow = table.insertRow();
              
              // 새 행(Row)에 Cell 추가
            var newCell1 = newRow.insertCell(0);
                newCell1.align="center";
            var newCell2 = newRow.insertCell(1);
                newCell2.align="center";
            var newCell3 = newRow.insertCell(2);
                newCell3.align="center";
            var newCell4 = newRow.insertCell(3);
                newCell4.align="center";
              
            // Cell에 텍스트 추가
            newCell1.innerHTML = mapNo;
            newCell2.innerHTML = "<input type=text placeholder='이름' name='memo' id='mapMemo"+mapNo+"' size='15'/>";
            newCell3.innerHTML = "<input type=text placeholder='주소' name='mapAddress' id='mapAddress"+mapNo+"' size='40' readonly='readonly'/> "+
            					 "<input type=text placeholder='위도(lat)' name='lat' id='mapLat"+mapNo+"' size='10' readonly='readonly'/> "+
								 "<input type=text placeholder='경도(lng))' name='lng' id='mapLng"+mapNo+"' size='10' readonly='readonly'/>";
            newCell4.innerHTML = "<input type=button id=addupdate"+mapNo+" name='addupdate"+mapNo+"' onclick='addupdate("+mapNo+")' value='입력'>";
   
            //mapNo값 +1
            mapNo++;
            // mloc 값 변경
            mloc.value = mapNo-1;
            };
        
        
        function delRow(rownum) {
            // table element 찾고 삭제하기
            var table = document.getElementById('mapTable');
            var newRow = table.deleteRow(rownum);
            // mapNo값 -1
            mapNo--;
            // mloc 값 변경
            mloc.value = mapNo-1;
        };
        
        // 입력버튼
        function addupdate(no) {
        	var address_on = document.getElementById('mapAddress'+no)
        	var lat_on = document.getElementById('mapLat'+no)
        	var lng_on = document.getElementById('mapLng'+no)
        	address_on.value = address;
        	lat_on.value = lat;
        	lng_on.value = lng;
        };
        
        // 지도표시 
        var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
        mapOption = {
            center : new kakao.maps.LatLng(33.37924097064395, 126.53121796470002), // 지도의 중심좌표
        level : 10
        // 지도의 확대 레벨
        };

        var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
        var geocoder = new kakao.maps.services.Geocoder();
        
        // 지도를 클릭한 위치에 표출할 마커입니다
        var marker = new kakao.maps.Marker({position : map.getCenter()});
        marker.setMap(map); // 지도에 마커를 표시합니다
        marker.setDraggable(true); // 마커가 드래그 가능하도록 설정합니다 
           
        // 지도에 클릭 이벤트를 등록합니다. 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
        kakao.maps.event.addListener(map, 'click', function(mouseEvent) {

            // 위치정보 가져와 마커 옮김 
            latlng = mouseEvent.latLng;
            marker.setPosition(latlng);

            // 위도-경도 변수입력
            lat = latlng.getLat();
            lng = latlng.getLng();
		    
            // 좌표로 주소연산 후 변수입력
          	searchAddress(mouseEvent.latLng, function(result, status){
          		if (status === kakao.maps.services.Status.OK) {
          			console.log('상대 : '+status);
          			console.log('결과 : '+result);
          			address = result[0].address.address_name;
          			console.log('주소 : '+address);
          		}
          	});

            // 클립보드에 복사 - 안쓰게됨
            /* navigator.clipboard.writeText(latlng); */
		});
        
        // 주소 요청
        function searchAddress(coords, callback) {
        	console.log(coords);
        	geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
        }
		
        /* jstl로 maplist 변수 받기 */
		// 배열 만들어 넣기 
 		var ml = ${mloc};
		let latlist = [];
		let lnglist = [];
		// jstl로 값 넣기 
		<c:forEach var="m" items="${maplist}" varStatus="status">
			latlist.push("${m.mlat}");
			lnglist.push("${m.mlng}");
		</c:forEach>
		
		/* 얜또 왜 안되 으아아 */
     	// 주소 가져오기 
		let abc = [];
		for (var i=0;i<ml;i++){
			console.log(i); // 확인
			console.log(lnglist[i],latlist[i]);
			// 콜백 만들고
        	function callback(result, status) {
			    if (status === kakao.maps.services.Status.OK) {
			        console.log('상태 : '+status);
			        abc.push(result[0].address.address_name);
			        console.log('result : '+result[0].address.address_name);
			        console.log('abc : '+abc[i]);
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
				addgo.value = abc[i];
          		console.log('주소 : '+addgo.value);
			}
		};
    </script>

</body>
</html>