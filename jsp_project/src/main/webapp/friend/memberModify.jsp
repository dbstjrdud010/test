<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="database.jsp" %>

<%
String no = request.getParameter("no");

if(no == null || no.equals("")) {
%>
	<script>
	alert("잘못된접근 입니다.");
	location = "index.jsp";
	</script>
<%
	return;
}

String sql = "SELECT"; 
	   sql +="	member_no,";
	   sql +="	member_id,";
	   sql +="	member_name,";
	   sql +="	member_grade,";
	   sql +="	member_hobby,";
	   sql +="	member_date";
	   sql +=" FROM";
	   sql +="	member_tbl";
	   sql +=" WHERE member_no='"+no+"'";
	   
ResultSet rs = stmt.executeQuery(sql);
rs.next();

String id = "";
String name = "";
String grade = "";
String hobby = "";
String date = "";

if(rs.next()) {
	id = rs.getString("member_id");
	name = rs.getString("member_name");
	grade = rs.getString("member_grade");
	hobby = rs.getString("member_hobby");
	date = rs.getString("member_date");
} else {
%>
	<script>
	alert("잘못된 접근 입니다.");
	location = "index.jsp";
	</script>
<%
	return;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="main.css">
</head>
<script>
function fn_submit() {
	
	if(document.frm.no.value == "") {
		alert("회원번호를 확인해주세요.");
		document.frm.no.focus();
		return false;
	}
	if(document.frm.id.value == "") {
		alert("회원ID를 확인해주세요.");
		document.frm.no.focus();
		return false;
	}
	if(document.frm.name.value == "") {
		alert("회원이름을 확인해주세요.");
		document.frm.no.focus();
		return false;
	}
	document.frm.submit();
}
</script>
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
		<h2 align="center">친구(회원)수정 화면</h2>
		<div>
			<form name="frm" method="post" action="memberModifySave.jsp">
				<input type="hidden" name="no" value="<%=no %>">
				<table border="1" width="600" align="center">
					<tr>
						<th>회원번호</th>
						<td><%=no %></td>
					</tr>
					<tr>
						<th>회원ID</th>
						<td><input type="text" name="id" required value="<%=id %>"></td>
					</tr>
					<tr>
						<th>이름</th>
						<td><input type="text" name="name" value="<%=name %>"></td>
					</tr>
					<tr>
						<th>등급</th>
						<td>
							<!-- multiple : 다중선택-->
							<select name="grade" size="3">
								<option value="S" <%if(grade.equals("S")) out.print("selected"); %>>특별회원</option>
								<option value="A" <%if(grade.equals("A")) out.print("selected"); %>>우수회원</option>
								<option value="B" <%if(grade.equals("B")) out.print("selected"); %>>일반회원</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>취미</th>
						<td>
							<input type="checkbox" name="hobby" value="독서">독서
							<input type="checkbox" name="hobby" value="운동">운동
							<input type="checkbox" name="hobby" value="영화">영화
						</td>
					</tr>
					<tr>
						<th>등록일자</th>
						<td><input type="text" name="date" value="<%=date %>"></td>
					</tr>
				</table>
				<div style="text-align:center;width:100%;">
					<button type="submit" onclick="fn_submit();retrun false;">수정</button>
					&nbsp;
					<button type="button" onclick="location='memberList.jsp'">조회</button>
				</div>
			</form>
		</div>
	</section>
	<footer>
	HRDKOREA Copyright@2016
	</footer>
</div>
</body>
</html>