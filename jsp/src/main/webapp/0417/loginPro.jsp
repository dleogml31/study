<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<h1>/jsp/0417/loginPro.jsp</h1>

<%
   String id = request.getParameter("id");
   String pw = request.getParameter("pw");
   if(id.equals("java")&& pw.equals("1234")){
      //로그인 성공
      session.setAttribute("sid", id);   //세션저장
      response.sendRedirect("loginMain.jsp");   // main 페이지 이동
   }else{
      //로그인 실패
%>
   <script>
      alert("id / pw 를 확인하세요");
      history.go(-1);
   </script>
<% 
   } 
%>