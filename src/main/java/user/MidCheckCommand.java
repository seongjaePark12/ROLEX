package user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDAO;

public class MidCheckCommand implements UserInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
				
		UserDAO dao = new UserDAO();
		
		String name = dao.midCheck(mid);
		
		if(name.equals("")) {	//사용 가능한 아이디
			request.setAttribute("res", 1);
		}
		else {	// 사용중인 아이디
			request.setAttribute("res", 0);
		}
		request.setAttribute("mid", mid);
	}
}
