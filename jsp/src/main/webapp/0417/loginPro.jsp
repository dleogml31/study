<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<h1>/jsp/0417/loginPro.jsp</h1>

<%
   String id = request.getParameter("id");
   String pw = request.getParameter("pw");
   if(id.equals("java")&& pw.equals("1234")){
      //�α��� ����
      session.setAttribute("sid", id);   //��������
      response.sendRedirect("loginMain.jsp");   // main ������ �̵�
   }else{
      //�α��� ����
%>
   <script>
      alert("id / pw �� Ȯ���ϼ���");
      history.go(-1);
   </script>
<% 
   } 
%>