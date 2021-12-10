<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="database.jsp" %>

<%
String no = request.getParameter("no");
String id = request.getParameter("id");
String name = request.getParameter("name");
String grade = request.getParameter("grade");
String[] hobby = request.getParameterValues("hobby");
String date = request.getParameter("date");
%>

<%
if(no == null || id == null || name == null ||
   no.equals("") || id.equals("") || name.equals("")) {
%>
	<script>
	alert("잘못된 경로 입니다.");
	location="index.jsp";
	</script>
<%
	return; // jsp종료
}

String str = "";

if(hobby !=null) {
	for(int i=0; i<hobby.length; i++) {
		str += hobby[i]+",";
	}
	// str = "독서,운동,영화,"; 0~8 
	// str = "독서,운동,; 0~5 
	str = str.substring(0,str.length()-1);
}

String sql = " UPDATE member_tbl SET";
	   sql +="	  	member_id='"+id+"', ";
	   sql +="		member_name='"+name+"', ";
	   sql +="		member_grade='"+grade+"', ";
	   sql +="		member_hobby='"+str+"', ";
	   sql +="		member_date='"+date+"' ";
	   sql +="	WHERE member_no='"+no+"' ";

int result = stmt.executeUpdate(sql); // result = 1
if(result == 1) {
%>
	<script>
	alert("수정완료");
	location="index.jsp";
	</script>
<%
} else {
%>
	<script>
	alert("수정실패");
	location="index.jsp";
	</script>
<%
}
%>
