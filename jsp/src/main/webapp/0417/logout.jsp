<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<h1>/jsp/0417/logout.jsp</h1>

<%
	//���ǻ���
	session.removeAttribute("sid");

	//Ŭ���̾�Ʈ�� ��� ���� ����
	session.invalidate();
	
	response.sendRedirect("loginForm.jsp");
%>