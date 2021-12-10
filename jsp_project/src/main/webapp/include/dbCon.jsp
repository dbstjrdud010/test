<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% // DB연결
String url = "jdbc:mysql://localhost:3306/apple?useUnicode=true&characterEncoding=utf8";
String username = "root";
String userpass = "apmsetup";

Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection (url,username,userpass);
Statement stmt = conn.createStatement();
%>

<% request.setCharacterEncoding("utf-8"); //한글깨짐 방지 %>
