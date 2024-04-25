<%@ page contentType = "text/html; charset=UTF-8" %>
<%@ page import = "web.bean.dao.BoardDAO" %>
<%@ page import = "web.bean.dto.BoardDTO" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ page import = "java.util.List" %>
<%@ page import = "web.bean.dto.BoardFileDTO" %>
<%
   int num = Integer.parseInt(request.getParameter("num"));
   String pageNum = request.getParameter("pageNum");

   BoardDAO dbPro = new BoardDAO();
   BoardDTO article =  dbPro.getArticle(num);

   List<BoardFileDTO> fileList=null;
   if(article.getBoardfile() > 0){
      fileList = dbPro.getBoardFileList(num);   
   }
   
   if(fileList != null){
      for(BoardFileDTO fileDTO : fileList){
      %> <a href="/jsp/global/board/upload/<%=fileDTO.getFilename()%>">
            <%=fileDTO.getFilename()%>
         </a>
         <a href = "deleteOne.jsp?boardnum=<%=fileDTO.getBoardnum()%>&num=<%=fileDTO.getNum()%>&fiename= <%=fileDTO.getFilename()%>&&pageNum=<%=pageNum%>"> 
         	[삭제]
         </a>
         <br /> 
      <%}
   }else{
%>      첨부 파일 없음
<%  }  %>
<br />
<script>
   n=1;
   function fileAdd(){
      upload = document.getElementById("upload");
      upload.innerHTML = 
      upload.innerHTML + "<input type='file' name='upload"+(n++)+"'><br>"
   }   
</script>
<form method="post" enctype="multipart/form-data" action="updateFilePro.jsp">
   <input type="button" value="추가" onclick="fileAdd();" /> <br />
   <div id="upload">
      파일 : <input type="file" name="upload" /> <br />
   </div>
   <input type="hidden" name="num" value="<%=num%>" />
   <input type="hidden" name="pageNum" value="<%=pageNum%>" />
   <input type="submit" value="파일 수정" />
</form>
