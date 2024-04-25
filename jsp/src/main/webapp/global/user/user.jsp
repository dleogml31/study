<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h1>회원 정보 확인</h1>
<%request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="dto" class="web.bean.dto.GlobalUserDTO" />
<jsp:useBean id="dao" class="web.bean.dao.GlobalUserDAO" />

<%
   String id  = (String)session.getAttribute("sid");
	dto = dao.user(id);
%>

<button onclick = "window.location = 'update.jsp'">정보 수정</button>
<button onclick = "window.location = 'delete.jsp'">회원 탈퇴</button>
<br />

<h2>아이디:<%=dto.getId() %></h2><br/>
<h2>비밀번호:<%=dto.getPw() %></h2><br/>
<h2>이름:<%=dto.getName() %></h2><br/>
<h2>생일:<%=dto.getBirth() %></h2><br/>
<h2>전화번호:<%=dto.getPhone() %></h2><br/>
<h2>가입날짜:<%=dto.getReg() %></h2><br/>

<img src="/jsp/global/user/<%=dto.getImg()%>"/>
<button onclick="window.location='imgChange.jsp'">사진 변경</button>