<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../navi.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function(){
		$('.qreply1').click(function(){
			var id = $(this).attr('id');	//qrno
//			alert(id);
			var txt = $('#td_'+id).text();	//qrnickname
//			alert('txt:'+txt);
			
			$('#td_'+id).html("<textarea row='3' cols='30' id='tt_"+id+"' >"+txt+"</textarea>");
			$('#btn_'+id).html("<input type='button' value='확인' onclick='up("+id+")'> "+"<input type='button' value='취소' onclick='lst()'>");
		});
	});
	
	function up(id) {
		alert('id:'+id);
		var qrcont = $('#tt_'+id).val();
		var formData = "qrno="+id+'&qrcont='+ qrcont +"&qno=${boardqna.qno}";
			$.post('${path}/qrupdate.do',formData, function(data) {
				$('#boardqnareply').html(data);
			});
	}
	
	function lst() {
		$('#boardqnareply').load('${path}/boardqnareply/qno/${boardqna.qno}');
	}
	
	function del(qrno,qno) {
		var formData="qrno="+qrno+"&qno="+qno;
		$.post("${path}/qrdelete.do",formData, function(data) {
			$('#boardqnareply').html(data);
		});
	}
</script> 
</head>
<body>
	<div class="container" align="center">
		<h2 class="text-primary">댓글</h2>
		<table class="table table-bordered">
		<input type="hidden" name="id" value="${sessionScope.mb.id } " >
		<input type="hidden" name="nickname" value="${sessionScope.mb.nickname }" >
			<tr>
				<td>작성자</td>
				<td>내용</td>
				<td>작성일</td>
				<td>수정/삭제
				 
				
				</td>
			</tr>
			
			<c:forEach var="qr" items="${qrlist}">
				<tr>
					<td>${qr.qrnickname}</td>
					<td id="td_${qr.qrno}">${qr.qrcont}</td>
					<td><fmt:formatDate value="${qr.qrupdate }" pattern="MM월dd일 HH:mm" /></td>
					<td id="btn_${qr.qrno}">
					 
					<%--   ${qr.qrnickname} - ${sessionScope.mb.nickname}
						${fn:trim(qr.qrnickname)} - ${fn:trim(sessionScope.mb.nickname)} 					  
						${fn:length(qr.qrnickname)} - ${fn:length(sessionScope.mb.nickname)}  --%>				
						
						<c:if test="${fn:trim(qr.qrnickname) == fn:trim(sessionScope.mb.nickname) }"> 
							<input type="button" value="수정" class="qreply1" id="${qr.qrno}">
							<input type="button" value="삭제"	 onclick="del(${qr.qrno},${qr.qno})">
						</c:if> 
						
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>