<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%!	//선언부는 !가 붙음(메소드라는 표시)
public int multi(int a, int b) {
	int result = a*b;
	return result;
}
public int plus(int a, int b) {
	int result = a+b;
	return result;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
10*25 = <%=multi(10,25) %> <br> <!-- 250(메소드 사용) -->
10+25 = <%=plus(10,25) %> 		<!-- 35(메소드 사용) -->

<hr>

<%
Calendar cal = Calendar.getInstance();

int y = cal.get(Calendar.YEAR);
int m = cal.get(Calendar.MONTH)+1;
int d = cal.get(Calendar.DATE);
%>
<%=y %>년 <%=m %>월 <%=d %>일

<hr>

<%
Random r = new Random();
out.print(r.nextInt(10)); // 0 ~ 9
out.print("<br>");
out.print(r.nextInt(100)); // 0 ~ 99
%>

<hr>
<%
Random r1 = new Random();
for(int i=1; i<=20; i++) {
	int nm = r1.nextInt(10);
	out.print(i+":"+nm+"<br>");
	if(nm == 7) {
		break;
	}
}
%>
</body>
</html>