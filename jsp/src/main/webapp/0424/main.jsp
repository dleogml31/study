<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h1> /jsp/0424/main.jsp</h1>

<%--a라는 이름에 10를 넣어서 b에는 hello를 넣어서 next.jsp에 전달 --%>
<%-- url에선 공백이 있어선 안된다 --%>
<%--'a=10&b=hello'는 파라미터 --%>
<a href="next.jsp?a=10&b=hello">NEXT</a>


<%--form태그는 파라미터를 보내는 대표적인 태그 --%>
<%--form태그 안에 form태그가 있어선 안된다 --%>
<%-- a,b,c 라는 이름의 파라미터를 next로 전달 --%>
<form action= "next.jsp" method="post">
	<input type="text" name = "a" /> <br />
	<input type="text" name = "b" /> <br />
	<input type="text" name = "c" /> <br />
	<input type="submit" value="전송" />
</form>