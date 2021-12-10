<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%!
public int multiA(int a, int b) {
	int c = a*b;
	return c;
}
public void plus(int a, int b) {
	int c = a + b;
	//out.print(c); 오류
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<script>

function multiB(a,b) {
	var result = a*b;
	//return result;
	document.getElementById("result").value = result;
}

</script>

<body>

<%
int result = multiA(10,25);
out.print(result);
%>

<input type="text" name="result" onclick="multiB(11,22)">

<br><br>

<table border="1">
	<tr>
<%
for(int i=1; i<=31; i++) {
	out.print("<td>"+i+"</td>");
	if(i%7 == 0) {
		out.print("</tr><tr>");
	}
}
%>
	</tr>
</table>

</body>
</html>