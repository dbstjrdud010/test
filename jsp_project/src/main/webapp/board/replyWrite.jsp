<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String unq = request.getParameter("unq");
if(unq == null) {
%>
	<script>
	alert("잘못된 경로로의 접근");
	location = "/";
	</script>
<%
	return;
}
%>
    
<!DOCTYPE html>
<html>
 <head>
  <meta charset="UTF-8">
  <title>답변형 게시판 댓글화면</title>
<link rel="stylesheet" href="../css/layout.css">
</head>

<style>
td {
	text-align:left;
}
.box_title {
	width:90%;
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
       
		<form name="frm" method="post" action="replyWriteSave.jsp">
		
		<input type="hidden" name="unq" value="<%=unq %>"/>
		
		<table>
		<caption> 답변형 게시판 댓글화면 </caption>
		<colgroup>
			 <col width="25%"/>
			 <col width="*%"/>
		 </colgroup>
		 <tbody>
			 <tr>
				  <td>제목</td>
				  <td>Re : <input type="text" name="title" class="box_title" required></td>
			 </tr>
			 <tr>
				   <td>암호</td>
				   <td><input type="password" name="pass" class="box_name" required></td>
			  </tr>
			  <tr>
				  <td>이름</td>
				  <td><input type="text" name="name" class="box_name"></td>
			 </tr>
			 <tr>
				  <td>내용</td>
				  <td>
				  <textarea name="content" rows="7" cols="50"></textarea>
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