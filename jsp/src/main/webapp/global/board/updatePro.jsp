<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import = "web.bean.dao.BoardDAO" %>
<%@ page import = "web.bean.dto.BoardDTO" %>
<%@ page import = "java.sql.Timestamp" %>

<% request.setCharacterEncoding("UTF-8");%>

<jsp:useBean id="article" scope="page" class="web.bean.dto.BoardDTO">
   <jsp:setProperty name="article" property="*"/>
</jsp:useBean>
<%
 
    String pageNum = request.getParameter("pageNum");

	BoardDAO dbPro = new BoardDAO();
    int check = dbPro.updateArticle(article);

    if(check==1){
%>
	  <meta http-equiv="Refresh" content="0;url=list.jsp?pageNum=<%=pageNum%>" >
<% }else{%>
      <script language="JavaScript">           
        alert("비밀번호가 맞지 않습니다");
        history.go(-1);
     </script>
<% } %>  

 