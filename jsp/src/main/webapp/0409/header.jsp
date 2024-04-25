<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <h1>/jsp/0409/header.jsp</h1>
    
    <%
    	String title = request.getParameter("title");
    %>
    
    <h1><%=title %></h1>