<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); // 한글깨짐 방지 %>

<%
String deptno = request.getParameter("deptno");
String dname = request.getParameter("dname");
String loc = request.getParameter("loc");
%>

<%
String url = "jdbc:mysql://localhost:3306/apple?useUnicode=true&characterEncoding=utf8";
String username = "root";
String userpass = "apmsetup";

Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection (url,username,userpass);
Statement stmt = conn.createStatement();

String sql = "update dept set dname='"+dname+"',loc='"+loc+"'";
	   sql += "where deptno='"+deptno+"'";

int result = stmt.executeUpdate(sql); // result = 1;(정상), result = 0;(오류)
if(result == 1) {
%>
	<script>
	alert("수정완료");
	location = "deptList.jsp"; // 목록으로 이동 시킴
	</script>
<%
} else {
%>
	<script>
	alert("수정실패");
	history.back(); // 이전화면으로 이동 시킴
	</script>
<%
}
%>

