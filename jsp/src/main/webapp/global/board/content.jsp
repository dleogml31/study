<%@ page contentType = "text/html; charset=UTF-8" %>
<%@ page import = "web.bean.dao.BoardDAO" %>
<%@ page import = "web.bean.dto.BoardDTO" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ page import = "java.util.List" %>
<%@ page import = "web.bean.dto.BoardFileDTO" %>
<%@ include file="color.jsp"%>
<html>
<head>
<title>게시판</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>

<%
   int num = Integer.parseInt(request.getParameter("num"));
   String pageNum = request.getParameter("pageNum");
   SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
   BoardDAO dbPro = new BoardDAO();
   BoardDTO article =  dbPro.getArticle(num);
   List<BoardFileDTO> fileList=null;
   if(article.getBoardfile() > 0){
      fileList = dbPro.getBoardFileList(num);
   }
   int ref=article.getRef();
   int re_step=article.getRe_step();
   int re_level=article.getRe_level();
%>
<body bgcolor="<%=bodyback_c%>">  
   <center>
      <b>글내용 보기</b>
      <br>
      <table width="500" border="1" cellspacing="0" cellpadding="0"  bgcolor="<%=bodyback_c%>" align="center">
         <tr height="30">
            <td align="center" width="125" bgcolor="<%=value_c%>">글번호</td>
             <td align="center" width="125" align="center"><%=article.getNum()%></td>
             <td align="center" width="125" bgcolor="<%=value_c%>">조회수</td>
             <td align="center" width="125" align="center"><%=article.getReadcount()%></td>
         </tr>
         <tr height="30">
             <td align="center" width="125" bgcolor="<%=value_c%>">작성자</td>
             <td align="center" width="125" align="center"><%=article.getWriter()%></td>
             <td align="center" width="125" bgcolor="<%=value_c%>" >작성일</td>
             <td align="center" width="125" align="center"><%= sdf.format(article.getReg_date())%></td>
         </tr>
         <tr height="30">
             <td align="center" width="125" bgcolor="<%=value_c%>">글제목</td>
             <td align="center" width="375" align="center" colspan="3"><%=article.getSubject()%></td>
         </tr>
         <tr height="30">
             <td align="center" width="125" bgcolor="<%=value_c%>">첨부파일</td>
             <td align="center" width="375" align="center" colspan="3">
             <%
             if(article.getBoardfile() > 0){
                for(BoardFileDTO fileDTO : fileList){
                %>      <a href="/jsp/global/board/upload/<%=fileDTO.getFilename()%>">
                            <%=fileDTO.getFilename() %>         
                   </a>   
                <%   }
                } 
                %>
                	
                <% String sid = (String)session.getAttribute("sid");
                	if(sid !=null && sid.equals(article.getWriter())){
                %>
                	<input type="button" value="파일수정" onclick="window.location='updateFileForm.jsp?num=<%=article.getNum()%>&pageNum=<%=pageNum%>'">
           		<% } %>
             </td>
         </tr>
         <tr>
             <td align="center" width="125" bgcolor="<%=value_c%>">글내용</td>
             <td align="left" width="375" colspan="3"><pre><%=article.getContent()%></pre></td>
         </tr>
         <tr height="30">      
            <td colspan="4" bgcolor="<%=value_c%>" align="right" > 
            	<%
            		
            		if(sid != null){
            			if(sid.equals(article.getWriter())){
            	%>
               <input type="button" value="글수정" onclick="window.location='updateForm.jsp?num=<%=article.getNum()%>&pageNum=<%=pageNum%>'">
               &nbsp;&nbsp;&nbsp;&nbsp;
               <input type="button" value="글삭제" onclick="window.location='deleteForm.jsp?num=<%=article.getNum()%>&pageNum=<%=pageNum%>'">
               &nbsp;&nbsp;&nbsp;&nbsp;
               <% } 
               if(sid.equals("admin")){
               %>
               <input type="button" value="답글쓰기" onclick="window.location='writeForm.jsp?num=<%=num%>&ref=<%=ref%>&re_step=<%=re_step%>&re_level=<%=re_level%>'">
               &nbsp;&nbsp;&nbsp;&nbsp;
               <% } 
            	}
               %>
               <input type="button" value="글목록" onclick="window.location='list.jsp?pageNum=<%=pageNum%>'">
            </td>
         </tr>
      </table>  
   </center>        
</body>
</html>      