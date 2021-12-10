<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/dbCon.jsp" %>

<%
String unq = request.getParameter("unq");

// 조회수 증가 SQL
String sql2 = "UPDATE reboard SET hits=hits+1 WHERE unq = '"+unq+"'"; // 조회수 증가
stmt.executeUpdate(sql2);

// 화면출력 SQL
String sql = "SELECT";
	   sql+= "		title,";
	   sql+= "		name,";
	   sql+= "		content,";
	   sql+= "		rdate";
	   sql+= "FROM reboard";
	   sql+= "	WHERE unq='"+unq+"'";
	   
ResultSet rs = stmt.executeQuery(sql);

String title = "";
String name = "";
String content = "";
String rdate = "";

if(rs.next()) {
	title = rs.getString("title");
	name = rs.getString("name");
	content = rs.getString("content");
	/*
	content 부분에 \n 및 공백을 html 요소로 바꿈
	\n : 화면에서 데이터 저장시 줄바꿈의 결과로 DB에 저장된 기호
	*/
	//replace
	content = content.replace("\n","<br>");
	rdate = rs.getString("rdate");
} else {
%>
	<script>
	alert("잘못된 접근입니다.");
	location = "../main/main.jsp";
	</script>
<%
	return;
}
%>

<!DOCTYPE html>
<html>
 <head>
  <meta charset="UTF-8">
  <title>답변형 게시판 상세화면</title>
<link rel="stylesheet" href="../css/layout.css">
</head>

<style>
td {
	text-align:left;
}
.box_title {
	width:98%;
}
.box_name {
	width:150px;
}
</style>

<body>
<div class="wrap">
    <header>
        <div class="top_logo">

		</div>
		<div class="top_header">

		</div>

    </header>
    <nav>
		
<%@ include file="../include/topmenu.jsp" %>
		
    </nav>
	<aside>
	
<%@ include file="../include/leftmenu.jsp" %>
	
	</aside>
    <section>
       <article>
		<table>
		<caption> 답변형 게시판 상세화면 </caption>
		<colgroup>
			 <col width="25%"/>
			 <col width="*%"/>
		 </colgroup>
		 <tbody>
			 <tr>
				  <td>제목</td>
				  <td><%=title %></td>
			 </tr>
			 <tr>
				   <td>이름</td>
				   <td><%=name %></td>
			  </tr>
			  <tr>
				  <td>내용</td>
				  <td><%=content %></td>
			 </tr>
			 <tr>
				  <td>날짜</td>
				  <td><%=rdate %></td>
			 </tr>
		 </tbody>
		</table>
		
		<div style="width:600px; text-align:center; margin-top:10px;">
			<button type="button" onclick="location='reBoradWrite.jsp'">글쓰기</button>
			<button type="button" onclick="location='reBoardList.jsp'">목록</button>
			<button type="button" onclick="location='replyWrite.jsp?unq=<%=unq %>'">답변</button>
			<button type="button" onclick="location='reBoardModify.jsp?nuq=<%=unq %>'">수정</button>
			<button type="button" onclick="location='passWrite.jsp?unq=<%=unq %>&gubun=R'">삭제</button>
		</div>
       </article>
    </section>
    <footer>
        
<%@ include file="../include/footer.jsp" %>
        
    </footer>
</div>
</body>
</html>