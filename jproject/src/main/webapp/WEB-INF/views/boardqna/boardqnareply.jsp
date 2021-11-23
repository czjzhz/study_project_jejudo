<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <script type="text/javascript">
	$(function(){
		$('.qreply1').click(function(){
			var id = $(this).attr('id');	//qrno
			var txt = $('#td_'+id).text();	//qrnickname
			$('td_'+id).html("<textarea row='3' cols='30' id='tt_"+id+"' >"+txt+"</textarea>");
			$('#btn_'+id).html("<input type='button' value='확인' onclick='up("+id+")'> "+"<input type='button' value='취소' onclick='lst()'>");
		});
	});
	
	function up(id) {
		var replytext = $('#tt_'+id).val();
		var formData = "qrno="+id+'&replytext='+ replytext +"&qno=${boardqna.qno}";
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
</script> -->
</head>
<body>
	<div class="container" align="center">
		<h2 class="text-primary">댓글</h2>
		<table class="table table-bordered">
			<tr>
				<td>작성자</td>
				<td>내용</td>
				<td>수정일</td>
				<td></td>
			</tr>
			<c:forEach var="qr" items="${qrlist}">
				<tr>
					<td><%-- ${qr.qrnickname} --%></td>
					<td id="td_${qr.qrno}">${qr.qrcont}</td>
					<td>${qr.qrupdate }</td>
					<td id="btn_${qr.qrno}">
						<%-- <c:if test="${qr.qrnickname==member.nickname }"> --%>
							<%-- <input type="button" value="수정" class="qreply1" id="${qr.qrno}">
							<input type="button" value="삭제"	 onclick="del(${qr.qrno},${qr.qno})"> --%>
						<%-- </c:if> --%>
						수정, 삭제
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>