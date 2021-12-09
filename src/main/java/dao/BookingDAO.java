package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import conn.GetConn;
import conn.TimeDiff;
import vo.BookingVO;

public class BookingDAO {
	GetConn getConn = GetConn.getInstance();
	private Connection conn = getConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql ="";
	BookingVO vo = null;
	
	// 관리자 페이지 예약 리스트
	public List<BookingVO> getBookingList(int startIndexNo, int pageSize) {
		List<BookingVO> vos = new ArrayList<BookingVO>();
		try {
			sql = "select * from booking order by idx desc limit ?,?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startIndexNo);
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo = new BookingVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setName(rs.getString("name"));
				vo.setBooTime(rs.getString("booTime"));
				vo.setContent(rs.getString("content"));
				
				// 날짜를 24시간제로 체크하기위해서 사용자정의 메소드로 만든 timeDiff()를 사용한다
				vo.setBooDate(rs.getString("booDate"));		//만약 wDate가 날짜 타입일경우
				vo.setwCdate(rs.getString("booDate"));	//날짜타입 wDate를 문자타입 wCdate로 저장후
				TimeDiff timeDiff = new TimeDiff();
				int res =  timeDiff.timeDiff(vo.getwCdate());		//문자타입 wCdate를 timeDiff()메소드 인자값으로 보내어서 오늘시간과 계산하여 시간차를 돌려받는다
				vo.setwNdate(res); 		//시간차를 숫자형식 변수에 저장시켜준다
				
				vo.setMid(rs.getString("mid"));
				
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("sql에러" + e.getMessage());
		}finally {
			getConn.rsClose();
		}
		return vos;
	}

	//관리자 페이지 최근 예약 리스트
	public List<BookingVO> getBookingLately(int startIndexNo, int pageSize, int lately) {
		List<BookingVO> vos = new ArrayList<BookingVO>();
		try {
			sql = "select * from booking where date_sub(now(), interval ? day) < booDate order by idx desc limit ?,?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, lately);
			pstmt.setInt(2, startIndexNo);
			pstmt.setInt(3, pageSize);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo = new BookingVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setName(rs.getString("name"));
				vo.setBooTime(rs.getString("booTime"));
				vo.setContent(rs.getString("content"));
				
				// 날짜를 24시간제로 체크하기위해서 사용자정의 메소드로 만든 timeDiff()를 사용한다
				vo.setBooDate(rs.getString("booDate"));		//만약 wDate가 날짜 타입일경우
				vo.setwCdate(rs.getString("booDate"));	//날짜타입 wDate를 문자타입 wCdate로 저장후
				TimeDiff timeDiff = new TimeDiff();
				int res =  timeDiff.timeDiff(vo.getwCdate());		//문자타입 wCdate를 timeDiff()메소드 인자값으로 보내어서 오늘시간과 계산하여 시간차를 돌려받는다
				vo.setwNdate(res); 		//시간차를 숫자형식 변수에 저장시켜준다
				
				vo.setMid(rs.getString("mid"));
				
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("sql에러" + e.getMessage());
		}finally {
			getConn.rsClose();
		}
		return vos;
	}

	// 게시글의 총 건수 수해오기
	public int totRecCnt() {
		int totRecCnt = 0;
		try {
			sql = "select count(*) from booking";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			totRecCnt = rs.getInt(1);
		} catch (SQLException e) {
			System.out.println("totRecCnt sql에러" + e.getMessage());
		}finally {
			getConn.rsClose();
		}
		return totRecCnt;
	}
	
	//최근 글 갯수 가져오기
	public int totRecCntLately(int lately) {
		int totRecCnt = 0;
		try {
			sql = "select count(*) from booking where date_sub(now(), interval ? day) < booDate";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, lately);
			rs = pstmt.executeQuery();
			rs.next();
			totRecCnt = rs.getInt(1);
		} catch (SQLException e) {
			System.out.println("totRecCntLately sql에러" + e.getMessage());
		}finally {
			getConn.rsClose();
		}
		return totRecCnt;
	}

	public BookingVO getBookingContent(int idx) {
		vo = new BookingVO();
		try {
			sql = "select * from booking where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo.setIdx(idx);
				vo.setMid(rs.getString("mid"));
				vo.setName(rs.getString("name"));
				vo.setBooDate(rs.getString("booDate"));
				vo.setBooTime(rs.getString("booTime"));
				vo.setContent(rs.getString("content"));
			}
		} catch (SQLException e) {
			System.out.println(" sql에러" + e.getMessage());
		}finally {
			getConn.rsClose();
		}
		return vo;
	}

	public BookingVO preNextSearch(String str, int idx) {
		vo = new BookingVO();
		try {
			if(str.equals("pre")) {
				sql = "select * from booking where idx < ? order by idx desc limit 1";
			}
			else {
				sql = "select * from booking where idx > ? limit 1;";
			}
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			
			if(str.equals("pre") && rs.next()){
				vo.setPreIdx(rs.getInt("idx"));
				vo.setPreTitle(rs.getString("mid"));
			}
			else if(str.equals("next") && rs.next()) {
				vo.setNextIdx(rs.getInt("idx"));
				vo.setNextTitle(rs.getString("mid"));
			}else {
				vo.setPreIdx(0);
				vo.setNextIdx(0);
			}
		} catch (SQLException e) {
			System.out.println("sql에러" + e.getMessage());
		}finally {
			getConn.rsClose();
		}
		return vo;
	}

	public BookingVO getBookingUserContent(String ymd, String mid) {
		vo = new BookingVO();
		try {
			sql ="select * from booking where date(booDate) =? and mid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ymd);
			pstmt.setString(2, mid);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(mid);
				vo.setName(rs.getString("name"));
				vo.setBooDate(rs.getString("booDate"));
				vo.setBooTime(rs.getString("booTime"));
				vo.setContent(rs.getString("content"));
			}
		} catch (SQLException e) {
			System.out.println("sql 에러" + e.getMessage());
		}finally {
			getConn.rsClose();
		}
		return vo;
	}
	
	//일정관리 등록 및 수정 처리하기
	public int setBookingContentOk(BookingVO vo) {
		int res = 0;
		try {
			if(vo.getIdx() == 0) {
				sql = "insert into booking values (default,?,?,?,?,?)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, vo.getMid());
				pstmt.setString(2, vo.getName());
				pstmt.setString(3, vo.getBooDate());
				pstmt.setString(4, vo.getBooTime());
				pstmt.setString(5, vo.getContent());
			}
			else {
				sql = "update booking set bootime=? content=? where idx=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, vo.getBooTime());
				pstmt.setString(2, vo.getContent());
				pstmt.setInt(3, vo.getIdx());
			}
			pstmt.executeUpdate();
			res = 1;
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		return res;
	}

	// 일정삭제하기
	public int setBookingDelete(int idx) {
		int res = 0;
		try {
			sql="delete from booking where idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
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
