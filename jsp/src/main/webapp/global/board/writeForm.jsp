<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="color.jsp"%>
<html>
<head>
<title>게시판</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="script.js"></script>

<script>
	n=1;
	function fileAdd(){
		upload = document.getElementById("upload");
		upload.innerHTML =
		upload.innerHTML + "<input type='file' name='upload"+(n++)+"'><br>";
}
</script>

</head>

<% 
	int num=0,ref=1,re_step=0,re_level=0; 
	
	//답글쓰기 - 
    if(request.getParameter("num")!=null){
		num=Integer.parseInt(request.getParameter("num"));
		ref=Integer.parseInt(request.getParameter("ref"));
		re_step=Integer.parseInt(request.getParameter("re_step"));
		re_level=Integer.parseInt(request.getParameter("re_level"));
	}
%>
<body bgcolor="<%=bodyback_c%>">  
<center><b>글쓰기</b>
<br>
		<form method="post" enctype = "multipart/form-data" name="writeform" action="writePro.jsp" onsubmit="return writeSave()">
			<input type="hidden" name="num" value="<%=num%>"> 
			<input type="hidden" name="ref" value="<%=ref%>"> 
			<input type="hidden" name="re_step" value="<%=re_step%>"> 
			<input type="hidden" name="re_level" value="<%=re_level%>">
			
			<table width="400" border="1" cellspacing="0" cellpadding="0" bgcolor="<%=bodyback_c%>" align="center">
				<tr>
					<td align="right" colspan="2" bgcolor="<%=value_c%>">
						<a href="list.jsp"> 글목록</a>
					</td>
				</tr>
				<tr>
					<td width="70" bgcolor="<%=value_c%>" align="center">I D</td>
					<td width="330">
					<%
						String sid = (String)session.getAttribute("sid"); %>
					<%=sid%>
							<input type="hidden" name="writer" value="<%=sid%>">
					</td>
				</tr>
				<tr>
					<td width="70" bgcolor="<%=value_c%>" align="center">제 목</td>
					<td width="330">
						<% if (request.getParameter("num") == null) { %> 
							<input type="text" size="40" maxlength="50" name="subject">
					
						<% } else { %>
							<input type="text" size="40" maxlength="50" name="subject" value="[답변]">
						<% } %>
					</td>
				</tr>
				<tr>
					<td width="70" bgcolor="<%=value_c%>" align="center">Email</td>
					<td width="330">
						<input type="text" size="40" maxlength="30" name="email">
					</td>
				</tr>
				<tr>
					<td width="70" bgcolor="<%=value_c%>" align="center">첨부파일</td>
					<td width="330" id="upload">
						<input type="button" value="파일 추가" onclick="fileAdd();"> <br />
						<input type="file" name="upload"><br>
					</td>
				</tr>
				<tr>
					<td width="70" bgcolor="<%=value_c%>" align="center">내 용</td>
					<td width="330">
						<textarea name="content" rows="13" cols="40"></textarea>
					</td>
				</tr>
				<tr>
					<td width="70" bgcolor="<%=value_c%>" align="center">비밀번호</td>
					<td width="330">
						<input type="password" size="8" maxlength="12" name="passwd">
					</td>
				</tr>
				<tr>
					<td colspan=2 bgcolor="<%=value_c%>" align="center">
						<input type="submit" value="글쓰기"> <input type="reset" value="다시작성">
						<input type="button" value="목록보기" OnClick="window.location='list.jsp'">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>      
