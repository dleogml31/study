<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<h1>/jsp/0408/form.jsp</h1>

<form action = "pro.jsp">
	이름 : <input type "text" name = "name" /> <br />
	선택 : <br />
	java <input type = "checkbox" name = "ch" value = "java" />
	jsp <input type = "checkbox" name = "ch" value = "jsp" />
	frame <input type = "checkbox" name = "ch" value = "frame" />
	c++  <input type = "checkbox" name = "ch" value = "c++" />
	<br />
	 <input type = "submit"  value = "전송" />
</form>