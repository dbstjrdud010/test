<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<p>
<%
String addr = "   123456 서울시 강남구 논현동77   ";
addr = addr.trim();
%>
1.문자열의 길이 : <%=addr.length() %> <br>
2.우편번호 : <%=addr.split(" ")[0] %> <br>
3.주소 : <%=addr.replace(addr.split(" ")[0],"").trim() %> <br>
4.검색단어 "논현" : <%=((addr.indexOf("논현") > -1)?"존재함":"존재하지않음") %>
</p>

<p>
<%
Calendar cal = Calendar.getInstance(); // 인스턴스화
int year = cal.get(Calendar.YEAR);

String birthday = "20100115 20011225 19981102";
String[] array = birthday.split(" ");
%>
<table>
	<tr>
		<th colspan="2">[분석결과]</th>
	</tr>
	<tr>
	<td colspan="2" height="1" bgcolor="#cccccc"></td>
	</tr>
	<tr>
		<td>전송데이터</td>
		<td><%=birthday %></td>
	</tr>
	<%
	for(int i=0; i<array.length; i++) {
		int a1 = Integer.parseInt(array[i].substring(0,4));
		String a2 = array[i].substring(4,6);
		String a3 = array[i].substring(6,8);
		int age = year - a1;
		String str = "나이(만 "+age+"), 생일("+a2+"월"+a3+"일)";
	%>
		<tr>
			<td>데이터<%=i+1 %></td>
			<td><%=str %></td>
		</tr>
	<%
	}
	%>

</table>
</p>
</body>
</html>