<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("utf-8"); %>

<%
String name = request.getParameter("username");
String date = request.getParameter("year");
String tel = request.getParameter("phone");
String addr = request.getParameter("addr");
String content = request.getParameter("content");
// name 값이 여러개있는 값을 받을때는 배열로 변수설정/getParameterValues() 사용
// String[] subject = {"java","html","mysql"};
String[] subject = request.getParameterValues("subject");
String gender = request.getParameter("gender");
if(gender == null) { // 성별 체크 안했을시 출력내용
	gender = "";
}
%>

이름 : <%=name %> <br>
생년 : <%=date %> <br>
전화 : <%=tel %> <br>
주소 : <%=addr %> <br>
내용 : <%=content %> <br>
성별 : <%=gender %> <br>
<hr>
<%
if(subject != null) { // 하나도 선택하지 않았을 경우 오류방지
for(int i=0; i<subject.length; i++) {
	out.print(subject[i] + " ");
	}
} else {
	out.print("선택과목이 없습니다.");
}
%>
    
    