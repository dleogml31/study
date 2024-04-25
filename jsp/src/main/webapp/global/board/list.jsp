<%@ page contentType = "text/html; charset=UTF-8" %>
<%@ page import = "web.bean.dao.BoardDAO" %>
<%@ page import = "web.bean.dto.BoardDTO" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ include file="color.jsp"%>

<%
	int pageSize = 10;	//한페이지의 나타낼 글의 갯수 (한페이지에 최대 10개 글 가능)
	
	//글작성 시간 년/월/일/시:분 
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
	//리스트 하단 페이지번호 클릭시 전달받는 파라미터
    String pageNum = request.getParameter("pageNum");
    if (pageNum == null) {
        pageNum = "1";
    }

    int currentPage = Integer.parseInt(pageNum);	//1
    int startRow = (currentPage - 1) * pageSize + 1;	// (1-1) * 10 + 1 = 1
    int endRow = currentPage * pageSize;	// ex) 1페이지라면 1 * 10 
    int count = 0;
    List articleList = null;
    BoardDAO dbPro = new BoardDAO();
    count = dbPro.getArticleCount();	//전체글 수
    if (count > 0) {
        articleList = dbPro.getArticles(startRow, endRow);
    }

%>
<html>
<head>
<title>게시판</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>

<body bgcolor="<%=bodyback_c%>">
<center><b>글목록(전체 글:<%=count%>)</b>
	<table width="700">
		<tr>
			<td align="right" bgcolor="<%=value_c%>">
			<%
				String sid = (String)session.getAttribute("sid");
				if(sid != null){
			%>	<a href="writeForm.jsp">글쓰기</a>
			<% }else{%>
				<a href="/jsp/global/user/login.jsp">로그인 후 글쓰기 사용가능</a>
			<%}%>
			</td>
		</tr>
	</table>

<% if (count == 0) { %>
	<table width="700" border="1" cellpadding="0" cellspacing="0">
		<tr>
    		<td align="center">
    			게시판에 저장된 글이 없습니다.
    		</td>
    	</tr>
	</table>
<% } else {    %>
	<table border="1" width="700" cellpadding="0" cellspacing="0" align="center"> 
    	<tr height="30" bgcolor="<%=value_c%>"> 
      		<td align="center"  width="50"  >번 호</td> 
      		<td align="center"  width="250" >제   목</td> 
      		<td align="center"  width="100" >작성자</td>
      		<td align="center"  width="150" >작성일</td> 
      		<td align="center"  width="50" >조 회</td> 
      		<td align="center"  width="100" >IP</td>    
    	</tr>
<%  
        for (int i = 0 ; i < articleList.size() ; i++) {
        	BoardDTO article = (BoardDTO)articleList.get(i);
%>
			<tr height="30">
	   			<td align="center"  width="50" > <%=article.getNum()%></td>
			<td  width="250" >
<%
			    int wid=0; 
			    if(article.getRe_level()>0){
					wid=5*(article.getRe_level());
%>
				  <img src="images/level.gif" width="<%=wid%>" height="16">
				  <img src="images/re.gif">
<%		  		}else{ %>
				  <img src="images/level.gif" width="<%=wid%>" height="16">
<%		  		} %>
				  <a href="content.jsp?num=<%=article.getNum()%>&pageNum=<%=currentPage%>">
						<%=article.getSubject()%>
				  </a> <%--//목록에 잇는 글을 읽으러 가는 --%>
				  <%if(article.getBoardfile() > 0){ %>
				  	<img src="images/down.jpg" width = "15">
				  <%}%>
<% 		  		if(article.getReadcount()>=20){%>
		         	<img src="images/hot.gif" border="0"  height="16">
<%				} %> 
	        </td>
			<td align="center"  width="100"> 
				<a href="mailto:<%=article.getEmail()%>"><%=article.getWriter()%></a>
			</td>
		    <td align="center"  width="150"><%= sdf.format(article.getReg_date())%></td>
		    <td align="center"  width="50"><%=article.getReadcount()%></td>
		    <td align="center" width="100" ><%=article.getIp()%></td>
		</tr>
	<%}%>
</table>
<%}%>
<%
    if (count > 0) {
        int pageCount = count / pageSize + ( count % pageSize == 0 ? 0 : 1);
        int startPage = (int)(currentPage/10)*10+1;
		int pageBlock=10;
        int endPage = startPage + pageBlock-1;
        if (endPage > pageCount) endPage = pageCount;
        if (startPage > 10) {    %>
        <a href="list.jsp?pageNum=<%= startPage - 10 %>">[이전]</a>
<%      }
        for (int i = startPage ; i <= endPage ; i++) {  %>
        <a href="list.jsp?pageNum=<%= i %>">[<%= i %>]</a>
<%
        }
        if (endPage < pageCount) {  %>
        <a href="list.jsp?pageNum=<%= startPage + 10 %>">[다음]</a>
<%
        }
    }
%>
</center>
</body>
</html>