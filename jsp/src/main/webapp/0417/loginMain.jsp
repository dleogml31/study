<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<h1>main</h1>
<%
	//서버에 저장된 세션 꺼내기
	String sid = (String)session.getAttribute("sid");
	if(sid == null){
%>		<script>
			alert("로그인 후 이용 가능합니다")
			window.location = "loginForm.jsp"
		</script>
		
	<% } %>

<h2>[<%=sid %>]님 어서오세요</h2>
<button onclick="window.location='user.jsp'">회원정보</button>
<button onclick="window.location='logout.jsp'">로그아웃</button>