package user;

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
@WebServlet("*.psj")
public class UserController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserInterface command = null;
		String viewPage = "";
		
		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/"), uri.lastIndexOf("."));
		
		if(com.equals("/userLogin")) {		// 로그인창
			command = new UserLoginCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/user/userLoginJoin/psjUserLogin.jsp";
		}
		else if(com.equals("/userLoginCheck")) { // 로그인 처리
			command = new UserLoginCheckCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/message/psjMessage.jsp";
		}
		else if(com.equals("/idFind")) { // 아이디찾기 처리
			viewPage = "/WEB-INF/user/userLoginJoin/idFind.jsp";
		}
		else if(com.equals("/idFindEnd")) { // 아이디찾기 완료
			command = new UserIdFindCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/user/userLoginJoin/idFindEnd.jsp";
		}
		else if(com.equals("/passwordFind")) { // 비밀번호찾기 처리
			viewPage = "/WEB-INF/user/userLoginJoin/passwordFind.jsp";
		}
		else if(com.equals("/passwordFindEnd")) { // 비밀번호찾기 완료
			command = new UserPasswordFindCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/user/userLoginJoin/passwordFindEnd.jsp";
		}
		else if(com.equals("/userLogOut")) { // 로그아웃 처리
			command = new UserLogOutCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/message/psjMessage.jsp";
		}
		else if(com.equals("/userJoin")) {		// 회원가입창
			viewPage = "/WEB-INF/user/userLoginJoin/psjUserJoin.jsp";
		}
		else if(com.equals("/userJoinCheck")) { // 회원가입 처리
			command = new UserJoinCheckCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/message/psjMessage.jsp";
		}
		else if(com.equals("/midCheck")) {	//아이디 중복처리
			command = new MidCheckCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/user/userLoginJoin/midCheck.jsp";
		}
		else if(com.equals("/userDelete")) {	// 회원 탈퇴
			command = new UserDeleteCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/message/psjMessage.jsp";
		}
		else if(com.equals("/userMain")) {	//메인 화면
			command = new UserMainCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/user/userMain.jsp";
		}
		else if(com.equals("/userMyPage")) {	// 마이페이지
			command = new UserMyPageCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/user/userPage/userMyPage.jsp";
		}
		else if(com.equals("/userUpdate")) {	// 회원 정보수정
			command = new UserUpdateCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/user/userPage/userUpdate/userUpdate.jsp";
		}
		else if(com.equals("/userUpdateCheck")) {	// 회원 정보수정 처리
			command = new UserUpdateCheckCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/message/psjMessage.jsp";
		}
		else if(com.equals("/userNotice")) { 	// 공지사항
			command = new UserNoticeCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/user/userNotice/UserNotice.jsp";
		}
		else if(com.equals("/userNoticeContent")) { 	// 공지사항 내용
			command = new UserNoticeContentCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/user/userNotice/UserNoticeContent.jsp";
		}
		else if(com.equals("/userNoticeSearch")) { 	// 공지사항 검색창
			command = new UserNoticeSearchCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/user/userNotice/UserNoticeSearch.jsp";
		}
		else if(com.equals("/userQuestion")) { 	// Q&A
			command = new UserQuestionCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/user/userQuestion/UserQuestion.jsp";
		}
		else if(com.equals("/userQuestionInput")) { 	// Q&A 입력
			command = new UserQuestionInputCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/user/userQuestion/UserQuestionInput.jsp";
		}
		else if(com.equals("/userQuestionInputOk")) { 	// Q&A 입력 완료
			command = new UserQuestionInputOkCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/message/psjMessage.jsp";
		}
		else if(com.equals("/userQuestionContent")) { 	// Q&A 내용
			command = new UserQuestionContentCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/user/userQuestion/UserQuestionContent.jsp";
		}
		else if(com.equals("/userQuestionDelete")) { 	// Q&A 삭제
			command = new UserQuestionDeleteCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/message/psjMessage.jsp";
		}
		else if(com.equals("/userQuestionUpdate")) { 	// Q&A 수정
			command = new UserQuestionUpdateCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/user/userQuestion/UserQuestionUpdate.jsp";
		}
		else if(com.equals("/userQuestionUpdateOk")) { 	// Q&A 수정완료
			command = new UserQuestionUpdateOkCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/message/psjMessage.jsp";
		}
		else if(com.equals("/userQuestionSearch")) { 	// Q&A 검색창
			command = new UserQuestionSearchCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/user/userQuestion/UserQuestionSearch.jsp";
		}
		else if(com.equals("/userQuestionReplyInput")) { 	// Q&A댓글입력
			command = new UserQuestionReplyInputCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/userQuestionReplyUpdateOk")) { 	// Q&A댓글수정
			command = new UserQuestionReplyUpdateOkCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/userQuestionReplyDelete")) { 	// Q&A댓글삭제
			command = new UserQuestionReplyDeleteCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/userSimple")) { 	// 자주하는질문
			command = new UserSimpleCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/user/userSimple/UserSimple.jsp";
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
