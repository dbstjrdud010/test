<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String eng = request.getParameter("eng");
String kor = request.getParameter("kor");

int sum = Integer.parseInt(eng) + Integer.parseInt(kor);
int avg = sum/2;
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

영어점수 : <%=eng %>, 국어점수 : <%=kor %>
합계 : <%=sum %>, 평균 : <%=avg %>

</body>
</html>