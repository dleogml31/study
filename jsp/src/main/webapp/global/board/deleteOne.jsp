<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="web.bean.dao.BoardDAO" %>
<%@ page import="java.io.File" %>
<%
   int boardnum = Integer.parseInt(request.getParameter("boardnum"));
   int num = Integer.parseInt(request.getParameter("num"));
   String filename = request.getParameter("filename");
   String pageNum = request.getParameter("pageNum");
   BoardDAO dao = new BoardDAO();
   dao.deleteOne(boardnum, num);
   
   String path = request.getRealPath("global/board/upload");
   File f = new File(path + "/" + filename);
   f.delete();
%>
<script>
   window.location=
	   "updateFileForm.jsp?num=<%=boardnum%>&pageNum=<%=pageNum%>";
</script>










