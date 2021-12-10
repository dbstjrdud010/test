<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %><!-- 한글깨짐 방지 -->
<%
String username = request.getParameter("username");
String useraddr = request.getParameter("useraddr");
%>    

<%=username %> <br>
<%=useraddr %>
