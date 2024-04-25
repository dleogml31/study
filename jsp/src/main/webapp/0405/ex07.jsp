<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h1>ex07.jsp</h1>

<%
	String [] name={"java", "sun", "naver"};
%>

<table border="1">
	<tr> <td>번호</td> <td>이름</td> </tr>
	<%for(int i = 1; i <= name.length; i ++){ %>

	<tr>
		<td><%=i --%></td>
		<td><%=name[i-1] %></td>
	</tr>

<% } %>
</table>

<%-- jsp 주석 - 코드에 영향이 없다 --%>

<!-- html 주석 - 브라우저에 결과만 안나온다. 코드는 실행이 된다 -->