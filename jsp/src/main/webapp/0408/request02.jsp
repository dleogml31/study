<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

     <h1>requset02.jsp</h1>
    
    <h1>request : <%=request.getAttribute("num") %></h1>
    <h1>request : <%=request.getAttribute("score") %></h1>
    <h1>session : <%=session.getAttribute("s1") %></h1>
    <h1>application : <%=application.getAttribute("a1") %></h1>