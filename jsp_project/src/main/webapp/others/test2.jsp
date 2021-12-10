<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
body {
	font-size:9px;
}
table {
	border-collapse:collapse;
}
th,td {
	border:1px solid #cccccc;
	width:30px;
	text-align:center;
}
</style>
<body>
<table>
	<tr>
	<%
	for(int i=1; i<=10; i++) {
		out.print("<td>"+i+"</td>");
	}
	%>
	</tr>
	<tr>
	<%
	for(int i=1; i<=10; i++) {
	%>
		<td><%=i %></td>
	<%
	}
	%>
	</tr>
</table>
<br>
<table>
	<tr>
		<%
		int count = 0;
		for(int i=1; i<31; i++) {
			count++;
			out.print("<td>"+i+"</td>");
			if(count == 7) {
				out.print("</tr><tr>");
				count = 0;
			}
		}
		while(count < 7) {
			count++;
			out.print("<td></td>");
		}
		%>
	</tr>
</table>

<br>

<select name="year">
	<%
	String str = "";
	for(int y=1940; y<=2020; y++) {
		if(y == 2000) {
			str = "selected";
		} else {
			str = "";
		}
	%>
	<option value="<%=y %>" <%=str %>><%=y %>년</option>
	<%
	}
	%>
</select>
</body>
</html>