package admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin.list.AdminPageCommand;
import admin.list.AdminUserInforCommand;
import admin.list.AdminUserLevelCommand;
import admin.list.AdminUserListCommand;
import admin.list.AdminUserResetCommand;
import admin.notice.AdminNoticeCommand;
import admin.notice.AdminNoticeContentCommand;
import admin.notice.AdminNoticeDeleteCommand;
import admin.notice.AdminNoticeInputCommand;
import admin.notice.AdminNoticeInputOkCommand;
import admin.notice.AdminNoticeSearchCommand;
import admin.notice.AdminNoticeUpdateCommand;
import admin.notice.AdminNoticeUpdateOkCommand;
import admin.notice.AdminUpdateFileDeleteCommand;
import admin.question.AdminQuestionCommand;
import admin.question.AdminQuestionContentCommand;
import admin.question.AdminQuestionDeleteCommand;
import admin.question.AdminQuestionReplyDeleteCommand;
import admin.question.AdminQuestionReplyInputCommand;
import admin.question.AdminQuestionReplyUpdateOkCommand;
import admin.question.AdminQuestionSearchCommand;
import admin.simple.AdminSimpleCommand;
import admin.simple.AdminSimpleDeleteCommand;
import admin.simple.AdminSimpleInputOkCommand;



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
		
		if(mid == null || level != 0) {
			request.setAttribute("msg", "loginGo");
			request.setAttribute("url", request.getContextPath()+"/userLogin.psj");
			viewPage = "/WEB-INF/message/psjMessage.jsp";
		}
		else if(com.equals("/adminPage")) {	// ????????? ?????????
			command = new AdminPageCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/admin/adminPage.jsp";
		}
		else if(com.equals("/adminUserList")) {	// ???????????? ?????????
			command = new AdminUserListCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/admin/adminUserList/adminUserList.jsp";
		}
		else if(com.equals("/adminUserLevel")) {	// ?????? ?????? ?????? 
			command = new AdminUserLevelCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/message/psjMessage.jsp";
		}
		else if(com.equals("/adminUserReset")) {	// ?????? ??????
			command = new AdminUserResetCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/message/psjMessage.jsp";
		}
		else if(com.equals("/adminUserInfor")) {	// ?????? ????????????
			command = new AdminUserInforCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/admin/adminUserList/adminUserInfor.jsp";
		}
		else if(com.equals("/adminNotice")) { 	// ????????????
			command = new AdminNoticeCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/admin/adminNotice/adminNotice.jsp";
		}
		else if(com.equals("/adminNoticeInput")) { 	// ???????????? ??????
			command = new AdminNoticeInputCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/admin/adminNotice/adminNoticeInput.jsp";
		}
		else if(com.equals("/adminNoticeInputOk")) { 	// ???????????? ?????? ??????
			command = new AdminNoticeInputOkCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/message/psjMessage.jsp";
		}
		else if(com.equals("/adminNoticeContent")) { 	// ???????????? ??????
			command = new AdminNoticeContentCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/admin/adminNotice/adminNoticeContent.jsp";
		}
		else if(com.equals("/adminNoticeDelete")) { 	// ???????????? ??????
			command = new AdminNoticeDeleteCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/message/psjMessage.jsp";
		}
		else if(com.equals("/adminNoticeUpdate")) { 	// ???????????? ??????
			command = new AdminNoticeUpdateCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/admin/adminNotice/adminNoticeUpdate.jsp";
		}
		else if(com.equals("/adminUpdateFileDelete")) { 	// ???????????? ?????? ????????????
			command = new AdminUpdateFileDeleteCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/adminNoticeUpdateOk")) { 	// ???????????? ??????
			command = new AdminNoticeUpdateOkCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/message/psjMessage.jsp";
		}
		else if(com.equals("/adminNoticeSearch")) { 	// ???????????? ?????????
			command = new AdminNoticeSearchCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/admin/adminNotice/adminNoticeSearch.jsp";
		}
		else if(com.equals("/adminQuestion")) { 	// Q&A
			command = new AdminQuestionCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/admin/adminQuestion/adminQuestion.jsp";
		}
		else if(com.equals("/adminQuestionContent")) { 	// Q&A ??????
			command = new AdminQuestionContentCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/admin/adminQuestion/adminQuestionContent.jsp";
		}
		else if(com.equals("/adminQuestionDelete")) { 	// Q&A ??????
			command = new AdminQuestionDeleteCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/message/psjMessage.jsp";
		}
		else if(com.equals("/adminQuestionSearch")) { 	// Q&A ?????????
			command = new AdminQuestionSearchCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/admin/adminQuestion/adminQuestionSearch.jsp";
		}
		else if(com.equals("/adminQuestionReplyInput")) { 	// Q&A????????????
			command = new AdminQuestionReplyInputCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/adminQuestionReplyUpdateOk")) { 	// Q&A????????????
			command = new AdminQuestionReplyUpdateOkCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/adminQuestionReplyDelete")) { 	// Q&A????????????
			command = new AdminQuestionReplyDeleteCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/adminSimple")) { 	// ??????????????????
			command = new AdminSimpleCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/admin/adminSimple/adminSimple.jsp";
		}
		else if(com.equals("/adminSimpleDelete")) { 	// ?????????????????? ??????
			command = new AdminSimpleDeleteCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/adminSimpleInput")) { 	// ?????????????????? ??????
			command = new AdminSimpleInputCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/admin/adminSimple/adminSimpleInput.jsp";
		}
		else if(com.equals("/adminSimpleInputOk")) { 	// ?????????????????? ?????? ??????
			command = new AdminSimpleInputOkCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/message/psjMessage.jsp";
		}

		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
