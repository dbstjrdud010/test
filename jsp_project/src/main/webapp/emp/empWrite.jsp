<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/dbCon.jsp" %>
    
<%
/*사원번호 얻기*/
String sql = "select ifnull(max(empno),1000)+1 myempno from emp";
ResultSet rs = stmt.executeQuery(sql);
int myempno = 0;
if(rs.next()) {
	myempno = rs.getInt("myempno");
}

/*부서목록 얻기*/
String sql2 = "select deptno,dname from dept order by dname asc";
ResultSet rs2 = stmt.executeQuery(sql2);
%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/empMain.css">

<link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
  <script>
  $( function() {
    $( "#hiredate" ).datepicker({
      changeMonth: true,
      changeYear: true
    });
  } );
  </script>
</head>
<style>

</style>
<script>
function fn_submit() { // 공백일시 제한사항
	if(document.frm.empno.value == ""){
		alert("사원번호를 입력해주세요.");
		documet.frm.empno.focus(); // 오류인곳 커서이동
		return false;
	}
	if(document.frm.ename.value == ""){
		alert("사원이름를 입력해주세요.");
		documet.frm.ename.focus();
		return false;
	}
	document.frm.submit(); // 전송
}
</script>
<body>

<form name="frm" method="post" action="empWriteSave.jsp">
<table align="center">
	<caption style="font-size:15px;">사원정보등록</caption>
	<tr>
		<th width="20%">사원번호</th>
		<td width="80%">
			<input type="text" name="empno" value="<%=myempno %>"></td>
	</tr>
	<tr>
		<th>사원이름</th>
		<td><input type="text" name="ename"></td>
	</tr>
	<tr>
		<th>업무</th>
		<td><input type="text" name="job"></td>
	</tr>
	<tr>
		<th>급여</th>
		<td><input type="text" name="sal"></td>
	</tr>
	<tr>
		<th>입사일</th>
		<td><input type="text" name="hiredate" id="hiredate"></td>
	</tr>
	<tr>
		<th>부서번호</th>
		<td>
			<select name="deptno">
			<%
			while(rs2.next()) {
				String deptno = rs2.getString("deptno");
				String dname = rs2.getString("dname");
			%>
				<option value="<%=deptno %>"><%=dname %></option>
			<%
			}
			%>
			</select>
		</td>
	</tr>
</table>
<div style="width:100%;text-align:center;margin-top:10px;">
	<button type="submit" onclick="fn_submit();return false;">저장</button>
	<button type="reset">취소</button>
	<button type="button" onclick="location='empList.jsp'">목록</button>
</div>
</form>

</body>
</html>