<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h1>ID 중복확인</h1>

<jsp:useBean id="dao" class="web.bean.dao.GlobalUserDAO" />

<%
   String id = request.getParameter("id");
   int result = dao.idCheck(id);
   if(result == 0){
%>   <h2>[<%=id%>] 사용가능한 ID 입니다.</h2>   
<%   }else{
%>   <h2>[<%=id%>] 사용할 수 없는 ID 입니다.</h2>   
   <form action="idCheck.jsp">
      id : <input type="text" name="id" /> <br/>
          <input type="submit" value="ID중복확인" /> <br/>      
   </form>
<%   }   %>
<br/>
<button onclick="selfClose();"> 닫기 </button>

<script>
   function selfClose(){
      opener.document.getElementById("id").value = "<%=id%>";
      self.close();
   }
</script>