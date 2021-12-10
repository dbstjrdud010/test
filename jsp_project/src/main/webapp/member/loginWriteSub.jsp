<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/dbCon.jsp" %>

<%
String userid = request.getParameter("userid");
String pass = request.getParameter("pass");

if(userid == null || pass == null) {
%>
	<script>
	alert("잘못된 경로로의 접근!");
	location = "/";
	</script>
<%
	return;
}

String sql = "SELECT COUNT(*) cnt FROM memberinfo 			  ";
	   sql+= "	WHERE userid='"+userid+"' and pass='"+pass+"' ";

ResultSet rs = stmt.executeQuery(sql);
rs.next();

int cnt = rs.getInt("cnt");

if(cnt == 0) {
%>
	<script>
	alert("잘못된 정보입니다.");
	history.back();
	</script>
<%
	return;
} else {
	//SessionUserId = "아이디";
	session.setAttribute("SessionUserId",userid); // 세션변수 생성
	//session.setMaxInactiveInterval(60*60); // 로그인 지속시간(초단위)

}
%>
	<script>
	alert("<%=userid %>님 로그인 되었습니다.");
	location = "/";
	</script>
    
