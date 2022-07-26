<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String nm = request.getParameter("name");
 String gd = request.getParameter("gender"); 
String[] foods = request.getParameterValues("food");
//String fd = request.getParameter("food"); 데이터가 하나일 떄
String fl = request.getParameter("file");
String hd = request.getParameter("hidden");

String food = "";
for(int i=0; i<foods.length; i++){
	food+=foods[i];
}

%>

당신의 이름은 <%=nm%> <br>
성별은 <%=gd%>이군요!! <br>
<%="좋아하는 음식은 " + food%>..<br>
선택한 파일은 : <%=fl %> <br><br>
숨겨진 데이터 내용 : <%=hd %> <br><br>
<%=nm%>,<%=gd%>,<%=food%><%=fl%> <br>
<%=nm%>,<%=gd%>,<%=foods[0]%>,<%=foods[1]%>,<%=fl%>