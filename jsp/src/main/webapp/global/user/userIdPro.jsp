<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h1>아이디 확인</h1>
<%request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="dto" class="web.bean.dto.GlobalUserDTO" />
<jsp:setProperty name="dto" property="*"/> 
<jsp:useBean id="dao" class="web.bean.dao.GlobalUserDAO" />

<%
String name = request.getParameter("name");
String phone = request.getParameter("phone");
dto = dao.userId(name, phone);
%>

아이디:<%=dto.getId()%><br/>