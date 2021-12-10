<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<!DOCTYPE html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <title>로그인</title>
<link rel="stylesheet" href="../css/layout.css">
</head>

<script>
function fn_submit() {
	var f = document.frm;
	if(f.userid.value == "") {
		alert("아이디를 입력해주세요.");
		f.userid.focus();
		return false;
	}
	if(f.pass.value == "") {
		alert("암호를 입력해주세요.");
		f.pass.focus();
		return false;
	}
	f.submit();
}
</script>

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
		
		<form name="frm" method="post" action="loginWriteSub.jsp">
		
		<table style="width:400px;position:relative;left:150px;">
		<caption> 로그인 </caption>
		<colgroup>
			 <col width="25%"/>
			 <col width="*%"/>
		 </colgroup>
		 <tbody>
			 <tr>
				  <td>아이디</td>
				  <td align="left">
				  	<input type="text" name="userid" style="width:98%;">
				  </td>
			 </tr>
			 <tr>
				   <td>암호</td>
				   <td align="left">
				   	<input type="password" name="pass" style="width:98%;">
				   </td>
			 </tr>
		 </tbody>
		</table>
		<div style="width:400px;text-align:center;position:relative;left:150px;margin-top:10px;">
			<button type="submit" onclick="fn_submit(); return false;">로그인</button>
			<!-- submit 타입 : enter키에 반응함 button 타입은 반응X -->
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