package loginJoin;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class LoginPDAO {
	private Connection conn = null;
	private Statement stmt = null;
	private ResultSet rs = null;
	
	private String sql = "";
	
	LoginPVO vo = null;
	private String url = "jdbc:mysql://localhost:3306/javacourse";
	private String user = "root";
	private String password = "1234";
	
	public LoginPDAO() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 검색x");
		} catch (SQLException e) {
			System.out.println("Database 연동x");
			e.printStackTrace();
		}
	}
	
	//Open된 객체 Close
	public void stmtClose() {
		if(stmt != null) {
			try {
				stmt.close();
			} catch (SQLException e) {}
		}
	}
	public void rsClose() {
		if(rs != null) {
			try {
				rs.close();
				stmtClose();
			} catch (SQLException e) {}
		}
	}
	
	public LoginPVO loginCheck(String mid, String pwd) {
		vo = new LoginPVO();
		
		try {
			sql="select * from join1 where mid='"+mid+"' and pwd= '"+pwd+"'";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(mid);
				vo.setName(rs.getString("name"));
				vo.setBirth(rs.getString("birth"));
				vo.setGender(rs.getString("gender"));
				vo.setEmail(rs.getString("email"));
				vo.setGetCode(rs.getString("getCode"));
				vo.setLastDate(rs.getString("lastDate"));
				vo.setvCount(rs.getInt("vCount")+1);
				vo.setPoint(rs.getInt("point"));
			}
		} catch (SQLException e) {
			System.out.println("sql 에러 :" + e.getMessage());
		}finally {
			rsClose();
		}
		return vo;
	}
	
	public void vCountUpdate(String mid) {
		try {
			sql = "update join1 set vCount = vCount + 1 where mid='"+mid+"'";
			stmt = conn.createStatement();
			stmt.executeUpdate(sql);
		} catch (SQLException e) {
			System.out.println("sql 에러 :" + e.getMessage());
		}finally {
			stmtClose();
		}
	}
	
	public void PointUpdate(String mid) {
		try {
			sql = "update join1 set point = point + 50 where mid='"+mid+"'";
			stmt = conn.createStatement();
			stmt.executeUpdate(sql);
		} catch (SQLException e) {
			System.out.println("sql 에러 :" + e.getMessage());
		}finally {
			stmtClose();
		}
	}
	
	//회원가입
	public int joinP(LoginPVO vo) {
		try {
			sql = "insert into join1 values (default,'"+vo.getMid()+"','"+vo.getPwd()+"','"+vo.getName()+"','"+vo.getBirth()+"','"+vo.getGender()+"','"+vo.getEmail()+"','"+vo.getGetCode()+"',default,default, default)";
			stmt = conn.createStatement();
			stmt.executeUpdate(sql);
			return 1;
		} catch (SQLException e) {
			System.out.println("sql 에러 :" + e.getMessage());
		}finally {
			stmtClose();
		}
		return 0;
	}
	
	// 회원 탈퇴
	public boolean loginDel(String mid) {
		try {
			sql = "delete from join1 where mid='"+mid+"'";
			stmt = conn.createStatement();
			stmt.executeUpdate(sql);
			return true;
		} catch (SQLException e) {
			System.out.println("sql 에러 :" + e.getMessage());
		}finally {
			stmtClose();
		}
		return false;
	}
	
//회원 전체조회
	public ArrayList<LoginPVO> loginList(){
		ArrayList<LoginPVO> vos = new ArrayList<>();
		try {
			sql = "select * from join1 order by name";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				vo = new LoginPVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setPwd(rs.getString("pwd"));
				vo.setName(rs.getString("name"));
				vo.setBirth(rs.getString("birth"));
				vo.setGender(rs.getString("gender"));
				vo.setEmail(rs.getString("email"));
				vo.setGetCode(rs.getString("getCode"));
				vo.setLastDate(rs.getString("lastDate"));
				vo.setvCount(rs.getInt("vCount"));
				vo.setPoint(rs.getInt("point"));
				
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("sql 에러 :" + e.getMessage());
		}finally {
			rsClose();
		}
		return vos;
	}
	
	public LoginPVO idCheck(String mid) {
		vo = new LoginPVO();
		try {
			sql = "select * from join1 where mid ='"+mid+"'";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()) {
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(mid);
				vo.setPwd(rs.getString("pwd"));
				vo.setBirth(rs.getString("birth"));
				vo.setGender(rs.getString ("gender"));
				vo.setEmail(rs.getString ("email"));
				vo.setGetCode(rs.getString("getCode"));
				vo.setLastDate(rs.getString("lastDate"));
				vo.setvCount(rs.getInt("vCount"));
				vo.setPoint(rs.getInt("point"));
			}
			else {
				return null;
			}
		} catch (SQLException e) {
			System.out.println("sql에러 :" + e.getMessage() + " : " + sql);
		} finally {
			rsClose();
		}
		return vo;
	}
}
