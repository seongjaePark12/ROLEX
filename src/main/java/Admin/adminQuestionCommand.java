package Admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.AdminDAO;
import VO.QuestionVO;

public class adminQuestionCommand implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		AdminDAO dao = new AdminDAO();
		QuestionVO vo2 = new QuestionVO();
		/*
		페이징 처리
			1. 한 페이지 분량을 정한다 : pageSize = 10건(사용자가 정한다)
			2. 총 레코드 건수를 구한다 : totRecCnt => SQL함수중 count(*)함수 사용
			3. 총 페이지 수를 구한다 : totPage => 총레코드수 / 페이지분량으로 하되, 나머지가 0이면 몫을, 0이아니면 몫+1로 처리
			4. 현재페이지의 시작 index번호 : startIndexNo => (현재페이지 -1) * 페이지분량
			5. 현재 화면에 보이는 방문소감 시작번호 : curScrStartNo => 총레코드수 - 현재페이지의 시작 index번호
		*/
		/* 이곳부터 페이징 처리변수 지정 시작 */
		int pag = request.getParameter("pag")==null ? 1 : Integer.parseInt(request.getParameter("pag"));		// 현재페이지 구하기
		
		int pageSize = 2; 									//1. 한 페이지 분량
		int totRecCnt = dao.totRecCnt();   	//2. 총 레코드건수 구하기
		int totPage = (totRecCnt % pageSize)==0 ? totRecCnt/pageSize : (totRecCnt/pageSize) + 1;	//3. 총 페이지 수 구하기
		int startIndexNo = (pag - 1) * pageSize; //4. 현재페이지의 시작 index번호
		int curScrStartNo = totRecCnt - startIndexNo;	// 5. 현재 화면에 보이는 방문소감 시작번호
		/* 이곳까지 페이징 처리변수 지정 끝*/
		
		/*블록 페이징처리(블록의 크기를 이용하여, '현재페이지의 블록위치(curBlock)','마지막 블럭의 위치(lastBlock)'를 구한다)*/
		int blockSize = 5;  // 한블록의 크기를 3개의 Page로본다( 사용자지정)
	  int curBlock = (pag - 1) / blockSize;		// 현재페이지의 블록위치
	  int lastBlock = (totPage % blockSize)==0 ? ((totPage / blockSize) - 1) : (totPage / blockSize);
		/* 블록페이징 처리끝*/
		
		List<QuestionVO> vos = dao.questionList(startIndexNo, pageSize);		//(시작번호, 페이지분량)
		
		for(int i=0; i<vos.size(); i++) {
			vo2 = vos.get(i);
			
			String vDate = vo2.getvDate().substring(0, vo2.getvDate().length() - 2);
			
			String content = vo2.getContent().replace("\n", "<br/>");
		}
			
		request.setAttribute("curScrStartNo", curScrStartNo);
		request.setAttribute("curBlock", curBlock);
		request.setAttribute("lastBlock", lastBlock);
		request.setAttribute("pag", pag);
		request.setAttribute("blockSize", blockSize);
		request.setAttribute("vo2", vo2);
		request.setAttribute("vos", vos);

	}

}
