<%@page import="java.util.Map"%>
<%@page import="kr.or.ddit.Service"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<pre>
	JDBC(Java DataBase Connectivity)를 이용한 DB Connection
	: 자바에서 디비에 접속할 수 있도록 하는 API
	>> DB에서 정보를 가져오기 위해 객체를 만들어 연결하는 방식
</pre>
<%
	String nm = request.getParameter("name");
	//Service 메소드 호출하여 데이터 전달받음
	Service service = Service.getInstance();
	Map<String,Object> map = service.selectMemberOne(nm);
	String mId = (String)map.get("id");
	String mHp = (String)map.get("hp");
	String mMail = (String)map.get("mail");

	//처리구조
	//MVC2 - model, view, controller로 세분화시켜 데이터를 처리
	//해당 예제는 View,Controller역할을 jsp에서 담당..
	//service-데이터를 활용해서 실제적인 처리를 진행
	//dao(-sql문을 통해 실제 데이터 받아오기)로 연결하여 sql문 실행 후 데이터 다시 반환
	
	// Controller(요청데이터 받음) >> Service 
	//  >> Dao (Connection객체로 DB접근 후 sql문 실행하여 결과 데이터 받음)
 	//  >> Service(데이터 처리후) >> Controller >> View



%>
<%-- 전달받은 요청데이터 : <%=nm %> --%>
  <table border="1">
    <tr>
      <th>이름</td>
      <th>아이디</th>
      <th>핸드폰</th>
      <th>이메일</th>
    </tr>
    <tr>
      <td><%=nm %></td>
      <td><%=mId %></td>
      <td><%=mHp %></td>
      <td><%=mMail %></td>
    </tr>
  </table>
</body>
</html>