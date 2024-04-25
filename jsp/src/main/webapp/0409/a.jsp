<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <h1>a.jsp</h1>
    
    <form action = "b.jsp">
    	name <input type = "text" name = "name" /> <br />
    	학생<input type = "radio" name = "ra" value = "1" />
    	교수<input type = "radio" name = "ra" value = "2" />
    	교직원<input type = "radio" name = "ra" value = "3" />
    	<input type="hidden" />
    	<input type = "submit" value = "이동" />
    </form>