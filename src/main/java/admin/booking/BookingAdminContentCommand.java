package admin.booking;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BookingDAO;
import vo.BookingVO;

public class BookingAdminContentCommand implements BookingInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx")==null ? 0 : Integer.parseInt(request.getParameter("idx"));
		int pag = request.getParameter("pag")==null ? 1 : Integer.parseInt(request.getParameter("pag"));
		int pageSize = request.getParameter("pageSize")==null ? 5 : Integer.parseInt(request.getParameter("pageSize"));
		int lately = request.getParameter("lately")==null? 0 : Integer.parseInt(request.getParameter("lately"));
		
		BookingDAO dao = new BookingDAO();
		
		BookingVO vo = dao.getBookingContent(idx);		// vo : 현재글을 저장
		
		request.setAttribute("vo", vo);
		request.setAttribute("pag", pag);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("lately", lately);
		
		//'이전글(preVO)'/'다음글(nextVO)' 처리하기
		BookingVO preVO = dao.preNextSearch("pre",idx);		// 이전글처리
		BookingVO nextVO = dao.preNextSearch("next",idx);		// 다음글처리
		request.setAttribute("preVO", preVO);
		request.setAttribute("nextVO", nextVO);
	}

}
