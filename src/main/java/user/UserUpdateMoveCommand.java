package user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import conn.SecurityUtil;
import dao.UserDAO;

public class UserUpdateMoveCommand implements UserInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String mid = session.getAttribute("sMid")==null ? "" : (String)session.getAttribute("sMid");
		String pwd = request.getParameter("pwd")== null ? "":request.getParameter("pwd");
		String pwd_ = pwd;
		
		UserDAO dao = new UserDAO();
		SecurityUtil securityUtil = new SecurityUtil();
		pwd = securityUtil.encryptSHA256(pwd);
		String passwordMove = dao.getUserUpdateMove(mid,pwd);
		
		if(passwordMove != "") {  
			//ServletContext application = request.getServletContext();
			request.getServletContext().setAttribute("pwd", pwd_);
			request.setAttribute("msg", "userpwdOk");
			request.setAttribute("url", request.getContextPath()+"/userUpdate.psj");
		}
		else {
			request.setAttribute("msg", "userpwdNo");
			request.setAttribute("url", request.getContextPath()+"/userMyPage.psj");
		}

	}

}
