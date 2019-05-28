<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
table {
	width:80%;
	border:1px solid white;
	border-collapse:collapse;
	border-spacing:0;
	color:white;
	padding:15px;
	margin-top:10px;
	margin-left:10px;
}

td {
	text-align:center;
	
}

th, td{
	padding:8px;
}

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	$(function() {
		$(".post_tr").click(function() {
			let id = $(this).attr("data-id")
			location.replace("<c:url value='/detail'/>" + "?id=" + id)
		})

		$("#btn_post").click(function() {
			$.ajax({
				url : "<c:url value='/write'/>",
				method : "POST",
				success : function() {
					alert("게시글이 등록되었습니다")
				},
				error : function() {
					alert("다시 시도해주세요")
				}
			})
		})
	})
</script>
<body>
	<table>
		<tr>
			<th>NO</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>제목</th>
		</tr>

		<c:choose>
			<c:when test="${empty POSTS}">
				<tr>
					<td colspan="4">등록한 게시글이 없습니다</td>
				</tr>
			</c:when>
			

			<c:otherwise>
				<c:forEach items="${POSTS}" var="post" varStatus="i">
					<tr class="post_tr" data-id="${post.id}">
						<td>${post.id}</td>
						<td>${post.p_auth}</td>
						<td>${post.p_date}</td>
						<td>${post.p_title}</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
	<button id="btn_post">SUBMIT</button>
</body>
</html>