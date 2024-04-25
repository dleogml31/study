<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%request.setCharacterEncoding("UTF-8");%>
    <%
    //세션 삭제
    session.removeAttribute("sid");
    // 클라이언트의 모든 세션 삭제
    session.invalidate();
    
 	Cookie [] cookies = request.getCookies();
 	String cid = null ,cpw= null ,cauto = null;
 		if(cookies != null){
 		   for(Cookie c : cookies){ //[cid,cpw,cauto,jsess]
 			   if(c.getName().equals("cid")){c.setMaxAge(0);response.addCookie(c);}
 			   if(c.getName().equals("cpw")){c.setMaxAge(0);response.addCookie(c);}
 			   if(c.getName().equals("cauto")){c.setMaxAge(0);response.addCookie(c);}
 		   }
 	   }
	response.sendRedirect("login.jsp");
	%>