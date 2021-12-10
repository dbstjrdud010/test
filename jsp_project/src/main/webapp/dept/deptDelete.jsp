<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String deptno = request.getParameter("deptno");
%>

<%
String url = "jdbc:mysql://localhost:3306/apple?useUnicode=true&characterEncoding=utf8";
String username = "root";
String userpass = "apmsetup";

Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection (url,username,userpass);
Statement stmt = conn.createStatement();
%>

<%
String sql = "delete from dept where deptno'"+deptno+"'";
int result = stmt.executeUpdate(sql);
if(result == 1) {
%>	
	<script>
	alert("삭제완료");
	location = "deptList.jsp";
	</script>
<%
} else {
%>
	<script>
	alert("삭제실패");
	history.back(); // 전화면으로 이동
	</script>	
<%
}
%>
    