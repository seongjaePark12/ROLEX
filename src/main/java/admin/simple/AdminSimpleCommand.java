package admin.simple;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.AdminInterface;
import dao.SimpleDAO;
import vo.SimpleVO;

public class AdminSimpleCommand implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SimpleDAO dao = new SimpleDAO();
		int pag = request.getParameter("pag")==null ? 1 : Integer.parseInt(request.getParameter("pag"));	
		int pageSize = request.getParameter("pageSize")==null ? 5 : Integer.parseInt(request.getParameter("pageSize")); 
		
	// 최근글 수정시 아래 두줄 삽입/수정
			int totRecCnt = dao.totRecCnt();// 전체자료
			int totPage = (totRecCnt % pageSize)==0 ? totRecCnt/pageSize : (totRecCnt/pageSize) + 1;
			int startIndexNo = (pag - 1) * pageSize; 
			int curScrStartNo = totRecCnt - startIndexNo;	
			int blockSize = 3; 
		  int curBlock = (pag - 1) / blockSize;	
		  int lastBlock = (totPage % blockSize)==0 ? ((totPage / blockSize) - 1) : (totPage / blockSize);
			/* 블록페이징 처리끝*/
		
	  // 최근글 수정시 아래 1줄수정
	  List<SimpleVO> vos = null;
	  vos = dao.getSimpleList(startIndexNo, pageSize); // 전체자료
		
		request.setAttribute("vos", vos);
		request.setAttribute("pag", pag);
		request.setAttribute("totPage", totPage);
		request.setAttribute("totRecCnt", totRecCnt);
		request.setAttribute("curScrStartNo", curScrStartNo);
		request.setAttribute("blockSize", blockSize);
		request.setAttribute("curBlock", curBlock);
		request.setAttribute("lastBlock", lastBlock);
		request.setAttribute("pageSize", pageSize);
	}

}
