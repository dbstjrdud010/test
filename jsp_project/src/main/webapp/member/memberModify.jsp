<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/dbCon.jsp" %>
<%
String session_id = (String) session.getAttribute("SessionUserId"); // 로그인한 상황
if(session_id == null) {
%>
	<script>
	alert("잘못된 경로로의 접근!");
	location = "/";
	</script>
<%
	return;
}
// 해킹방지용 DB에 session값 존재하는지 유무
String sql = "SELECT COUNT(*) cnt FROM memberinfo ";
	   sql+= "	WHERE userid='"+session_id+"'     ";
	   
ResultSet rs = stmt.executeQuery(sql);
rs.next();

int cnt = rs.getInt("cnt");

if(cnt != 1) {
%>
	<script>
	alert("오류입니다. 관리자에게 연락바랍니다.\n(연락처)02-1111-22222");
	location = "/";
	</script>
<%
	return;
}
// 화면 출력을 위한 SQL
String sql2 = "SELECT name,birthday,gender,mobile,zipcode,addr,rdate ";
	   sql2+= "	FROM memberinfo	";
	   sql2+= "		WHERE userid='"+session_id+"' ";
	   
ResultSet rs2 = stmt.executeQuery(sql2);

String name = "";
String birthday = "";
String gender = "";
String mobile = "";
String zipcode = "";
String addr = "";
String rdate = "";

if(rs2.next()) { // 아이디값이 존재할 경우
	name = rs2.getString("name");
	birthday = rs2.getString("birthday");
	gender = rs2.getString("gender");
	mobile = rs2.getString("mobile");
	zipcode = rs2.getString("zipcode");
	addr = rs2.getString("addr");
	rdate = rs2.getString("rdate");
} else { // 아이디값이 존재하지 않을 경우
%>
	<script>
	alert("다시 시도해주세요.");
	location = "../member/loginWrite.jsp";
	</script>
<%
	return;
}
%>
    
<!DOCTYPE html>
<html>
 <head>
  <meta charset="UTF-8">
  <title>회원정보 수정</title>
  <link rel="stylesheet" href="../css/layout.css">

  <link rel="stylesheet" href="../css/jquery-ui.css">
  <script src="../script/jquery-3.6.0.js"></script>
  <script src="../script/jquery-ui.js"></script>
  <script>
  $( function() {
    $( "#birthday" ).datepicker({
      changeMonth: true,
      changeYear: true
    });
  } );
  </script>

</head>

<style>
td {
	text-align:left;
	line-height:1.6;
}
.box1 {
	width:98%;
}
.box2 {
	width:150px;
}
button {
	height:25px;
}
</style>

<script>
function fn_submit() { // 저장 매소드
	
	var f = document.frm;
	
	if(f.name.value == "") {
		aler("이름을 입력해주세요.");
		f.name.focus();
		return false;
	}
	if(f.gender[0].checked == false && f.gender[1].checked == false) {
		alert("성별을 체크해주세요.");
		return false;
	}
	f.submit();
}

function fn_post() {
	window.open("post1.jsp","post","width=500,height=200");
}

function fn_passChange() {
	var w = window.screen.width/2 - 200;
	var h = window.screen.height/2 - 100;
	var url = "passChange.jsp";
	window.open(url,"passChange","width=400,height=300,left="+w+",top="+h);
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
		<form name="frm" method="post" action="memberModifySave.jsp">
		
		<input type="hidden" name="chk" value="0">
		
		<table>
		<caption> 회원정보수정 </caption>
		<colgroup>
			 <col width="25%"/>
			 <col width="*%"/>
		 </colgroup>
		 <tbody>
			 <tr>
				  <th>아이디</th>
				  <td>
				  	<%=session_id %>
				  </td>
			 </tr>
			 <tr>
				   <th>암호</th>
				   <td>
				   	<button type="button" onclick="fn_passChange()">암호변경</button>
				   </td>
			  </tr>
			  <tr>
				  <th>이름</th>
				  <td><input type="text" name="name" class="box2" required value="<%=name %>"></td>
			 </tr>
			 <tr>
				  <th>성별</th>
				  <td>
				  	<input type="radio" name="gender" value="M" <%if(gender.equals("M")) {out.print("checked");} %>>남성
				  	<input type="radio" name="gender" value="F" <%if(gender.equals("F")) {out.print("checked");} %>>여성
				  </td>
			 </tr>
			 <tr>
				  <th>생일</th>
				  <td><input type="text" name="birthday" id="birthday" required value="<%=birthday %>"></td>
			 </tr>
			 <tr>
				  <th>핸드폰</th>
				  <td><input type="text" name="mobile" class="box2" value="<%=mobile %>"></td>
			 </tr>
			 <tr>
				  <th>주소</th>
				  <td>
				  	<input type="text" name="zipcode" class="box2" value="<%=zipcode %>">
				  	<button type="button" onclick="fn_post()">우편번호찾기</button> <br>
				  	<input type="text" name="addr" class="box1" value="<%=addr %>">
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