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
		$('.rreply1').click(function(){
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
		var rrcont = $('#tt_'+id).val();
		var formData = "rrno="+id+'&rrcont='+ rrcont +"&rno=${boardreview.rno}";
			$.post('${path}/rrupdate.do',formData, function(data) {
				$('#boardreviewreply').html(data);
			});
	}
	
	function lst() {
		$('#boardreviewreply').load('${path}/boardreviewreply.do?rno=${boardreview.rno}');
	}
	
	function del(rrno,rno) {
		var formData="rrno="+rrno+"&rno="+rno;
		$.post("${path}/rrdelete.do",formData, function(data) {
			$('#boardreviewreply').html(data);
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
			
			<c:forEach var="rr" items="${rrlist}">
				<tr>
					<td>${rr.rrnickname}</td>
					<td id="td_${rr.rrno}">${rr.rrcont}</td>
					<td><fmt:formatDate value="${rr.rrupdate }" pattern="MM월dd일 HH:mm" /></td>
					<td id="btn_${rr.rrno}">
					 
						<c:if test="${fn:trim(rr.rrnickname) == fn:trim(sessionScope.mb.nickname) }"> 
							<input type="button" value="수정" class="rreply1" id="${rr.rrno}">
							<input type="button" value="삭제"	 onclick="del(${rr.rrno},${rr.rno})">
						</c:if> 
						
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>