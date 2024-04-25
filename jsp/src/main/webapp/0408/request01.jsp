<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

     <h1>requset01.jsp</h1>
    
    <%	//속성추가
    	request.setAttribute("num", 100);
    	request.setAttribute("score", 200); 
    	session.setAttribute("s1", 300);
    	application.setAttribute("a1", 500);
    	
    	request.getRequestDispatcher("request02.jsp")
    			.forward(request, response);
    			
    %>
    
    <form action= "request02.jsp">
		<input type = "submit" value = "이동" />
		</form>