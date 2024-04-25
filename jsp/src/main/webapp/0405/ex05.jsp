<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <h1>ex05.jsp</h1>
    
    
    <%	//scriptlet 
    	// java 영역, 매서드영역
    	//지역변수, 연산, 객체호출
    	
    	for(int i = 2; i <= 9; i++){
    		for(int j = 1; j <= 9; j++){
    			out.println(i+"x"+j+"="+(i*j)+"<br>");
    		}
    	}
    %>