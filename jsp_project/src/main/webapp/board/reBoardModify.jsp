<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/dbCon.jsp" %>

<%
// 수정화면 unq값 필요
String unq = request.getParameter("unq");
if(unq == null || unq.equals("")) {
%>
	<script>
	alert("잘못된 경로로의 접근");
	location="boardList.jsp";
	</script>
<%
	return; // jsp종료
}

String sql = "SELECT		";
	   sql+= "		title,	";
	   sql+= "		name,	";
	   sql+= "		content	";
	   sql+= " FROM reboard	";
	   sql+= "	WHERE unq='"+unq+"'	";
	   
ResultSet rs = stmt.executeQuery(sql);

String title = "";
String name = "";
String content = "";

if(rs.next()) {
	title = rs.getString("title");
	name = rs.getString("name");
	content = rs.getString("content");
} else {
%>
	<script>
	alert("잘못된 접근입니다.");
	location = "boardList.jsp";
	</script>
<%
	return; // jsp종료
}
%>

<!DOCTYPE html>
<html>
 <head>
  <meta charset="UTF-8">
  <title>답변형 게시판 수정화면</title>
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

<script>
function fn_submit() {
	
	if(document.frm.title.value == "") {
		aler("제목을 입력해주세요.");
		document.frm.title.focus();
		return false;
	}
	if(document.frm.pass.value == "") {
		aler("암호를 입력해주세요.");
		document.frm.pass.focus();
		return false;
	}
	document.frm.submit();
}

function fn_onload() {
	document.frm.title.focus();
}
</script>

<body onload="fn_onload()">
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
		<form name="frm" method="post" action="reBoardModifySave.jsp">
		
		<input type="hidden" name="unq" value="<%=unq %>">
		
		<table>
		<caption> 답변형 게시판 수정화면 </caption>
		<colgroup>
			 <col width="25%"/>
			 <col width="*%"/>
		 </colgroup>
		 <tbody>
			 <tr>
				  <td>제목</td>
				  <td><input type="text" name="title" class="box_title" value="<%=title %>" required></td>
			 </tr>
			 <tr>
				   <td>암호</td>
				   <td><input type="password" name="pass" class="box_name" required></td>
			  </tr>
			  <tr>
				  <td>이름</td>
				  <td><input type="text" name="name" class="box_name" value="<%=name %>"></td>
			 </tr>
			 <tr>
				  <td>내용</td>
				  <td>
				  <textarea name="content" rows="7" cols="50"><%=content %></textarea>
				  </td>
			 </tr>
		 </tbody>
		</table>
		
		<div style="width:600px; text-align:center; margin-top:10px;">
			<button type="submit" onclick="fn_submit();return false">저장</button>
			<button type="reset">취소</button>
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