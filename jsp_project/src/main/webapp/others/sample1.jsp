<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- GET 전송방식 -->
<%
for(int i=1; i<=5; i++) {
%>
	<a href="sample2.jsp?pageIndex=<%=i %>"><%=i %></a>&nbsp;
<%
}
%>
<!--
<a href="sample2.jsp?page=1">1</a>&nbsp;
<a href="sample2.jsp?page=2">2</a>&nbsp;
<a href="sample2.jsp?page=3">3</a>&nbsp;
<a href="sample2.jsp?page=4">4</a>&nbsp;
<a href="sample2.jsp?page=5">5</a>&nbsp;
-->

<br>
<br>
<!-- GET 전송방식은 한글인식을 하지 못함 -->
<a href="sample3.jsp?id=test1&pass=123456&name=Hong">데이터전송</a>

</body>
</html>