<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <h1>/jsp/error/code500.jsp</h1>
    
    <%
    	//톰캣 서버로부터 응답을 받는다
    	//HttpServletResponse.SC_OK == 정상처리
    	response.setStatus(HttpServletResponse.SC_OK);
    
    %>
    
    <h1>준비중입니다</h1>