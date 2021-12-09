package user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDAO;
import vo.UserVO;

public class UserUpdateCommand implements UserInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("sMid");
		String pwd = (String) request.getServletContext().getAttribute("pwd");
		request.getServletContext().removeAttribute("pwd");
		
		UserDAO dao = new UserDAO();
		UserVO vo = dao.userLogin(mid);
		
		// 이메일 처리
		String[] email = vo.getEmail().split("@");
		String email1 =  email[0];
		String email2 =  email[1];
		
		//전화번호
		String[] getcode = vo.getGetCode().split("-");
		String getcode1 =  getcode[0];
		String getcode2 = (getcode.length >= 2) ? getcode[1] : " ";
		String getcode3 = (getcode.length >= 3) ? getcode[2] : " ";
		
		//주소
		String[] address = vo.getAddress().split("/");
		
		String address1 = address[0].trim();
		String address2 = address[1].trim();
		String address3 = address[2].trim();
		String address4 = address[3].trim();
		
		request.setAttribute("vo", vo);
		request.setAttribute("email1", email1);
		request.setAttribute("email2", email2);
		request.setAttribute("getcode1", getcode1);
		request.setAttribute("getcode2", getcode2);
		request.setAttribute("getcode3", getcode3);
		request.setAttribute("address1", address1);
		request.setAttribute("address2", address2);
		request.setAttribute("address3", address3);
		request.setAttribute("address4", address4);
		request.setAttribute("pwd", pwd);
		
	}

}
