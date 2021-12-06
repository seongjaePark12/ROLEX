package user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDAO;

public class UserIdFindCommand implements UserInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name")== null ? "" : request.getParameter("name");
		String email1 = request.getParameter("email1")== null ? "" : request.getParameter("email1");
		String email2 = request.getParameter("email2")== null ? "" : request.getParameter("email2");
		String email = email1 + "@" + email2;
		String message = "";
		UserDAO dao = new UserDAO();
		String idFind = dao.findId(name,email);

		if(idFind != "") {
			message = "회원님의 아이디는 " + idFind + "입니다";
		}
		else {
			message = "아이디를 찾을 수 없습니다.";
		}
		request.setAttribute("message", message);





	}

}
