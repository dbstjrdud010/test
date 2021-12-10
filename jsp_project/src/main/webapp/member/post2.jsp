<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/dbCon.jsp" %>    

<%
String dong = request.getParameter("dong");

if(dong == null) {
%>
	<script>
	alert("잘못된 경로로의 접근");
	self.close();
	</script>
<%
	return;
}

dong = dong.trim();

if(dong.equals("")) { // 앞뒤공백 제거했음에도 공백인 경우
%>
	<script>
	alert("다시 입력해주세요.");
	history.back();
	</script>
<%
	return;
}

String sqlTot = "SELECT COUNT(*) total FROM post	";
	   sqlTot+= "	WHERE a4 like '%"+dong+"%' or a5 like '%"+dong+"%' ";

ResultSet rsTot = stmt.executeQuery(sqlTot);
rsTot.next();
int total = rsTot.getInt("total");
	   
String sql = "SELECT a1,a2,a3,a4,a5,a6,a7,a8 FROM post	";
	   sql+= "	WHERE a4 like '%"+dong+"%' or a5 like '%"+dong+"%' ";

ResultSet rs = stmt.executeQuery(sql);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우편번호(주소) 검색 결과</title>
</head>

<style>
div {
	font-size:12px;
	width:100%;
	height:190px;
	text-align:center;
	background:skyblue;
}
</style>

<script>
function fn_action() {
	// [706794] 대구광역시 수성구 황금1동 가든하이츠2차아파트
	var addr = document.frm.address.value;
	
	var array = addr.split(" "); // array[0]="[123456]"
	var zipcode = array[0].substring(1,7); // 1~6번 가져오기([]제거)
	var address = addr.replace(array[0],""); // array[0] -> "" 변환
	
	opener.document.frm.zipcode.value = zipcode;
	opener.document.frm.addr.value = address;
	
	self.close();
}
</script>

<body onload="document.frm.dong.focus();">

<div>
<br><br><br><br><br>
<form name="frm" method="post" action="">

	검색결과 : 총 <%=total %>개 <br>
	<%
	if(total > 0) {
	%>
	<select name="address">
	<%
	while(rs.next()) {
		String a1 = rs.getString("a1");
		String a2 = rs.getString("a2");
		String a3 = rs.getString("a3");
		String a4 = rs.getString("a4");
		String a5 = rs.getString("a5");
		String a6 = rs.getString("a6");
		String a7 = rs.getString("a7");
		String a8 = rs.getString("a8");
		
		String addr = "["+a1+"]"+" "+a2+" "+a3+" "+a4+" "+a5+" "+a6+" "+a7+" "+a8;
	%>
		<option value="<%=addr %>"><%=addr %></option>
	<%
	}
	%>
	</select>
	<button type="button" onclick="fn_action()">적용</button>
	<%
	} else {
	%>
		"<%=dong %>" 이라는 동(면,리)를 찾을 수 없습니다.
	<%
	}
	%>

</form>
</div>

</body>
</html>