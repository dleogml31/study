<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String color = "red";
	String value = "color";
%>

	<h1>색상 : <%=color %></h1>
	<font size= "7" color= "blue">hello world</font>
	<font size= "7" color= "<%=color %>">hello world</font>
	<font size= "7" <%=value%>="green">hello world</font>