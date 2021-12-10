<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- DB연결 -->
<%@ include file="../include/dbCon.jsp" %>

<!-- 데이터 받기 -->
<%
String empno = request.getParameter("empno");
String ename = request.getParameter("ename");
String sal = request.getParameter("sal");
String job = request.getParameter("job");
String hiredate = request.getParameter("hiredate"); // 2020/12/25 --> 2020-12-25
String deptno = request.getParameter("deptno");
%>

<!-- 중요데이터 체크(null값) 유효성 체크 -->
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

<%
/* 날짜 데이터 세팅 */
if(hiredate != null && !hiredate.equals("")) {
	// 12/25/2020
	String[] array = hiredate.split("/");
	// array[0] = "12" ; array[1] = "25" ; array[2] = "2020"
	hiredate = array[2] + "-" + array[0] + "-" + array[1];
}
%>
<!-- 사원번호 중복 체크 (*중요)-->
<%
String sql = "select count(*) as cnt from emp where empno='"+empno+"' ";
ResultSet rs = stmt.executeQuery(sql); // SQL적용
rs.next();
int cnt = rs.getInt("cnt");
if(cnt > 0) { // 중복된 데이터가 있는 경우
%>
	<script>
	alert("입력하신 사원번호는 이미 사용 중 입니다.");
	history.back(); // 이전화면으로 이동
	</script>
<%
}
%>

<!-- 부서번호 존재유무 (*중요) -->
<%
String sql2 = "select count(*) as cnt from dept where deptno='"+deptno+"' ";
ResultSet rs2 = stmt.executeQuery(sql2); // SQL적용
rs2.next(); // 커서 내림
int cnt2 = rs2.getInt("cnt");
if(cnt2 == 0) { // 부서중복 없을경우
%>
	<script>
	alert("존재하는 부서번호가 아닙니다.");
	history.back(); // 이전화면으로 이동
	</script>
<%
	return; // jsp 종료
}
%>

<!-- 저장 SQL 작성 및 적용 -->
<%
String sql3 = "insert into emp(empno,ename,sal,job,hiredate,deptno)";
	   sql3 +="values('"+empno+"','"+ename+"','"+sal+"','"+job+"','"+hiredate+"','"+deptno+"') ";
int result = stmt.executeUpdate(sql3);
if(result == 1) { // 결과 출력메세지
%>
	<script>
	alert("저장완료");
	location = "empList.jsp";
	</script>
<%
} else {
%>
	<script>
	alert("저장실패");
	history.back();
	</script>
<%
}
%>
