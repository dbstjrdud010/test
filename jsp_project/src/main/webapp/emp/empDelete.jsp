<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- DB연결 -->
<%@ include file="../include/dbCon.jsp" %>

<!-- Request 설정 -->
<%
String empno = request.getParameter("empno");
%>

<!-- 사원번호의 유효성 체크(null,공백) -->
<%
if(empno == null || empno.equals("")) {
%>
	<script>
	alert("잘못된 접근입니다.");
	location = empList.jsp;
	</script>
<%
	return;
} 
%>

<!-- SQL작성/적용/결과메세지 -->
<%
String sql = "delete from emp where empno='"+empno+"' ";
int result = stmt.executeUpdate(sql); // result = 1;
if(result == 1) {
%>
	<script>
	alert("삭제완료");
	location="empList.jsp";
	</script>
<%
} else {
%>
	<script>
	alert("삭제실패! 관리자에게 연락해 주세요.");
	location="empList.jsp";
	</script>
<%
}
%>