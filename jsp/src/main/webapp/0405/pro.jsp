<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<h1>pro.jsp</h1>

<%
	request.setCharacterEncoding("UTF-8");

	String a = request.getParameter("a");
	String b = request.getParameter("b");
	String c = request.getParameter("c");
	String d = request.getParameter("d");
	String e = request.getParameter("e");
	String f = request.getParameter("f");
	String g = request.getParameter("g");
	String h = request.getParameter("h");
	String i = request.getParameter("i");
	String j = request.getParameter("j");
%>

<h1><%=a %></h1>