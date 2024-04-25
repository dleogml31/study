<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="java.sql.*" %>
<h1>/jsp/0416/empInsert.jsp</h1>

<%
	int empno = Integer.parseInt(request.getParameter("empno"));
	String ename = request.getParameter("ename");
	String job = request.getParameter("job");
	String mgr = request.getParameter("mgr");
	String hiredate = request.getParameter("hiredate");
	String sal = request.getParameter("sal");
	String comm = request.getParameter("comm");
	String deptno = request.getParameter("deptno");
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String dbURL="jdbc:oracle:thin:@localhost:1521:orcl";
	String user = "scott";
	String dbpw = "tiger";
	Connection conn = DriverManager.getConnection(dbURL, user, dbpw);
	
	String sql = "insert into emp values(?,?,?,?,?,?,?,?)";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1, empno);
	pstmt.setString(2, ename);
	pstmt.setString(3, job);
	pstmt.setString(4, mgr);
	pstmt.setString(5, hiredate);
	pstmt.setString(6, sal);
	pstmt.setString(7, comm);
	pstmt.setString(8, deptno);
	
	int reslut = pstmt.executeUpdate();
%> <h1>[<%=ename%>] 사원이 추가되었습니다</h1>
<%
	pstmt.close();
	conn.close();
%>