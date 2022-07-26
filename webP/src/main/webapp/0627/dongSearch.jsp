<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  String v_dong = request.getParameter("dong");
  Class.forName("oracle.jdbc.driver.OracleDriver"); 
  String url = "jdbc:oracle:thin:@localhost:1521:xe";
  Connection conn = DriverManager.getConnection(url,"cjh99","java");
  Statement stmt = conn.createStatement();
  String sql = "select * from ziptb where dong like '" + v_dong + "%'";
  ResultSet rs = stmt.executeQuery(sql); 
%> [  <%
  int i=0;
  while(rs.next()){
	String zipcode = rs.getString("zipcode");
    String sido = rs.getString("sido");
	String gugun = rs.getString("gugun");
	String dong = rs.getString("dong");
	String bunji = rs.getString("bunji");
	if(bunji == null) bunji = "";
	
	//json objec생성 - index로 쉼표 생성
	if(i>0) out.print(",");
%>	
	{
		"code"	: "<%=zipcode%>",
		"addr"	: "<%=sido%><%=gugun%><%=dong%>",
		"bunji" : "<%=bunji%>"
	} 
<%
	i++;
  }//while end
%>	 
]