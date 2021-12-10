<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- POST 전송방식 : form태그 안에 작성-->
<form name="frm" method="post" action="write1Sub.jsp">

이름 : <input type="text" name="username"> <br>
주소 : <input type="text" name="useraddr"> <br>
<!-- <input type="submit" value="전송"> -->
<button type="submit">전송</button>

</form>

</body>
</html>