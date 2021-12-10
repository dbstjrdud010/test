<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="database.jsp" %>
<%
//데이터베이스로 해결(속도가 빠름)
/*String sql = "SELECT";
	   sql +="		member_no 	 			no,";
	   sql +="		member_id 				id,";
	   sql +="		member_name  			name,";
	   sql +="		if(member_grade='S','특별', if(member_grade='A','우수','일반')) grade,";
	   sql +="		ifnull(member_hobby,'') hobby,";
	   sql +="		date_format(member_date, '%Y.%m.%d')  date";
	   sql +=" FROM";
	   sql +="		member_tbl";
	   sql +="	ORDER BY member_no DESC";*/
	   
// jsp로 해결
String sql = "SELECT";
	   sql +="		member_no 	 		no,";
	   sql +="		member_id 			id,";
	   sql +="		member_name  		name,";
	   sql +="		member_gradeade		grade,";
	   sql +="		member_hobby		hobby,";
	   sql +="		member_date			date";
	   sql +=" FROM";
	   sql +="		member_tbl";
	   sql +="	ORDER BY member_no DESC";
	   
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
		<h2 align="center">친구목록 조회/수정</h2>
		<div>
			<table border="1" align="center" width="600">
				<tr>
					<th>회원번호</th>
					<th>회원ID</th>
					<th>이름</th>
					<th>등급</th>
					<th>취미</th>
					<th>날짜</th>
				</tr>
				<%
				while(rs.next()) { // 포인터가 내려가면서 존재하면 출력
					String no = rs.getString("no");
					String id = rs.getString("id");
					String name = rs.getString("name");
					String grade = rs.getString("grade");
					String hobby = rs.getString("hobby");
					String date = rs.getString("date");
				
					// grade의 S,A,B -> 특별,우수,일반
					if(grade.equals("S")) {
						grade = "특별";
					} else if(grade.equals("A")) {
						grade = "우수";
					} else {
						grade = "일반";
					}
					
					// hobby의 화면에 null값 공백 표시
					if(hobby == null) hobby = "";
					
					// date의 -표시를 .표시로 바꿈
					date = date.replace("-",".");
				%>
					<tr align="center">
						<td><%=no %></td>
						<td><a href="memberModify.jsp?no=<%=no %>"><%=id %></a></td>
						<td><%=name %></td>
						<td><%=grade %></td>
						<td><%=hobby %></td>
						<td><%=date %></td>
					</tr>
				<%
				}
				%>
			</table>
		</div>
	</section>
	<footer>
	HRDKOREA Copyright@2016
	</footer>
</div>
</body>
</html>