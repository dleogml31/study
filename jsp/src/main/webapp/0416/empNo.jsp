<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Timestamp" %>
<h1>/jsp/0416/empNo.jsp</h1>

<%
	int empno = Integer.parseInt(request.getParameter("empno"));

	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String dbURL="jdbc:oracle:thin:@localhost:1521:orcl";
	String user = "scott";
	String dbpw = "tiger";
	Connection conn = DriverManager.getConnection(dbURL, user, dbpw);
	
	String sql = "select * from emp where empno = ? ";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1, empno);
	
	ResultSet rs = pstmt.executeQuery();
	if(rs.next()){
	
		int no = rs.getInt("empno");
		String name = rs.getString("ename");
		Timestamp hire = rs.getTimestamp("hiredate");	
	%>	<h2><%=no%> <%=name%> <%=hire%> </h2>
	<%}else{
	%> <h2> [<%=empno %>] 없는 사원번호 입니다</h2>
	<%}
	rs.close();
	pstmt.close();
	conn.close();
%>