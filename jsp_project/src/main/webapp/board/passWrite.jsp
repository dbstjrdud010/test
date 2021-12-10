<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String unq = request.getParameter("unq");
String gubun = request.getParameter("gubun"); // 답변형gubun="R" , 일반gubun=null;
if(unq == null || unq.equals("")) {
%>
	<script>
	alert("잘못된 경로로의 접근");
	location = "boardList.jsp";
	</script>
<%
	return;
}

String delete_url = "boardDelete.jsp";

if(gubun.equals("R")) {
	delete_url = "reBoardDelete.jsp";
}
%>

<!DOCTYPE html>
<html>
 <head>
  <meta charset="UTF-8">
  <title>게시판 암호 입력화면</title>
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
       
		<form name="frm" method="post" action="<%=delete_url %>">
		
		<input type="hidden" name="unq" value="<%=unq %>">
		
		<table style="position:relative; width:400px;left:100px;">
		<caption> 암호 입력 화면 </caption>
		<colgroup>
			 <col width="25%"/>
			 <col width="*%"/>
		 </colgroup>
		 <tbody>
			 <tr>
				   <td>암호</td>
				   <td><input type="password" name="pass" class="box_name" maxlength="20" required></td>
			  </tr>
		 </tbody>
		</table>
		
		<div style="width:600px; text-align:center; margin-top:10px;">
			<button type="button" onclick="history.back()">뒤로</button>
			<button type="submit" onclick="fn_submit();return false">삭제</button>
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