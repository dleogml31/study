<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%@ page import ="java.sql.*" %>
<%@ page import ="web.bean.dao.OracleConnection" %>
   <h1>/jsp/0416/testUpdate.jsp</h1>
   
<%

   int num = Integer.parseInt(request.getParameter("num"));
   String name = request.getParameter("name");
   String birth = request.getParameter("birth");
   String phone = request.getParameter("phone");
	
   //1,2 단계
  	Connection conn = OracleConnection.getConnection();
  
   
   String sql = "update test set name =?, birth =?, phone=? where num=?";
   PreparedStatement pstmt = conn.prepareStatement(sql);
   pstmt.setString(1, name);
   pstmt.setString(2, birth);
   pstmt.setString(3, phone);
   pstmt.setInt(4, num);
   
   int result = pstmt.executeUpdate();
   
%>   <h1>[<%=result %>][<%=name %>] 정보가 수정되었습니다</h1>
<%
   pstmt.close();
   conn.close();
%>