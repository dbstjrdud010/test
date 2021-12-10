<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% out.print("JSP 시작하기 <br>"); %> 
<%="게시판만들기" %>
<br>
<%="MySQL연동하기" %>

<hr>

<%
String title = "java";
int year = 2020;
out.print(title+"<br>"); // html코드는 ""안에 들어가야함 혹은 jsp코드 밖에 있어야함
%>
<%=title %>
<br>
<%=year %>

<hr>

<%
for(int i=1; i<=10; i++) {
	out.print(i + " "); // 틀린건 아니지만 이렇게 코딩 잘 안함
}
%>

<br>

<%
for(int i=1; i<=10; i++) {
%>
	<a href="test1.jsp"><%=i %></a> <!-- html코드와 같이쓰기위해 이런식으로 코딩 많이함 -->
<%
}
%>
</body>
</html>