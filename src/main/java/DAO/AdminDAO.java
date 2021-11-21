package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Conn.GetConn;
import VO.QuestionVO;
import VO.UserVO;

public class AdminDAO {
	GetConn getConn = GetConn.getInstance();
	
	private Connection conn = getConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql = "";
	
	UserVO vo = null;
	QuestionVO vo2 = null;

	//신규회원(준회원)의 갯수 가져오기
	public int getNewUser() {
		int newUser = 0;
		try {
			sql = "select count(*) from RolexUser where level = 1";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			newUser = rs.getInt(1);
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return newUser;
	}

	// 페이지 수 구하기
	public int totRecCnt(int level, String mid) {
		int totRecCnt = 0;
		try {
			if(level == 99 && mid.equals("")) {
				sql = "select count(*) from RolexUser";
				pstmt = conn.prepareStatement(sql);
			}else if(level != 99 && mid.equals("")){
				sql = "select count(*) from RolexUser where level = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, level);
			}else {
				sql = "select count(*) from RolexUser where mid like ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%"+mid+"%");
			}
			rs = pstmt.executeQuery();
			rs.next();
			totRecCnt = rs.getInt(1);
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return totRecCnt;
	}

	// 회원 리스트
	public ArrayList<UserVO> getMemberList(int startIndexNo, int pageSize, int level, String mid) {
		ArrayList<UserVO> vos = new ArrayList<UserVO>();
		try {
			if(level == 99 && mid.equals("")) {
				sql = "select * from RolexUser order by idx desc limit ?, ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, startIndexNo);
				pstmt.setInt(2, pageSize);
			}else if(level != 99 && mid.equals("")){
				sql = "select * from RolexUser where level = ? order by idx desc limit ?, ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, level);
				pstmt.setInt(2, startIndexNo);
				pstmt.setInt(3, pageSize);
			}else {
				sql = "select * from RolexUser where mid like ? order by idx desc limit ?, ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%"+mid+"%");
				pstmt.setInt(2, startIndexNo);
				pstmt.setInt(3, pageSize);
			}
			rs = pstmt.executeQuery();
			while(rs.next()) {
				vo = new UserVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
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
				
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return vos;
	}

	// 회원 등급 변경처리
	public void setUserLevelChange(int idx, int level) {
		try {
			sql = "update RolexUser set level = ? where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, level);
			pstmt.setInt(2, idx);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
	}

	public void setUserReset(int idx) {
		try {
			sql="delete from RolexUser where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		
	}

	public UserVO getUserInfor(int idx) {
		vo = new UserVO();
		try {
			sql = "select * from RolexUser where idx = ?";
			pstmt= conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
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
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return vo;
	}

	// 공지사항 페이지
	public int totRecCnt() {
		int totRecCnt = 0;
		try {
			sql="select count(*) from question";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) totRecCnt=rs.getInt(1);
		} catch (SQLException e) {
			System.out.println("sql 오류 : " + e.getMessage());
		}finally {
			getConn.rsClose();
		}
		
		return totRecCnt;
	}

	// 공지사항 리스트
	public List<QuestionVO> questionList(int startIndexNo, int pageSize) {
		List<QuestionVO> vos = new ArrayList<QuestionVO>();
		try {
			sql = "select * from question order by idx desc limit ?,?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startIndexNo);
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo2 = new QuestionVO();
				vo2.setIdx(rs.getInt("idx"));
				vo2.setName(rs.getString("name"));
				vo2.setTitle(rs.getString("title"));
				vo2.setvDate(rs.getString("vDate"));
				vo2.setvCount(rs.getInt("vCount"));
				vo2.setContent(rs.getString("content"));
				
				vos.add(vo2);
			}
		} catch (SQLException e) {
			System.out.println("sql 오류 : " + e.getMessage());
		}finally {
			getConn.rsClose();
		}
		return vos;
	}
	
	
	
	
}
