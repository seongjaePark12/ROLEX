package UserController;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.UserDAO;
import VO.UserVO;

public class UserMyPageCommand implements UserInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("sMid");
		UserDAO dao = new UserDAO();
		
		UserVO vo = dao.userLogin(mid);
		
		request.setAttribute("vo", vo);
	}

}
