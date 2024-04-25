<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ page import ="java.sql.*" %>
<%@ page import ="web.bean.dao.OracleConnection" %>

<h1>/jsp/0416/testDelete.jsp</h1>

<%
	String num = request.getParameter("num");
	Connection conn = OracleConnection.getConnection();
	String sql = "delete from test where num=?";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, num);
	int result = pstmt.executeUpdate();
	if(result == 1){
		out.println("<h1>삭제 되었습니다</h1>");
	}else{
		out.println("<h1>사원번호를 다시 입력하세요</h1>");
	}
	pstmt.close();
	conn.close();
%>