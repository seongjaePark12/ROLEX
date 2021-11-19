package UserController;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("*.psj")
public class UserController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserInterface command = null;
		String viewPage = "";
		
		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/"), uri.lastIndexOf("."));
		
		if(com.equals("/userLogin")) {
			command = new UserLoginCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/UserLoginJoin/psjUserLogin.jsp";
		}
		else if(com.equals("/userLoginCheck")) {
			command = new UserLoginCheckCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/message/psjUserMessage.jsp";
		}
		else if(com.equals("/userLogOut")) {
			command = new UserLogOutCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/message/psjUserMessage.jsp";
		}
		else if(com.equals("/userJoin")) {
			viewPage = "/WEB-INF/UserLoginJoin/psjUserJoin.jsp";
		}
		else if(com.equals("/userJoinCheck")) {
			command = new UserJoinCheckCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/message/psjUserMessage.jsp";
		}
		else if(com.equals("/midCheck")) {
			command = new MidCheckCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/UserLoginJoin/midCheck.jsp";
		}
		else if(com.equals("/userDelete")) {
			command = new UserDeleteCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/message/psjUserMessage.jsp";
		}
		else if(com.equals("/userMain")) {
			command = new UserMainCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/UserLoginJoin/userMain.jsp";
		}
		else if(com.equals("/userMyPage")) {
			command = new UserMyPageCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/UserLoginJoin/userMyPage.jsp";
		}
		else if(com.equals("/userUpdate")) {
			//command = new UserUpdateCommand();
			//command.execute(request, response);
			viewPage = "/WEB-INF/UserLoginJoin/userUpdate.jsp";
		}
		else if(com.equals("/userUpdateCheck")) {
			command = new UserUpdateCheckCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/message/psjUserMessage.jsp";
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
