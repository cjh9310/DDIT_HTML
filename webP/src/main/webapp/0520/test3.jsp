<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// post방식으로 한글데이터가 들어올때
	request.setCharacterEncoding("utf-8");
	// 요청데이터 전달받기
// 	getParameter 단일객체만 받는다.
	String txta = request.getParameter("feedback");
// 	엔터키 적용 해결법
// 	txta = txta.replace("\n", "<br>").replace("\r",""); \r\n이 한 번에 썻는데 적용 안될 시 사용
	txta = txta.replace("\r\n", "<br>");  
// 맥북 : \r만 사용, 유닉스 : \n만 사용 윈도우 : \r\n
	
	
	
// 	String car  = request.getParameter("cars");
	String[] car = request.getParameterValues("cars");
	
	String cha = "";
	for(int i=0; i<car.length; i++){
		if(i>0) {
			cha += "," + car[i];
		}else {
			cha += car[i];
		}
		
	}
%>

피드백 : <%= txta%> <br>
<!-- 문제점 : 엔터를 사용해도 결과값에 적용이 안됨. -->
<!-- ex) 가\r\n나다라\r\n마다 -->
<!-- \r carrage return , \n line feed-->
<!--  -->



<%="Drean car : " + cha %>
<%-- <%=" Dream car : " + car[0]%>, <%=car[1]%>, <%=car[2]%> --%>
<!-- car[]의 갯수를 맞추지 않으면 오류가 떠서 for문으로 갯수를 맞춰준다. -->