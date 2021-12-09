package admin.booking;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BookingDAO;
import vo.BookingVO;

public class BookingContentOkCommand implements BookingInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx")==null ? 0 : Integer.parseInt(request.getParameter("idx"));
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String name = request.getParameter("name")==null ? "" : request.getParameter("name");
		String booDate = request.getParameter("booDate")==null ? "" : request.getParameter("booDate");
		String booTime = request.getParameter("booTime")==null ? "" : request.getParameter("booTime");
		String content = request.getParameter("content")==null ? "" : request.getParameter("content");
		
		BookingVO vo = new BookingVO();
		vo.setIdx(idx);
		vo.setMid(mid);
		vo.setName(name);
		vo.setBooDate(booDate);
		vo.setBooTime(booTime);
		vo.setContent(content);
		
		BookingDAO dao = new BookingDAO();
		int res = dao.setBookingContentOk(vo);		// 일정등록과 일정수정처리
		
		if(res == 1) {
			request.setAttribute("msg", "bookingMainContentOk");
		}
		else {
			request.setAttribute("msg", "bookingMainContentNo");
		}
		request.setAttribute("url", request.getContextPath()+"/bookingUser.boo?ymd="+booDate+"&mid="+mid);

	}

}
