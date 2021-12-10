<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/dbCon.jsp" %>

<%
int unit = 10; // 한페이지에 몇개씩 보여줄 것인지 숫자만 바꾸면 됨

String vpage = request.getParameter("vpage");
if(vpage == null) {
	vpage = "1";
}
int v_page = Integer.parseInt(vpage);

// 1 -> 0 ; 2 -> 10 ; 3 -> 20
int index_no = (v_page-1) * unit;

String sqlTot = "SELECT count(*) total FROM nboard";
ResultSet rsTot = stmt.executeQuery(sqlTot);
rsTot.next();
int total = rsTot.getInt("total"); // 전체 데이터 개수

// 12 -> 2 , 22 -> 3 , 32 -> 4 페이지
// 19/10 -> 1.9 -> ceil(1.9) -> 2.0 -> (int)2.0 -> 2
// 29/10 -> 2.9 -> ceil(2.9) -> 3.0 -> (int)3.0 -> 3
// 39/10 -> 3.9 -> ceil(3.9) -> 4.0 -> (int)4.0 -> 4
int lastpage = (int)Math.ceil((double)total/unit);

int rownumber = total - index_no; // 행번호

String sql = "SELECT";
	   sql+= "	unq,";
	   sql+= "	title,";
	   sql+= "	name,";
	   sql+= "	date_format(rdate,'%Y-%m-%d') rdate,";
	   sql+= "	hits";
	   sql+= "FROM nboard";
	   sql+= "	ORDER BY unq DESC";
	   sql+= "	 LIMIT "+index_no+","+unit	;	// limit 시작번호,출력개수
	   
ResultSet rs = stmt.executeQuery(sql);
%> 

<!DOCTYPE html>
 <head>
  <meta charset="UTF-8">
  <title>메인</title>
<link rel="stylesheet" href="../css/layout.css">
</head>
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
		<caption>
			<div>게시판 목록</div>
			<div style="font-size:10px; width:100%; text-align:left;">
			전체 데이터 개수 : 총 <%=total %>개
			</div>
		</caption>
		<colgroup>
			 <col width="10%"/>
			 <col width="50%"/>
			 <col width="15%"/>
			 <col width="15%"/>
			 <col width="10%"/>
		 </colgroup>
		 <thead>
			 <tr>
				  <th>번호</th>
				  <th>제목</th>
				  <th>이름</th>
				  <th>날짜</th>
				  <th>조회수</th>
			 </tr>
		 </thead>
		 <tbody>
			 <%
			 while(rs.next()) {
				 int unq = rs.getInt("unq");
				 String title = rs.getString("title");
				 String name = rs.getString("name");
				 String hits = rs.getString("hits");
				 String rdate = rs.getString("rdate");
			 %>
			 	<tr>
			 		<td><%=rownumber %></td>
			 		<td align="left"><a href="boardDetail.jsp?unq=<%=unq %>"><%=title %></a></td>
			 		<td><%=name %></td>
			 		<td><%=rdate %></td>
			 		<td><%=hits %></td>
			 	</tr>
			 <%
			 	rownumber--;
			 }
			 %>
		 </tbody>
		 
		 <div style="width:600px; text-align:center; margin-top:10px;">
		 <%
		 for(int i=1; i<=lastpage; i++) {
			// out.print("<a href='boardList.jsp?vpage="+i+"'>"+i+"</a> ");
		 %> 
			 <a href="boardList.jsp?vpage=<%=i %>"><%=i %></a>
		<%	 
		 }
		 %>
		 </div>
		 
		</table>
		<div style="width:600px; text-align:right;">
			<button type="button" onclick="location='boardWrite.jsp'">글쓰기</button>
		</div>

       </article>
    </section>
    <footer>
        
<%@ include file="../include/footer.jsp" %>
        
    </footer>
</div>
</body>
</html>