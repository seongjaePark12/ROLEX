package user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDAO;

public class UserPasswordFindCommand implements UserInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")== null ? "" : request.getParameter("mid");
		String name = request.getParameter("name")== null ? "" : request.getParameter("name");
		String email1 = request.getParameter("email1")== null ? "" : request.getParameter("email1");
		String email2 = request.getParameter("email2")== null ? "" : request.getParameter("email2");
		String email = email1 + "@" + email2;
		String message = "";
		UserDAO dao = new UserDAO();
		String passwordFind = dao.findPassword(mid,name,email);

		if(passwordFind != "") {
			message = "회원님의 비밀번호는 " + passwordFind + "입니다";
		}
		else {
			message = "비밀번호를를 찾을 수 없습니다.";
		}
		request.setAttribute("message", message);
	}

}
