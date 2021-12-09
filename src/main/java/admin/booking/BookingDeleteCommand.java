package admin.booking;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BookingDAO;

public class BookingDeleteCommand implements BookingInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx")==null ? 0 :Integer.parseInt(request.getParameter("idx"));
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String booDate = request.getParameter("ymd")==null ? "" : request.getParameter("ymd");
		
		BookingDAO dao = new BookingDAO();
		int res = dao.setBookingDelete(idx);

		if(res == 1) {
			request.setAttribute("msg", "bookingDeleteOk");
		}
		else {
			request.setAttribute("msg", "bookingDeleteNo");
		}
		request.setAttribute("url", request.getContextPath()+"/bookingUser.boo?ymd="+booDate+"&mid="+mid);

	}

}
