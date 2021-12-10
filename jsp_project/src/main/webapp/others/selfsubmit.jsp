<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
String name = request.getParameter("name");
String tell = request.getParameter("tell");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
if(name != null && 
   tell != null && 
   !name.equals("") &&
   !tell.equals("")) {
%>
<%=name %>의 연락처는 <%=tell %>입니다.<br><br>
<%
}
%>
<!-- request.getRequestURI() : 자기자신을 자동 업데이트해주는 메소드 -->
<form name="frm" method="post" action="<%=request.getRequestURI() %>">

이름 <input type="text" name="name"> <br>
연락처 <input type="text"name="tell"> <br>
<input type="submit" value="전송">
</form>

</body>
</html>