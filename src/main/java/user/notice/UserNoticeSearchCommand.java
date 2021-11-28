package user.notice;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.NoticeDAO;
import user.UserInterface;
import vo.NoticeVO;

public class UserNoticeSearchCommand implements UserInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String search = request.getParameter("search")==null ? "" : request.getParameter("search");
		String searchString = request.getParameter("searchString")==null ? "" : request.getParameter("searchString");

		NoticeDAO dao = new NoticeDAO();
		
		int pag = request.getParameter("pag")==null ? 1 : Integer.parseInt(request.getParameter("pag"));	
		int pageSize = request.getParameter("pageSize")==null ? 5 : Integer.parseInt(request.getParameter("pageSize")); 
		
		int totRecCnt = dao.totRecCnt(search, searchString);// 검색기에 입력된 전체 레코드수 구해오기
		int totPage = (totRecCnt % pageSize)==0 ? totRecCnt/pageSize : (totRecCnt/pageSize) + 1;
		int startIndexNo = (pag - 1) * pageSize; 
		int curScrStartNo = totRecCnt - startIndexNo;	
		int blockSize = 3; 
	  int curBlock = (pag - 1) / blockSize;	
	  int lastBlock = (totPage % blockSize)==0 ? ((totPage / blockSize) - 1) : (totPage / blockSize);
		/* 블록페이징 처리끝*/
		
	  List<NoticeVO> vos = dao.getNoticeSearch(search, searchString, startIndexNo, pageSize); 
		
		request.setAttribute("vos", vos);
		request.setAttribute("pag", pag);
		request.setAttribute("totPage", totPage);
		request.setAttribute("curScrStartNo", curScrStartNo);
		request.setAttribute("blockSize", blockSize);
		request.setAttribute("curBlock", curBlock);
		request.setAttribute("lastBlock", lastBlock);
		request.setAttribute("pageSize", pageSize);
		
		//검색기에서 추가
		String searchTitle ="";
		if(search.equals("title")) searchTitle = "제목";
		//else if(search.equals("mid")) searchTitle = "글쓴이";
		else searchTitle = "내용";
				
		request.setAttribute("search", search);
		request.setAttribute("searchTitle", searchTitle);
		request.setAttribute("searchString", searchString);
		request.setAttribute("searchCount", totRecCnt);
	}

}
