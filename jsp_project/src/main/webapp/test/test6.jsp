<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<script>
function fn_send() {
	var eng = document.getElementById("eng").value;
	var eng = document.getElementById("kor").value;
	alert(eng + "," + kor);
	
	location.href = "test5_sub.jsp?kor="+kor"&eng="+eng;
}
</script>

<body>
<!-- GET방식 -->
<%
String abc = "test";
%>
<a href="test5_sub.jsp?kor=80&eng=70">점수전송</a>
<br>

<p>
영어 : <input type="text" name="eng"> <br>
국어 : <input type="text" name="kor"> <br>
<button type="button" onclick="fn_send()">전송</button>
</p>

</body>
</html>