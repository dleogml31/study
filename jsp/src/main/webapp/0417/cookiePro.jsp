<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<h1>/jsp/0417/cookiePro.jsp</h1>
<% 
	String id = request.getParameter("id");
    String pw = request.getParameter("pw");
    if(id.equals("java")&& pw.equals("1234")){
      //�α��� ����
      //��Ű����
      Cookie cid = new Cookie("cid",id);
      cid.setMaxAge(60);	//��Ű��ȿ�ð�
      response.addCookie(cid);	//Ŭ���̾�Ʈ���� ������
      
      response.sendRedirect("cookieMain.jsp");   // main ������ �̵�
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