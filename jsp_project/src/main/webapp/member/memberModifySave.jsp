<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- DB 연결 -->
<%@ include file="../include/dbCon.jsp" %>

<!-- 세션아이디 가져오기(로그인된 상황이기 때문) -->
<%
String session_id = (String) session.getAttribute("SessionUserId");
%>

<!-- 데이터 받기 -->
<%
String name = request.getParameter("name");
String gender = request.getParameter("gender");
String birthday = request.getParameter("birthday");
String mobile = request.getParameter("mobile");
String zipcode = request.getParameter("zipcode");
String addr = request.getParameter("addr");
%>

<!-- 유효성 체크 -->
<%
if(session_id == null || 
   name == null ||
   gender == null) {
%>
	<script>
	alert("잘못된 경로로의 접근!");
	location = "/"; //홈으로 이동
	</script>
<%
	return; // jsp 종료
}
%>

<!-- 저장SQL 작성 및 실행 -->
<%
String sql2 = "UPDATE memberinfo SET	";
	   sql2 += "	name='"+name+"',gender='"+gender+"',birthday='"+birthday+"',mobile='"+mobile+"',zipcode='"+zipcode+"',addr='"+addr+"' ";
	   sql2 += "		WHERE userid='"+session_id+"'	";

int result = stmt.executeUpdate(sql2);
%>

<!-- 메시지 출력 후 메인으로 이동 -->
<%
if(result == 1) {
%>
	<script>
	alert("<%=name %>님의 회원정보가 변경되었습니다.");
	location = "/"; // index파일 존재하면 /는 최상위 파일로 이동
	</script>
<%
} else {
%>
	<script>
	alert("회원정보 변경실패");
	history.back();
	</script>
<%
}
%>

