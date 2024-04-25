<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <h1>/jsp/0409/main.jsp</h1>
    
    
    <jsp:include page = "top.jsp" />
    
    <jsp:include page = "header.jsp" >
    	<jsp:param value = "hello world" name= "title" />
    	
    </jsp:include>
    
    
    
    
    <%--  <%@ include file = "top.jsp" %>  --%>