<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
String url = "jdbc:mysql://localhost:3306/apple?useUnicode=true&characterEncoding=utf8";
String username = "root";
String userpass = "apmsetup";

Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection (url,username,userpass);
Statement stmt = conn.createStatement();

String sql = "SELECT deptno,dname,loc FROM dept";
ResultSet rs = stmt.executeQuery(sql);
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<button type="button" onclick="location='deptWrite.jsp'">부서등록</button>

<table border="1">
	<tr>
		<th>번호</th>
		<th>부서이름</th>
		<th>부서번호</th>
		<th>부서위치</th>
	</tr>
	<%
	int cnt = 0;
	while(rs.next()) {
		cnt++;
		String no = rs.getString("deptno");
	%>
		<tr>
			<td><%=cnt %></td>
			<td>
			<a href="deptModify.jsp?no=<%=no %>"><%=no %></a>
			</td>
			<td><%=rs.getString("dname") %></td>
			<td><%=rs.getString("loc") %></td>
		</tr>
	<%
	}
	%>
</table>

</body>
</html>