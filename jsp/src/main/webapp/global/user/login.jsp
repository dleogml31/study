<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h1>로그인</h1>

<form action="loginPro.jsp" method="post">
   id : <input type="text" name="id" /> <br/>
   pw : <input type="password" name="pw" /> <br/>
   자동로그인 : <input type="checkbox" name="auto" value="1" /><br/> <%-- 체크박스에 체크를하면 1을 보내겠다는 의미  체크를 하지 않으면 null --%>
       <input type="submit" value="login" /> <br/>
</form>

<a href = "input.jsp">회원가입</a>
<a href = "userId.jsp">아이디 찾기</a>
<a href = "      ">비밀번호 찾기</a>
<a href = "/jsp/global/board/list.jsp">게시판 바로가기</a>