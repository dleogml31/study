<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <h1>cookiemain</h1>

<% 
	String cid = null;
	Cookie[] cookies = request.getCookies();
	for(Cookie c : cookies){	//new Cookie("cid",id)
		if(c.getName().equals("cid")){
			cid = c.getValue();
		}
	}

	if(cid == null){
%>	<script>
		alert("�α��� �� ��밡���մϴ�")
		window.location="cookieForm.jsp"
	</script>
<% 
	}
%>
	<h2>[<%=cid %>]�� �������</h2>
<button onclick="window.location='user.jsp'">ȸ������</button>
<button onclick="window.location='cookielogout.jsp'">�α׾ƿ�</button>

