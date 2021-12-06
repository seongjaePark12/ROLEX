package user.list;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import conn.SecurityUtil;
import dao.UserDAO;
import user.UserInterface;
import vo.UserVO;

public class UserUpdateCommand implements UserInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("sMid");
		String pwd = request.getParameter("pwd")==null ? "" :request.getParameter("pwd");
		UserDAO dao = new UserDAO();
		UserVO vo = dao.userLogin(mid);
		
		SecurityUtil securityUtil = new SecurityUtil();
		pwd = securityUtil.encryptSHA256(pwd);
		vo.setPwd(pwd);
		// 이메일 처리
		String[] email = vo.getEmail().split("@");
		request.setAttribute("email1", email[0]);
		request.setAttribute("email2", email[1]);
		
		//생일
		request.setAttribute("birth", vo.getBirth().substring(0, 10));
		
		//전화번호
		String[] getcode = vo.getGetCode().split("/");
		request.setAttribute("getcode1", getcode[0]);
		request.setAttribute("getcode2", getcode[1]);
		request.setAttribute("getcode3", getcode[2]);
		
		//주소
		String[] address = vo.getAddress().split("/");
		request.setAttribute("postcode", address[0]);
		request.setAttribute("roadAddress", address[1]);
		request.setAttribute("detailAddress", address[2]);
		request.setAttribute("extraAddress", address[3]);
		
		
		
		//나머지 일반적인 모든 내용은 vo에 있으므로 vo를 저장소에 담아서 넘겨준다		
		request.setAttribute("vo", vo);
	}
}
