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
<link href="https://fonts.googleapis.com/css?family=Libre+Baskerville" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(function(){
	$("#btn_login").click(function(){
		let b_userid = $("#b_userid").val()
		let b_password = $("#b_password").val()
		if(b_userid == ""){
			alert("id를 입력하세요")
			$("#b_userid").focus()
			return false;
		} 
		
		if(b_password == ""){
			alert("패스워드를 입력하세요")
			$("b_password").focus()
			return false;
		}
		$("form").submit()
	})
	
	if("${LOGIN_MSG}" == "NULL"){
		alert("존재하지 않는 ID입니다")
	}
	
	if("${LOGIN_MSG}" == "FAIL"){
		alert("비밀번호가 일치하지 않습니다")
	}
	
	if("${LOGIN_MSG}" == "SUCCESS"){
		alert("${LOGIN_INFO.b_userid}님 환영합니다.")
		opener.location.reload()
		window.close();
	}
	
})
</script>
<style>
body {
	background-image:url("https://images.unsplash.com/photo-1528459801416-a9e53bbf4e17?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=355&q=80");
	background-repeat:no-repeat;
	background-size:cover;
	position:relative;
	font-family: 'Libre Baskerville', serif;
}

.container{
	background-color:white;
	margin:50px 10px 10px 10px;
	padding:20px;
	position:relative;
	height:100%;
}

#title {
	text-align:center;
	font-weight:bold;
	font-size:20pt;
}

#b_userid, #b_password{
	width:90%;
	padding:15px;
	margin: 15px 10px;
	border:none;
	background-color:#f1f1f1;
}

#btn_login{
	width:100%;
	padding:15px;
	background-color:#e0e0eb;
	color:black;
	border:none;
	cursor:pointer;
	opacity:0.8;
	font-size:15pt;
	border-radius:16px;
}

#btn_login:hover {
	opacity:1;
}

label {
	margin-left:10pt;

}

</style>

<body>
<div class="container">
<form action="<c:url value='/login_check'/>" method="POST" autocomplete="off">
<p id="title">MEMBER LOGIN</p><br/>

<label for="id"><b>ID</b></label><br/>
<input type="text" placeholder="아이디를 입력하세요" id="b_userid" name="b_userid" required></input><br/>

<label for="password"><b>Password</b></label><br/>
<input type="password" placeholder="비밀번호를 입력하세요" id="b_password" name="b_password" required></input><br/>

<button type="button" id="btn_login"><b>GO</b></button>
</form>
</div>
</body>
</html>