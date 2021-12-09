package admin.booking;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BookingDAO;
import vo.BookingVO;

public class BookingContentCommand implements BookingInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String ymd = request.getParameter("ymd") == null ? "" : request.getParameter("ymd");
		String mid = session.getAttribute("sMid") == null ? "" : (String)session.getAttribute("sMid");
		
		BookingDAO dao = new BookingDAO();
		BookingVO vo = dao.getBookingUserContent(ymd, mid);
		
		request.setAttribute("vo", vo);
		request.setAttribute("ymd", ymd);
		

	}

}
