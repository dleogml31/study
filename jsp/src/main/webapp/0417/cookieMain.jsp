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
		alert("로그인 후 사용가능합니다")
		window.location="cookieForm.jsp"
	</script>
<% 
	}
%>
	<h2>[<%=cid %>]님 어서오세요</h2>
<button onclick="window.location='user.jsp'">회원정보</button>
<button onclick="window.location='cookielogout.jsp'">로그아웃</button>

