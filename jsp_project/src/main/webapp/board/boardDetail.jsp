<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/dbCon.jsp" %>

<%
String unq = request.getParameter("unq");

String sql2 = "UPDATE nboard SET hits=hits+1 WHERE unq = '"+unq+"'"; // 조회수 증가
stmt.executeUpdate(sql2);

String sql = "SELECT";
	   sql+= "		title,";
	   sql+= "		name,";
	   sql+= "		content,";
	   sql+= "		rdate";
	   sql+= "FROM nboard";
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
  <title>게시판 상세화면</title>
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
		<form name="frm" method="post" action="boardWriteSave.jsp">
		<table>
		<caption> 게시판 입력화면 </caption>
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
			<button type="button" onclick="location='boradWrite.jsp'">글쓰기</button>
			<button type="button" onclick="location='boardList.jsp'">목록</button>
			<button type="button" onclick="location='boardModify.jsp?nuq=<%=unq %>'">수정</button>
			<button type="button" onclick="location='passWrite.jsp?unq=<%=unq %>'">삭제</button>
		</div>
		</form>
       </article>
    </section>
    <footer>
        
<%@ include file="../include/footer.jsp" %>
        
    </footer>
</div>
</body>
</html>