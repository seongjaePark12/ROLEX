package Admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.AdminDAO;
import VO.UserVO;

public class AdminUserListCommand implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int level = request.getParameter("level")==null ? 99 : Integer.parseInt(request.getParameter("level"));
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		
		AdminDAO adminDAO = new AdminDAO();
		
		/* 이곳부터 페이징 처리변수 지정 시작 */
		int pag = request.getParameter("pag")==null ? 1 : Integer.parseInt(request.getParameter("pag"));		// 현재페이지 구하기
		int pageSize = 5; 									//1. 한 페이지 분량
		int totRecCnt = adminDAO.totRecCnt(level, mid);   	//2. 총 레코드건수 구하기
		int totPage = (totRecCnt % pageSize)==0 ? totRecCnt/pageSize : (totRecCnt/pageSize) + 1;	//3. 총 페이지 수 구하기
		int startIndexNo = (pag - 1) * pageSize; //4. 현재페이지의 시작 index번호
		int curScrStartNo = totRecCnt - startIndexNo;	// 5. 현재 화면에 보이는 방문소감 시작번호
		/* 이곳까지 페이징 처리변수 지정 끝*/
		
		ArrayList<UserVO> vos = adminDAO.getMemberList(startIndexNo, pageSize, level, mid);
		
		request.setAttribute("vos", vos);
		request.setAttribute("pag", pag);
		request.setAttribute("totPage", totPage);
		request.setAttribute("curScrStartNo", curScrStartNo);
		request.setAttribute("level", level);
		request.setAttribute("mid", mid);
	}

}
