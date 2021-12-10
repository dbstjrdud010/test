<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%

String title = "jsp";

byte number1 = 127;
short number2 = 32000;
int number3 = 2100000000;
long number4 = 300000000000L;

float d1 = 1.12345678F;
double d2 = 1.12345678;

boolean result = true;

out.print(number1 + "<br>");
out.print(number2 + "<br>");
out.print(number3);

%>

<%=number4 %> <br>
<%=d1 %> <br>
<%=d2 %> <br>
<%=result %>

</body>
</html>