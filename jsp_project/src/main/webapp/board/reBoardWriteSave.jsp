<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- DB연결 -->
<%@ include file="../include/dbCon.jsp" %>

<!-- 전송데이터 받기 -->
<%
String title = request.getParameter("title");
String pass = request.getParameter("pass");
String name = request.getParameter("name");
String content = request.getParameter("content");
%>

<!-- 데이터 유효성 체크 -->
<%
if(title == null || pass == null || 
   title.trim().equals("") || pass.trim().equals("")) {
%>
	<script>
	alert("다시 시도해주세요.");
	history.back();
	</script>
<%
	return;
}
title = title.trim();
pass = pass.trim();

if(name == null) {
	name = "";
}
if(content == null) {
	content = "";
}

content = content.trim();
if(content.length() > 500) {
%>
	<script>
	alert("내용이 너무 많습니다.");
	history.back();
	</script>
<%
	return;
}
%>

<!-- SQL/적용 -->
<%
/* gid 세팅 */
String sql = "SELECT ifnull(MAX(gid),0)+1 as mygid FROM reboard";
ResultSet rs = stmt.executeQuery(sql);
rs.next();
int mygid = rs.getInt("mygid");

String sql2 = "INSERT INTO reboard(title,pass,name,content,rdate,gid,thread)";
	   sql2+= "	VALUES('"+title+"','"+pass+"','"+name+"','"+content+"',now(),'"+mygid+"','a')";

int result = stmt.executeUpdate(sql2);
%>

<!-- 결과메세지 출력 -->
<%
if(result == 1) {
%>
	<script>
	alert("저장완료\n목록으로 이동합니다."); // \n : 자바스크립트 줄바꿈
	location = "reBoardList.jsp";
	</script>
<%
} else {
%>
	<script>
	alert("저장실패\n관리자에게 연락해주세요."); // \n : 자바스크립트 줄바꿈
	history.back();
	</script>
<%
}
%>
    