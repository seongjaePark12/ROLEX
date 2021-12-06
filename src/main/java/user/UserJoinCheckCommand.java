package user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import conn.SecurityUtil;
import dao.UserDAO;
import vo.UserVO;

public class UserJoinCheckCommand implements UserInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "": request.getParameter("mid").trim();
		String pwd = request.getParameter("pwd")==null ? "": request.getParameter("pwd").trim();
		String name = request.getParameter("name")==null ? "": request.getParameter("name").trim();
		String name_ = name;
		String birth = request.getParameter("birth")==null ? "": request.getParameter("birth").trim();
		String email = request.getParameter("email")==null ? "": request.getParameter("email").trim();
		String email2 = request.getParameter("email2")==null ? "": request.getParameter("email2").trim();
		String getCode = request.getParameter("getCode")==null ? "": request.getParameter("getCode").trim();
		String getCode2 = request.getParameter("getCode2")==null ? "": request.getParameter("getCode2").trim();
		String getCode3 = request.getParameter("getCode3")==null ? "": request.getParameter("getCode3").trim();
		String address = request.getParameter("address")==null ? "": request.getParameter("address");
		String emailInfor = request.getParameter("emailInfor")==null ? "": request.getParameter("emailInfor").trim();
		
		UserVO vo = new UserVO();
		UserDAO dao = new UserDAO();
	
		// 아이디와 닉네임 중복체크를 저장전에 한번더 수행시켜준다
		name = dao.midCheck(mid);
		if(!name.equals("")) {	//사용 불가능 아이디
			request.setAttribute("msg", "idCheckNo");
			request.setAttribute("url", request.getContextPath()+"/userJoin.psj");
			return;
		}
		SecurityUtil securityUtil = new SecurityUtil();
		pwd = securityUtil.encryptSHA256(pwd);
		
		vo.setMid(mid);
		vo.setPwd(pwd);
		vo.setName(name_);
		vo.setBirth(birth);
		vo.setEmail(email+"@"+email2);
		vo.setGetCode(getCode+"-"+getCode2+"-"+getCode3);
		vo.setAddress(address);
		vo.setEmailInfor(emailInfor);
	
		
			
		int res = dao.userJoin(vo);
		if(res == 1) {
			request.setAttribute("msg", "userJoinOk");
			request.setAttribute("url", request.getContextPath()+"/userLogin.psj");
		}
		else {
			request.setAttribute("msg", "userJoinNo");
			request.setAttribute("url", request.getContextPath()+"/userJoin.psj");
		}
	}
}
