<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div style="background-color:yellow; width:400px; height:100px">
<%
for(int i=1; i<=10; i++) {
	out.print(i + "&nbsp;&nbsp;");
}
%>
</div>

<div style="background-color:skyblue; width:400px; height:100px">
<%
for(int i=1; i<=10; i++) {
%>	
	<%=i %>&nbsp;&nbsp;
<%
}
%>
</div>

<div style="background-color:pink; width:400px; height:100px">
<%
int j = 1;
while(j<=10) {
	out.print(j + "&nbsp;&nbsp;");
	j++;
}
%>
</div>

<table border="1">
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

<select name="year">
	<option value="">-년도선택-</option>
	<%
	for(int i=1940; i<2021; i++) {
	%>
	<option value="<%=1 %>"><%=i %></option>
	<%
	}
	%>
</select>


</body>
</html>