<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <h1>/jsp/0408/header.jsp</h1>
    <%
    	
    	Enumeration<String> hn = request.getHeaderNames();
    	while(hn.hasMoreElements()){
    		String name = hn.nextElement();
    		String value = request.getHeader(name);
   %>    	<h1><%=name %> = <%=value %></h1>	
    	<% } %>
    
