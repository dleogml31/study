<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<h1>main</h1>
<%
	//������ ����� ���� ������
	String sid = (String)session.getAttribute("sid");
	if(sid == null){
%>		<script>
			alert("�α��� �� �̿� �����մϴ�")
			window.location = "loginForm.jsp"
		</script>
		
	<% } %>

<h2>[<%=sid %>]�� �������</h2>
<button onclick="window.location='user.jsp'">ȸ������</button>
<button onclick="window.location='logout.jsp'">�α׾ƿ�</button>