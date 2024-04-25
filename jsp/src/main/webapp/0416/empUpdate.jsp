<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%@ page import ="java.sql.*" %>
<%@ page import ="web.bean.dao.OracleConnection" %>
   <h1>/jsp/0416/empUpdate.jsp</h1>
   
<%

   String empno = request.getParameter("empno");
   String sal = request.getParameter("sal");
   String comm = request.getParameter("comm");
	
   //1,2 단계
  	Connection conn = OracleConnection.getConnection();
  
   
   String sql = "update emp set sal =?, comm =? where empno=?";
   PreparedStatement pstmt = conn.prepareStatement(sql);
   pstmt.setString(1, sal);
   pstmt.setString(2, comm);
   pstmt.setString(3, empno);
   
   int result = pstmt.executeUpdate();
   
%>   <h1>[<%=result %>][<%=empno %>] 정보가 수정되었습니다</h1>
<%
   pstmt.close();
   conn.close();
%>
