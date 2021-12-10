<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Random"%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
Calendar cal = Calendar.getInstance(); // 인스턴스화(객체화)
%>

<%=cal.get(Calendar.YEAR) %>년
<br><br>

<%
double L1 = Math.random(); // 0~1 ; 0.1234

Random random = new Random();

out.print("int : " + random.nextInt(10) + "<br>");
out.print("boolean : " + random.nextBoolean() + "<br>");
out.print("long : " + random.nextLong() + "<br>");
out.print("double : " + random.nextDouble());

%>




</body>
</html>