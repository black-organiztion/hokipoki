package db;


import java.sql.*;
import javax.naming.*;
import javax.sql.DataSource;

public class JdbcUtil {
	//Connection 객체 반환하는 기능(DB접속)
	public static Connection getConnection() {
		Connection con = null;
		
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context)initCtx.lookup("java:comp/env");
			DataSource ds = (DataSource)envCtx.lookup("jdbc/hokipoki");
			con = ds.getConnection();
			con.setAutoCommit(false); //transaction 사용하려고		
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return con;
		
	}
	
	//close
	//메서드 오버로딩
	public static void close(Connection con) {
		try {
			if(con != null) {
				con.close();
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void close(Statement stmt) {
		try {
			if(stmt != null) {
				stmt.close();
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void close(ResultSet rs) {
		try {
			if(rs != null) {
				rs.close();
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	//commit
	public static void commit(Connection con) {
		try {
			con.commit();
			System.out.println("commit success");
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	//rollback
	public static void rollback(Connection con) {
		try {
			con.rollback();
			System.out.println("rollback success");
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
   