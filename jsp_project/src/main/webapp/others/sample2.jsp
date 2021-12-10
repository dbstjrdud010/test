<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
String page1 = request.getParameter("pageIndex");

// 1 -> 시작번호  1 마지막번호 10
// 2 -> 시작번호 11 마지막번호 20
// 3 -> 시작번호 21 마지막번호 30
// 4 -> 시작번호 31 마지막번호 40
// 5 -> 시작번호 41 마지막번호 50

int pageNo = Integer.parseInt(page1); // 계산을 위한 형변환
int startNo = (pageNo-1)*10+1;
int lastNo = startNo+9;
%>

현재 페이지 : <%=page1 %> <br>
시작 번호 : <%=startNo %> <br>
마지막번호 : <%=lastNo %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>