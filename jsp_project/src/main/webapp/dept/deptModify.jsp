<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
String no = request.getParameter("no"); // 부서번호
%>
    
<%
String url = "jdbc:mysql://localhost:3306/apple?useUnicode=true&characterEncoding=utf8";
String username = "root";
String userpass = "apmsetup";

Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection (url,username,userpass);
Statement stmt = conn.createStatement();

String sql = "select deptno,dname,loc from dept where deptno='"+no+"'";
ResultSet rs = stmt.executeQuery(sql);
rs.next();

String dname = rs.getString("dname");
String loc = rs.getString("loc");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
function fn_delete() {
	if(confirm("정말 삭제하시겠습니까?")) { // [확인] [취소]
		location='deptDelete.jsp?deptno=<%=no %>';
	}
}
</script>
<body>

<form name="frm" method="post" action="deptModifySave.jsp">
<table border="1" width="400">
	<tr>
		<th>부서번호</th>
		<td><input type="text" name="deptno" value="<%=no %>" readonly></td>
	</tr>
	<tr>
		<th>부서이름</th>
		<td><input type="text" name="dname" value="<%=dname %>"></td>
	</tr>
	<tr>
		<th>부서번호</th>
		<td><input type="text" name="loc" value="<%=loc %>"></td>
	</tr>
	<tr>
		<th colspan="2">
			<button type="submit">저장</button>
			<button type="button" onclick="fn_delete()">삭제</button>
		</th>
	</tr>
</table>
</form>

</body>
</html>