package User;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
			viewPage = "/WEB-INF/User/UserLoginJoin/psjUserLogin.jsp";
		}
		else if(com.equals("/userLoginCheck")) { // 로그인 처리
			command = new UserLoginCheckCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/message/psjMessage.jsp";
		}
		else if(com.equals("/userLogOut")) { // 로그아웃 처리
			command = new UserLogOutCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/message/psjMessage.jsp";
		}
		else if(com.equals("/userJoin")) {		// 회원가입창
			viewPage = "/WEB-INF/User/UserLoginJoin/psjUserJoin.jsp";
		}
		else if(com.equals("/userJoinCheck")) { // 회원가입 처리
			command = new UserJoinCheckCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/message/psjMessage.jsp";
		}
		else if(com.equals("/midCheck")) {	//아이디 중복처리
			command = new MidCheckCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/User/UserLoginJoin/midCheck.jsp";
		}
		else if(com.equals("/userDelete")) {	// 회원 탈퇴
			command = new UserDeleteCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/message/psjMessage.jsp";
		}
		else if(com.equals("/userMain")) {	//메인 화면
			command = new UserMainCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/User/userMain.jsp";
		}
		else if(com.equals("/userMyPage")) {	// 마이페이지
			command = new UserMyPageCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/User/UserPage/userMyPage.jsp";
		}
		else if(com.equals("/userUpdate")) {	// 회원 정보수정
			//command = new UserUpdateCommand();
			//command.execute(request, response);
			viewPage = "/WEB-INF/User/UserPage/UserUpdate/userUpdate.jsp";
		}
		else if(com.equals("/userUpdateCheck")) {	// 회원 정보수정 처리
			command = new UserUpdateCheckCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/message/psjMessage.jsp";
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
