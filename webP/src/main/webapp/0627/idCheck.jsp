<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  String id = request.getParameter("id");
  Class.forName("oracle.jdbc.driver.OracleDriver"); 
  String url = "jdbc:oracle:thin:@localhost:1521:xe";
  Connection conn = DriverManager.getConnection(url,"cjh99","java");
  Statement stmt = conn.createStatement();
  ResultSet rs = stmt.executeQuery("select mem_id from member where mem_id = '" + id + "'");

  if(rs.next()){	//조회한 값이 존재할 때 - 중복 id
%>	  { 
	  	"code" : "no",
	  	"msg" : "사용불가"
	  } <%
  }else{ %>
	  { 
	  	"code" : "ok",
	  	"msg" : "사용가능"
	  }
<% }//if end
%>