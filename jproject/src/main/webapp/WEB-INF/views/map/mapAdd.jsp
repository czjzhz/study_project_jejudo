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
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7ca06a496d8c916cc2f7a4467704f49e"></script>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script>
	    $(function() {
	        $("#comp").click(function(){
	            var frmData = $('form').serialize();
	            alert(frmData);
	            console.log(frmData);
	        });
	    });
	    
        var mapNo = 2;
        
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
              
            // Cell에 텍스트 추가
            newCell1.innerHTML = mapNo;
            newCell2.innerHTML = "<input type=text placeholder='목적지' name='mapMemo"+mapNo+"' id='mapMemo"+mapNo+"'/>";
            newCell3.innerHTML = "<input type=text placeholder='위치' name='mapLatlng"+mapNo+"' id='mapLatlng"+mapNo+"'/>";
    
            //mapNo값 +1
            mapNo++;
            };
        
        // 모델 어트리뷰터ㅡ 맵으로 dto없이 받기 서비스dao넘기고 맵퍼에서 파라미터타입을 해시맵으로 받으면 된ek ajax아이디 중복검
        function delRow(rownum) {
            // table element 찾고 삭제하기
            var table = document.getElementById('mapTable');
            var newRow = table.deleteRow(rownum);
            // mapNo값 -1
            mapNo--;
        };
        
        // 버튼 클릭 이벤트
        function copy(){
            /* var t = document.getElementById('latlng');
            t.select();
            document.execCommand('copy'); */    
             
            var loc = $("#latlng").text();
            $("#mapNo1").val(loc);
        };
        
        // 지도표시 
        var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
        mapOption = {
            center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level : 3
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

	<form method="post" action="map_action.do">
		<table align=center border=1>
			<tr>
				<td>연결 게시물 번호</td>
				<td><input type="text" id="ano" name="ano" size="10"></td>
			</tr>	
			<tr>
				<td>지도 작성하기</td>
				<td><div>
				
					<div id="map" style="width:100%;height:350px;"></div> 
				    <div id=latlng></div>
				    <button onclick='copy()'>마커위치복사</button>
				    <br>
					<table id="mapTable" border=0 align=center width=350>
				        <tr>
				            <th>No</th>
				            <th>목적지</th>
				            <th>위치</th>
				        </tr>
				        <tr>
				            <th>1</th>
				            <th><input type=text placeholder='목적지' name='mapMemo1' id='mapMemo1'/></th>
				            <th><input type=text placeholder='위치 (*복붙해주세요)' name='mapNo1' id='mapNo1'/></th>
				        </tr>   
				    </table>
				    
				    <div align=center>
				        <input type=button onclick='addRow()' value='목적지 추가'/>
				        <input type=button onclick='delRow(-1)' value='마지막줄 지우기'/>
				        <input type=button id='comp' value='완료'/>
				    </div>

				</div></td>
			</tr>
				
			<tr>
				<td colspan=2 align=center> <input type="submit" value="작성완료"> </td>
			</tr>	
		</table>
	</form>
	
</body>
</html>