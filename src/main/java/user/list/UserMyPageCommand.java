package user.list;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDAO;
import user.UserInterface;
import vo.UserVO;

public class UserMyPageCommand implements UserInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("sMid");
		UserDAO dao = new UserDAO();
		
		UserVO vo = dao.userLogin(mid);
		
		request.setAttribute("vo", vo);
		request.setAttribute("startDate", vo.getStartDate().substring(0, 10));
	}

}
