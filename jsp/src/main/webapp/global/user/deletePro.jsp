<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h1>deletePro.jsp</h1>
<jsp:useBean id= "dao" class="web.bean.dao.GlobalUserDAO" />
<%
	String id = (String)session.getAttribute("sid");
	String pw = request.getParameter("pw");
	
	int result = dao.userDelete(id, pw);
	if(result == 1){
		session.invalidate();
%>      <script>
			alert("탈퇴 되었습니다")
			window.location = "logout.jsp";
		</script>				
<% 	}else{
%>		<script>
			alert("비밀번호 재입력")
			history.go(-1);
		</script>		
<% 
	}
%>