<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/dbCon.jsp" %>
    
<%@ include file="../include/certificate.jsp" %>
    
<%@ page import="java.util.*"%>

<%
String yy = request.getParameter("year");
String mm = request.getParameter("month");

Calendar cal = Calendar.getInstance();
int y = cal.get(Calendar.YEAR);
int m = cal.get(Calendar.MONTH);

if(yy != null && mm != null && !yy.equals("") && !mm.equals("")) {
	y = Integer.parseInt(yy);
	m = Integer.parseInt(mm)-1;
}

cal.set(y,m,1); // 시점(이번달 1일) 셋팅
int dayOfweek = cal.get(Calendar.DAY_OF_WEEK); // 출력 년월의 1일날의 요일 (일:1, 월:2 ~ 토:7)
int lastday = cal.getActualMaximum(Calendar.DATE); // 출력 년월의 마지막날짜

// 이전버튼 기능 세팅
int b_y = y;
int b_m = m;
if(m == 0) {
	b_y = b_y - 1;
	b_m = 12;
}

// 다음버튼 기능 세팅
int n_y = y;
int n_m = m+2;
if(m == 11) {
	n_y = n_y + 1;
	n_m = 1;
}
%>  

<!DOCTYPE html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <title>일정목록</title>
<link rel="stylesheet" href="../css/layout.css">
</head>

<style>
.t_div1 {
	float:left;
	width:30%;
}
.t_div2 {
	float:left; 
	width:40%;
}
.t_div3 {
	float:left; 
	width:30%; 
	text-align:right;
}
</style>

<script>
function fn_planWrite() {
	<%
	if(USERID == null) {
	%>
		alert("로그인 이후에 이용가능합니다.");
		location = "../member/loginWrite.jsp";
	<%
	} else {
	%>
		var w = (window.screen.width/2) - 200;
		var h = (window.screen.height/2) - 200;
		var url = "planWrite.jsp";
		window.open(url,"planWrite","width=400, height=400,left="+w+",top="+h);
	<%
	}
	%>
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
	
	<div style="width:600;">
		<div class="t_div1">&nbsp;</div>
		<div class="t_div2">
			<%=y %>년 <%=m+1 %>월
		</div>
		<div class="t_div3">
			<button type="button" onclick="fn_palnWrite()">일정등록</button>
		</div>
	</div>
	<table>
	<caption>
		
	</caption>
	<tr>
		<th>일</th>
		<th>월</th>
		<th>화</th>
		<th>수</th>
		<th>목</th>
		<th>금</th>
		<th>토</th>
	</tr>
	<tr>
		<%
		// 1일을 출력하기 전 빈칸을 출력하는 설정
		int count = 0;
		
		for(int s=1; s<dayOfweek; s++) {
			out.print("<td></td>");
			count++;
		}
		// 날짜를 출력하는 설정
		for(int d=1; d<=lastday; d++) {
			count++;
			
			String color = "#555555";
			if(count == 7) {
				color = "blue";
			} else if(count == 1) {
				color = "red";
			}
			String f_date = y + "-" + (m+1) + d;
			String f_sql = "SELECT COUNT(*) cnt FROM plan ";
				   f_sql+= " WHERE userid='"+USERID+"' 	  ";
				   f_sql+= "		AND pdate='"+f_date+"'";
			ResultSet f_rs = stmt.executeQuery(f_sql);
			int f_cnt = f_rs.getInt("cnt");
			
			if(f_cnt == 1) {
				color = "pink";
			%>	
			}
				<td style="color:<%=color %>"><a href="#"><%=d %></td>
			<%
		}
		%>
				<td style="color:<%=color %>"><%=d %></td>
		<%  
			// 개행을 위한 설정
			if(count == 7) { // 월화수목금토일(7)의 배수
				out.print("</tr><tr>"); //행변환
				count = 0; // 변수 초기화
			}
		}
		while(count < 7) {
			out.print("<td></td>");
			count++;
		}
		%>
	</tr>
</table>

       </article>
    </section>
    <footer>
        
<%@ include file="../include/footer.jsp" %>
        
    </footer>
</div>
</body>
</html>