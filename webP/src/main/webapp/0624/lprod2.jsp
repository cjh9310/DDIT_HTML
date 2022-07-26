<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//커넥션 객체 만들고 
Class.forName("oracle.jdbc.driver.OracleDriver");
String url = "jdbc:oracle:thin:@localhost:1521:xe";
Connection conn = DriverManager.getConnection(url, "cjh99", "java");

//db에 접근해서 sql실행하고 
Statement stmt = conn.createStatement();
// String sql = "select * from lprod";
// stmt.executeQuery(sql);
ResultSet rs = stmt.executeQuery("select * from lprod");
%>
<table border=1>
  <tr style="background-color: blue;">
    <td>아이디</td>
    <td>ㅈㅣ유</td>
    <td>앤엠</td>
  </tr>
<%
//결과값 을 받아서 json object array로 만들어서
while(rs.next()){
	int id = rs.getInt("lprod_id");
	String gu = rs.getString("lprod_gu");
	String nm = rs.getString("lprod_nm");
	
	//html table형태로 결과 작성
%>
	<tr>
	  <td><%=id %></td>
	  <td><%=gu %></td>
	  <td><%=nm %></td>
	</tr>
<%	
}//while end
%>
</table>
