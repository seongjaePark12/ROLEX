package watch;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.list.UserDeleteCommand;
import user.list.UserMainCommand;
import user.list.UserMyPageCommand;
import user.list.UserUpdateCheckCommand;
import user.notice.UserNoticeCommand;
import user.notice.UserNoticeContentCommand;
import user.notice.UserNoticeSearchCommand;
import user.notice.UserQuestionReplyDeleteCommand;
import user.question.UserQuestionCommand;
import user.question.UserQuestionContentCommand;
import user.question.UserQuestionDeleteCommand;
import user.question.UserQuestionInputCommand;
import user.question.UserQuestionInputOkCommand;
import user.question.UserQuestionReplyInputCommand;
import user.question.UserQuestionReplyUpdateOkCommand;
import user.question.UserQuestionSearchCommand;
import user.question.UserQuestionUpdateCommand;
import user.question.UserQuestionUpdateOkCommand;

@SuppressWarnings("serial")
@WebServlet("*.watch")
public class WatchController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String viewPage = "";
		
		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/"), uri.lastIndexOf("."));
		
		if(com.equals("/manWatch")) {
			viewPage = "/WEB-INF/watch/manWatch.jsp";
		}
		else if(com.equals("/womanWatch")) {
			viewPage = "/WEB-INF/watch/womanWatch.jsp";
		}
		else if(com.equals("/collectionWatch")) {
			viewPage = "/WEB-INF/watch/collectionWatch.jsp";
		}
		else if(com.equals("/newWatch")) {
			viewPage = "/WEB-INF/watch/newWatch.jsp";
		}
		else if(com.equals("/newWatch2")) {
			viewPage = "/WEB-INF/watch/newWatch2.jsp";
		}
		else if(com.equals("/cul1")) {
			viewPage = "/WEB-INF/watch/culWatch1.jsp";
		}
		else if(com.equals("/cul2")) {
			viewPage = "/WEB-INF/watch/culWatch2.jsp";
		}
		else if(com.equals("/cul3")) {
			viewPage = "/WEB-INF/watch/culWatch3.jsp";
		}
		else if(com.equals("/cul4")) {
			viewPage = "/WEB-INF/watch/culWatch4.jsp";
		}
		else if(com.equals("/cul5")) {
			viewPage = "/WEB-INF/watch/culWatch5.jsp";
		}
		else if(com.equals("/cul6")) {
			viewPage = "/WEB-INF/watch/culWatch6.jsp";
		}
		else if(com.equals("/cul7")) {
			viewPage = "/WEB-INF/watch/culWatch7.jsp";
		}
		else if(com.equals("/mainWatch1")) {
			viewPage = "/WEB-INF/watch/mainWatch1.jsp";
		}
		else if(com.equals("/mainWatch2")) {
			viewPage = "/WEB-INF/watch/mainWatch2.jsp";
		}
		else if(com.equals("/mainWatch3")) {
			viewPage = "/WEB-INF/watch/mainWatch3.jsp";
		}
		else if(com.equals("/mainWatch4")) {
			viewPage = "/WEB-INF/watch/mainWatch4.jsp";
		}
		else if(com.equals("/mainWatch5")) {
			viewPage = "/WEB-INF/watch/mainWatch5.jsp";
		}
		else if(com.equals("/mainWatch6")) {
			viewPage = "/WEB-INF/watch/mainWatch6.jsp";
		}
		else if(com.equals("/mainWatch7")) {
			viewPage = "/WEB-INF/watch/mainWatch7.jsp";
		}
		else if(com.equals("/mainWatch8")) {
			viewPage = "/WEB-INF/watch/mainWatch8.jsp";
		}
		else if(com.equals("/mainWatch9")) {
			viewPage = "/WEB-INF/watch/mainWatch9.jsp";
		}
		else if(com.equals("/mainWatch10")) {
			viewPage = "/WEB-INF/watch/mainWatch10.jsp";
		}
		else if(com.equals("/mainWatch11")) {
			viewPage = "/WEB-INF/watch/mainWatch11.jsp";
		}
		else if(com.equals("/mainWatch12")) {
			viewPage = "/WEB-INF/watch/mainWatch12.jsp";
		}
		else if(com.equals("/mainWatch13")) {
			viewPage = "/WEB-INF/watch/mainWatch13.jsp";
		}
		else if(com.equals("/mainWatch14")) {
			viewPage = "/WEB-INF/watch/mainWatch14.jsp";
		}
		else if(com.equals("/mainWatch15")) {
			viewPage = "/WEB-INF/watch/mainWatch15.jsp";
		}
		else if(com.equals("/mainWatch16")) {
			viewPage = "/WEB-INF/watch/mainWatch16.jsp";
		}
		else if(com.equals("/mainWatch17")) {
			viewPage = "/WEB-INF/watch/mainWatch17.jsp";
		}
		else if(com.equals("/mainWatch18")) {
			viewPage = "/WEB-INF/watch/mainWatch18.jsp";
		}
		else if(com.equals("/mainWatch19")) {
			viewPage = "/WEB-INF/watch/mainWatch19.jsp";
		}
		else if(com.equals("/mainWatch20")) {
			viewPage = "/WEB-INF/watch/mainWatch20.jsp";
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
