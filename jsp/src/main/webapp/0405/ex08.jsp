<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "ex.test.ch02.Data" %>

<h1>Data 이름 : <%=Data.name %></h1>
<h1>Data 나이 : <%=Data.getAge() %></h1>

    <%!		//클래스 영역
    		//정적변스, 인스터너스변수 선언
    		//매서드 구현
    		
    	static String name="java";
    	public static String getName(){
    		return name;
    	}
    
    %>
    <h1>이름 : <%=name %></h1>
    <h1>이름 : <%=getName() %></h1>