<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import = "web.bean.dao.BoardDAO" %>
<%@ page import = "web.bean.dto.BoardDTO" %>
<%@ page import = "java.sql.Timestamp" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.io.File" %>
<% request.setCharacterEncoding("UTF-8");%>
<%
	//deleteForm에서 보낸 값 받는
  int num = Integer.parseInt(request.getParameter("num"));
  String pageNum = request.getParameter("pageNum");
  String passwd = request.getParameter("passwd");

  BoardDAO dbPro = new BoardDAO();
  List<String> fileNames = dbPro.deleteArticle(num, passwd);
  if(fileNames != null){
	  String path = request.getRealPath("global/board/upload");
	  for(String fn : fileNames){
		  File f = new File(path= "/" + fn);
		  f.delete();
	  }
  }
		//0초안에 이동 
%>	<meta http-equiv="Refresh" content="0;url=list.jsp?pageNum=<%=pageNum%>" >
	