<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<h1>cookielogout.jsp</h1>

<%
	String cid = null;
	Cookie[] cookies = request.getCookies();
	for(Cookie c : cookies){	
		if(c.getName().equals("cid")){
			c.setMaxAge(0);
			response.addCookie(c);
		}
  	}
	response.sendRedirect("cookieForm.jsp");
%>