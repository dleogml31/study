<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import = "web.bean.dao.BoardDAO" %>
<%@ page import = "web.bean.dto.BoardDTO" %>
<%@ page import = "java.sql.Timestamp" %>
<%@ page import = "com.oreilly.servlet.MultipartRequest" %>
<%@ page import = "com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import = "java.util.Enumeration" %>
<%@ page import = "web.bean.dto.BoardFileDTO" %>

<% request.setCharacterEncoding("UTF-8");%>

<jsp:useBean id="article" class="web.bean.dto.BoardDTO" />

 
<%
   String path = request.getRealPath("global/board/upload");
   int max = 1024*1024*100;
   String enc = "UTF-8";
   DefaultFileRenamePolicy dp = new DefaultFileRenamePolicy();
   MultipartRequest mr = new MultipartRequest(request, path, max, enc, dp); // 업로드 처리 완료 (파일 n개여도 다 업로드 진행됨)
   
   article.setNum(Integer.parseInt(mr.getParameter("num")));
   article.setRef(Integer.parseInt(mr.getParameter("ref")));
   article.setRe_step(Integer.parseInt(mr.getParameter("re_step")));
   article.setRe_level(Integer.parseInt(mr.getParameter("re_level")));
   article.setWriter(mr.getParameter("writer"));
   article.setSubject(mr.getParameter("subject"));
   article.setEmail(mr.getParameter("email"));
   article.setContent(mr.getParameter("content"));
   article.setPasswd(mr.getParameter("passwd"));
   
    // 글 작성 시간과 작성자 IP는 게시글에서 따로 받은 파라미터가 아니므로 코드로 작성해서 set
   article.setReg_date(new Timestamp(System.currentTimeMillis()) );
   article.setIp(request.getRemoteAddr());

   BoardDAO dbPro = new BoardDAO();
      // DTO(article)에 있는 파라미터 값들을 DAO(dbPro)에 입력
   dbPro.insertArticle(article);
      
      int boardnum = dbPro.maxNum();
      // 현재 업로드 된 게시물 번호 중 가장 큰 숫자 출력
      int fileCount = 0;
      
      // 첨부파일 처리
    BoardFileDTO boardFileDTO = new BoardFileDTO();
      Enumeration enu = mr.getFileNames();   // iteration과 같은 개념. 반복
       while(enu.hasMoreElements()){
         String key = (String) enu.nextElement();   // 파일 추출
         String fileName = mr.getFilesystemName(key);
         if(fileName != null){   // 파일첨부가 되었을 때
            // boardfile table에 insert
            fileCount++;
            // 첨부 파일의 갯수만큼 fileCount가 증가함
            boardFileDTO.setBoardnum(boardnum);
            boardFileDTO.setFilename(fileName);
            dbPro.insertFile(boardFileDTO);
         }
      }
      
      if(fileCount > 0){
         dbPro.updateFile(fileCount, boardnum);
      }

      // 글쓰기가 완료되면, list 페이지로 이동
    response.sendRedirect("list.jsp");
%>
