package user.list;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import conn.SecurityUtil;
import dao.UserDAO;
import user.UserInterface;
import vo.UserVO;

public class UserUpdateCheckCommand implements UserInterface {

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
		
		UserDAO dao = new UserDAO();
		// 비밀번호 암호화 처리 
		SecurityUtil securityUtil = new SecurityUtil();
		pwd = securityUtil.encryptSHA256(pwd);
		
		UserVO vo = new UserVO();
		vo.setMid(mid);
		vo.setPwd(pwd);
		vo.setName(name_);
		vo.setBirth(birth);
		vo.setEmail(email+"@"+email2);
		vo.setGetCode(getCode+"-"+getCode2+"-"+getCode3);
		vo.setAddress(address);
		vo.setEmailInfor(emailInfor);
		
		int res = dao.setUserUpdateCheck(vo);
		
		if(res == 1) {  // 정상적으로 회원정보수정처리완료
			request.setAttribute("msg", "userUpdateOk");
			request.setAttribute("url", request.getContextPath()+"/userMyPage.psj");
		}
		else {
			request.setAttribute("msg", "userUpdateNo");
			request.setAttribute("url", request.getContextPath()+"/userUpdate.psj");
		}
	}

}
