<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String lprodGu = request.getParameter("gu");

	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	Connection conn = DriverManager.getConnection(url, "cjh99", "java");
	Statement stmt = conn.createStatement();
	String sql = "select prod_id, prod_name from prod" +
					" where prod_lgu = '" + lprodGu + "'";
	ResultSet rs = stmt.executeQuery(sql);
	
	if(rs.next()){	//데이터가 있음
%>
		{
			"code"  : "ok",
			"value" : [
<%
			int i = 0;
			while(rs.next()){
			//index로 쉼표 추가
				if(i>0) out.print(",");
%>				
				{
				  "prodId" : "<%=rs.getString("prod_id") %>",
				  "prodNm" : "<%=rs.getString("prod_name") %>"
				}
<% 			
				i++;
			}//while end
%>
			]
		} <%-- json data end --%>
<%
	}else{ 			//데이터가 없음
%>		{
			"code" : "no"
		}
<%	
	}//if end
%>
