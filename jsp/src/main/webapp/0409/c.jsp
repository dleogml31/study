<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <h1>c.jsp</h1>
    
    <%
    	String name = request.getParameter("name");
    	String msg = request.getParameter("msg");
    
    %>
    <h1>name : <%=name %></h1>
    <h1>msg : <%=msg %></h1>