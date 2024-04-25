package web.bean.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class OracleConnection {
	
	public static Connection getConnection() {
		Connection conn = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String dbURL="jdbc:oracle:thin:@localhost:1521:orcl";
			String user = "scott";
			String dbpw = "tiger";
			conn = DriverManager.getConnection(dbURL, user, dbpw);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	public static void close(ResultSet rs, 
					  PreparedStatement pstmt,
					  Connection conn) {
		
	}
}
