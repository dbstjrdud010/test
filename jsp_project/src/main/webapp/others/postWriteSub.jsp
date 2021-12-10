<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("utf-8"); %>
나의 IP : <%=request.getRemoteAddr() %> <br>
데이터길이 : <%=request.getContentLength() %> <br>
인코딩 : <%=request.getCharacterEncoding() %> <br>
컨텐츠 타입 : <%=request.getContentType() %> <br>
프로토콜 : <%=request.getProtocol() %> <br>
전송방식 : <%=request.getMethod() %> <br>
URI : <%=request.getRequestURI() %> <br>
경로 : <%=request.getContextPath() %> <br>
서버이름 : <%=request.getServerName() %> <br> 
서버포트 : <%=request.getServerPort() %>
    