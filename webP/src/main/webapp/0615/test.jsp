<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
//	String hb = request.getParameter("hobby");  단일데이터
	String[] hb = request.getParameterValues("hobby");
	String result = "";
	for(int i=0; i<hb.length; i++){
		result += hb[i]; 
	}

%>
<%= hb%>