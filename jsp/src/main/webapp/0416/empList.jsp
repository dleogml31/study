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
	// 1�ܰ�. JDBC ����̹� �ε� (Oracle)	//ojdbc11.jar
	//JDBC ��� ������	//DriverManager Ŭ������ ���� �����ȴ�
	Class.forName("oracle.jdbc.driver.OracleDriver");

	//2�ܰ�. DB �α��� 
	String dbURL="jdbc:oracle:thin:@localhost:1521:orcl";
	String user = "scott";
	String dbpw = "tiger";
	Connection conn = DriverManager.getConnection(dbURL, user, dbpw);
	
	//3�ܰ� SQL Query �ۼ�
	String sql = "select * from emp";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	//4�ܰ� SQL Query ����
	//select - executeQuery();
	//�׿� - executeUpdate();
	ResultSet rs = pstmt.executeQuery();
	
	//5�ܰ� ������� - select�� ���ุ
	while(rs.next()){
		int no = rs.getInt("empno");
		String name = rs.getString("ename");
		Timestamp hire = rs.getTimestamp("hiredate");
		%>	<h2><%=no%> <%=name%> <%=hire%> </h2>
<% } 
	rs.close();
	pstmt.close();
	conn.close();
