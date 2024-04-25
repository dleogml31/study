<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <h1>b.jsp</h1>
    
 <%
    	
    	int ra = Integer.parseInt(request.getParameter("ra"));
    	String view = "교직원.jsp";
    	if(ra == 1){
    		view = "학생.jsp";
    	}else if(ra == 2){
    		view = "교수.jsp";
    	}
    	
%>
    <jsp:forward page="view" >
    	<jsp:parm value = "hello" name = "msg" />
    </jsp:forward>