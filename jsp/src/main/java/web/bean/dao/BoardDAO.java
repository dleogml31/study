package web.bean.dao;
import java.sql.*;
import web.bean.dto.BoardDTO;
import web.bean.dto.BoardFileDTO;

import java.util.*; 

public class BoardDAO {
	private static Connection conn = OracleConnection.getConnection();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = null;
	
	//파일삭제
	public void deleteOne(int boardnum , int num) {
	      try {	//보드번호로 삭제
	         sql = "delete from boardfile where num=?";
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setInt(1, num);
	         pstmt.executeUpdate();
	         
	         sql = "update board set boardfile=boardfile-1 where num=?";
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setInt(1, boardnum);
	         pstmt.executeUpdate();
	      }catch(Exception e) {
	         e.printStackTrace();
	      }finally {
	         OracleConnection.close(rs, pstmt, conn);
	      }
	   }
	
	//글번호를 받아 해당 글번호 모든걸 삭제
	public void deleteFile(int boardnum) {
		try {
			sql = "delete from boardfile where boardnum=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardnum);
			pstmt.executeUpdate();

		}catch(Exception e) {
			e.printStackTrace();
		}finally{
			OracleConnection.close(rs, pstmt, conn);
		}
	}
	
	public List<BoardFileDTO> getBoardFileList(int boardnum) {
		List<BoardFileDTO> list = new ArrayList();
		try {
			
			sql = "select * from boardfile where boardnum=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardnum);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				BoardFileDTO boardFileDTO = new BoardFileDTO();
				boardFileDTO.setNum(rs.getInt("num"));
				boardFileDTO.setBoardnum(rs.getInt("boardnum"));
				boardFileDTO.setFilename(rs.getString("filename"));
				list.add(boardFileDTO);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally{
			OracleConnection.close(rs, pstmt, conn);
		}
		return list;
	}
	
	
	public void updateFile(int count, int boardnum) {
		try {
			
			sql = "update board set boardfile=? where num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, count);
			pstmt.setInt(2, boardnum);
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally{
			OracleConnection.close(rs, pstmt, conn);
		}

	}
	
	
	public void insertFile(BoardFileDTO dto) {
		try {
			
			sql = "insert into boardfile values(boardfile_seq.nextval,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getBoardnum());
			pstmt.setString(2, dto.getFilename());
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally{
			OracleConnection.close(rs, pstmt, conn);
		}

	}
	
	
	
	public int maxNum() {
		int result = 0;
		try {
			
			pstmt = conn.prepareStatement("select count(*) from board");
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getInt(1); 
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally{
			OracleConnection.close(rs, pstmt, conn);
		}
		return result;
	}
	
	public void insertArticle(BoardDTO article) {
		int num=article.getNum();
		int ref=article.getRef();
		int re_step=article.getRe_step();
		int re_level=article.getRe_level();
		int number=0;
		try {
			
			pstmt = conn.prepareStatement("select max(num) from board");
			rs = pstmt.executeQuery();
			if (rs.next()) {
				number=rs.getInt(1)+1;	
			}else {
				number=1; 
			}
			if (num!=0) { 
				sql="update board set re_step=re_step+1 where ref= ? and re_step > ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, ref);
				pstmt.setInt(2, re_step);
				pstmt.executeUpdate();
				re_step=re_step+1;
				re_level=re_level+1;
			}else{ 
				ref=number;
				re_step=0;
				re_level=0;
			}
 
			sql = "insert into board(num,writer,email,subject,passwd,reg_date,";
			sql+="ref,re_step,re_level,content,ip) values(board_seq.NEXTVAL,?,?,?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, article.getWriter());
			pstmt.setString(2, article.getEmail());
			pstmt.setString(3, article.getSubject());
			pstmt.setString(4, article.getPasswd());
			pstmt.setTimestamp(5, article.getReg_date());
			pstmt.setInt(6, ref);
			pstmt.setInt(7, re_step);
			pstmt.setInt(8, re_level);
			pstmt.setString(9, article.getContent());
			pstmt.setString(10, article.getIp());
			pstmt.executeUpdate();
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			OracleConnection.close(rs, pstmt, conn);
		}
	}
	
	public int getArticleCount() throws Exception {
		int x=0;
		try {
			
			pstmt = conn.prepareStatement("select count(*) from board");
			rs = pstmt.executeQuery();
			if (rs.next()) {
				x= rs.getInt(1); 
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			OracleConnection.close(rs, pstmt, conn);
		}
		return x; 
	}
	
	public List getArticles(int start, int end)  {
		List articleList=null;
		try {
			pstmt = conn.prepareStatement(
					"select * from (select num,writer,email,subject,passwd,reg_date,ref,re_step,re_level,content,ip,readcount,boardfile,rownum r " +
					"from (select * from board order by ref desc, re_step asc) order by ref desc, re_step asc ) where r >= ? and r <= ? ");
			pstmt.setInt(1, start); 
			pstmt.setInt(2, end); 
			rs = pstmt.executeQuery();
			articleList = new ArrayList(end); 
			while(rs.next()){ 
				BoardDTO article= new BoardDTO();
				article.setNum(rs.getInt("num"));
				article.setWriter(rs.getString("writer"));
				article.setEmail(rs.getString("email"));
				article.setSubject(rs.getString("subject"));
				article.setPasswd(rs.getString("passwd"));
				article.setReg_date(rs.getTimestamp("reg_date"));
				article.setReadcount(rs.getInt("readcount"));
				article.setRef(rs.getInt("ref"));
				article.setRe_step(rs.getInt("re_step"));
				article.setRe_level(rs.getInt("re_level"));
				article.setContent(rs.getString("content"));
				article.setIp(rs.getString("ip"));
				article.setBoardfile(rs.getInt("boardfile"));
				articleList.add(article); 
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			OracleConnection.close(rs, pstmt, conn);
		}
		return articleList;
	}
	
	public BoardDTO getArticle(int num) {
		BoardDTO article=null;
		try {
			pstmt = conn.prepareStatement("update board set readcount=readcount+1 where num = ?"); 
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
			pstmt = conn.prepareStatement("select * from board where num = ?"); 
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				article = new BoardDTO();
				article.setNum(rs.getInt("num"));
				article.setWriter(rs.getString("writer"));
				article.setEmail(rs.getString("email"));
				article.setSubject(rs.getString("subject"));
				article.setPasswd(rs.getString("passwd"));
				article.setReg_date(rs.getTimestamp("reg_date"));
				article.setReadcount(rs.getInt("readcount"));
				article.setRef(rs.getInt("ref"));
				article.setRe_step(rs.getInt("re_step"));
				article.setRe_level(rs.getInt("re_level"));
				article.setContent(rs.getString("content"));
				article.setIp(rs.getString("ip"));
				article.setBoardfile(rs.getInt("boardfile"));
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			OracleConnection.close(rs, pstmt, conn);
		}
		
		return article;
	}
	
	
	public BoardDTO updateGetArticle(int num) {
		BoardDTO article=null;
		try {
			
			pstmt = conn.prepareStatement("select * from board where num = ?"); 
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				article = new BoardDTO();
				article.setNum(rs.getInt("num"));
				article.setWriter(rs.getString("writer"));
				article.setEmail(rs.getString("email"));
				article.setSubject(rs.getString("subject"));
				article.setPasswd(rs.getString("passwd"));
				article.setReg_date(rs.getTimestamp("reg_date"));
				article.setReadcount(rs.getInt("readcount"));
				article.setRef(rs.getInt("ref"));
				article.setRe_step(rs.getInt("re_step"));
				article.setRe_level(rs.getInt("re_level"));
				article.setContent(rs.getString("content"));
				article.setIp(rs.getString("ip"));
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			OracleConnection.close(rs, pstmt, conn);
		}

		return article;
	}
	

	public int updateArticle(BoardDTO article) {
		String dbpasswd="";
		int x=-1;
		try {
			
			pstmt = conn.prepareStatement("select passwd from board where num = ?");
			pstmt.setInt(1, article.getNum());
			rs = pstmt.executeQuery();
			if(rs.next()){
				dbpasswd= rs.getString("passwd"); 
				if(dbpasswd.equals(article.getPasswd())){
					sql="update board set writer=?,email=?,subject=?,passwd=?";
					sql+=",content=? where num=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, article.getWriter());
					pstmt.setString(2, article.getEmail());
					pstmt.setString(3, article.getSubject());
					pstmt.setString(4, article.getPasswd());
					pstmt.setString(5, article.getContent());
					pstmt.setInt(6, article.getNum());
					pstmt.executeUpdate();
					x= 1;
				}else{
					x= 0;
				}
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			OracleConnection.close(rs, pstmt, conn);
		}
		return x;
	}
	//board.num == boardfile.boardnum
	//emp.deptno == dept.deptno 
	//board 글삭제, boardfile 파일목록 삭제, boardfile 파일목록은 리턴해서 보내야함
	public List<String> deleteArticle(int num, String passwd) {
	      String dbpasswd="";
	      int x=-1;
	      int boardfile = 0;
	      List<String> fileNames = null;
	      try {
	         
	         pstmt = conn.prepareStatement("select boardfile from board where num = ?");
	         pstmt.setInt(1, num);
	         rs = pstmt.executeQuery();
	         if(rs.next()){
	            boardfile = rs.getInt("boardfile");
	            pstmt = conn.prepareStatement("delete from board where num=? and passwd=?");              
	            pstmt.setInt(1, num);
	            pstmt.setString(2, passwd);
	            x = pstmt.executeUpdate();
	            if(x == 1) {
	               if(boardfile > 0) {
	                  sql = "select filename from boardfile where boardnum=?";
	                  pstmt = conn.prepareStatement(sql);
	                  pstmt.setInt(1, num);
	                  rs = pstmt.executeQuery();
	                  fileNames = new ArrayList<>();
	                  while(rs.next()) {
	                     fileNames.add(rs.getString(1));   
	                  }
	                  pstmt = conn.prepareStatement("delete from boardfile where boardnum=?");              
	                  pstmt.setInt(1, num);
	                  pstmt.executeUpdate();
	               }
	            }   
	         }
	      } catch(Exception ex) {
	         ex.printStackTrace();
	      } finally {
	         OracleConnection.close(rs, pstmt, conn);
	      }
	      return fileNames;
	   }
	
//	
//	public Connection dbConnect(String query, String params, String crud) throws SQLException {
//		
//        pstmt = conn.prepareStatement(query);
//        String[] paramSplit = params.split(",");
//        for(int i=0; i<paramSplit.length; i++) {
//        	pstmt.setString(i+1, paramSplit[i]);
//        }
//        return conn;
//	}
	
}