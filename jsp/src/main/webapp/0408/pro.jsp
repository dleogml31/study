<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <h1>/jsp/0408/pro.jsp</h1>
    
    <%-- 선택한것만 출력 --%>
    
    <%
		String name = request.getParameter("name");
		String [] ch = request.getParameterValues("ch");
		for(String c : ch){
	%>			<h1>ch : <%=c%> </h1>
	<% } %>		
    
				    
		<h1>name : <%=name%></h1>
		