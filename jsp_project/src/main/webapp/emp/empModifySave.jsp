<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- DB연결 -->
<%@ include file="../include/dbCon.jsp" %>

<!-- Resquest로 받기 -->
<%
String empno = request.getParameter("empno");
String ename = request.getParameter("ename");
String sal = request.getParameter("sal");
String job = request.getParameter("job");
String hiredate = request.getParameter("hiredate"); // 2020/12/25 --> 2020-12-25
String deptno = request.getParameter("deptno");
%>

<!-- 중요데이터 유효성 체크(사원번호,사원이름) -->
<%
if(empno == null || ename == null || empno.equals("") || ename.equals("")) {
%>
	<script>
	alert("다시 시도해 주세요.");
	history.back();
	</script>
<%
	return; // jsp 종료
}
%>

<!-- 날짜 세팅 -->
<%
// 12/25/2020 or 2020-12-25
if(hiredate != null && !hiredate.equals("")) {
	if(hiredate.indexOf("/") > -1) {
		String[] array = hiredate.split("/");
		hiredate = array[2]+array[0]+array[1];
	}
}
%>

<!-- SQL작성/적용 -->
<%
String sql =  "update emp set";
	   sql += "		ename='"+ename+"',";
	   sql += "		hiredate='"+hiredate+"',";
	   sql += "		job='"+job+"',";
	   sql += "		deptno='"+deptno+"',";
	   sql += "		sal='"+sal+"'";
	   sql += "	where";
	   sql += "		empno='"+empno+"'";
int result = stmt.executeUpdate(sql);

if(result == 1) {
%>
	<script>
	alert(수정성공);
	location = "empList.jsp";
	</script>
<%
} else {
%>
	<script>
	alert("수정실패");
	histoy.back();
	</script>
<%
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>