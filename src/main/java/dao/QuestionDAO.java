package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import conn.GetConn;
import conn.TimeDiff;
import vo.QuestionVO;
import vo.ReplyQuestionVO;

public class QuestionDAO {
	GetConn getConn = GetConn.getInstance();
	private Connection conn = getConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql ="";
	QuestionVO vo = null;
	ReplyQuestionVO replyVO = null;
	
	// 게시글 전체보기
	public List<QuestionVO> getQuestionList(int startIndexNo, int pageSize) {
		List<QuestionVO> vos = new ArrayList<QuestionVO>();
		try {
			sql = "select *,(select count(*) from replyQuestion where QuestionIdx = RolexQuestion.idx) as replyCount from RolexQuestion order by idx desc limit ?,?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startIndexNo);
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo = new QuestionVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setTitle(rs.getString("title"));
				vo.setWhat(rs.getString("what"));
				vo.setContent(rs.getString("content"));
				
				// 날짜를 24시간제로 체크하기위해서 사용자정의 메소드로 만든 timeDiff()를 사용한다
				vo.setwDate(rs.getString("wDate"));		//만약 wDate가 날짜 타입일경우
				vo.setwCdate(rs.getString("wDate"));	//날짜타입 wDate를 문자타입 wCdate로 저장후
				TimeDiff timeDiff = new TimeDiff();
				int res =  timeDiff.timeDiff(vo.getwCdate());		//문자타입 wCdate를 timeDiff()메소드 인자값으로 보내어서 오늘시간과 계산하여 시간차를 돌려받는다
				vo.setwNdate(res); 		//시간차를 숫자형식 변수에 저장시켜준다
				
				vo.setHostIp(rs.getString("hostIp"));
				vo.setMid(rs.getString("mid"));
				
				// 댓글의 개수를 구해서 replyCount vo변수에 담는다
				vo.setReplyCount(rs.getInt("replyCount"));
				
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("sql에러" + e.getMessage());
		}finally {
			getConn.rsClose();
		}
		return vos;
	}

