package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import conn.GetConn;
import vo.SimpleVO;

public class SimpleDAO {
	GetConn getConn = GetConn.getInstance();
	private Connection conn = getConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql ="";
	SimpleVO vo = null;
	
	// 게시글 전체보기
	public List<SimpleVO> getSimpleList(int startIndexNo, int pageSize) {
		List<SimpleVO> vos = new ArrayList<SimpleVO>();
		try {
			sql = "select * from RolexSimple order by idx desc limit ?,?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startIndexNo);
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo = new SimpleVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setTitle(rs.getString("title"));
				vo.setWhat(rs.getString("what"));
				vo.setContent(rs.getString("content"));
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("getNoticeList sql에러" + e.getMessage());
		}finally {
			getConn.rsClose();
		}
		return vos;
	}

	//입력창
	public int setSimpleInput(SimpleVO vo) {
		int res = 0;
		try {
			sql = "insert into RolexSimple values (default,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getWhat());
			pstmt.setString(3, vo.getContent());
			pstmt.executeUpdate();
			res = 1;
		} catch (SQLException e) {
			System.out.println("sql에러" + e.getMessage());
		}finally {
			getConn.pstmtClose();
		}
		return res;
	}

	// 게시글의 총 건수 수해오기
	public int totRecCnt() {
		int totRecCnt = 0;
		try {
			sql = "select count(*) from RolexSimple";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			totRecCnt = rs.getInt(1);
		} catch (SQLException e) {
			System.out.println("sql에러" + e.getMessage());
		}finally {
			getConn.rsClose();
		}
		return totRecCnt;
	}

	// 삭제
	public void setSimpleDelete(int idx) {
		try {
			sql = "delete from RolexSimple where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("sql에러" + e.getMessage());
		}finally {
			getConn.pstmtClose();
		}
	}
}
