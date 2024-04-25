<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <h1>/jsp/0409/ex01.jsp</h1>
    <%-- 객체생성 태그
    	 기본생성자만 사용가능
    --%>
    
    <%
    	java.util.Date date = new java.util.Date();
    %>
    
    <jsp:useBean id = "d" class = "java.util.Date" />
    <jsp:setProperty property = "" name = "" />
    <jsp:getProperty property = "" name = "" />
    <jsp:useBean id = "i" class = "java.lang.Integer" />
    <jsp:useBean id = "s" class = "java.lang.String" />