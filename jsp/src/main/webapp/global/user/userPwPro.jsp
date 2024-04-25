<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h1>비밀번호 확인</h1>
<%request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="dto" class="web.bean.dto.GlobalUserDTO" />
<jsp:setProperty name="dto" property="*"/> 
<jsp:useBean id="dao" class="web.bean.dao.GlobalUserDAO" />

<%
String id = dto.getId();
String phone = dto.getPhone();
dto = dao.userPw(id, phone);
%>

비밀번호:<%=dto.getPw()%><br/>