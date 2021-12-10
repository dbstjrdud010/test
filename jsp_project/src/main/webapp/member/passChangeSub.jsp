<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- DB연결 -->
<%@ include file="../include/dbCon.jsp" %>

<!-- 세션아이디값 가져오기 -->
<%
String session_id = (String) session.getAttribute("SessionUserId");

if(session_id == null) { // 로그인이 되어있지 않은경우 체크
%>
	<script>
	alert("로그인 해주세요.");
	self.close();
	</script>
<%
	return;
}
%>

<!-- 데이터 받기 -->
<%
String pass1 = request.getParameter("pass1");
String pass2 = request.getParameter("pass2");
String pass3 = request.getParameter("pass3");
%>

<%
if(pass1 == null || pass2 == null || pass3 == null) {
%>
	<script>
	alert("암호를 입력해주세요.");
	history.back();
	</script>
<%
	return;
}
%>

<!-- 현 암호의 일치 검사 -->
<%
String sql = "SELECT COUNT(*) cnt FROM memberinfo 					";
	   sql+= "	WHERE userid='"+session_id+"' and pass='"+pass1+"'	";

ResultSet rs = stmt.executeQuery(sql);
rs.next();
int cnt = rs.getInt("cnt");
if(cnt == 0) {
%>
	<script>
	alert("현재 암호를 잘못 입력했습니다.");
	history.back();
	</script>
<%
	return;
}
%>

<!-- 새로운 암호와 재설정 암호가 맞는지 검사 -->
<%
if(!pass2.equals(pass3)) {
%>
	<script>
	alert("새로운 암호와 일치하지 않습니다.");
	history.back();
	</script>
<%
	return;
}
%>

<!-- 암호변경 SQL작성 후 적용 -->
<%
String sql2 = "UPDATE memberinfo SET pass='"+pass2+"' ";
	   sql2+= "		WHERE userid='"+session_id+"' 	  ";

int result = stmt.executeUpdate(sql2);
if(result == 1) {
%>
	<script>
	alert("새로운 암호로 변경되었습니다.");
	self.close();
	</script>
<%
}
%>


    