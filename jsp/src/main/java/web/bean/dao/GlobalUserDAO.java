package web.bean.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import web.bean.dto.GlobalUserDTO;

public class GlobalUserDAO {
	//3,4,5 단계
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = null;

	public int loginCheck(GlobalUserDTO dto) {
		int result = 0 ;
		try {
			conn = OracleConnection.getConnection(); // 1,2단계
			sql = "select count(*) from global_user where id=? and pw=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,dto.getId());
			pstmt.setString(2,dto.getPw());
			rs = pstmt.executeQuery();
			rs.next();
			result = rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			OracleConnection.close(rs, pstmt, conn);
		}
		return result;
	}
	//회원가입
	public void userInput(GlobalUserDTO dto) {
		try {
			conn = OracleConnection.getConnection();
			sql="insert into global_user(id,pw,name,birth,phone)"+"values(?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,dto.getId());
			pstmt.setString(2,dto.getPw());
			pstmt.setString(3,dto.getName());
			pstmt.setString(4,dto.getBirth());
			pstmt.setString(5,dto.getPhone());

			pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			OracleConnection.close(rs, pstmt, conn);
		}
	}
	//중복확인

	public int idCheck(String id) {
		int result = 0 ;
		try {
			conn = OracleConnection.getConnection(); // 1,2단계
			sql = "select count(*) from global_user where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,id);
			rs = pstmt.executeQuery();
			rs.next();
			result = rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			OracleConnection.close(rs, pstmt, conn);
		}
		return result;
	}

	public GlobalUserDTO user(String id) {
		System.out.println("test ==>");
		GlobalUserDTO dto = null;
		try {
			conn = OracleConnection.getConnection();
			sql="select * from global_user where id=?";
			pstmt = conn.prepareStatement(sql);
			//여기가 조회가안됨  조회카운트 0 id가 null이라서
			pstmt.setString(1,id);
			rs = pstmt.executeQuery();
			rs.next();
			
			dto = new GlobalUserDTO();
			dto.setId(rs.getString("id"));
			dto.setPw(rs.getString("pw"));
			dto.setName(rs.getString("name"));
			dto.setBirth(rs.getString("birth").split(" ")[0]);
			dto.setPhone(rs.getString("phone"));
			dto.setImg(rs.getString("img"));
			dto.setReg(rs.getTimestamp("reg"));
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			OracleConnection.close(rs, pstmt, conn);
		}
		return dto;
	}

	public void imgChange(String img,String id) {
		try {
			conn = OracleConnection.getConnection();
			sql="update global_user set img=? where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,img);
			pstmt.setString(2,id);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			OracleConnection.close(rs, pstmt, conn);
		}
	}

	public void userUpdate(GlobalUserDTO dto) {
		try {
			conn = OracleConnection.getConnection();
			sql="update global_user set pw=?,name=?,birth=?,phone=? where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,dto.getPw());
			pstmt.setString(2,dto.getName());
			pstmt.setString(3,dto.getBirth());
			pstmt.setString(4,dto.getPhone());
			pstmt.setString(5,dto.getId());

			pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			OracleConnection.close(rs, pstmt, conn);
		}
	}
	public int userDelete(String id,String pw) {
		int result = 0 ;
		try {
			conn = OracleConnection.getConnection(); // 1,2단계
			sql = "delete from global_user where id=? and pw=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,id);
			pstmt.setString(2,pw);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			OracleConnection.close(rs, pstmt, conn);
		}
		return result;
	}
	public GlobalUserDTO userId(String name,String phone) {
		GlobalUserDTO dto = null;
		try {
			conn = OracleConnection.getConnection();
			sql="select * from global_user where name=? and phone=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,name);
			pstmt.setString(2,phone);
			rs = pstmt.executeQuery();
			rs.next();
			dto = new GlobalUserDTO();
			dto.setId(rs.getString("id"));
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			OracleConnection.close(rs, pstmt, conn);
		}
		return dto;
	}
	public GlobalUserDTO userPw(String id,String phone) {
		GlobalUserDTO dto = null;
		try {
			conn = OracleConnection.getConnection();
			sql="select * from global_user where id=? and phone=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,id);
			pstmt.setString(2,phone);
			rs = pstmt.executeQuery();
			rs.next();
			dto = new GlobalUserDTO();
			dto.setPw(rs.getString("pw"));
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			OracleConnection.close(rs, pstmt, conn);
		}
		return dto;
	}
}
