<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="database.jsp" %>

<%
String sql = "SELECT ";
	   sql +="		f.req_member_no		req_no,";
	   sql +="		m.member_id			id,";
	   sql +="		m.member_name 		name,";
	   sql +="		f.req_date 			date";
	   sql +="FROM friend_tbl f, member_tbl m";
	   sql +="	WHERE f.req_member_no = m.member_no";
	   
ResultSet rs = stmt.executeQuery(sql);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="main.css">
</head>
<body>
<div>
	<header>
		<h1>친구관리</h1>
	</header>
	<nav>
<%@ include file="topMenu.jsp" %>
	</nav>
	<section>
		<br>
		<h2 align="center">친구요청 목록</h2>
		<div>
			<tabel border="1" width="300" align="center">
				<tr>
					<th>회원ID</th>
					<th>회원명</th>
					<th>요청일자</th>
				</tr>
				<%
				int cnt = 0;
				while(rs.next()) {
					cnt++;
					String id = rs.getString("id");
					String name = rs.getString("name");
					String date = rs.getString("date");
				%>
					<tr align="center">
						<td><%=id %></td>
						<td><%=name %></td>
						<td><%=date %></td>
					</tr>
				<%
				}
				%>
			</tabel>
			<br>
			<table width="300" align="center">
				<tr>
					<td align="left">총 <%=cnt %>명</td>
				</tr>
			</table>
		</div>
	</section>
	<footer>
	HRDKOREA Copyright@2016
	</footer>
</div>
</body>
</html>