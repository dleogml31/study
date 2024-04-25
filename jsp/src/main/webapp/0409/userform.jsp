<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="/jsp/resources/js/user.js"></script>  
<link rel="stylesheet" href="/jsp/resources/css/user.css" type="text/css"></link>  

	 
    <h1>/jsp/0409/userform.jsp</h1>
    
    <form action="userpro.jsp" method="post">
   id : <input type="text" name="id" id="id" /><br/>
   pw : <input type="password" name="pw"/><br/>
   name : <input type="text" name="name"/><br/>
   age : <input type="text" name="age"/><br/>
       <input type="submit" value="회원가입"/><br/>
       
       <input type="button" value="확인" onclick="inputCheck()" />
</form>
    
   