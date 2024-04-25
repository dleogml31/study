<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h1>update / 회원정보 수정</h1>

<jsp:useBean id="dto" class="web.bean.dto.GlobalUserDTO" />
<jsp:useBean id="dao" class="web.bean.dao.GlobalUserDAO" />

<%
   String id  = (String)session.getAttribute("sid");
	dto = dao.user(id);
	
%>

<form action="updatePro.jsp" method = "post">
	id : <%=id%> <br />
		 <input type ="hidden" name = "id" value = "<%=id%>" />
	pw : <input type = "password" name = "pw" value ="<%=dto.getPw()%>" /> <br />
	name : <input type = "text" name = "name" value ="<%=dto.getName()%>" /> <br />
	birth : <input type = "date" name = "birth" value ="<%=dto.getBirth()%>" /> <br />
	phone : <input type = "text" name = "phone" value ="<%=dto.getPhone()%>" /> <br />
			<input type = "submit" value = "정보수정"/>

</form>