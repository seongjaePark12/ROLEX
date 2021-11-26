package conn;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class GetConn {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String driver = "com.mysql.jdbc.Driver";
	private String url = "jdbc:mysql://localhost:3306/java06_psj";
	private String user = "root";
	private String password = "1234";
	
	private GetConn() {
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 검색 실패" +e.getMessage());
		} catch (SQLException e) {
			System.out.println("데이터베이스 연동 실패");
		}
	}
	
	private static GetConn instance = new GetConn();
	
	public static GetConn getInstance() {
		return instance;
	}
	
	public Connection getConn() {
		return conn;
	}
	
	public void rsClose() {
		if(rs != null) {
			try {
				rsClose();
				pstmtClose();
			} catch (Exception e) {}
		}
	}
	public void pstmtClose() {
		if(pstmt != null) {
			try {
				pstmtClose();
			} catch (Exception e) {}
		}
	}
}
