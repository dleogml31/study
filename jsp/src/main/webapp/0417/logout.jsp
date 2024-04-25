<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<h1>/jsp/0417/logout.jsp</h1>

<%
	//세션삭제
	session.removeAttribute("sid");

	//클라이언트의 모든 세션 삭제
	session.invalidate();
	
	response.sendRedirect("loginForm.jsp");
%>