<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<form method="post" action="map_action.do">
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
			<th align=center colspan=4>연결 게시물 번호 : <input type="text" id="ano" name="ano" size="10">
			<input type=hidden id='mapLoc' name='mapLoc' value='1' size='2'/></th>
		</tr>
		<tr>
			<th>No</th>
			<th>이름</th>
			<th>주소 (위도,경도)</th>
			<th>입력</th>
		</tr>
		<tr>
			<td align=center>1</td>
			<td><input type=text placeholder='이름' name='mapMemo1' id='mapMemo1' size='15'/></td>
			<td><input type=text placeholder='주소' name='mapAddress1' id='mapAddress1' size='40' readonly="readonly"/>
				<input type=text placeholder='위도(lat)' name='mapLat1' id='mapLat1' size='10' readonly="readonly"/>
				<input type=text placeholder='경도(lng))' name='mapLng1' id='mapLng1' size='10' readonly="readonly"/></td>
			<td><input type=button id=addupdate1 name=addupdate1 onclick='addupdate(1)' value='입력'></td>
		</tr>
	</table>
	<!-- 버튼 table -->	   
	<table align=center>
		<tr><td>
				<input type=button onclick='addRow()' value='목적지 추가'/>
				<input type=button onclick='delRow(-1)' value='마지막줄 지우기'/>
				<input type="submit" value="작성완료">
		</td></tr>	
	</table>
</form>
	
	
	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7ca06a496d8c916cc2f7a4467704f49e&libraries=services"></script>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script>
	    /* 
	    >> ?? : 선생님이 추천한 방식인데 이해못하고 다른 방식으로 해결함. 추후 공부해야함 
	    >> 메세지 : 모델 어트리뷰트 맵으로 dto없이 받기 서비스dao넘기고 맵퍼에서 파라미터타입을 해시맵으로 받으면 됨. ajax아이디 중복검사랑 비슷
	    $(function() {
	        $("#comp").click(function(){
	            var frmData = $('form').serialize();
	            alert(frmData);
	            console.log(frmData);
	        });
	    }); */
	    
	    var mapLoc = document.getElementById('mapLoc');
        var mapNo = 2;
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
            newCell2.innerHTML = "<input type=text placeholder='이름' name='mapMemo"+mapNo+"' id='mapMemo"+mapNo+"' size='15'/>";
            newCell3.innerHTML = "<input type=text placeholder='주소' name='mapAddress"+mapNo+"' id='mapAddress"+mapNo+"' size='40'/> "+
            					 "<input type=text placeholder='위도(lat)' name='mapLat"+mapNo+"' id='mapLat"+mapNo+"' size='10'/> "+
								 "<input type=text placeholder='경도(lng))' name='mapLng"+mapNo+"' id='mapLng"+mapNo+"' size='10'/>";
            newCell4.innerHTML = "<input type=button id=addupdate"+mapNo+" name=addupdate"+mapNo+" onclick='addupdate("+mapNo+")' value='입력'>";
   
            //mapNo값 +1
            mapNo++;
            // mapLoc 값 변경
            mapLoc.value = mapNo-1;
            };
        
        
        function delRow(rownum) {
            // table element 찾고 삭제하기
            var table = document.getElementById('mapTable');
            var newRow = table.deleteRow(rownum);
            // mapNo값 -1
            mapNo--;
            // mapLoc 값 변경
            mapLoc.value = mapNo-1;
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
    </script>

</body>
</html>