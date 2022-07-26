<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="kr.or.ddit.member.MemberVO"%>
<%@page import="org.apache.commons.beanutils.BeanUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	MemberVO vo = new MemberVO();
	//BeanUtils : map을 bean객체로 바꿔주는 클래스
	//				>> java bean(vo)객체에 맞춰 값을 자동으로 넣음
	BeanUtils.populate(vo, request.getParameterMap());
	
	//String memId = vo.getMem_name();

	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	Connection conn = DriverManager.getConnection(url, "sem", "java");
	
	//insert query
	String sql = "";
	
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	
	
	
%>
