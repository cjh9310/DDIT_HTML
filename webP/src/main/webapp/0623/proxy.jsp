<%@page import="net.okjsp.ajax.Proxy"%>
<%@ page contentType="text/plain; charset=utf-8"
    pageEncoding="UTF-8"
%>
<% 
	String url = request.getQueryString();
%>
<%= Proxy.getSource(url) %>