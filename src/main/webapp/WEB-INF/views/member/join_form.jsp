<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>

form{
	margin: 0 auto;
	width: 80%;
}

label {
	display:inline-block;
	float:left;
	padding:5px;
	font-weight:bold;
	width:100px;
}

input, textarea{
	display:inline-block;
	width:85%;
	padding:5px;
	margin:5px;
}

button{
	margin-left:600px;
}
</style>
<script>
$(function(){
	$("#btn_join").click(function(){
		let b_userid = $("#b_userid").val()
		let b_password = $("#b_password").val()
		let b_repassword = $("#b_repassword").val()
		if(b_userid == "") {
			alert("id(email)을 반드시 입력하세요")
			$("#b_userid").focus();
			return false;
		}
		if(b_password == "") {
			alert("비밀번호를 반드시 입력하세요")
			$("#b_password").focus()
			return false;
		}
		if(b_repassword == "") {
			alert("비밀번호를 한 번 더 입력하세요")
			$("#b_repassword").focus()
			return false;
		}
		if(b_password != b_repassword) {
			alert("비밀번호와 확인이 일치하지 않습니다")
			$("#b_password").val("")
			$("#b_repassword").val("")
			$("#b_password").focus()
			return false;
		}
		$("form").submit()
})

})
</script>
<body>
<section>
	<form action="<c:url value="/join"/>" method="POST" class="join_form" autocomplete="off">
	
	<label for="b_userid">사용자ID</label>	
	<input type="text" name="b_userid"><br/>

	<label for="b_password">비밀번호</label>	
	<input type="password" name="b_password"><br/>
	
	<label for="b_repassword">비밀번호확인</label>	
	<input type="password" name="b_repassword"><br/>
	
	<label for="b_tel">전화번호</label>	
	<input type="text" name="b_tel"><br/>
	
	<label for="b_addr">주소</label>	
	<input type="text" name="b_addr"><br/>
	
	<label></label>
	<button id="btn_join">회원가입</button>
	</form>

</section>
</body>
</html>