package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import conn.GetConn;
import conn.TimeDiff;
import vo.NoticeVO;
import vo.ReplyQuestionVO;

public class NoticeDAO {
	GetConn getConn = GetConn.getInstance();
	private Connection conn = getConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql ="";
	NoticeVO vo = null;
	ReplyQuestionVO replyVO = null;
	
	// 게시글 전체보기
	public List<NoticeVO> getNoticeList(int startIndexNo, int pageSize) {
		List<NoticeVO> vos = new ArrayList<NoticeVO>();
		try {
			sql = "select * from RolexNotice order by idx desc limit ?,?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startIndexNo);
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo = new NoticeVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				
				// 날짜를 24시간제로 체크하기위해서 사용자정의 메소드로 만든 timeDiff()를 사용한다
				vo.setwDate(rs.getString("wDate"));		//만약 wDate가 날짜 타입일경우
				vo.setwCdate(rs.getString("wDate"));	//날짜타입 wDate를 문자타입 wCdate로 저장후
				TimeDiff timeDiff = new TimeDiff();
				int res =  timeDiff.timeDiff(vo.getwCdate());		//문자타입 wCdate를 timeDiff()메소드 인자값으로 보내어서 오늘시간과 계산하여 시간차를 돌려받는다
				vo.setwNdate(res); 		//시간차를 숫자형식 변수에 저장시켜준다
				
				vo.setReadNum(rs.getInt("readNum"));
				vo.setHostIp(rs.getString("hostIp"));
				vo.setMid(rs.getString("mid"));
				
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
	public int setNoticeInput(NoticeVO vo) {
		int res = 0;
		try {
			sql = "insert into RolexNotice values (default,?,?,?,default,default,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getTitle());
			pstmt.setString(3, vo.getContent());
			pstmt.setString(4, vo.getHostIp());
			pstmt.setString(5, vo.getfName());
			pstmt.setString(6, vo.getfSName());
			pstmt.setInt(7, vo.getfSize());
			pstmt.executeUpdate();
			res = 1;
		} catch (SQLException e) {
			System.out.println("setNoticeInput sql에러" + e.getMessage());
		}finally {
			getConn.pstmtClose();
		}
		return res;
	}

	// 게시글의 총 건수 수해오기
	public int totRecCnt() {
		int totRecCnt = 0;
		try {
			sql = "select count(*) from RolexNotice";
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

	// 게시글 내용 상세보기
	public NoticeVO getNoticeContent(int idx) {
		vo = new NoticeVO();
		try {
			sql = "select * from RolexNotice where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo.setIdx(idx);
				vo.setMid(rs.getString("mid"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setwDate(rs.getString("wDate"));
				vo.setReadNum(rs.getInt("readNum"));
				vo.setHostIp(rs.getString("hostIp"));
				vo.setfName(rs.getString("fName"));
				vo.setfSName(rs.getString("fSName"));
				vo.setfSize(rs.getInt("fSize"));
			}
		} catch (SQLException e) {
			System.out.println("getNoticeContent sql에러" + e.getMessage());
		}finally {
			getConn.rsClose();
		}
		return vo;
	}

	// 조회수 1 증가처리
	public void setReadNum(int idx) {
		try {
			sql = "update RolexNotice set readNum = readNum + 1 where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("setReadNum sql에러" + e.getMessage());
		}finally {
			getConn.pstmtClose();
		}
		
	}

	// 게시글 삭제
	public int setNoticeDelete(int idx) {
		int res = 0;
		try {
			sql = "delete from RolexNotice where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
			res=1;
		} catch (SQLException e) {
			System.out.println("setNoticeDelete sql에러" + e.getMessage());
		}finally {
			getConn.pstmtClose();
		}
		return res;
	}
	
	// 업데이트 파일 삭제
	public int updateFileDelete(int idx) {
		int res = 0;
		try {
			sql = "update RolexNotice set fName='', fSName='', fSize=0 where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
			res=1;
		} catch (SQLException e) {
			System.out.println("setNoticeDelete sql에러" + e.getMessage());
		}finally {
			getConn.pstmtClose();
		}
		return res;
	}

	// 최근 글 갯수 가져오기
	public int totRecCntLately(int lately) {
		int totRecCnt = 0;
		try {
			sql = "select count(*) from RolexNotice where date_sub(now(), interval ? day) < wDate";
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

	// 최근 게시글 보기
	public List<NoticeVO> getNoticeLately(int startIndexNo, int pageSize, int lately) {
		List<NoticeVO> vos = new ArrayList<NoticeVO>();
		try {
			sql = "select * from RolexNotice where date_sub(now(), interval ? day) < wDate order by idx desc limit ?,?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, lately);
			pstmt.setInt(2, startIndexNo);
			pstmt.setInt(3, pageSize);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo = new NoticeVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				
				// 날짜를 24시간제로 체크하기위해서 사용자정의 메소드로 만든 timeDiff()를 사용한다
				vo.setwDate(rs.getString("wDate"));		//만약 wDate가 날짜 타입일경우
				vo.setwCdate(rs.getString("wDate"));	//날짜타입 wDate를 문자타입 wCdate로 저장후
				TimeDiff timeDiff = new TimeDiff();
				int res =  timeDiff.timeDiff(vo.getwCdate());		//문자타입 wCdate를 timeDiff()메소드 인자값으로 보내어서 오늘시간과 계산하여 시간차를 돌려받는다
				vo.setwNdate(res); 		//시간차를 숫자형식 변수에 저장시켜준다
				
				vo.setReadNum(rs.getInt("readNum"));
				vo.setHostIp(rs.getString("hostIp"));
				vo.setMid(rs.getString("mid"));
				
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("getNoticeLately sql에러" + e.getMessage());
		}finally {
			getConn.rsClose();
		}
		return vos;
	}

	//게시글 수정처리
	public int setNoticeUpdateOk(NoticeVO vo) {
		int res = 0;
		try {
			sql = "update RolexNotice set title=?,content=?,hostIp=?,fName=?,fSName=?,fSize=? where idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getContent());
			pstmt.setString(3, vo.getHostIp());
			pstmt.setString(4, vo.getfName());
			pstmt.setString(5, vo.getfSName());
			pstmt.setInt(6, vo.getfSize());
			pstmt.setInt(7, vo.getIdx());
			pstmt.executeUpdate();
			res = 1;
		} catch (SQLException e) {
			System.out.println("sql에러" + e.getMessage());
		}finally {
			getConn.pstmtClose();
		}
		return res;
	}

	//이전글 다음글 처리
	public NoticeVO preNextSearch(String str, int idx) {
		vo = new NoticeVO();
		try {
			if(str.equals("pre")) {
				sql = "select * from RolexNotice where idx < ? order by idx desc limit 1";
			}
			else {
				sql = "select * from RolexNotice where idx > ? limit 1;";
			}
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			
			if(str.equals("pre") && rs.next()){
				vo.setPreIdx(rs.getInt("idx"));
				vo.setPreTitle(rs.getString("title"));
			}
			else if(str.equals("next") && rs.next()) {
				vo.setNextIdx(rs.getInt("idx"));
				vo.setNextTitle(rs.getString("title"));
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

	// 검색기로 검색된 자료의 개수를 구한다
	public int totRecCnt(String search, String searchString) {
		int totRecCnt = 0;
		try {
			sql = "select count(*) from RolexNotice where "+search+" like ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+searchString+"%");
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

	//검색기 자료 검색 처리 부분
	public List<NoticeVO> getNoticeSearch(String search, String searchString, int startIndexNo, int pageSize) {
		List<NoticeVO> vos = new ArrayList<NoticeVO>();
		try {
			sql = "select * from RolexNotice where "+search+" like ? order by idx desc limit ?,?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+searchString+"%");
			pstmt.setInt(2, startIndexNo);
			pstmt.setInt(3, pageSize);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo = new NoticeVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				
				// 날짜를 24시간제로 체크하기위해서 사용자정의 메소드로 만든 timeDiff()를 사용한다
				vo.setwDate(rs.getString("wDate"));		//만약 wDate가 날짜 타입일경우
				vo.setwCdate(rs.getString("wDate"));	//날짜타입 wDate를 문자타입 wCdate로 저장후
				TimeDiff timeDiff = new TimeDiff();
				int res =  timeDiff.timeDiff(vo.getwCdate());		//문자타입 wCdate를 timeDiff()메소드 인자값으로 보내어서 오늘시간과 계산하여 시간차를 돌려받는다
				vo.setwNdate(res); 		//시간차를 숫자형식 변수에 저장시켜준다
				
				vo.setReadNum(rs.getInt("readNum"));
				vo.setHostIp(rs.getString("hostIp"));
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
}
