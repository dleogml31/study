<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <h1>/jsp/0408/request03.jsp</h1>
    
    <h1> <%=request.getContentType() %> </h1>
    <h1> <%=request.getLocalAddr() %> </h1>
    <h1> <%=request.getLocalName() %> </h1>
    <h1> <%=request.getLocalPort()%> </h1>
    <h1><%= request.getContextPath() %></h1>
    <h1> <%=request.getCharacterEncoding() %></h1>
    <h1> <%=request.getRequestURI() %></h1>
    <h1> <%=request.getRequestURL() %></h1>
    