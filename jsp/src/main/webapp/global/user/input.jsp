<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
function idCheck(){
	id = document.getElementById("id").value;
	open("idCheck.jsp?id="+id,"아이디 중복확인",); // 새창(".jsp?id="+id,["타이틀","창의 크기"]) ?파라미터
}

</script>
<form action = "inputPro.jsp" method="post">
   id : <input type="text" name="id" id="id"/> 
		<input type="button" value="ID중복확인" onclick="idCheck()"><br/>
   pw : <input type="password" name="pw" /> <br/>
   name : <input type="text" name="name" /> <br/>
   birth : <input type="date" name="birth" /> <br/>
   phone : <input type="text" name="phone" /> <br/>
       <input type="submit" name="가입" />
</form>