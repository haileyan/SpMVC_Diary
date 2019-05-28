<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
form {
	width:80%;
	magin: 0 auto;
}

textarea {
	margin-left:5px;
}

input,textarea {
	display: inline-block;
	width:85%;
	padding: 10px;
	margin: 5px;
	margin-left:15px;
}

label {
	display: inline-block;
	margin-left:10px;
}

.btn {
  position: absolute;
  top: 70%;
  left: 45%;
  transform: translate(-110%, -50%);
  width: 150px;
  height: 50x;
  background: #7affc7;
  border-radius: 4px;
  text-align: center;
  line-height: 50px;
  color: #fff;
  font-family: verdana;
  font-size: 15px;
  box-shadow: 0 3px 3px rgba(0, 0, 0, 0.65);
  cursor: pointer;
  transition: all .25s
}

.btn:active {
  box-shadow: 0 1px 2px rgba(0, 0, 0, 0.5);
}

#btn_upload:hover:after,
#btn_upload:hover:before {
  content: '';
  position: absolute;
  width: 100%;
  height: 50%;
  left: 0;
  top: 0;
  background: repeating-linear-gradient( 45deg, rgba(255, 255, 255, 0.2) 0, rgba(255, 255, 255, 0.2) 20%, rgba(0, 0, 0, 0.2) 20%, rgba(0, 0, 0, 0.2) 40%);
  background-position: 0;
  animation: movement 10s linear infinite;
}

#btn_upload:hover:after {
  top: 50%;
  background: repeating-linear-gradient( -45deg, rgba(255, 255, 255, 0.2) 0%, rgba(255, 255, 255, 0.2) 20%, rgba(0, 0, 0, 0.2) 20%, rgba(0, 0, 0, 0.2) 40%)
}

</style>    
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(function(){
	$("#btn_upload").click(function(){
		$("#form").submit()
		alert("게시글이 등록되었습니다")
	})
})
</script>
<article>
<form id="form" action="<c:url value="/write"/>" method="POST">

<label for="p_title"></label>
<input type="text" name="p_title" placeholder="제목을 입력하세요">

<label for="p_contents"></label>
<textarea rows="10" name="p_contents"></textarea>
<br/>

<label for="p_file1">첨부파일1</label>
<input type="file" name="p_file1">

<label for="p_file2">첨부파일2</label>
<input type="file" name="p_file2">

<div id="btn_upload" class="btn">UPLOAD</div>

</form>
</article>