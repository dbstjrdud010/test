<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/certificate.jsp" %>

<%@ include file="../include/dbCon.jsp" %>

<%
String pdate = request.getParameter("pdate");
String title = request.getParameter("title");
String content = request.getParameter("content");
%>

<%
String sql = "INSERT INTO plan(userid,pdate,title,content) ";
	   sql+= "	VALUES('"+USERID+"','"+pdate+"','"+title+"','"+content+"')";

int result = stmt.executeUpdate(sql);
%>
<script>
alert("일정 저장완료!");
self.close();
opener.location = "planList.jsp";
</script>

    