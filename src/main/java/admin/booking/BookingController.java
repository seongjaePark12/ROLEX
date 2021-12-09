package admin.booking;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("*.boo")
public class BookingController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BookingInterface command = null;
		String viewPage = "";
		
		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/"), uri.lastIndexOf("."));
		
		if(com.equals("/bookingMain")) {	// 예약 페이지(관리자)
			command = new BookingMainCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/booking/bookingMain.jsp";
		}
		else if(com.equals("/bookingAdminContent")) {	// 예약 페이지 상세(관리자)
			command = new BookingAdminContentCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/booking/bookingAdminContent.jsp";
		}
		else if(com.equals("/bookingUser")) {	// 예약 페이지
			viewPage = "/WEB-INF/booking/bookingUser.jsp";
		}
		else if(com.equals("/bookingContent")) {	// 예약 페이지 상세
			command = new BookingContentCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/booking/bookingContent.jsp";
		}
		else if(com.equals("/bookingContentOk")) {	// 예약 페이지 상세
			command = new BookingContentOkCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/message/psjMessage.jsp";
		}
		else if(com.equals("/bookingDelete")) {	// 예약 페이지 상세
			command = new BookingDeleteCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/message/psjMessage.jsp";
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
