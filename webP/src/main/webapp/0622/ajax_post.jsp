<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  request.setCharacterEncoding("utf-8");
  
  String userId = request.getParameter("id");
  String userPw = request.getParameter("pw");
  
  //실제로 요청전달받은 데이터로 결과를 생성해야하지만 생략..
  //id,pw를 이용해 로그인 여부 결과를 받았다고 가정한다..
  
  String ss = "0";	//회원정보 일치시 상태 코드
  
  if(ss.equals("1")){	//정보 일치
	  
	  //json object data 생성하기..
%>	  
	  {
<%-- 	  	"rst" : "로그인 성공했어요" --%>
	  	"cd" : "ok"
	  }
<%	  
  }else { 				//정보 불일치
	  
	  //json object data 생성하기..
%>
	  {
<%-- 	  	"rst" : "로그인 실패했어요" --%>
		"cd" : "no"	
	  }
<%
  }
%>