package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import Conn.GetConn;
import VO.UserVO;

public class UserDAO {
	GetConn getConn = GetConn.getInstance();
	
	private Connection conn = getConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql = "";
	
	UserVO vo = null;

	// 아이디 중복체크
	public String midCheck(String mid) {
		String name = "";
		try {
			sql="select * from RolexUser where mid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			if(rs.next()) name = rs.getString("name");
		} catch (SQLException e) {
			System.out.println("sql오류 : " + e.getMessage());
		}finally {
			getConn.rsClose();
		}
		return name;
	}

	//회원가입
	public int userJoin(UserVO vo) {
		int res = 0;
		try {
			sql = "insert into RolexUser values(default,?,?,?,?,?,?,?,?,?,default,default,default,default,default,default,default)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getPwd());
			pstmt.setInt(3, vo.getPwdKey());
			pstmt.setString(4, vo.getName());
			pstmt.setString(5, vo.getBirth());
			pstmt.setString(6, vo.getEmail());
			pstmt.setString(7, vo.getGetCode());
			pstmt.setString(8, vo.getAddress());
			pstmt.setString(9, vo.getEmailInfor());
			pstmt.executeUpdate();
			res = 1; 
		} catch (SQLException e) {
			System.out.println("sql오류 : " + e.getMessage());
		}finally {
			getConn.pstmtClose();
		}
		return res;
	}

	//회원탈퇴(userDel값을 'OK'로 변경한다)
	public void userDelete(String mid) {
		try {
			sql = "update RolexUser set userDel = 'OK' where mid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
	}

	// 로그인처리
	public UserVO userLogin(String mid) {
		UserVO vo = new UserVO(); 
		try {
			sql = "select * from RolexUser where mid = ? and userDel = 'NO' ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo.setMid(mid);
				vo.setPwd(rs.getString("pwd"));
				vo.setPwdKey(rs.getInt("pwdKey"));
				vo.setName(rs.getString("name"));
				vo.setLevel(rs.getInt("level"));
				vo.setBirth(rs.getString("birth"));
				vo.setEmail(rs.getString("email"));
				vo.setGetCode(rs.getString("getCode"));
				vo.setAddress(rs.getString("address"));
				vo.setEmailInfor(rs.getString("emailInfor"));
				vo.setUserDel(rs.getString("userDel"));
				vo.setPoint(rs.getInt("point"));
				vo.setLevel(rs.getInt("level"));
				vo.setVisitCnt(rs.getInt("visitCnt"));
				vo.setStartDate(rs.getString("startDate"));
				vo.setLastDate(rs.getString("lastDate"));
				vo.setTodayCnt(rs.getInt("todayCnt"));
			}
			else {
				vo = null;
			}
		} catch (SQLException e) {
			System.out.println("..sql오류 : " + e.getMessage());
		}finally {
			getConn.rsClose();
		}
		return vo;
	}


	public long getHashTableSearch(int pwdKey) {
		long pwdValue = 0;
		try {
			sql = "select * from hashTable where pwdKey = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pwdKey);
			rs = pstmt.executeQuery();
			rs.next();
			pwdValue = rs.getLong("pwdValue");
		} catch (SQLException e) {
			System.out.println("sql오류 : " + e.getMessage());
		}finally {
			getConn.rsClose();
		}
		return pwdValue;
	}

	public void setLastDateUpdate(String mid, int newPoint, int todayCnt) {
		try {
			sql = "update RolexUser set lastDate = now(), point = point + ?, visitCnt = visitCnt + 1, todayCnt = ? where mid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, newPoint);
			pstmt.setInt(2, todayCnt);
			pstmt.setString(3, mid);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
	}

	public UserVO getUserInfor(String mid) {
		vo = new UserVO();
		try {
			sql = "select * from RolexUser where mid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			rs.next();
			
			vo.setVisitCnt(rs.getInt("visitCnt"));
			vo.setTodayCnt(rs.getInt("todayCnt"));
			vo.setPoint(rs.getInt("point"));
			vo.setName(rs.getString("name"));
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return vo;
	}

	public int setUserUpdateCheck(UserVO vo) {
		int res = 0;
		try {
			sql = "update RolexUser set pwd=?,pwdKey=?,name=?,birth=?,email=?, getCode=?, address=?, emailInfor=? where mid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getPwd());
			pstmt.setInt(2, vo.getPwdKey());
			pstmt.setString(3, vo.getName());
			pstmt.setString(4, vo.getBirth());
			pstmt.setString(5, vo.getEmail());
			pstmt.setString(6, vo.getGetCode());
			pstmt.setString(7, vo.getAddress());
			pstmt.setString(8, vo.getEmailInfor());
			pstmt.setString(9, vo.getMid());
			pstmt.executeUpdate();
			res = 1;
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		return res;
	}
	
	
	
	
	
}
