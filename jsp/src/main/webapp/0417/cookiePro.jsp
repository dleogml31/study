<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<h1>/jsp/0417/cookiePro.jsp</h1>
<% 
	String id = request.getParameter("id");
    String pw = request.getParameter("pw");
    if(id.equals("java")&& pw.equals("1234")){
      //로그인 성공
      //쿠키저장
      Cookie cid = new Cookie("cid",id);
      cid.setMaxAge(60);	//쿠키유효시간
      response.addCookie(cid);	//클라이언트에게 보내기
      
      response.sendRedirect("cookieMain.jsp");   // main 페이지 이동
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