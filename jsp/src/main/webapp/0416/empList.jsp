<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Timestamp" %>
<h1>/jsp/0416/empList.jsp</h1>

<%
	// 1단계. JDBC 드라이버 로드 (Oracle)	//ojdbc11.jar
	//JDBC 기술 실행중	//DriverManager 클래스에 의해 관리된다
	Class.forName("oracle.jdbc.driver.OracleDriver");

	//2단계. DB 로그인 
	String dbURL="jdbc:oracle:thin:@localhost:1521:orcl";
	String user = "scott";
	String dbpw = "tiger";
	Connection conn = DriverManager.getConnection(dbURL, user, dbpw);
	
	//3단계 SQL Query 작성
	String sql = "select * from emp";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	//4단계 SQL Query 실행
	//select - executeQuery();
	//그외 - executeUpdate();
	ResultSet rs = pstmt.executeQuery();
	
	//5단계 결과추출 - select문 실행만
	while(rs.next()){
		int no = rs.getInt("empno");
		String name = rs.getString("ename");
		Timestamp hire = rs.getTimestamp("hiredate");
		%>	<h2><%=no%> <%=name%> <%=hire%> </h2>
<% } 
	rs.close();
	pstmt.close();
	conn.close();
