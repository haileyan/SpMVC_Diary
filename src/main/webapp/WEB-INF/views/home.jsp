<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<c:set var="rootPath" value="${pageContext.request.contextPath}" />  
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<title>Dear Diary</title>
</head>
<link href="https://fonts.googleapis.com/css?family=Playfair+Display" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>

body {
	background-image:url("https://images.unsplash.com/photo-1517673626-d1fa13313145?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1267&q=80");
	background-repeat:none;
	background-size:cover;
	font-family: 'Playfair Display', serif;
}

#logo {
	width:80px;
}

.sidenav {
  height:100%;
  width: 15%;
  position: fixed;
  z-index: 1;
  top: 0;
  left: 0;
  background-color: #111;
  overflow-x: hidden;
}

/* Side navigation links */
.sidenav a {
  color: white;
  padding: 16px;
  text-decoration: none;
  display: block;
}

/* Change color on hover */
.sidenav a:hover {
  background-color: #ddd;
  color: black;
}

/* Style the content */
.main {
  height:100%;
  margin-left: 15%;
  padding-left: 10px;
  padding-top:10px;
}

.subnav {
	height:15%;
	width:100%;

}

.contents {
	height:90%;
	width:100%;
	border:1px solid black;
	maring-top:50px;
	position:fixed;
}

</style>
<script>
$(function(){
	$("#join").click(function(){
		location.href = "<c:url value='/join'/>";
	})
	
	$("#logout").click(function(){
		$.ajax({
			url:"<c:url value='/logout'/>",
			method:"GET",
			sucess:function(result){
				$(".contents").html(result)
			},
			error:function(){
				alert("!!nope!!")
			}
		})
	})
	
	$("#login").click(function(){
		var popupX = (window.screen.width / 2) - (500 / 2);
		var popupY = (window.screen.height / 2) - (500 / 2);
		window.open("<c:url value='/login'/>", "login",
				"width=500, height=500, left="+ popupX +",top=" + popupY + ", resizable=no, status=no");
		opener.location.reload()
		window.close();
	})
	
})

</script>

<body>
<div class="sidenav">
	<a href="${rootPath}/"><img src="https://images.vexels.com/media/users/3/157534/isolated/preview
	/04a822950d3a39a1a31eaa7b4980e5e2-leyendo-un-vector-de-libro-by-vexels.png" id="logo"></a>
	<a href="${rootPath}/list">LIST</a>
	<a href="${rootPath}/write">WRITE</a>
	<a href="">MORE</a>
	<a href="">ABOUT</a>
</div>

<div class="main">
<article class="subnav">
	<c:if test="${empty LOGIN_INFO}">
		<a href="javascript:void(0)" id="login"><img src="https://www.iconsdb.com/icons/preview/white/account-login-xxl.png" alt="login" style="width:32px;"></a>		
	</c:if>
	<c:if test="${LOGIN_INFO ne null}">
		<a href="javascript:void(0)"><b>${LOGIN_INFO.b_userid}님</b></a>
		<a href="javascript:void(0)" id="logout"><img src="https://img.icons8.com/windows/32/000000/exit.png"></a>
	</c:if>
	<a href="javascript:void(0)" id="join"><img src="http://www.calicicek.com/images/large-icon-user.png" alt="join" style="width:32px;"></a>
	<hr>	
</article>

<article class="contents">
<c:choose>
	<c:when test="${BODY=='LIST'}">
		<%@ include file="/WEB-INF/views/post/post_list.jsp" %>
	</c:when>
	<c:when test="${BODY=='WRITE'}">
		<%@ include file="/WEB-INF/views/post/post_write.jsp" %>
	</c:when>
	<c:when test="${BODY=='DETAIL'}">
		<%@ include file="/WEB-INF/views/post/post_detail.jsp"%>
	</c:when>
	<c:when test="${BODY=='JOIN'}">
		<%@ include file="/WEB-INF/views/member/join_form.jsp" %>
	</c:when>
	<c:otherwise> 
		<div class="home_main"><img src="https://i.gifer.com/81CA.gif"></div>
	</c:otherwise>
</c:choose>	
</article>

</div>
</body>
</html>