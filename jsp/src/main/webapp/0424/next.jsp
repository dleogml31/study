<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import= "web.bean.dto.TestDTO" %>
<h1> /jsp/0424/next.jsp</h1>

<%--객체생성 태그 --%>
<jsp:useBean id="dto" class="web.bean.dto.TestDTO" />
<jsp:setProperty name="dto" property="*" />

<jsp:getProperty name="dto" property="a" /> <br />
<jsp:getProperty name="dto" property="b" /> <br />
<jsp:getProperty name="dto" property="c" /> <br />
<jsp:getProperty name="dto" property="d" /> <br />

<%--<%
	//request=불러온다 a,b,c 파라미터로, 없느값는 null이 나온다
	//파라미터는 넘어올때 String으로 넘어온다 숫자도 
	String a = request.getParameter("a");
	String b =request.getParameter("b");
	String c =request.getParameter("c");
	TestDTO dto = new TestDTO(); 
	dto.setA(a);
	dto.setB(b);
	dto.setC(c); 
	


<%=a%> <br />
<%=b%> <br />
<%=c%> <br />
--%>