<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
Calendar cal = Calendar.getInstance();
int year = cal.get(Calendar.YEAR);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form name="frm" method="post" action="write2Sub.jsp">
이름 <input type="text" name="username"> <br>
생년 <select name="year">
	<%
	for(int i=1940; i<=(year-1); i++) {
		String str = ""; // 기본값 설정을 위한 변수처리
		if(i == 2000) str = "selected";
	%>
		<option value="<%=i %>" <%=str %>><%=i %>년</option>
	<%
	}
	%>
   <!-- <option value="2000">2000년</option>
		<option value="2001" selected>2001년</option>
		<option value="2002">2002년</option> -->
	</select>
<br>
성별 <input type="radio" name="gender" value="M">남성,
	<input type="radio" name="gender" value="F">여성
<br>
전화 <input type="text" name="phone"> <br>
<br>
학습과목
<input type="checkbox" name="subject" value="java">JAVA
<input type="checkbox" name="subject" value="html">HTML
<input type="checkbox" name="subject" value="mysql">MYSQL
<br>
주소 <input type="text" name="addr" value="주소를 넣어주세요."> <br>
하고싶은말 <br>
<textarea name="content">내용을 넣어주세요.</textarea> <br>
<button type="submit">전송</button>
</form>

</body>
</html>