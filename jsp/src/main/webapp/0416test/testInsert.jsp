<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="java.sql.*" %>
    <%@ page import ="web.bean.dao.OracleConnection" %>
<h1>/jsp/0416/testInsert.jsp</h1>

<%
	
	String name = request.getParameter("name");
	String birth = request.getParameter("birth");
	String phone = request.getParameter("phone");
	
	Connection conn = OracleConnection.getConnection();
	
	
	String sql = "insert into test values(test_seq.nextval,?,?,?)";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	pstmt.setString(1, name);
	pstmt.setString(2, birth);
	pstmt.setString(3, phone);
	
	
	int reslut = pstmt.executeUpdate();
%> <h1>[<%=name%>] 사원이 추가되었습니다</h1>
<%
	pstmt.close();
	conn.close();
%>