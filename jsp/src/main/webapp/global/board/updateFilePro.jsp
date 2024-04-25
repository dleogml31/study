<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.oreilly.servlet.MultipartRequest" %>
<%@ page import = "com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import = "java.util.Enumeration" %>
<%@ page import = "web.bean.dto.BoardFileDTO" %>
<%@ page import = "web.bean.dao.BoardDAO" %>

<% 
   String path = request.getRealPath("global/board/upload");
   int max = 1024*1024*100;
   String enc = "UTF-8";
   DefaultFileRenamePolicy dp = new DefaultFileRenamePolicy();
   MultipartRequest mr = new MultipartRequest(request, path, max, enc, dp);
   
   int num = Integer.parseInt(mr.getParameter("num"));
   BoardFileDTO fileDTO = new BoardFileDTO();
   fileDTO.setBoardnum(Integer.parseInt(mr.getParameter("num")));
   fileDTO.setBoardnum(num);

  
   String pageNum = mr.getParameter("pageNum");
   
   BoardDAO dao = new BoardDAO();
   
   
   int fileCount = 0;
   Enumeration enu = mr.getFileNames();   // iteration과 같은 개념. 반복
   while(enu.hasMoreElements()){
     String key = (String) enu.nextElement();   // 파일 추출
     String fileName = mr.getFilesystemName(key);
     if(fileName != null){   // 파일첨부가 되었을 때
        // boardfile table에 insert
        fileCount++;
        // 첨부 파일의 갯수만큼 fileCount가 증가함
 	    fileDTO.setFilename(fileName);
        dao.insertFile(fileDTO);
     }
  }
  
  if(fileCount > 0){
     dao.updateFile(fileCount,num);
  }
%> 
<script>
   alert("첨부파일 수정이 완료되었습니다");
   window.location="content.jsp?num=<%=num%>&pageNum=<%=pageNum%>";
</script> 