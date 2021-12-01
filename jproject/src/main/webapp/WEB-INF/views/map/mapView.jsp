<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<html>
<head>
<meta charset="UTF-8">
<title>지도 보기</title>
</head>
<body>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7ca06a496d8c916cc2f7a4467704f49e"></script>	
	<script>
		function showcont(no) {
			var x = document.getElementsByTagName("div");
			for(var i=0;i<x.length;i++){
				if(x[i].id!=('showcont_'+(parseInt(no))) && x[i].id!=('save')&& x[i].id!=('map')&& x[i].id!=('latlng')){
					x[i].style.display="none";
			       	x[i].style.visibility='hidden';					
				}else{
					x[i].style.display="block";
					x[i].style.visibility='visible';
				}	
			}
		}

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
            }
        
        // 모델 어트리뷰터ㅡ 맵으로 dto없이 받기 서비스dao넘기고 맵퍼에서 파라미터타입을 해시맵으로 받으면 된ek ajax아이디 중복검
        function delRow(rownum) {
            // table element 찾고 삭제하기
            var table = document.getElementById('mapTable');
            var newRow = table.deleteRow(rownum);
            // mapNo값 -1
            mapNo--;
        }
        
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



	<input type="button" value='지도쓰기' onclick="location.href='map_add.do'">
<br>
	<table border=1 align=center>
		<thead>
			<tr>
				<td>지도 no</td>
				<td>연결 게시글 no</td>
			</tr>
		</thead>
		<tbody>
			<c:if test="${empty maplist }">
				<tr>
					<td colspan="4" align=center>저장된 지도가 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${not empty maplist }">
				<c:forEach var="q" items="${maplist}">
					<tr>
						<td onClick='showcont(${q.mapno})'><a href="#">${q.mapno}</a></td>
						<td>${q.ano}</td>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
	</table>
<br>
	<c:forEach var="q" items="${maplist}">
	<div id="showcont_${q.mapno}" style="display:none; visibility: hidden;" align="center">
		<table border=1 >
		
			<tr><td>[${q.mapno}] - 연결 게시물 번호 : ${q.adsubject}</td></tr>
			<tr><td>
					[지도]				
				</td></tr>
			<tr><td align = "center">
				<input type="button" value='수정하기' onclick="location.href='map_update.do?mapno=${q.mapno}&pageNum=${currentPage}'">
				<input type="button" value='삭제하기' 
				onclick="if(confirm('삭제하시겠습니까?')) {location.href='map_delete.do?mapno=${q.mapno}&pageNum=${currentPage}'}">
				</td></tr>
			
		</table>
<br>
	</div>
	</c:forEach>
		<!-- 페이징 처리 -->
	<div id="save" style="display:block; visibility: visible;" align="center">
		<c:if test="${pp.startPage > pp.pagePerBlk }">
			<a href="map_view.do?pageNum=${pp.startPage - 1}">이전</a>
		</c:if>

		<c:forEach var="i" begin="${pp.startPage}" end="${pp.endPage}">
			<c:if test="${pp.currentPage==i}"></c:if>
			<a href="map_view.do?pageNum=${i}">${i}</a>
		</c:forEach>

		<c:if test="${pp.endPage < pp.totalPage}">
			<a href="$map_view.do?pageNum=${pp.endPage + 1}">다음</a>
		</c:if>
	</div>
</body>
</html>