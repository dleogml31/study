<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <h1>/jsp/0408/uploadform.jsp</h1>
    
    <form action = "uploadpro.jsp" 
    				method= "post" enctype = "multipart/form-data">
    	이름 : <input type = "text" name = "name" /> <br />
    	file : <input type= "file" name = "save" /> <br />
    			<input type= "submit" value= "전송" />
    			
    </form>