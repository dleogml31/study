<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%request.setCharacterEncoding("UTF-8");%>
<%
   // 서버에 저장된 세션값을 꺼내는것
   String sid = (String)session.getAttribute("sid");
   if(sid == null){
	   Cookie [] cookies = request.getCookies();
	   String cid = null ,cpw= null ,cauto = null;
	   if(cookies != null){
		   for(Cookie c : cookies){ //[cid,cpw,cauto,jsess]
			   if(c.getName().equals("cid")){cid = c.getValue();}
			   if(c.getName().equals("cpw")){cpw = c.getValue();}
			   if(c.getName().equals("cauto")){cauto = c.getValue();}
		   }
	   }
	   if(cid != null && cpw != null && cauto != null){
		   response.sendRedirect("loginPro.jsp");
	   }else{
	%>  <script>
	   alert("로그인후 사용이 가능합니다");
	   window.location='pjlogin.jsp'
	   </script>
	<% } 
	}%>
<h2>[<%=sid%>]님 어서오세요</h2>
<button onclick="window.location='user.jsp'">회원정보</button>
<button onclick="window.location='logout.jsp'">로그아웃</button>