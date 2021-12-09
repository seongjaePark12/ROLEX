package user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import conn.SecurityUtil;
import dao.UserDAO;
import vo.UserVO;

public class PasswordInputOkCommand implements UserInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid") == null?"" : request.getParameter("mid");
		String pwd = request.getParameter("password") == null?"" : request.getParameter("password");
		SecurityUtil securityUtil = new SecurityUtil();
		
		UserDAO dao = new UserDAO();
		UserVO vo = new UserVO();
		vo.setMid(mid);
		vo.setPwd(securityUtil.encryptSHA256(pwd));
		int res = dao.setUserUpdateCheck(vo);
		
		if(res == 1) {
			request.setAttribute("msg", "passwordUpdateOk");
			request.setAttribute("url", request.getContextPath()+"/userLogin.psj");
		}
		else {
			request.setAttribute("msg", "passwordUpdateNo");
			request.setAttribute("url", request.getContextPath()+"/passwordFind.psj");
		}
	}

}
