package Admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



@SuppressWarnings("serial")
@WebServlet("*.boss")
public class AdminController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AdminInterface command = null;
		String viewPage = "";
		
		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/"), uri.lastIndexOf("."));
		
		
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("sMid");
		int level = session.getAttribute("sLevel")==null ? 99 : (int) session.getAttribute("sLevel");
//		if(mid == null || level != 0) {
		if(mid == null || level >= 5) {
			viewPage = "/WEB-INF/User/UserLoginJoin/psjUserLogin.jsp";
		}
		else if(com.equals("/adminPage")) {	// 관리자 페이지
			command = new AdminPageCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/admin/adminPage.jsp";
		}
		else if(com.equals("/adminUserList")) {	// 회원관리 페이지
			command = new AdminUserListCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/admin/AdminUserList/adminUserList.jsp";
		}
		else if(com.equals("/adminUserLevel")) {	// 유저 등급 조정 
			command = new AdminUserLevelCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/message/psjMessage.jsp";
		}
		else if(com.equals("/adminUserReset")) {	// 유저 삭제
			command = new AdminUserResetCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/message/psjMessage.jsp";
		}
		else if(com.equals("/adminUserInfor")) {	// 유저 상세보기
			command = new AdminUserInforCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/admin/AdminUserList/adminUserInfor.jsp";
		}
		else if(com.equals("/adminQuestion")) {	// 유저 상세보기
			command = new adminQuestionCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/admin/AdminQuestion/adminQuestion.jsp";
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
