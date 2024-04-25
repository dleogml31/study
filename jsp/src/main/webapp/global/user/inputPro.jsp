<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id= "dto" class="web.bean.dto.GlobalUserDTO" />
<jsp:setProperty name="dto" property="*"/> 
<jsp:useBean id= "dao" class="web.bean.dao.GlobalUserDAO" />
<%
dao.userInput(dto);
%>
     <script>
         alert("가입 되었습니다.");
         window.location="login.jsp"
        </script>   
