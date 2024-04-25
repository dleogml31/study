<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="web.bean.dao.OracleConnection" %>
<%@ page import="java.sql.*" %>

<%request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="dto" class="web.bean.dto.GlobalUserDTO" />
<jsp:setProperty name="dto" property="*"/> 
<jsp:useBean id="dao" class="web.bean.dao.GlobalUserDAO" />

<%
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
		   dto.setId(cid);
		   dto.setPw(cpw);
		   dto.setAuto(cauto);}
   int result = dao.loginCheck(dto);
   if(result == 1){
      session.setAttribute("sid", dto.getId()); 
      if(dto.getAuto() != null){
    	  Cookie cooid = new Cookie("cid",dto.getId());
    	  Cookie coopw = new Cookie("cpw",dto.getPw());
    	  Cookie cooauto = new Cookie("cauto",dto.getAuto());
    	  cooid.setMaxAge(60*60*24);
    	  coopw.setMaxAge(60*60*24);
    	  cooauto.setMaxAge(60*60*24);
    	  response.addCookie(cooid);
    	  response.addCookie(coopw);
    	  response.addCookie(cooauto);
      }
      response.sendRedirect("main.jsp");
   } else {
%>      <script>
         alert("아이디 또는 비밀번호가 일치하지 않습니다.");
         history.go(-1);
        </script>   
<% } %>
