<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h1>form.jsp</h1>

<form action = "pro.jsp" method="get">
	<input type ="number" name= "a" /> <br />
	<input type ="date" name= "a" /> <br />
	<input type ="email" name= "b" /> <br />
	<input type ="password" name= "c" /> <br />
	<input type ="radio" name= "d" value= "x"/> <br />
	<input type ="radio" name= "d" value= "y" /> <br />
	<input type ="checkbox" name= "f" value= "100" /> <br />
	<input type ="checkbox" name= "g" value= "200" /> <br />
	<input type ="color" name= "h" /> <br />
	<input type ="time" name= "i" /> <br />
	<input type ="hidden" name= "j" value= "dfdf"/> <br />
	<input type ="submit" value= "전송" />
	
	<select name= "m">
		<option value= "11">java</option>
		<option value= "22">jsp</option>
		<option value= "33">frame</option>
		
	</select>
	<br />
	
	<textarea rows= "5" cols= "20" name= "content"></textarea><br />
	<input type ="submit" value= "전송" />
	
</form>