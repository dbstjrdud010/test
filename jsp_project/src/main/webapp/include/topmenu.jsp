<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<ul>
			<li class="menuLink"><a href="/">홈</a></li>
			<li class="menuLink"><a href="../board/boardList.jsp">게시판</a></li>
			<li class="menuLink"><a href="../board/reBoardList.jsp">답변게시판</a></li>
			
		<%
		String SESSION_ID = (String) session.getAttribute("SessionUserId");
			
		if(SESSION_ID == null) { // 로그인 전
		%>
			<li class="menuLink"><a href="../member/memberWrite.jsp">회원가입</a></li>
			<li class="menulink"><a href="../member/LoginWrite.jsp">로그인</a></li>
		<%
		} else { // 로그인 후
		%>
			<li class="menuLink"><a href="../member/memberModify.jsp">정보수정</a></li>
			<li class="menulink"><a href="../member/logout.jsp">로그아웃</a></li>
		<%
		}
		%>
			<li class="menuLink"><a href="../plan.planList.jsp">일정관리</a></li>
			<li class="menuLink"><a href="#">대화방</a></li>
		</ul>
</body>
</html>