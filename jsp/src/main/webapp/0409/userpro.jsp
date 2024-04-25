<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h1>/jsp/0409/userPro.jsp</h1>

<%
   // post방식 인코딩 처리
   request.setCharacterEncoding("UTF-8");
%>


<jsp:useBean id="dto" class="web.bean.dto.UserDTO"/>
<jsp:useBean id="dto2" class="web.bean.dto.MemberDTO"/>
<jsp:setProperty property="*" name="dto" />

<jsp:setProperty property="*" name="dto2" />

<h1><jsp:getProperty name="dto" property="id"/> </h1>
<h1><jsp:getProperty name="dto" property="pw"/> </h1>
<h1><jsp:getProperty name="dto" property="name"/> </h1>
<h1><jsp:getProperty name="dto" property="age"/>
	
	
	
    <%
    dto.setId(request.getParameter("id"));
    
    String id = request.getParameter("id");
    
    String pw = request.getParameter("pw");
    
    String name = request.getParameter("name");
    
    String age = request.getParameter("age");
    
    
    %>