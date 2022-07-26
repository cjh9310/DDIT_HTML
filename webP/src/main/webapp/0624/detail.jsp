<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  String prodId = request.getParameter("prodId");

  Class.forName("oracle.jdbc.driver.OracleDriver");
  String url = "jdbc:oracle:thin:@localhost:1521:xe";
  Connection conn = DriverManager.getConnection(url, "cjh99", "java");
  Statement stmt = conn.createStatement();
  String sql = "select * from prod where prod_id = '" + prodId + "'";
  ResultSet rs = stmt.executeQuery(sql);
  
  if(rs.next()){
	  //json object 생성
%>	  {
		  "code" : "ok",
		  "id" : "<%=rs.getString("prod_id") %>",
		  "nm" : "<%=rs.getString("prod_name") %>",
		  "lgu" : "<%=rs.getString("prod_lgu") %>",
		  "cost" : "<%=rs.getInt("prod_cost") %>",
		  "price" : "<%=rs.getInt("prod_price") %>",
		  "sale" : "<%=rs.getInt("prod_sale") %>"
	  } <%
  }else {
%>	  { "code" : "no" } <%
  }//if end
%>