	//입력창
	public int setQuestionInput(QuestionVO vo) {
		int res = 0;
		try {
			sql = "insert into RolexQuestion values (default,?,?,?,?,default,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getTitle());
			pstmt.setString(3, vo.getWhat());
			pstmt.setString(4, vo.getContent());
			pstmt.setString(5, vo.getHostIp());
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
			sql = "select count(*) from RolexQuestion";
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

	// 게시글 내용 상세보기
	public QuestionVO getQuestionContent(int idx) {
		vo = new QuestionVO();
		try {
			sql = "select * from RolexQuestion where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo.setIdx(idx);
				vo.setMid(rs.getString("mid"));
				vo.setTitle(rs.getString("title"));
				vo.setWhat(rs.getString("what"));
				vo.setContent(rs.getString("content"));
				vo.setwDate(rs.getString("wDate"));
				vo.setHostIp(rs.getString("hostIp"));
			}
		} catch (SQLException e) {
			System.out.println("sql에러" + e.getMessage());
		}finally {
			getConn.rsClose();
		}
		return vo;
	}

	// 게시글 삭제
	public int setQuestionDelete(int idx) {
		int res = 0;
		try {
			sql = "delete from RolexQuestion where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
			res=1;
		} catch (SQLException e) {
			System.out.println("sql에러" + e.getMessage());
		}finally {
			getConn.pstmtClose();
		}
		return res;
	}

	// 최근 글 갯수 가져오기
	public int totRecCntLately(int lately) {
		int totRecCnt = 0;
		try {
			sql = "select count(*) from RolexQuestion where date_sub(now(), interval ? day) < wDate";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, lately);
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

	// 최근 게시글 보기
	public List<QuestionVO> getQuestionLately(int startIndexNo, int pageSize, int lately) {
		List<QuestionVO> vos = new ArrayList<QuestionVO>();
		try {
			sql = "select * from RolexQuestion where date_sub(now(), interval ? day) < wDate order by idx desc limit ?,?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, lately);
			pstmt.setInt(2, startIndexNo);
			pstmt.setInt(3, pageSize);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo = new QuestionVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setWhat(rs.getString("what"));
				
				// 날짜를 24시간제로 체크하기위해서 사용자정의 메소드로 만든 timeDiff()를 사용한다
				vo.setwDate(rs.getString("wDate"));		//만약 wDate가 날짜 타입일경우
				vo.setwCdate(rs.getString("wDate"));	//날짜타입 wDate를 문자타입 wCdate로 저장후
				TimeDiff timeDiff = new TimeDiff();
				int res =  timeDiff.timeDiff(vo.getwCdate());		//문자타입 wCdate를 timeDiff()메소드 인자값으로 보내어서 오늘시간과 계산하여 시간차를 돌려받는다
				vo.setwNdate(res); 		//시간차를 숫자형식 변수에 저장시켜준다
				
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

	//게시글 수정처리
	public int setQuestionUpdateOk(QuestionVO vo) {
		int res = 0;
		try {
			sql = "update RolexQuestion set title=?,what=?,content=?,hostIp=? where idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getWhat());
			pstmt.setString(3, vo.getContent());
			pstmt.setString(4, vo.getHostIp());
			pstmt.setInt(5, vo.getIdx());
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
	public QuestionVO preNextSearch(String str, int idx) {
		vo = new QuestionVO();
		try {
			if(str.equals("pre")) {
				sql = "select * from RolexQuestion where idx < ? order by idx desc limit 1";
			}
			else {
				sql = "select * from RolexQuestion where idx > ? limit 1;";
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
			sql = "select count(*) from RolexQuestion where "+search+" like ?";
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
	public List<QuestionVO> getQuestionSearch(String search, String searchString, int startIndexNo, int pageSize) {
		List<QuestionVO> vos = new ArrayList<QuestionVO>();
		try {
			sql = "select * from RolexQuestion where "+search+" like ? order by idx desc limit ?,?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+searchString+"%");
			pstmt.setInt(2, startIndexNo);
			pstmt.setInt(3, pageSize);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo = new QuestionVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setWhat(rs.getString("what"));
				
				// 날짜를 24시간제로 체크하기위해서 사용자정의 메소드로 만든 timeDiff()를 사용한다
				vo.setwDate(rs.getString("wDate"));		//만약 wDate가 날짜 타입일경우
				vo.setwCdate(rs.getString("wDate"));	//날짜타입 wDate를 문자타입 wCdate로 저장후
				TimeDiff timeDiff = new TimeDiff();
				int res =  timeDiff.timeDiff(vo.getwCdate());		//문자타입 wCdate를 timeDiff()메소드 인자값으로 보내어서 오늘시간과 계산하여 시간차를 돌려받는다
				vo.setwNdate(res); 		//시간차를 숫자형식 변수에 저장시켜준다
				
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

	// 댓글 입력처리
	public void replyInput(ReplyQuestionVO replyVO) {
		try {
			sql = "insert into replyQuestion values (default,?,?,default,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, replyVO.getQuestionIdx());
			pstmt.setString(2, replyVO.getMid());
			pstmt.setString(3, replyVO.getHostIp());
			pstmt.setString(4, replyVO.getContent());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("sql에러" + e.getMessage());
		}finally {
			getConn.pstmtClose();
		}
	}

	//댓글 내용 가져오기
	public List<ReplyQuestionVO> getReplyQuestion(int idx) {
		List<ReplyQuestionVO> replyBoardVOS = new ArrayList<ReplyQuestionVO>();
		try {
			sql = "select * from replyQuestion where questionIdx = ? order by idx desc";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				replyVO = new ReplyQuestionVO();
				
				replyVO.setIdx(rs.getInt("idx"));
				replyVO.setQuestionIdx(idx);
				replyVO.setMid(rs.getString("mid"));
				replyVO.setwDate(rs.getString("wDate"));
				replyVO.setHostIp(rs.getString("hostIp"));
				replyVO.setContent(rs.getString("content"));
				
				replyBoardVOS.add(replyVO);
			}
		} catch (SQLException e) {
			System.out.println("sql에러" + e.getMessage());
		}finally {
			getConn.rsClose();
		}
		return replyBoardVOS;
	}

	//댓글 수정을 위한 댓글내역 가져오기
	public String getReply(int idx) {
		String replyContent = "";
		try {
			sql ="select content from replyQuestion where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			
			rs.next();
			replyContent = rs.getString(1);
		} catch (SQLException e) {
			System.out.println("sql에러" + e.getMessage());
		}finally {
			getConn.rsClose();
		}
		return replyContent;
	}

	
	// 댓글 수정 처리하기
	public void questionReplyUpdateOk(int idx, String content, String hostIp) {
		try {
			sql = "update replyQuestion set content = ?, hostIp = ?, wDate = now() where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, content);
			pstmt.setString(2, hostIp);
			pstmt.setInt(3, idx);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("sql에러" + e.getMessage());
		}finally {
			getConn.pstmtClose();
		}
	}

	// 댓글 삭제
	public void setReplyDelete(int replyIdx) {
		try {
			sql = "delete from replyQuestion where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, replyIdx);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("sql에러" + e.getMessage());
		}finally {
			getConn.pstmtClose();
		}
		
	}
	
}
