<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <h1>hello</h1>
    
    <%
    	
    	request.setCharacterEncoding("UTF-8");
 //			http://localhost:8080/jsp/0405/ex10.jsp?name=java&age=20
 //			parameeter ==> Map(key, value) <String, String>
 	String n =	request.getParameter("name");
    String a = 	request.getParameter("age");
    int age = Integer.parseInt(a);	//문자 -> 숫자 "20" -> 20
    if(age >= 20){
%>    	
   		<h1>[<%=n %>]님 반갑습니다</h1> 	
<%     }else{ %>
    	<h1>[<%=n %>]님 나이는 <%=age %>세 입니다. 접속불가(미성년자 입니다 )</h1>
    <%} %>
    
    <h1>이름 : <%=n %></h1>
    <h1>나이 : <%=a %></h1>