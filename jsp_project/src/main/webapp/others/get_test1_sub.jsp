<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%
// 주소?eng=90&kor=100
String eng = request.getParameter("eng");
String kor = request.getParameter("kor");
String math = request.getParameter("math");
%>

영어점수 : <%=eng %> <br>
국어점수 : <%=kor %> <br>
수학점수 : <%=math %>
