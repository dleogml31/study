<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<h1>updatePro</h1>
<%request.setCharacterEncoding("UTF-8");%>

<jsp:useBean id= "dto" class="web.bean.dto.GlobalUserDTO" />
<jsp:setProperty name="dto" property="*"/> 
<jsp:useBean id= "dao" class="web.bean.dao.GlobalUserDAO" />
<%
	dao.userUpdate(dto);
%>
<script>
         alert("수정 되었습니다.");
         window.location="user.jsp"
 </script>   
