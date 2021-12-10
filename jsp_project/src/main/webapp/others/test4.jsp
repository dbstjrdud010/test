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
String address = "   123456 서울시 성북구 ";
%>
문자열 길이1 : <%=address.length() %> <br>
<%
address = address.trim();
%>
문자열 길이2 : <%=address.length() %> <br>
<%
String[] array = address.split(" ");
array[0] = "123456"; array[1] = "주소1"; array[2] = "주소2";
%>
우편번호 : <%=array[0] %> <br>
<%
String address2 = address.replace(array[0], "");
address2 = address2.trim();
%>
주소 : <%=address2 %> <br>
<%
if(address.indexOf("대구") < 0) {
	out.print("존재하지 않음");
} else {
	out.print("존재함");
}
%>
</body>
</html>