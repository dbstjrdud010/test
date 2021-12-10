<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("utf-8"); %>

<%
//?id=test1&pass=123456&name=Hong
String id = request.getParameter("id");
String pass = request.getParameter("pass");
String name = request.getParameter("name");
%>

<%=id %> <br>
<%=pass %> <br>
<%=name %>
    
    