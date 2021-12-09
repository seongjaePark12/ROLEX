package admin.booking;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BookingDAO;
import vo.BookingVO;

public class BookingMainCommand implements BookingInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BookingDAO dao = new BookingDAO();
		int pag = request.getParameter("pag")==null ? 1 : Integer.parseInt(request.getParameter("pag"));	
		int pageSize = request.getParameter("pageSize")==null ? 5 : Integer.parseInt(request.getParameter("pageSize")); 
		
		// 최근글 수정시 아래 두줄 삽입/수정
		int lately = request.getParameter("lately")==null ? 0 : Integer.parseInt(request.getParameter("lately")); 
		int totRecCnt = 0;
		
		if(lately == 0) totRecCnt = dao.totRecCnt();// 전체자료
		else totRecCnt = dao.totRecCntLately(lately);// 지정된자료		
		
		int totPage = (totRecCnt % pageSize)==0 ? totRecCnt/pageSize : (totRecCnt/pageSize) + 1;
		int startIndexNo = (pag - 1) * pageSize; 
		int curScrStartNo = totRecCnt - startIndexNo;	
		int blockSize = 3; 
	  int curBlock = (pag - 1) / blockSize;	
	  int lastBlock = (totPage % blockSize)==0 ? ((totPage / blockSize) - 1) : (totPage / blockSize);
		/* 블록페이징 처리끝*/
	  
	  List<BookingVO> vos = null;
	  if(lately == 0) vos= dao.getBookingList(startIndexNo, pageSize); // 전체자료
	  else vos = dao.getBookingLately(startIndexNo, pageSize, lately); // 지정된자료
	  
	  request.setAttribute("vos", vos);
		request.setAttribute("pag", pag);
		request.setAttribute("totPage", totPage);
		request.setAttribute("curScrStartNo", curScrStartNo);
		request.setAttribute("blockSize", blockSize);
		request.setAttribute("curBlock", curBlock);
		request.setAttribute("lastBlock", lastBlock);
		request.setAttribute("pageSize", pageSize);
		
		//최근 게시글에서 추가
		request.setAttribute("lately", lately);

	}

}
