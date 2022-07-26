<%@page import="kr.or.ddit.board.vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<BoardVO> list = (List<BoardVO>)request.getAttribute("list");
	int sPage = (int)request.getAttribute("sPage");
	int ePage = (int)request.getAttribute("ePage");
	int ttPage = (int)request.getAttribute("ttPage");
%>

<%-- JSON데이터로 가공하기 --%>
		{	
			"sPage"		: "<%=sPage %>",
			"ePage"		: "<%=ePage %>",
			"ttPage"	: "<%=ttPage %>",
			"data"		: [
<% 
			//for - json object 
			for(int i=0; i<list.size(); i++){
				BoardVO vo = list.get(i);
				if(i>0) out.print(",");
%>				
				{ 
					"num"		: "<%=vo.getNum() %>", 
					"subject"	: "<%=vo.getSubject() %>", 
					"writer"	: "<%=vo.getWriter() %>", 
					"mail"		: "<%=vo.getMail() %>", 
					"cont"	: "<%=vo.getContent() %>", 
					"hit"		: "<%=vo.getHit() %>", 
					"wdate"		: "<%=vo.getWdate() %>" 
				}
<%				
			}//for end
%>			
			]
		}












