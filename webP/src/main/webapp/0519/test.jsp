<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> <!--  스크립트릿 -->

    
    <%
    // post방식으로 데이터를 받을 경우 캐릭터 셋팅 필요(한글)
    request.setCharacterEncoding("utf-8");
    // 데이터 전달받기 -id, pw
    String id = request.getParameter("userId");
    String pw = request.getParameter("userPw");
%>
    
<%=id%> <br>
<%=pw%>